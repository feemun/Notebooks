正则表达式用途：文本搜索和替换，模式匹配。



常用正则表达式

```java
1 实现或
    // 字符串只能是China/America/Africa中的一个
    String regex = "(^China$|^America$|^Africa$)";
```



文本搜索并替换

```java
/**
     * hump to underline
     *
     * @param str
     * @return
     */
    public static String hump2Underline(String str) {
        if (Objects.isNull(str))
            return null;
        Pattern pattern = Pattern.compile("([A-Z])");
        Matcher matcher = pattern.matcher(str);
        while (matcher.find()) {
            String target = matcher.group();
            str = str.replaceAll(target, "_" + target.toLowerCase());
        }
        return str;
    }

    /**
     * underline to hump
     *
     * @param str
     * @return
     */
    public static String underline2Hump(String str) {
        if (Objects.isNull(str))
            return null;

        Pattern pattern = Pattern.compile("_(.)");
        Matcher matcher = pattern.matcher(str);
        while (matcher.find()) {
            String target = matcher.group(1);
            str = str.replaceAll("_" + target, target.toUpperCase());
        }
        return str;
    }
```



模式匹配

```java
boolean matches = str.matches("((2[0-4]\d|25[0-5]|[01]?\d\d?)\.){3}(2[0-4]\d|25[0-5]|[01]?\d\d?)");
```



