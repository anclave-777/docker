# docker
site

# 🚀 Запуск Nginx + Certbot контейнера

```bash
docker run -it -p 80:80 -p 443:443 -d \
  --env CERTBOT_EMAIL=your@email.org \
  -v $(pwd)/nginxsecrets:/etc/letsencrypt \
  -v $(pwd)/user_conf.d:/etc/nginx/user_conf.d:ro \
  --name nginx-certbot \
  jonasal/nginx-certbot:latest
