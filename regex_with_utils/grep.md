```c
grep  支持 BRE
grep -E 支持 ERE
egrep 支持 ERE
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
