# texlive-groff-ja

日本語向け texlive + groff Docker イメージ

paperist/texlive-ja に groff や ghostscript 等、出版編集作業に必要なパッケージを追加したイメージ

docker client もインストールしてある

## Supported tags / タグ一覧

- [`latest`](./build/Dockerfile)
  - AMD64, ARM64 (M1 mac) に対応

## Install / インストール

Docker Hub もしくは GitHub Container Registry からインストールできます

### Docker Hub

```bash
docker pull tecolicom/texlive-groff-ja:latest
```

## Usage / 使い方

```bash
$ docker run --rm -it -v $PWD:/workdir tecolicom/texlive-groff-ja:latest \
    sh -c 'latexmk -C main.tex && latexmk main.tex && latexmk -c main.tex'
```

### docker-in-docker 環境でシェルを実行

```bash
$ docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v $PWD:/workdir tecolicom/texlive-groff-ja:latest \
```

## SEE ALSO

- https://hub.docker.com/r/tecolicom/texlive-groff-ja
- https://github.com/tecolicom/docker-texlive-groff-ja

- https://hub.docker.com/r/paperist/texlive-ja
- https://github.com/Paperist/texlive-ja

## License / ライセンス

MIT ©︎ 2022 Kaz Utashiro

---

Based on [paperist/texlive-ja] \(under the MIT License\).

[paperist/texlive-ja]: https://github.com/paperist/texlive-ja
