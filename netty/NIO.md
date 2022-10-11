handler （处理器）

handler 是由 Netty 生成用来处理 I/O 事件的。

![image-20220611151405695](D:\GitHub\Notebooks\picture\netty\image-20220611151405695.png)

![image-20220611151255290](D:\GitHub\Notebooks\picture\netty\image-20220611151255290.png)

![image-20220611184749383](D:\GitHub\Notebooks\picture\netty\image-20220611184749383.png)

1. SimpleChatServerHandler 继承自 [SimpleChannelInboundHandler](http://netty.io/4.0/api/io/netty/channel/SimpleChannelInboundHandler.html)，这个类实现了 [ChannelInboundHandler](http://netty.io/4.0/api/io/netty/channel/ChannelInboundHandler.html) 接口，ChannelInboundHandler 提供了许多事件处理的接口方法，然后你可以覆盖这些方法。现在仅仅只需要继承 SimpleChannelInboundHandler 类而不是你自己去实现接口方法。
2.  handlerAdded() 事件处理方法。每当从服务端收到新的客户端连接时，客户端的 Channel 存入 [ChannelGroup](http://netty.io/4.0/api/io/netty/channel/group/ChannelGroup.html) 列表中，并通知列表中的其他客户端 Channel
3.  handlerRemoved() 事件处理方法。每当从服务端收到客户端断开时，客户端的 Channel 自动从 ChannelGroup 列表中移除了，并通知列表中的其他客户端 Channel
4.  channelRead0() 事件处理方法。每当从服务端读到客户端写入信息时，将信息转发给其他客户端的 Channel。其中如果你使用的是 Netty 5.x 版本时，需要把 channelRead0() 重命名为messageReceived()
5.  channelActive() 事件处理方法。服务端监听到客户端活动
6.  channelInactive() 事件处理方法。服务端监听到客户端不活动
7. exceptionCaught() 事件处理方法是当出现 Throwable 对象才会被调用，即当 Netty 由于 IO 错误或者处理器在处理事件时抛出的异常时。在大部分情况下，捕获的异常应该被记录下来并且把关联的 channel 给关闭掉。然而这个方法的处理方式会在遇到不同异常的情况下有不同的实现，比如你可能想在关闭连接之前发送一个错误码的响应消息。



ChannelInitializer<T>

![image-20220611151846667](D:\GitHub\Notebooks\picture\netty\image-20220611151846667.png)

1. [NioEventLoopGroup](http://netty.io/4.0/api/io/netty/channel/nio/NioEventLoopGroup.html) 是用来处理I/O操作的多线程事件循环器，Netty 提供了许多不同的 [EventLoopGroup](http://netty.io/4.0/api/io/netty/channel/EventLoopGroup.html) 的实现用来处理不同的传输。在这个例子中我们实现了一个服务端的应用，因此会有2个 NioEventLoopGroup 会被使用。第一个经常被叫做‘boss’，用来接收进来的连接。第二个经常被叫做‘worker’，用来处理已经被接收的连接，一旦‘boss’接收到连接，就会把连接信息注册到‘worker’上。如何知道多少个线程已经被使用，如何映射到已经创建的 [Channel](http://netty.io/4.0/api/io/netty/channel/Channel.html)上都需要依赖于 EventLoopGroup 的实现，并且可以通过构造函数来配置他们的关系。
2. [ServerBootstrap](http://netty.io/4.0/api/io/netty/bootstrap/ServerBootstrap.html) 是一个启动 NIO 服务的辅助启动类。你可以在这个服务中直接使用 Channel，但是这会是一个复杂的处理过程，在很多情况下你并不需要这样做。
3. 这里我们指定使用 [NioServerSocketChannel](http://netty.io/4.0/api/io/netty/channel/socket/nio/NioServerSocketChannel.html) 类来举例说明一个新的 Channel 如何接收进来的连接。
4. 这里的事件处理类经常会被用来处理一个最近的已经接收的 Channel。SimpleChatServerInitializer 继承自[ChannelInitializer](http://netty.io/4.0/api/io/netty/channel/ChannelInitializer.html) 是一个特殊的处理类，他的目的是帮助使用者配置一个新的 Channel。也许你想通过增加一些处理类比如 SimpleChatServerHandler 来配置一个新的 Channel 或者其对应的[ChannelPipeline](http://netty.io/4.0/api/io/netty/channel/ChannelPipeline.html) 来实现你的网络程序。当你的程序变的复杂时，可能你会增加更多的处理类到 pipline 上，然后提取这些匿名类到最顶层的类上。
5. 你可以设置这里指定的 Channel 实现的配置参数。我们正在写一个TCP/IP 的服务端，因此我们被允许设置 socket 的参数选项比如tcpNoDelay 和 keepAlive。请参考 [ChannelOption](http://netty.io/4.0/api/io/netty/channel/ChannelOption.html) 和详细的 [ChannelConfig](http://netty.io/4.0/api/io/netty/channel/ChannelConfig.html) 实现的接口文档以此可以对ChannelOption 的有一个大概的认识。
6. option() 是提供给[NioServerSocketChannel](http://netty.io/4.0/api/io/netty/channel/socket/nio/NioServerSocketChannel.html) 用来接收进来的连接。childOption() 是提供给由父管道 [ServerChannel](http://netty.io/4.0/api/io/netty/channel/ServerChannel.html) 接收到的连接，在这个例子中也是 NioServerSocketChannel。
7. 我们继续，剩下的就是绑定端口然后启动服务。这里我们在机器上绑定了机器所有网卡上的 8080 端口。当然现在你可以多次调用 bind() 方法(基于不同绑定地址)。





编码器和解码器

![image-20220612133536363](D:\GitHub\Notebooks\picture\netty\image-20220612133536363.png)