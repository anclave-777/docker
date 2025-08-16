# docker
## docker файл для образа:

https://hub.docker.com/repository/docker/anclave777/xray-reality-rg_alpin/tags/0.2/sha256-2126090e8b9c7db14e1d142136bfd5910e1425550b14b4051c46baf53550722f


## Рабочая версия 0.2
### Для просмотра публичного ключа и uid  используется команда(остальное лежит в конфиге .sh):
root@resistance:/home/kwaigon# docker logs romantic_wilson


=== Конфигурация ===

## Шаблон формирования конфигурации для подключения

vless://<uuid >@<IP-адрес сервера>:443?type=tcp&security=reality&pbk=<публичный ключ>&fp=chrome&sni=<домен из serverNames в конфиге>&sid=<одно из значений shortIds в конфиге>&flow=xtls-rprx-vision#<произвольное название, под которым профиль будет сохранён в приложении>

## Правила iptables

*nat


-A POSTROUTING -s 172.17.0.0/16 ! -o docker0 -j MASQUERADE

*filter


-A DOCKER -d 172.17.0.3/32 ! -i docker0 -o docker0 -p tcp -m tcp --dport 443 -j ACCEPT

## Версии клиентов
nekoray-4.0.1-2024-12-12-windows64.zip


NekoBox-1.3.9-arm64-v8a.apk

### Todo:

1. Сформировать автоматическое формирование ссылки на подключение

2. 
3. ПРОВЕРЯТЬ доступность ресурсов пред их внесением в конфиг(фильтрация по GEOip итд)
