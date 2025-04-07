---
title: "【初心者向け】Hugo + GitHub Pages + Actions でブログを自動デプロイする方法（PaperMod対応）"
date: 2025-04-03
tags: ["Hugo", "GitHub Pages", "GitHub Actions", "CI/CD", "静的サイト", "PaperMod"]
categories: ["ブログ構築"]
description: "Hugo × GitHub Pages × GitHub Actions を使った静的ブログの自動デプロイ手順を、初心者向けに完全解説。PaperMod テーマ対応、CI/CD の設定方法、403 エラーや README.md 問題の対処法まで網羅。無料で始めるモダンなブログ構築ガイドをお探しの方に最適です。"
keywords: ["Hugo GitHub Pages 自動デプロイ",　"Hugo GitHub Actions 設定方法",　"PaperMod デプロイ手順",　"静的サイト CI/CD 初心者",　"GitHub Pages README.md 表示される",　"github-actions bot 403 エラー",　"deploy.yml Hugo テンプレート",　"Hugo ブログ GitHub Actions",　"GitHub Pages Hugo 公開できない",　"Hugo GitHub Pages トラブルシューティング"]
cover:
  image: "images/2_post/hugo_githubactions.png"
  alt: "Hugo + Github Actions Automated Deployment"
#   caption: "画像の下に表示するキャプション"
  relative: false  # 必要なら絶対パス扱いに
  hidden: false     # trueにすると記事内には表示されずOGPのみ
---

## はじめに

Hugo でブログを作成し、GitHub Pages で公開しようとした際に、次のような壁にぶつかりました。

- `README.md` しか表示されない
- `github-actions[bot]` による push が 403 エラーで拒否される
- 自動デプロイがうまく動かない

この記事では、私が実際に解決した手順をもとに、**Hugo + GitHub Pages + GitHub Actions を使った静的ブログの自動公開方法**を、初心者向けに丁寧に解説します。

---

## 使用した技術スタック

- **Hugo**（静的サイトジェネレーター）
- **テーマ**：PaperMod
- **GitHub Pages**（ホスティング）
- **GitHub Actions**（CI/CD）

---

## 構成の全体図

```
Hugo（ローカル）
   ↓ push
GitHub（main または master ブランチ）
   ↓ GitHub Actions が起動
gh-pages ブランチに public/ を push
   ↓
GitHub Pages で公開
```

---

## 1. Hugo プロジェクトを作成

```bash
hugo new site my-blog
cd my-blog
git init
```

---

## 2. PaperMod テーマを導入

```bash
git submodule add https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
echo 'theme = "PaperMod"' >> hugo.toml
```

`config.toml`（または `hugo.toml`）に `baseURL` も忘れずに設定します。

```toml
baseURL = "https://your-github-username.github.io/your-repo-name/"
```

---

## 3. GitHub Actions の設定

`.github/workflows/deploy.yml` を作成。

```yaml
name: Deploy Hugo site to GitHub Pages

on:
  push:
    branches:
      - master  # or main

jobs:
  build-deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout source
        uses: actions/checkout@v3

      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: 'latest'

      - name: Build
        run: hugo --minify

      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./public
          user_name: github-actions[bot]
          user_email: github-actions[bot]@users.noreply.github.com
```

---

## 4. GitHub リポジトリの設定

### ✅ GitHub Pages 設定

- Branch: `gh-pages`
- Folder: `/ (root)`

### ✅ GitHub Actions のパーミッション設定

1. `Settings > Actions > General` を開く  
2. **Workflow permissions** で次を有効にする：
   - ✅ `Read and write permissions`
   - ✅ `Allow GitHub Actions to create and approve pull requests`

---

## 5. よくあるトラブルとその解決方法

### 🐛 `README.md` しか表示されない

- **原因**：Pages が `main`/`master` を公開対象としていた
- **解決**：`gh-pages` ブランチに切り替え、`public/` のみを push

### 🐛 `github-actions[bot]` が push できない（403 エラー）

- **原因**：`GITHUB_TOKEN` に書き込み権限がない
- **解決**：GitHub Actions の設定で「Read and write permissions」を明示的に有効にする

---

## 6. 自動デプロイの確認

`master` ブランチに記事やテーマを push すると、  
自動的に GitHub Actions が `public/` をビルドし、`gh-pages` にデプロイされ、即座に Web に反映されるようになります。

---

## まとめ

Hugo + GitHub Pages + GitHub Actions は、無料かつ簡単に始められるブログ運用のスタックです。  
手動でのビルドやアップロードを自動化することで、**開発に集中できる環境**が整います。

---

## おまけ：今後やってみたいこと

- 独自ドメインの設定（Cloudflare 経由も可）
- お問い合わせフォームの設置（Formspreeなど）
- 投稿記事の構造化データ対応（SEO強化）
- SNS自動投稿の連携（Zapier など）

---

## サンプル構成（リポジトリ構造）

```
.
├── content/
├── themes/PaperMod
├── static/
├── hugo.toml
├── public/           ← 自動生成されるビルド成果物
└── .github/workflows/deploy.yml
```

---

## 最後に

この記事が、Hugo × GitHub Pages の運用における「つまづきポイント」の解決に役立てば嬉しいです！  
技術ブログの世界に一歩踏み出すあなたを、心から応援しています。

---