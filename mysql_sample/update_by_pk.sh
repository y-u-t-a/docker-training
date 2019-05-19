#!/bin/bash

######### 接続情報 ########
MYSQL_USER=root
MYSQL_PWD=root
MYSQL_DATABASE_NAME=sample
##########################

if [ $# -ne 1 ]; then
  echo "[error] 第一引数にインプットファイルのパスを入力してください" 
  exit 1
fi

if [ ! -e $1 ]; then
  echo "[error] 存在しないファイルが指定されています"
  exit 1
fi

target_file=$1

read -p "テーブル名を入力してください: " table

MYSQL_PWD="$MYSQL_PWD" mysql -u "$MYSQL_USER" -D "$MYSQL_DATABASE_NAME" -e "select 1 from $table limit 1;"

if [ ! $? -eq 0 ]; then
  echo "[error] 入力されたテーブル「$table」はいれ存在しません"
  exit 1
fi

# インプットファイル1行目をカンマ区切りにする（主キーのカラム名）
declare -a keys=($(head -n 1 "$target_file" | tr "," " "))

# インプットファイルの2行目以降でループ
tail -n +2 $target_file | while read line || [ -n "${line}" ];
do
  sql="UPDATE SET version = 1 "
  sql_where=" where 1=1 "
  declare -a values=($(line | tr "," " "))
  i=0
  for v in "${keys[@]}"
  do
      sql_where="$sql_where AND ${keys[$i]} = ${values[$i]}"
      let i++
  done
  echo "$sql $sql_where"
done