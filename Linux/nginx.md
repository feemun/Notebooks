问题处理

记得看日志



文件服务器

```json
	server {
		listen 8099;
		server_name "测试文件夹代理服务";
		#配置跨域
		add_header Access-Control-Allow-Origin *;
    	add_header Access-Control-Allow-Methods GET,POST,OPTIONS;
        add_header Access-Control-Allow-Headers Content-Type,Authorization;
        # 文件名乱码配置
 
		location / {
			#代理的本地文件夹
			root C:\\Users\\cat\\Desktop\\tmp\\video;
			#开启目录浏览功能；
			autoindex on;  
			#关闭详细文件大小统计，让文件大小显示MB，GB单位，默认为b；			
			autoindex_exact_size off;  
			#开启以服务器本地时区显示文件修改日期！ 			
			autoindex_localtime on;
		}
	}
```



正向代理

隐藏客户端信息，客户端访问前必须输入服务端url。如跨越长城。

反向代理

隐藏服务端信息，服务端可获取客户端真实信息。通常用nginx实现反向代理。如nginx实现负载均衡。
