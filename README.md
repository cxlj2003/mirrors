使用Dock和Nginx搭建私有yum源
=
1.启动容器 
--
    docker run -d -p 80:80 --name mirrors cxlj2003/mirrors
    或
    docker run -d -p 80:80 --name mirrors registry.cn-hangzhou.aliyuncs.com/cxlj2003/mirrors
   
   2.自定义配置
--
    docker exec -it mirrors bash 
    配置文件在/etc/nginx/conf.d/
    可根据需求修改
3.客户端配置文件生成
--
   请自行百度，或参考阿里云或中科大帮助文件。
