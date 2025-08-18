

```markdown
# Xray Reality Docker Image

![Docker](https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white)
![Xray](https://img.shields.io/badge/Xray-1177AA?style=for-the-badge)

Docker образ для быстрого разворачивания Xray с Reality протоколом

## 🚀 Быстрый старт

```bash
docker run -d \
  --name=xray-reality \
  --restart=unless-stopped \
  -p 443:443 \
  anclave777/xray-reality-rg_alpin:0.2
```

## 🔍 Получение параметров подключения

После запуска контейнера просмотрите логи для получения UUID и публичного ключа:

```bash
docker logs xray-reality
```

## ⚙️ Шаблон конфигурации подключения

```
vless://<uuid>@<SERVER_IP>:443?type=tcp&security=reality&pbk=<public_key>&fp=chrome&sni=<domain>&sid=<short_id>&flow=xtls-rprx-vision#MyRealityVPN
```

Где:
- `<SERVER_IP>` - IP вашего сервера
- `<public_key>` - публичный ключ из логов
- `<domain>` - один из доменов из serverNames
- `<short_id>` - одно из значений shortIds

## 🔥 Правила iptables

```bash
*nat
-A POSTROUTING -s 172.17.0.0/16 ! -o docker0 -j MASQUERADE

*filter
-A DOCKER -d 172.17.0.3/32 ! -i docker0 -o docker0 -p tcp -m tcp --dport 443 -j ACCEPT
```

## 📱 Поддерживаемые клиенты

- [NekoRay 4.0.1](https://github.com/MatsuriDayo/NekoRayForDesktop/releases)
- [NekoBox 1.3.9](https://github.com/MatsuriDayo/NekoBoxForAndroid/releases)

## 📌 TODO

- [ ] Автоматическая генерация ссылки подключения
- [ ] Проверка доступности ресурсов (GEOip фильтрация)
- [ ] Добавить поддержку динамических доменов
