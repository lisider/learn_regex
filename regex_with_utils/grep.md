```c
grep  支持 BRE
grep -E 支持 ERE
egrep 支持 ERE
```
---

## grep 命令

```c

# Search a file for a pattern
grep pattern file

# Case insensitive search (with line numbers)
grep -in pattern file

# Recursively grep for string <pattern> in folder:
grep -R pattern folder

# Read search patterns from a file (one per line)
grep -f pattern_file file

# Find lines NOT containing pattern
grep -v pattern file

# You can grep with regular expressions
grep "^00" file  #Match lines starting with 00
grep -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" file  #Find IP add

# Find all files which match {pattern} in {directory}
# This will show: "file:line my research"
grep -rnw 'directory' -e "pattern"

# Exclude grep from your grepped output of ps.
# Add [] to the first letter. Ex: sshd -> [s]shd
ps aux | grep '[h]ttpd'

# Colour in red {bash} and keep all other lines
ps aux | grep -E --color 'bash|$'


可见,grep  命令中没有 命令的概念,但是有脚本的概念

```

---

## grep 的执行 方式

```c

1/
     读取一行到 缓冲区 ,可以从标准 输入读, 可以从文件读 

2/
     匹配 正则表达式 ,如果匹配成功,则打印出来

3/
     清空缓冲区的内容

4/
     跳转到1


```

---



- BRE

```c

ls -l | grep '^d'

cat log | grep '^2016.9'

```

```c

cat /usr/share/dict/words | grep '^[cC].t$'

```

```c

cat log | grep '^201[67].9'


ls -R | grep '^[Cc].*\.sh'


```

```c

ll -R | grep '.*clean\.sh'


```

---

- ERE

```c

cat log | grep -E 'main|MAIN'


```

```c

ls -R | grep -E '.*\.(ba)?sh'


```

```c

echo "t h i s i t" | grep -E '^([0-9]+ )+$' log
echo "this it" | grep -E '^([0-9]+ ?)+$' log
echo "this  it" | grep -E '^([0-9]? ?)+$' log
```
