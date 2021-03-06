- 正则表达式的组成
```c
普通字符
元字符

注意 : 元字符和 普通字符之间可以转换
```


- 元字符
```c
元字符包括下列字符

^ $ . [  ] {  } - ? * + (  ) | \

普通字符转义后的字符

但是 BRE 只支持下面的字符,ERE也支持
          ^ $ . [  ] *
     ERE (比 标准 多几个元字符)
          (  ) {  } ? + |

```

---

- 下面的属于 BRE 和 ERE

- 1 ^ $

```c

^ $

锚点
     ^ 只匹配文本行的开头
     $ 只匹配文本行的末尾

示例
     '^zip'    匹配 以 zip 开头的行
     '^zip$'   匹配 以 zip 开头 且 以 该字母 结束的行
     '^$'      匹配空行
```


- 2 .

```c

.

小数点可以匹配除“\n”以外的任意一个字符
如果要匹配包括“\n”在内的所有字符，一般用[\s\S]，或者是用“.”加(?s)匹配模式来实现。
匹配任意字符

示例
     echo zip
     $ echo zip > test
     $ echo gzip >> test
     $ grep '.zip' test 
     gzip

```


- 3 [  ]

```c

[  ]

匹配一个字符集合

示例

$ echo 2w > test 
$ echo 3w >> test  
$ echo 4w >> test  
$ grep '[23]w' test 
2w
3w


'[A-Za-z0-9]'

```


- 4 [  ] 中的 首字母^

```c


反向匹配一个字符集合
插入字符如果是中括号表达式中的第一个字符的时候，才会唤醒否定功能

示例

$ echo 2w > test 
$ echo 3w >> test    
$ echo 4w >> test    
$ grep '[^23]w' test 
4w

```


- 5 *

```c

*

匹配0个或1个或多个字符
匹配目标:前面的一个字符

示例

$ echo "ABC" | grep '*A*' 
ABC


```

---

## 下面的属于 ERE


- 6 |

```c

|

交替

示例

$ echo "AAA" | grep -E 'AAA|BBB'
AAA
$ echo "BBB" | grep -E 'AAA|BBB'
BBB
$ echo "CCC" | grep -E 'AAA|BBB'


```

- 7 ?

```c

?

匹配一个或0个字符
匹配对象 
     匹配目标:前面的一个字符
     使前面的元素可有可无

示例
$ echo "(555) 123-4567" | grep -E '^\(?[0-9][0-9][0-9]
\)? [0-9][0-9][0-9]$'
(555) 123-4567

$ echo "555 123-4567" | grep -E '^\(?[0-9][0-9][0-9]\)
? [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]$'
555 123-4567


```

- 8 +

```c

匹配目标:前面的一个字符
它要求前面的元素至少出现一次匹配

^([[:alpha:]]+ ?)+$
$ echo "This that" | grep -E '^([[:alpha:]]+ ?)+$'
This that
$ echo "a b c" | grep -E '^([[:alpha:]]+ ?)+$'
a b c
$ echo "a b 9" | grep -E '^([[:alpha:]]+ ?)+$'
$ echo "abc  d" | grep -E '^([[:alpha:]]+ ?)+$'
$

```


- 9 {}

```c

这个 { 和  } 元字符都被用来表达要求匹配的最小和最大数目
匹配目标:前面的一个字符

这个是前开后闭区间
{n}  ==n
{n,} >=n
{,m}  <m
{n,m} >=n <m


$ echo "(555) 123-4567" | grep -E '^\(?[0-9]{3}\)? [0-9]{3}-[0-9]{4}$'
(555) 123-4567
$ echo "555 123-4567" | grep -E '^\(?[0-9]{3}\)? [0-9]{3}-[0-9]{4}$'
555 123-4567
$ echo "5555 123-4567" | grep -E '^\(?[0-9]{3}\)? [0-9]{3}-[0-9]{4}$'
$

```

-11 ()


```c

将 () 中 的部分当成一个字符处理

按说 第二个 + 只能处理一个字符,但是却处理了 一个字母字符串和一个空格
是因为 () 把 这个字母字符串和空格当做 一个字符处理了

^([[:alpha:]]+ ?)+$
$ echo "This that" | grep -E '^([[:alpha:]]+ ?)+$'
This that
$ echo "a b c" | grep -E '^([[:alpha:]]+ ?)+$'
a b c
$ echo "a b 9" | grep -E '^([[:alpha:]]+ ?)+$'
$ echo "abc  d" | grep -E '^([[:alpha:]]+ ?)+$'
$


```

-12 POSIX 字符集
```c

[:alnum:]alnum字母数字字符。在 ASCII 中，等价于：[A-Za-z0-9]
[:word:]word与[:alnum:]相同, 但增加了下划线字符。
[:alpha:]alpha字母字符。在 ASCII 中，等价于：[A-Za-z]
[:blank:]blank包含空格和 tab 字符。
[:cntrl:]cntrlASCII 的控制码。包含了0到31，和127的 ASCII 字符。
[:digit:]digit数字0到9
[:graph:]graph可视字符。在 ASCII 中，它包含33到126的字符。
[:lower:]lower小写字母。
[:punct:]punct标点符号字符。在 ASCII 中，等价于：
[:print:]print可打印的字符。在[:graph:]中的所有字符，再加上空格字符。
[:space:]space空白字符，包括空格，tab，回车，换行，vertical tab, 
               和 form feed.在 ASCII 中， 等价于：[ \t\r\n\v\f ]
[:upper:]upper大写字母。
[:xdigit:]xdigit用来表示十六进制数字的字符。在 ASCII 中，等价于：[0-9A-Fa-f]


```


-12 转义字符

```c

对普通字符的转义

\<  匹配单词词首      
\>  匹配单词词尾      
\b  匹配单词边界 
\d 匹配阿拉伯数字，等同于[0-9]。        
\D 匹配阿拉伯数字之外的任意字符，等同于[^0-9]。        
\x 匹配十六进制数字，等同于[0-9A-Fa-f]。        
\X 匹配十六进制数字，等同于[^0-9A-Fa-f]。        
\w 匹配单词字母，等同于[0-9A-Za-z_]。        
\W 匹配单词字母之外的任意字符，等同于[^0-9A-Za-z_]。        
\t 匹配<TAB>字符。        
\s 匹配空白字符，等同于[ /t ]。        
\S 匹配非空白字符，等同于[^ /t]
\a 所有的字母字符. 等同于[a-zA-Z]        
\l 小写字母 [a-z]        
\L 非小写字母 [^a-z]        
\u 大写字母 [A-Z]
\U 非大写字母 [^A-Z] 
\r,\n          回车和换行


```

