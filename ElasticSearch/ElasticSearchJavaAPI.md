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

## 实现与或非
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

## 实现SQL的范围查询（注意左右区间的开闭）
### 数字范围查询
```java
    // 实现SQL: select * from student where age between 15 to 20
    public SearchResponse select() {
        RangeQueryBuilder rangeQueryBuilder = QueryBuilders.rangeQuery("age").from(15).to(20);
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder().query(rangeQueryBuilder).size(10000);
        SearchRequest searchRequest = new SearchRequest("student").source(sourceBuilder);
        return Resource.ESClients.getFirst().search(searchRequest, RequestOptions.DEFAULT);
    }
```
### 时间范围查询
```java
    // 实现SQL: select * from student where birthday > timeA and birthday < timeB
    public SearchResponse select() {
        RangeQueryBuilder rangeQueryBuilder = QueryBuilders.rangeQuery("age").from(15).to(20);
        SearchSourceBuilder sourceBuilder = new SearchSourceBuilder().query(rangeQueryBuilder).size(10000);
        SearchRequest searchRequest = new SearchRequest("student").source(sourceBuilder);
        return Resource.ESClients.getFirst().search(searchRequest, RequestOptions.DEFAULT);
    }
```