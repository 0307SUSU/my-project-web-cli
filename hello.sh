#!/bin/bash
echo "Hello World!"  # 输出文本
echo -n "请输入名字：$1"
read name
echo -n "请输入年龄：$2"
read age
echo "你叫$name 你的年龄是$age 岁，你是我老板！"
echo "所有参数：$@"
echo "参数个数：$#"
echo "脚本运行的当前进程ID号：$$"