# 📘 My Hugo Blog

このリポジトリは [Hugo](https://gohugo.io/) を使って構築された静的ブログです。  
GitHub Pages を使って無料でホスティングしています。

---

## 📄 目次

- [使用技術](#使用技術)
- [ローカル環境での起動方法](#ローカル環境での起動方法)
- [記事の追加方法](#記事の追加方法)
- [公開（デプロイ）手順](#公開デプロイ手順)
- [メンテナンスに必要な作業](#メンテナンスに必要な作業)
- [参考リンク](#参考リンク)

---

## 🛠 使用技術

| 項目 | 内容 |
|------|------|
| フレームワーク | [Hugo](https://gohugo.io/) |
| テーマ | [PaperMod](https://github.com/adityatelange/hugo-PaperMod) |
| ホスティング | GitHub Pages |
| 記事フォーマット | Markdown (.md) |

---

## 🚀 ローカル環境での起動方法

初回のみ：

```bash
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
git submodule update --init --recursive
```

毎回使うとき：

```bash
hugo server -D
```

ローカルにて http://localhost:1313 でプレビューできます。

---

## ✏️ 記事の追加方法

```bash
hugo new posts/my-new-article.md
```

記事ファイルは content/posts/ に生成されます。

書き終わったら、フロントマターの draft: true を false に変更してください。

例：

```toml
---
title: "My New Article"
date: 2025-03-24
draft: false
tags: ["blog", "hugo"]
---
```

---

## 🌐 公開（デプロイ）手順
```bash
# 公開用のHTMLを生成
hugo
```

### public ディレクトリへ移動
```bash
cd public
```

### GitHub Pages 用にコミット＆プッシュ

```bash
git add .
git commit -m "Publish new article"
git push origin main
```
※ このディレクトリは GitHub Pages に紐づけられたリポジトリになっている必要があります。

### 🛠 メンテナンスに必要な作業

| 作業内容                           | 頻度             | コマンド or 手順例                                         | 備考 |
|------------------------------------|------------------|-------------------------------------------------------------|------|
| Hugo のバージョンアップ           | 月1回 or 任意    | `brew upgrade hugo`（Mac）<br>`choco upgrade hugo`（Windows） | 新機能や修正を取り込むため |
| テーマ（PaperMod）の更新          | 必要に応じて     | `git submodule update --remote`<br>`git commit -am "Update theme"` | 外観や機能の更新 |
| Markdownリンクチェック            | 記事公開時       | VS CodeのプラグインやCIツールでチェック                     | リンク切れ対策 |
| `config.toml` の設定確認          | 月1回 or 必要時  | 記事が正しく表示されない時に確認                            | タイトルやメタ情報など |
| デプロイ確認（GitHub Pages表示）  | 毎回の公開後     | ブラウザで `https://your-name.github.io/` を確認            | 表示崩れやリンク切れ確認 |
| GitHub Pages のビルドログ確認     | デプロイ失敗時   | GitHub → Actions → 該当ワークフローでログ確認              | デプロイ失敗時のトラブルシュート |
| `public/` の git 管理確認         | 公開するたび     | `git status` / `git add .` / `git commit` / `git push`      | GitHub Pages へ正しく反映させるため |
| ブログのヘッダー全面画像         | 記事作成時     | cover: image: "" alt: ""を使用する      | 画像サイズ　1920 x 1080 |

	横長 1200x630 px 程度（16:9）がおすすめ

---

# 🔗 参考リンク
Hugo 公式: https://gohugo.io/

PaperMod テーマ: https://github.com/adityatelange/hugo-PaperMod

GitHub Pages Docs: https://pages.github.com/

Markdown チートシート: https://www.markdownguide.org/cheat-sheet/
