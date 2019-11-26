#### 在rancher 中将80端口通过nodeport方式映射成 `30080`

![](https://tva1.sinaimg.cn/large/006y8mN6gy1g8fccnu6qaj31dr0u0gsi.jpg)


#### 在rancher 中将443端口通过nodeport方式映射成 `30443`

![](https://tva1.sinaimg.cn/large/006y8mN6gy1g8fcdkcxjsj31is0u0jwz.jpg)

#### 通过`http`访问Rancher的nginx中配置

```
root@ip-172-31-15-150:~# cat /etc/nginx.conf
worker_processes 4;
worker_rlimit_nofile 40000;

events {
    worker_connections 8192;
}

http {
    upstream rancher {
        server 172.31.7.145:30443;
        server 172.31.2.21:30443;
        server 172.31.5.170:30443;
    }
    map $http_upgrade $connection_upgrade {
        default Upgrade;
        ''      close;
    }
    server {
        listen 80;

        location / {
            proxy_set_header Host $host:$server_port;
            proxy_set_header Origin '';
            proxy_http_version 1.1;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto http;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection "upgrade";
            proxy_pass https://rancher; #rancher server的https地址
        }
    }
}
```

#### 通过`https`访问Rancher的nginx中配置


```
root@ip-172-31-2-8:~# cat /etc/nginx.conf
worker_processes 4;
worker_rlimit_nofile 40000;

events {
    worker_connections 8192;
}

http {
    upstream rancher {
        server 172.31.7.145:30080;
        server 172.31.2.21:30080;
        server 172.31.5.170:30080;
    }

    map $http_upgrade $connection_upgrade {
        default Upgrade;
        ''      close;
    }

    server {
        listen 443 ssl http2; # 如果是升级或者全新安装v2.2.2,需要禁止http2，其他版本不需修改。
        server_name rancher.kingsd.top;
        ssl_certificate /cert/1893816_rancher.kingsd.top.pem;
        ssl_certificate_key /cert/1893816_rancher.kingsd.top.key;

        location / {
            proxy_set_header Host $host;
            proxy_set_header X-Forwarded-Proto $scheme;
            proxy_set_header X-Forwarded-Port $server_port;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_pass http://rancher;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection $connection_upgrade;
            # This allows the ability for the execute shell window to remain open for up to 15 minutes.
            ## Without this parameter, the default is 1 minute and will automatically close.
            proxy_read_timeout 900s;
            proxy_buffering off;
        }
    }

    #server {
    #    listen 80;
    #    server_name rancher.kingsd.top;
    #    return 301 https://$server_name$request_uri;
    #}
}
```
