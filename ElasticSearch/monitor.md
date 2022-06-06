查询全部索引下的文档总数：

```bash
GET /_cat/count
```

查询某个索引下的文档总数

```shell
GET /_cat/count/索引名
```



集群健康状态，总分片数，主分片数

```
GET /_cat/health?v
```



磁盘使用率

```
GET /_cat/allocation?v
```



CPU、内存使用率

```bash
GET _cat/nodes?v
```



读写速率的监控

定时10s调用GET indexName/_stats/indexing获取当前这个索引index指标数据，关注index_total这个值。写入速度就可以根据相隔两次获取到的结果差与处理间隔时间计算获得。

```bsh
GET 索引名/_stats/indexing
```





```shell
# 0 健康度
GET /_cluster/stats
status中记录了

# 1 获取集群内存占用情况
GET /_cluster/stats
os.mem.free_percent中记录了

# 2 获取集群磁盘占用情况
GET /_cluster/stats
os.fs中记录了空闲和总量

# 3 集群cpu使用率
GET /_cluster/stats
process.cpu.percent中记录了

# 4 集群总分片数，主分片数
GET /_cluster/stats
indicies.shards中记录了

# 5 文档总条数
GET /_cluster/stats
indicies.docs.count中记录了

# 6 读写速率
GET _nodes/stats
io_stats.total中，"read_kilobytes" : 2652,"write_kilobytes" : 1194084,

# 7 索引存储量
GET /_cat/indices?v
里面记录了每个索引占用了多少空间
```

