SpringMVC工作原理

![springmvc-basic](..\picture\springmvc-basic.png)

**流程说明（重要）：**

1. 客户端（浏览器）发送请求，直接请求到 `DispatcherServlet`。
2. `DispatcherServlet` 根据请求信息调用 `HandlerMapping`，解析请求对应的 `Handler`。
3. 解析到对应的 `Handler`（也就是我们平常说的 `Controller` 控制器）后，开始由 `HandlerAdapter` 适配器处理。
4. `HandlerAdapter` 会根据 `Handler`来调用真正的处理器开处理请求，并处理相应的业务逻辑。
5. 处理器处理完业务后，会返回一个 `ModelAndView` 对象，`Model` 是返回的数据对象，`View` 是个逻辑上的 `View`。
6. `ViewResolver` 会根据逻辑 `View` 查找实际的 `View`。
7. `DispaterServlet` 把返回的 `Model` 传给 `View`（视图渲染）。
8. 把 `View` 返回给请求者（浏览器）



抛弃上面的原理图，自己实现也知道大致流程

1.浏览器向SpringMVC发起请求。从postman或者浏览器开发者工具都可以观察到，请求的数据通常包含url和请求体。

2.SpringMVC解析url，解析请求体为对象。url确定执行哪个Controller，Controller中的哪个方法。

3.执行Controller中的方法。

4.把Controller中的方法返回值封装成一个对象，响应给前端。

可以把推断的流程和工作原理图进行对比记忆。