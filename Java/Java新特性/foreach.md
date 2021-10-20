foeach方法的参数

参数为函数式接口Consumer，该接口中唯一的抽象方法如下

```java
@FunctionInterface
interface Consumer{
	void accept(T t);
}
```





foreach的常用用法

1.遍历list<T>

2.遍历set<T>

3.遍历Queue<T>

4.遍历Map<K,V>、遍历Map<K,V>的key、遍历Map<K,V>的value

