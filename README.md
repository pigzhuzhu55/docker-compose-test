# docker-compose-test

## 启动服务
+ 先不要使用后台进程启动，看服务是否正常
docker-compose up
+ 后台进程启动  docker-compose up -d

+ 停止容器服务
docker-compose stop

## 查看容器日志
+ 首先切到docker-compose.yml文件的目录，执行docker-compose ps,可以看到容器的名称
+ 然后根据名称查看对应的日志
docker logs -ft --tail 100 dubbo-admin

## 进入容器内部
docker exec -it #容器id# bash