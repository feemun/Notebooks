我们在写service业务代码时，通常service中一个方法会调用dao中的一个或多个方法。

那么问题来了，如果service方法抛异常了，那么dao方法执行成功的是rollback还是commit？

如果一个方法开了事务，另一个方法没开事务，那执行失败事务又是怎样的？

在Spring中，这叫做事务的传播机制。



Spring中，事务分为编程式事务和声明式事务。编程式事务通过transactionTemplate和transactionManager实现。声明式事务通过@Transaction(propagation = xxx)实现。



Spring中对事务的实现

三个类：TransactionManager、TransactionDefinition、Propagation、Isolation、TransactionStatus

三个开发中常用的传播行为：Required、Requires_new、nested

使用事务时需要考虑方法抛出异常时是否rollback的三种情况：

​	1.开启事务的方法调用开启事务的方法

​	2.开启事务的方法调用没开启事务的方法

​	3.没开启事务的方法调用开启事务的方法



没开启事务的方法调用开启事务的方法，在某些情况下不会rollback，原因是使用了SpringAOP，它有自调用失效问题。



**事务传播行为是为了解决业务层方法之间互相调用的事务问题**。

当事务方法被另一个事务方法调用时，必须指定事务应该如何传播。例如：方法可能继续在现有事务中运行，也可能开启一个新事务，并在自己的事务中运行。

正确的事务传播行为可能的值如下:

**1.`TransactionDefinition.PROPAGATION_REQUIRED`**

使用的最多的一个事务传播行为，我们平时经常使用的`@Transactional`注解默认使用就是这个事务传播行为。如果当前存在事务，则加入该事务；如果当前没有事务，则创建一个新的事务。

**`2.TransactionDefinition.PROPAGATION_REQUIRES_NEW`**

创建一个新的事务，如果当前存在事务，则把当前事务挂起。也就是说不管外部方法是否开启事务，`Propagation.REQUIRES_NEW`修饰的内部方法会新开启自己的事务，且开启的事务相互独立，互不干扰。

**3.`TransactionDefinition.PROPAGATION_NESTED`**

如果当前存在事务，则创建一个事务作为当前事务的嵌套事务来运行；如果当前没有事务，则该取值等价于`TransactionDefinition.PROPAGATION_REQUIRED`。

**4.`TransactionDefinition.PROPAGATION_MANDATORY`**

如果当前存在事务，则加入该事务；如果当前没有事务，则抛出异常。（mandatory：强制性）

这个使用的很少。

若是错误的配置以下 3 种事务传播行为，事务将不会发生回滚：

- **`TransactionDefinition.PROPAGATION_SUPPORTS`**: 如果当前存在事务，则加入该事务；如果当前没有事务，则以非事务的方式继续运行。
- **`TransactionDefinition.PROPAGATION_NOT_SUPPORTED`**: 以非事务方式运行，如果当前存在事务，则把当前事务挂起。
- **`TransactionDefinition.PROPAGATION_NEVER`**: 以非事务方式运行，如果当前存在事务，则抛出异常。