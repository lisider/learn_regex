
- awk

```c

在linux 下面, awk 是 gawk 的软链接

```

```c

awk -Fs '/pattern/ {action}' input-file
awk -Fs -f scripts.awk input-file
awk  -f scripts.awk input-file
awk  -f scripts.awk input-file input-file2

awk 'BEGIN {FS=":";print "----header----"}\
        /mail/ {print $1}\
        END {print "----footer----"}'\
        /etc/passwd


awk -F: '/mail/ {print $1}' /etc/passwd
```

---

## 命令

- print

```c
print
print $0
print $1

```

- printf

```c

格式化输出, 和 c语言函数 printf 类似


```




---

## 匹配模式

```c

awk -Fs '/pattern/ {action}' input-file


pattern 可以 被 替换成 正则表达式

```

---
---
---
---

- awk 脚本怎么写?

```c
只有头部
     只有头部时不能加 文件

只有头部和身体

只有身体

有头部 身体 和 尾部

```

```c
#我是注释 

BEGIN {command1;command2}
/pattern/ {action}
END {command1;command2}

```

---



## 内部变量

```c


内部变量只能在 BEGIN 中使用

虽然BEGIN 可以写在命令行中,但是我们一般都写写在脚本中,所以 内部变量一般也写在脚本中

FS

OFS

RS

ORS

NR

FILENAME

FNR


```

- 自定义变量

```c

```

- 分支和循环

```c



```

- 关联数组

```c


```




