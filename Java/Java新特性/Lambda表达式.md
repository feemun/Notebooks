# Lambda表达式

## 应用场景一：简化匿名内部类

经典案例：创建一个线程

传统方式匿名内部类创建一个线程

```java
Thread t = new Thread(new Runnable(){
    @Override
    public void run(){
        System.out.println("hello world");
    }
});
t.start();
```

使用lambda表达式简化后

```java
Thread t = new Thread(()->System.out.println("hello world"););
t.start();
```

