# 删除
## 1 删除 xxxfield = xxx 的记录
```java
    // SQL: delete from student where name = 'zhangsan'
    BulkByScrollResponse delete() {
        DeleteByQueryRequest deleteByQueryRequest = new DeleteByQueryRequest("student")
                .setQuery(new TermQueryBuilder("name", "zhangsan"));
        return client.deleteByQuery(deleteByQueryRequest, RequestOptions.DEFAULT);
    }
```

### 2 范围删除
```java
    // SQL: delete from student where age between 15 and 20
    BulkByScrollResponse delete() {
        DeleteByQueryRequest deleteByQueryRequest = new DeleteByQueryRequest("student")
                .setQuery(new RangeQueryBuilder("age").from(15).to(20));
        return Resource.ESClients.getFirst().deleteByQuery(deleteByQueryRequest, RequestOptions.DEFAULT);
    }
```