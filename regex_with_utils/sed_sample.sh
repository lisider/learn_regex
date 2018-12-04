```c
sed 's/out/in/g' -i file.txt #全部替换,并改写文件
sed 's/out/in/' -i file.txt  #全部替换,并改写文件
sed  -n 's/out/in/gp'  file.txt  #全部替换,并打印出替换的行,不该写文件

```

```c
sed -n '/picqiu/ p' file.txt  #查找,并打印到屏幕,不打印默认输出
```
