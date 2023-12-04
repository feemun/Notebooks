Java基础

**集合框架**：

- List、Set、Map等集合接口和实现类
- 集合操作和迭代
- 泛型

**Lambda表达式和函数式编程**：

- Lambda表达式的使用
- 函数式接口和Stream API

**网络编程**：

- Socket
- nio
- netty

**文件和I/O操作**：

   - 文件读写
   - 流和缓冲
   - 序列化和反序列化

**正则表达式**

**设计模式**：

   - 常见的设计模式，如单例模式、工厂模式、观察者模式等

**异常处理**：

- 异常的类型和层次结构
- try-catch块
- 自定义异常

**注解和反射**：

   - Java的注解机制
   - 反射API用于动态处理类和对象

**数据库访问**：

- JDBC（Java Database Connectivity）用于与数据库交互
- 数据库连接池

**性能调优**：

- JVM性能调优

**多线程**：

- 线程同步
- 线程通信
- 线程池
- 并发集合
- 原子类



数据结构

时间复杂度分析

链表

哈希表

N叉树：N叉树的创建，dfs，bfs

图与寻径：图的构建，路径搜索，最短路径



MySQL

数据类型：整型，浮点型，时间，字符串，布尔等

约束：主键约束，非空约束，唯一约束等

索引：B树索引

子查询

联表查询

常用函数

乐观锁，悲观锁



Linux常用命令

1. 文件和目录操作：`ls`, `pwd`, `cd`, `touch`, `mkdir`, `rm`, `cp`, `mv`, `cat`, `grep`, `find`, `file`
2. 文件内容操作：`less`, `head`, `tail`, `wc`, `sort`, `cut`
3. 文件权限管理：`chmod`, `chown`, `chgrp`
4. 系统信息和状态：`date`, `uptime`, `top`, `free`, `df`, `du`, `ps`, `kill`
5. 用户和权限管理：`who`, `w`, `useradd`, `userdel`, `passwd`, `su`, `sudo`, `groupadd`, `groupdel`
6. 网络操作：`ping`, `ifconfig`, `netstat`, `ssh`, `scp`, `wget`
7. 系统管理：`shutdown`, `reboot`, `halt`, `ps aux`, `killall`, `crontab`
8. 软件包管理：`apt`/`apt-get`, `yum`, `dnf`
9. 压缩和解压缩：`tar`, `zip`, `unzip`



ElasticSearch

Elasticsearch是一个强大的分布式搜索引擎和分析引擎，它提供了多种查询方式来满足不同的搜索需求。

基本查询

1. **Match查询**：用于全文搜索，根据指定的字段匹配文本。可以使用`match`和`match_phrase`查询，前者用于匹配文本中的任何单词，后者用于匹配完整短语。

2. **Term查询**：用于精确匹配字段中的值。它适用于关键字字段，例如ID或标签。

3. **Range查询**：用于根据范围匹配字段值，例如日期范围或数字范围。`range`查询可以处理大于、小于、大于等于、小于等于等情况。

4. **Bool查询**：允许组合多个查询条件，使用逻辑运算符AND、OR、NOT来构建复杂的查询。

5. **Wildcard查询**：支持通配符搜索，例如使用`*`和`?`来匹配模糊文本。

6. **Fuzzy查询**：用于在文本中查找与给定术语相似的词语。它可以处理拼写错误或模糊查询的情况。

7. **Prefix查询**：用于匹配字段中以指定前缀开头的词语。

8. **Term和Terms集合查询**：用于匹配字段中的多个值。`term`用于匹配单个值，而`terms`用于匹配多个值。

9. **Exists和Missing查询**：用于检查文档中是否存在某个字段或某些字段。

10. **Geo查询**：用于地理位置数据的查询，包括`geo_distance`、`geo_bounding_box`等。

    聚合查询

    1. **Terms Aggregation（词条聚合）**：用于对字段中的词条进行分组，统计每个词条的文档数量。这类似于SQL中的GROUP BY。
    2. **Range Aggregation（范围聚合）**：允许你将文档分组到指定的范围内，例如按价格范围分组。
    3. **Date Histogram Aggregation（日期直方图聚合）**：用于按照时间间隔（如小时、天、月）对文档进行分组，然后统计每个时间间隔内的文档数量。
    4. **Histogram Aggregation（直方图聚合）**：类似于日期直方图聚合，但适用于数字字段，将数值范围划分为多个桶。
    5. **Top Hits Aggregation**：用于查找每个桶内排名前N的文档，通常与其他聚合一起使用，以获取每个分组的关键文档。
    6. **Cardinality Aggregation（基数聚合）**：计算一个字段的不同值的数量，用于统计唯一值的个数。
    7. **Avg、Sum、Min和Max Aggregations**：用于计算字段的平均值、总和、最小值和最大值。
    8. **Percentiles Aggregation（百分位数聚合）**：用于计算字段的百分位数，例如中位数、75th百分位数等。
    9. **Geo Distance Aggregation（地理距离聚合）**：用于计算地理坐标点之间的距离并进行聚合。

这些查询类型可以根据具体需求和场景进行组合和定制，以构建复杂的搜索和分析功能。根据你的数据和业务需求，选择适当的查询类型来优化搜索性能和结果精度。

除了查询之外，还需要掌握索引的创建，数据索引（乐观锁），数据更新，数据删除。

注意：能在kibana中写出DSL，且能把DSL转化成对应的Java代码。



SSM

ioc，aop

常用注解

Rest接口

声明式事务

ApplicationRunner接口

bean和配置文件绑定

定时任务

websocket

多模块的项目结构



Redis
Redis是一个开源的内存数据库，它支持多种基本数据类型，这些数据类型允许你在内存中存储和操作不同种类的数据。以下是Redis中的主要基本数据类型：

1. **字符串（String）**：Redis的最基本数据类型，可以存储文本、数字等任意二进制数据。你可以对字符串执行GET、SET、APPEND等操作。
2. **列表（List）**：有序的字符串元素集合，支持在列表的两端进行元素的插入和删除操作。你可以使用LPUSH、RPUSH、LPOP、RPOP等命令来操作列表。
3. **集合（Set）**：无序的字符串元素集合，每个元素都是唯一的。你可以使用SADD、SREM、SMEMBERS等命令来操作集合。
4. **有序集合（Sorted Set）**：类似于集合，但每个元素都有一个分数（score），根据分数进行排序。你可以使用ZADD、ZRANK、ZREVRANGE等命令来操作有序集合。
5. **散列（Hash）**：键值对的集合，每个键都与一个值相关联。散列适用于存储对象或记录的多个字段。你可以使用HSET、HGET、HDEL等命令来操作散列。
6. **位图（Bitmap）**：一个特殊的字符串类型，可以用于位运算操作。你可以使用SETBIT、GETBIT等命令来操作位图。

这些基本数据类型使Redis非常灵活，适用于多种应用场景，包括缓存、队列、计数器、实时分析和地理信息系统等。根据你的需求，你可以选择合适的数据类型来存储和处理数据。

Redis是一种高性能、内存存储的数据结构服务器，它在各种应用场景中都有广泛的应用。以下是一些常见的Redis应用场景：

1. **缓存**：Redis最常见的用途之一是作为缓存层，用于存储频繁访问的数据，以减轻后端数据库的负载。Redis能够快速读取和写入数据，提供低延迟的访问。
2. **会话存储**：将用户会话数据存储在Redis中，以实现分布式应用程序的会话管理。这有助于确保用户在多个服务器上的会话状态一致，并且支持会话超时和自动续期。
3. **计数器**：Redis的原子操作使其成为计数器的理想选择。你可以使用INCRBY命令来增加或减少计数器的值，例如网站的访问计数器或投票计数器。
4. **存储配置信息**：将应用程序的配置信息存储在Redis中，以支持配置的实时更新和动态配置。
5. **分布式锁**：Redis可以用作分布式锁的存储后端，以实现多个进程或服务器之间的协同操作。

这些只是Redis的一些常见应用场景。Redis的灵活性和高性能使其适用于各种用途，而且它支持多种数据结构，使得可以根据具体需求选择最合适的数据类型和功能。



Flink

执行模式（流/批），有边界 / 无边界 的作业

时间概念（EventTime，ProcessingTime，DigestTime），Watermark和生成器

状态计算（KeyedState，BroadcastState）

算子：map，filter，keyBy，reduce，window，自定义processFunction

窗口计算（滑动窗口）

DataStreamConnectors



常用应用场景

数据丰富，实时统计，告警。



hbase

1. **HBase基本概念**：

   - 掌握HBase的核心概念，包括表（Table）、列族（Column Family）、行键（Row Key）、列限定符（Column Qualifier）等。

2. **HBase Java API**：

   - 熟悉HBase的Java客户端API，用于连接、读取、写入和管理HBase数据。
   - 学习如何创建HBase表、插入数据、扫描和过滤数据。

3. **HBase过滤器**：

   - 了解HBase过滤器的使用，以便在检索数据时进行条件过滤和筛选。

   **HBase集成**：

   - 了解HBase的相关项目和工具，如Apache Phoenix（SQL查询层）和HBase的扩展库。