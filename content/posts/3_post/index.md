---
title: "【解決】Hugo + PaperModでGoogleアナリティクスが機能しない？原因はuBlock Originかも"
date: 2025-04-03
tags: ["Hugo", "PaperMod", "Google Analytics", "uBlock Origin", "トラブルシューティング"]
categories: ["ブログ構築", "SEO対策"]
description: "Hugo + PaperModでGoogleアナリティクスが動作しない原因を徹底解説。uBlock Originなどの広告ブロッカーの影響で測定できないトラブルとその解決策を初心者向けに解説します。"
keywords: ["Hugo Googleアナリティクス 設定",　"PaperMod GA4 反映されない",　"uBlock Origin Google Analytics",　"gtag.js 読み込まれない 原因",　"静的サイト アクセス解析",　"広告ブロッカー 影響 Hugo",　"Google Analytics 動作確認方法",　"Hugo ブログ GA4 トラブルシューティング",　"uBlock Analytics 307 リダイレクト",　"Hugo PaperMod 計測できない"]
cover:
  image: "images/3_post/hugo_papermod_googleanalytics.png"
  alt: "Hugo + PaperMod + Googleアナリティクス"
#   caption: "画像の下に表示するキャプション"
  relative: false  # 必要なら絶対パス扱いに
  hidden: false     # trueにすると記事内には表示されずOGPのみ
---

# Hugo + PaperModでGoogleアナリティクスが機能しない？原因はuBlock Originかも

静的サイトジェネレータの **Hugo** と人気テーマ **PaperMod** を使ってブログを構築し、  
Googleアナリティクス（GA4）の設定も済ませた。なのに、アクセスが計測されない…。

そんなとき、**見落としがちな原因のひとつ**が、  
**広告ブロッカー（uBlock Originなど）によるスクリプトのブロック**です。

---

## ✅ この記事でわかること

- Hugo + PaperModでのGoogleアナリティクス設定方法（おさらい）
- `gtag.js`が読み込まれない理由
- uBlock Originがどのように影響するのか
- 解決策：広告ブロッカーの無効化と確認方法

---

## 1. Hugo + PaperModでGoogleアナリティクスを設定する方法

```toml
# config.toml
googleAnalytics = "G-XXXXXXXXXX"

[params]
  env = "production"
```

- `googleAnalytics` に **GA4の測定ID（例：G-ABC123XYZ）** を設定
- `params.env = "production"` とすることで、**本番環境**のみでスクリプトが有効化されます

PaperMod は内部で `_internal/google_analytics.html` を呼び出すため、特別なカスタマイズ不要で動作するはずです。

---

## 2. 設定は完璧なのに…？動作しないときにまず確認すべきこと

- **ブラウザのデベロッパーツール（F12）→ Network タブ**
- `gtag.js?id=G-XXXXX` にアクセスされているか
- ステータスコードが `200` になっているか

しかし、こんな状況に遭遇しました：

> `gtag.js` が **307 Internal Redirect**  
> Location: `chrome-extension://...` にリダイレクト

---

## 3. 原因はuBlock Originなどの広告ブロッカーだった

これは、**uBlock Origin** などの広告ブロック系拡張機能が、Googleアナリティクスの読み込みを**勝手に書き換えて**いたのです。

その結果、ローカル開発中や自分のアクセスが**Googleアナリティクスに記録されない**という状況に…。

---

## 4. 解決策：広告ブロッカーの無効化 or 別ブラウザで確認

### 🔸 方法1：シークレットモードで開く

- 拡張機能が無効になるため、純粋なアクセスで確認できます。

### 🔸 方法2：uBlock Originなどの拡張機能を一時的に無効化

1. Chromeの右上のパズルアイコン → `uBlock Origin`
2. 「このサイトでは無効化」をクリック
3. 再読み込みして挙動確認

---

## 5. 本番環境ではどうなる？

読者の多くは広告ブロッカーを使用していないため、**実際のアクセスは問題なく計測されます**。

開発中は意図的に無効化しておくことで、正しいトラッキングの確認が可能になります。

---

## ✅ まとめ

| 項目 | 内容 |
|------|------|
| Google Analytics 設定 | `config.toml` に測定IDを追加 |
| スクリプト読み込み確認 | DevTools → Networkタブで確認 |
| ブロックされる原因 | uBlock Originなどの広告ブロッカー |
| 解決策 | 拡張機能を無効化 or 別環境で確認 |

---

## 🎁 おまけ：読者に伝えておくと良いかも？

> 「広告ブロッカーを使っていると、アクセス解析が正しく行えない場合があります」  
> といった注意文を**フッターやプライバシーポリシー**に入れておくのも有効です。

---

## 📚 参考リンク

- [Google アナリティクス公式ヘルプ](https://support.google.com/analytics)
- [uBlock Origin GitHub](https://github.com/gorhill/uBlock)

---
