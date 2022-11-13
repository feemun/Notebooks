

## Bean的定义

### 1 扫描不到Bean

问题：

当@SpringBoootApplication和@RestController在包的同一层级时，会扫描不到Bean。

解决方案：

a.调整层级

b.使用多个@ComponentScan或@ComponentScans指定bean所在的包。



### 2 重写Bean的带参构造（无参构造删除）

问题：

当带参构造器中参数在ioc容器中不存在时，创建Bean失败。

原因：

解决方案：

1.向ioc中添加与参数同类型的bean

### 3 bean的scope设置为protoType

问题：

当在类上@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)时，该Bean变成单例的。无论获取多少次，都是同一个。但是我们在其他包调用时，希望是多例的。

解决方案：

a.通过从ioc.getBean(Class)中获取。

b.使用@LookUp注解



## 依赖注入

### 1 多个Class相同的Bean

问题：

使用@AutoWired注入时，如果有多个同种类型的Bean，Spring无法确定注入哪一个。

解决方案：

a.使用@Primary确定Bean的优先级

b.使用@Qulifier填入beanName确定注入哪个Bean



### 2 @Qulifier的坑

当我们使用@Component注解把类标记为Bean时，可以给Bean配置一个名字。但我们不给时，默认的BeanName又是什么？

当类名为StudentService时，默认的beanName = "studentService"。

当类名为SQLiteService时，默认的beanName = "SQLiteService"。

当类为内部类时，默认的beanName="外部类名.内部类名"。其中，外部类的首字母小写。



### 3 @Value的坑