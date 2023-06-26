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

