# docker
## docker файл для образа:

https://hub.docker.com/repository/docker/anclave777/xray-reality-rg_alpin/tags/0.2/sha256-2126090e8b9c7db14e1d142136bfd5910e1425550b14b4051c46baf53550722f


## Рабочая версия 0.2
### Для просмотра публичного ключа и uid  используется команда:
root@resistance:/home/kwaigon# docker logs romantic_wilson


=== Конфигурация ===

## Шаблон формирования конфигурации для подключения
vless://<uuid >@<IP-адрес сервера>:443?type=tcp&security=reality&pbk=<публичный ключ>&fp=chrome&sni=<домен из serverNames в конфиге>&sid=<одно из значений shortIds в конфиге>&flow=xtls-rprx-vision#<произвольное название, под которым профиль будет сохранён в приложении>
