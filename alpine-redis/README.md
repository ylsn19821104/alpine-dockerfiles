# alpine-redis

## 构建image
docker build -t alpine-redis .

## 启动容器
docker run -d -p 1908:22 -p 9000:6379  --name redis alpine-redis