# YAPC Japan Bitcoin with Perl

ビットコインをやってみようと思っていれば下記のコマンドを操作すると５分でビットコインのライブラリが使える環境ができます。

新しいコンテナーの名前は「yapc-osaka:2017」となります。

```
docker build -t yapc-osaka:2017 https://raw.githubusercontent.com/favioflamingo/bitcoin-tryout-perl/master/Dockerfile.amd64
```

Perlのビットコインのライブラリの詳細は[このページ](https://github.com/favioflamingo/libcbitcoin-perl)をご覧ください。すべての依存はdeb化されました。


コンテナーを作るときに下記のコマンドを使います。

```
docker run --rm=true -v $(pwd):/tmp/code --name yapc-osaka.run -it yapc-osaka:2017 /bin/bash
```

コンテナーのなかで自分が作ったコードが/tmp/codeに入っているはずです。




## リンク

[このウェブサイトでは](https://live.blockcypher.com/btc-testnet/pushtx/)送金ができます。

[このウェブサイトでは](https://live.blockcypher.com/btc-testnet/)アドレスとつながっている残高

[このウェブサイトでは](http://bitcoinfaucet.uo1.net/)TEST用のビットコインがもらえます。
