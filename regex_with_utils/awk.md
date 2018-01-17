- awk

```c

在linux 下面, awk 是 gawk 的软链接

```

- 怎么键入一个合法的awk命令


```c

awk -Fs '/pattern/ {action}' input-file
awk -Fs -f scripts.awk input-file
awk  -f scripts.awk input-file
awk  -f scripts.awk input-file input-file2


示例:

awk 'BEGIN {FS=":";print "----header----"}\
        /mail/ {print $1}\
        END {print "----footer----"}'\
        /etc/passwd

awk -F: '/mail/ {print $1}' /etc/passwd
```

---

## awk 的执行流程

```c
awk的运行过程
1、如果BEGIN 区块存在，awk执行它指定的actions(例如 指定 FS)
2、awk从输入文件中读取一行，称为一条输入记录。如果输入文件省略，将从标准输入读取
3、awk将读入的记录分割成字段，将第1个字段放入变量$1中，第2个字段放入$2，以此类推。$0表示整条记录。字段分隔符使用shell环境变量FS或由参数指定。
4、把当前输入记录(数据行)依次与每一个awk_cmd中awk_pattern比较，看是否匹配，如果相匹配，就执行对应的actions。如果不匹配，就跳过对应的actions，直到比较完所有的awk_cmd。
5、当一条输入记录比较了所有的awk_cmd后，awk读取输入的下一行，继续重复步骤3和4，这个过程一直持续，直到awk读取到文件尾。
6、当awk读完所有的输入行后，如果存在END，就执行相应的actions。

其中iput_file可以是多于一个文件的文件列表，awk将按顺序处理列表中的每个文件。awk会先对输入文件执行完所有的action后再处理下一个文件

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

```c
1、print 参数列表 : print可以打印字符串(加双引号)、变量和表达式，是awk最基本的命令。参数列表要用逗号(,)分隔，如果参数间用空格分隔，打印出时参数值之间不会有空格。
2、printf ([格式控制符]，参数) : 格式化打印命令(函数)，语法与C语言的printf函数类似。
3、next : 强迫awk立刻停止处理当前的记录,而开始读取和处理下一条记录，改变脚本控制过程。
4、nextfile : 强迫awk立刻停止处理当前的输入文件而处理输入文件列表中的下一个文件
5、exit : 使awk停止执行而跳出。如果有END 存在，awk会去执行END 的actions。
6、getline:读取下一行数据，但不改变脚本控制过程。


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

## awk脚本


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



- 内部变量

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

- 自定义变量及变量运算

```c

awk的语句: 
     awk的语句主要是赋值语句，用来给变量赋值。
1、把直接值或一个变量值赋值给变量。如果直接值是字符串要加双引号。
举例

awk 'BEGIN {x=1 ; y=3 ; x=y ; print "x=" x " ; y=" y }'

2、把一个表达式的值赋值给变量。表达式一般是数值表达式，也可以是其它表达式。
数值表达式: num1 operator num2
operator可以是: +(加) -(减) *(乘) /(除) %(取模) ^(求幂)
当num1或者num2是字符串而是不是数字时，无论是否加有双引号，awk都视其值为0
条件选择表达式: A?B:C (A为布尔表达式，B和C可以是表达式或者直接值)
当布尔表达式A的值为真时，整个表达式的值为B，A的值为假时，整个表达式的值为C
举例

awk 'BEGIN {x=3 ; x+=2 ; y=x+2 ; print "x=" x " ; y=" y }'
awk 'BEGIN {x=3 ; y=x>4?"ok":4 ; print "x=" x " ; y=" y }'

3、为了方便书写，awk也支持C语言语法的赋值操作符: += -= *= /= %= ^= ++ --


```

- 分支和循环

```c

其中condition一般为布尔表达式，body和else-body是awk语句块。
1、if (condition) {then-body} [else {else-body}]
2、while (condition) {body}
3、do {body} while (condition)
4、for (initialization; condition; increment) {body}与C语言的for结构的语法相同。
5、break : 跳出包含它的for、while、do-while 循环
6、continue : 跳过for、while、do-while循环的body的剩余部分，而立刻进行下一次循环的执行。


```

- 关联数组

```c


```

