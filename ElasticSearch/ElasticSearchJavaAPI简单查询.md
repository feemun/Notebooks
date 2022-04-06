TermQueryBuilder


SearchSourceBuilder
- query(QueryBuilder query)
- fetchSource(@Nullable String[] includes, @Nullable String[] excludes)
- size

```java
    //  实现SQL: select * from student where name = 'zhangsan'
    public SearchResponse select() {
        TermQueryBuilder termQuery = QueryBuilders.termQuery("name", "zhangsan");
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder().query(termQuery).size(10000);
        SearchRequest searchRequest = new SearchRequest(indices).source(sourceBuilder);
        return Resource.ESClients.getFirst().search(searchRequest, RequestOptions.DEFAULT);
    }
```

## 1 实现SQL的与或非
### 1.1 实现与
```java
    // 实现SQL: select * from student where name = 'zhangsan' and age = 15
    public SearchResponse termQuery() {
        TermQueryBuilder nameQuery = QueryBuilders.termQuery("name", "zhangsan");
        TermQueryBuilder ageQuery = QueryBuilders.termQuery("age", 15);

        BoolQueryBuilder boolQueryBuilder = QueryBuilders.boolQuery()
                .must(nameQuery)
                .must(ageQuery);

        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder().query(boolQueryBuilder).size(10000);
        SearchRequest searchRequest = new SearchRequest("student").source(sourceBuilder);

        return Resource.ESClients.getFirst().search(searchRequest, RequestOptions.DEFAULT);
    }
```

### 1.2 实现或
```java
    // 实现SQL: select * from student where name = 'zhangsan' or age = 15
    public SearchResponse termQuery() {
        TermQueryBuilder nameQuery = QueryBuilders.termQuery("name", "zhangsan");
        TermQueryBuilder ageQuery = QueryBuilders.termQuery("age", 15);

        BoolQueryBuilder boolQueryBuilder = QueryBuilders.boolQuery()
                .should(nameQuery)
                .should(ageQuery);

        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder().query(boolQueryBuilder).size(10000);
        SearchRequest searchRequest = new SearchRequest("student").source(sourceBuilder);

        return Resource.ESClients.getFirst().search(searchRequest, RequestOptions.DEFAULT);
    }
```

## 2 实现SQL的范围查询（注意左右区间的开闭）
### 2.1 数字范围查询
```java
    // 实现SQL: select * from student where age between 15 to 20
    public SearchResponse select() {
        RangeQueryBuilder rangeQueryBuilder = QueryBuilders.rangeQuery("age").from(15).to(20);
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder().query(rangeQueryBuilder).size(10000);
        SearchRequest searchRequest = new SearchRequest("student").source(sourceBuilder);
        return Resource.ESClients.getFirst().search(searchRequest, RequestOptions.DEFAULT);
    }
```
### 2.2 时间范围查询
```java
    // 实现SQL: select * from student where birthday > timeA and birthday < timeB
    public SearchResponse select() {
        RangeQueryBuilder rangeQueryBuilder = QueryBuilders.rangeQuery("age").from(15).to(20);
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder().query(rangeQueryBuilder).size(10000);
        SearchRequest searchRequest = new SearchRequest("student").source(sourceBuilder);
        return Resource.ESClients.getFirst().search(searchRequest, RequestOptions.DEFAULT);
    }
```
### 2.3 实现SQL中的in


## 3 去重
```java
    // 实现SQL: select distinct course_name from course(能实现吗)
    public SearchResponse select() {
        RangeQueryBuilder rangeQueryBuilder = QueryBuilders.rangeQuery("age").from(15).to(20);
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder().query(rangeQueryBuilder).size(10000);
        SearchRequest searchRequest = new SearchRequest("student").source(sourceBuilder);
        return Resource.ESClients.getFirst().search(searchRequest, RequestOptions.DEFAULT);
    }
```
## 4 实现SQL排序
### 4.1 实现按照field升序
### 4.2 实现按照field降序

## 5 查询符合某条件的总记录条数



## 6 模糊查询
### 6.1 查询姓李的同学
### 6.2 查询名字中包含军的同学