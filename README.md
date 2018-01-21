# WIP esa.vim - post esa.io from vim 

esa.vimはvim上からesa.ioに投稿できるvimプラグインです。
投稿以外のことはできません。
**esa.io公式プラグインではありません。[esa.io Web-API](https://docs.esa.io/posts/102)を利用しています。**

## 🐦 デモ

* ここにデモが入る

## 目次

* [利用時の注意](#dependency)
* [インストール](#installation)
* [開発](#contributing)
* [ライセンス](#License)

## dependency

esa.vimを使用するには、以下の準備が必要です。

* 環境変数の準備
* [esayari](https://github.com/ygnmhdtt/esayari)のインストール
* [peco](https://github.com/peco/peco)のインストール

### 環境変数
esa.vimは `ESA_TEAM` と `ESA_AUTH` の環境変数を必要とします。
`ESA_TEAM` は組織名です。
アクセスURLの `https://[組織名].esa.io` の部分です。

`ESA_AUTH` は[こちら](https://docs.esa.io/posts/102#3-0-0)を参考に取得するか、  
`https://[組織名].esa.io/user/applications` の `Personal access tokens` より取得してください。  
(`Select scopes`には`READ` `WRITE` ともチェックを入れてください。)

以下のように環境変数をセットします。値は自分のものに変更してください。

```
$ echo 'export ESA_TEAM="exampleteam"' >> ~/.bash_profile
$ echo 'export ESA_AUTH="Bearer 1234567890abcdef1234567890"' >> ~/.bash_profile
```

### esayari
esa.vimは記事カテゴリの取得に[esayari](https://github.com/ygnmhdtt/esayari)を利用しています。

#### esayariの配布方法記載

### peco
esa.vimは記事カテゴリの選択に[peco](https://github.com/peco/peco)を利用しています。
[こちら](https://qiita.com/lestrrat/items/de8565fe32864f76ac19)などを参考にインストールしてください。

## installation
vimプラグインマネージャに[Plug-vim](https://github.com/junegunn/vim-plug)を利用している場合:

* vimrc

```
Plug 'ygnmhdtt/esa.vim'
```

```
:source ~/.vimrc
:PlugInstall
```

その他のプラグインマネージャを利用されている方は、各プラグインマネージャの使い方に則ってください。

## contributing

* バグ報告等は [Issues](https://github.com/ygnmhdtt/esa.vim/issues)にpostしてください。
* コントリビューションはPRを送ってください。

## License

[MIT](https://github.com/ygnmhdtt/esa.vim/blob/master/LICENSE)
