# Go で Docker の multi-stage build を試す

```bash
docker build -t app .

docker run --rm app
> Hello, world

# app のイメージサイズ ≒ バイナリのサイズ で「Go のバイナリを実行する環境」が実現できる
docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}"
REPOSITORY          TAG                 SIZE
<none>              <none>              805MB
app                 latest              2.01MB
golang              1.13                803MB
```