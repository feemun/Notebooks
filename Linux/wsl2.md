转发wsl2端口

```bat
# netsh interface portproxy add v4tov4 listenport=[win10端口] listenaddress=0.0.0.0 connectport=[虚拟机的端口] connectaddress=[虚拟机的ip]
netsh interface portproxy add v4tov4 listenport=2181 listenaddress=0.0.0.0 connectport=2181 connectaddress=172.28.145.66

# 删除端口映射
# netsh interface portproxy delete v4tov4 listenaddress=[外网IP] listenport=[外网端口]
netsh interface portproxy delete v4tov4 listenaddress=0.0.0.0 listenport=1313

# 查看所有转发的端口
netsh interface portproxy show all
```





Test-NetConnection -ComputerName 172.28.145.66 -Port 8080



修改主机名

```
要在 Windows 下独立更改。
在 WSL 中执行：sudo nano /etc/wsl.conf，
在 [network] 下添加 hostname = your-new-hcleaost-name 和 generateHosts = false 这两行，然后在 Windows 的 CMD 中执行 wsl --shutdown 使其生效。
```

