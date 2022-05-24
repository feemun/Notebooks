# yml配置文件

## 一 配置类与yaml配置文件的绑定

### 1.1 绑定方式1

1.配置类

```java
@Configuration
@ConfigurationProperties(prefix = "thread")
@Setter	// 若没有，则无法为成员变量注入值
@Getter
public class ThredPoolConfig {
	Integer poolSize;
    Integer minSize;
    Integer maxSize;
}
```

2.yaml配置文件

```yaml
thred:
  poolSize: 10
  minSize: 10
  maxSize: 20
```

### 1.2 读取指定yml文件

```java
@Component
@PropertySource("classpath:datasource.properties")
@Getter
@Setter
class WebSite {
    @Value("${driverName}")
    private String driverName;
    @Value("${url}")
    private String url;
    @Value("${username}")
    private String username;
    @Value("${password}")
    private String password;
}
```

## 二 yml中配置

yml

```yml
server:
  port: 8080	-- 配置基本数据类型
  
tes:	-- 配置hashMap
  maps: {key1: 12,key2: 34}

es:
  addr:	-- 配置数组
    - 192.168.1.66
    - 192.168.1.77
    - 192.168.1.88
```

对应的类

```java
```

