apt的使用

```shell
# 列出所有安装的软件，并通过管道过滤
apt list --install | grep regex

# 删除软件
apt remove app_name
apt autoremove
```



soft link

```shell
# 创建软引用
ln -s /absolute/path/node /usr/local/bin/node

# 删除软引用
rm -rf /usr/local/bin/node
```



find

```shell
# 
find target_path -name file_name
find / -name hello.java
```



```shell
# ~ 当前用户的家目录
cd ~
== cd /home/catfish

# . 当前目录

```



adb

```shell
# 连接WSL子系统
adb connect 127.0.0.1:58679

# 设置代理
adb shell settings put global http_proxy 192.168.0.102:7890
# 关闭代理(无需重启)
adb shell settings put global http_proxy :0

# 安装apk
adb install c:\\absolute\path\tiktok.apk
```



环境变量

```bash
# 查看所有环境变量
env

# 
echo $env_var_name
```

scp

```shell
scp -p File.cfg linuxprobe@192.168.10.10:/Dir
```



创建环境变量

/etc/profile .bash_profile .bashrc的联系和区别



开放端口

```sh
```



测试TCP或UDP端口是否可访问

```sh
telnet ip port
可访问：Escape character is '^]'.
不可访问: telnet: Unable to connect to remote host: Connection refused
```





显示当前正在监听的所有TCP和UDP端口以及与之相关的进程和PID

```shell
1 netstat -tuln
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp6       0      0 :::8080                 :::*                    LISTEN
tcp6       0      0 :::35515                :::*                    LISTEN
tcp6       0      0 :::2181                 :::*                    LISTEN
udp        0      0 127.0.0.1:323           0.0.0.0:*
udp6       0      0 ::1:323                 :::*
LocalAddress代表

2 ss -tuln
```



日志文件重定向

```shell
nohup java -jar HelloWorld.jar 1> stdout.log 2> stderr.log &
其中: 
&使当前jar后台运行，但关闭窗口程序可能会停止。
nohup + &使当前jar后台运行，即使关闭窗口程序也不停止。

1> stdout.log 代表把控制台的标准输出流写入到stdout.log文件。
2> stderr.log 代表把控制台的标准输出流写入到stderr.log文件。

0标准输入流
1标准输出流
2标准错误流
/dev/null没有输出（该目录是linux的空设备文件，写入这里的内容会全部丢失掉）

实际使用场景下1可以省略：nohup java -jar HelloWorld.jar > stdout.log 2> stderr.log &
实际场景下，若需要把标准输出流和标准错误流输出到同一个文件: nohup java -jar HelloWorld.jar > stdout.log 2>&1 &
实际场景下，通常不需要标准输入流：nohup java -jar HelloWorld.jar > /dev/null 2>&1 &

新日志产生时，是在日志文件后追加还是覆盖?
>>追加的方式
>覆盖的方式

按指定周期创建新的日志文件

我在springboot中已经配置了日志按天分割，因此在启动时不需要nohup可以不需要nohup.out
nohup java -jar HelloWorld.jar > /dev/null 2&1 &
```

