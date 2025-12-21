#!/bin/sh
set -e

# Генерируем ключи
UUID=$(xray uuid)
KEYS=$(xray x25519)
PRIVATE_KEY=$(echo "$KEYS" | grep "Private key:" | awk '{print $3}')
PUBLIC_KEY=$(echo "$KEYS" | grep "Public key:" | awk '{print $3}')
cat > /etc/xray/config.json <<EOL
{
    "log": {
        "loglevel": "warning"
    },
    "inbounds": [
        {
            "port": 4443,
            "protocol": "vless",
            "settings": {
                "clients": [
                    {
                        "id": "$UUID",          // здесь вставить uuid, сгенерированный на шаге №2
                        "flow": "xtls-rprx-vision"
                    }
                ],
                "decryption": "none"
            },
            "streamSettings": {
                "network": "tcp",
                "security": "reality",
                "realitySettings": {
                    "dest": "ya.ru:443",        // здесь заменить `example.com` на ваш сайт из шага №3, порт оставляем
                    "serverNames": [
                        "ya.ru",                // заменить на ваш сайт из шага №3
                        "www.ya.ru"   // и добавить альтернативные имена (если есть)
                    ],
                    "privateKey": "$PRIVATE_KEY",// вставить приватный ключ (Private key), созданный на шаге №2
                    "shortIds": [
                        "0a381e1fa219",         // Список уникальных коротких идентификаторов, доступных клиентам, чтобы их различать
                        "be0ce04754dc",         // Длина: от 2 до 16 символов. Используемые символы: 0-f.
                        "41beec74f4bc"          // Для удобства, значения можно сгенерировать командой `openssl rand -hex 6`
                    ]
                }
            },
            "sniffing": {
                "enabled": true,
                "destOverride": [
                    "http",
                    "tls"
                ]
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom",
            "tag": "direct"
        }
    ]
}
EOL

echo "=== Конфигурация ==="
echo "UUID: $UUID"
echo "Public Key: $PUBLIC_KEY"

exec xray -c /etc/xray/config.json
