spring boot controller层在向前端返回实体类对象，但不想返回实体类对象的部分字段，此时可以用@JsonIgnore在不想返回的字段上。

spring boot controller层在向前端返回实体类对象（其中包含时间的字段），可以在时间字段上使用@Format，控制返回给前端的时间格式。

使用@JsonWrapper可以扁平化实体类对象。