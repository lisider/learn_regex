
- awk

```c

在linux 下面, awk 是 gawk 的软链接

```

```c

awk -Fs '/pattern/ {action}' input-file
awk -Fs -f scripts.awk input-file
awk  -f scripts.awk input-file


awk -F: '/mail/ {print $1}' /etc/passwd
```

