# texlive-groff-ja

日本語向け texlive + groff Docker イメージ

paperist/texlive-ja に groff や ghostscript 等、出版編集作業に必要なパッケージを追加したイメージ

## Supported tags / タグ一覧

- [`latest`](./build/Dockerfile)
  - AMD64, ARM64 (M1 mac) に対応

## Install / インストール

The image can be installed from Docker Hub or GitHub Container Registry. <br/>
Docker Hub もしくは GitHub Container Registry からインストールできます

### Docker Hub

```bash
docker pull utashiro/texlive-groff-ja:latest
```

### GitHub Container Registry

```bash
docker pull ghcr.io/kaz-utashiro/texlive-groff-ja:latest
docker image tag ghcr.io/kaz-utashiro/texlive-groff-ja:latest kaz-utashiro/texlive-groff-ja:latest
```

## Usage / 使い方

```bash
$ docker run --rm -it -v $PWD:/workdir utashiro/texlive-groff-ja:latest \
    sh -c 'latexmk -C main.tex && latexmk main.tex && latexmk -c main.tex'
```

## License / ライセンス

MIT ©︎ 2022 Kaz Utashiro

---

Based on [paperist/texlive-ja] \(under the MIT License\).

[paperist/texlive-ja]: https://github.com/paperist/texlive-ja
