#!/bin/bash
mkdir -p /opt/www/html
loc=`curl mirrors.ustc.edu.cn | grep filename.*= | awk '{print $NF}'|awk -F "\"" '{print $2}'|uniq`
cat << EOF >/etc/nginx/conf.d/default.conf
server
    {
        listen 80;
        location / {
                root /opt/www/html;
                autoindex on;
                autoindex_exact_size off;
                autoindex_localtime on;
                #proxy_pass http://www.baidu.com;
        }
EOF
for l in $loc
do
cat << EOF >>/etc/nginx/conf.d/default.conf
        location /$l {
           proxy_pass https://mirrors.ustc.edu.cn/$l ;
        }
EOF
done
echo "}" >> /etc/nginx/conf.d/default.conf
