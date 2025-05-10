#!/bin/bash

# 実行権限付与(初回のみでOK) ↓
# chmod +x new_post.sh


# 念の為、アクセス権を確認したい場合 ↓
# ls -l new_post.sh


# ターミナル実行コマンド(例) ↓
# ./new_post.sh 29_post

POST_NAME=$1

if [ -z "$POST_NAME" ]; then
  echo "使い方: ./new_post.sh 投稿名（例: 28_post）"
  exit 1
fi

# 新規投稿作成
hugo new posts/${POST_NAME}/index.md

# 画像フォルダ作成
mkdir -p static/images/${POST_NAME}

echo "投稿と画像フォルダを作成しました！🎉"
