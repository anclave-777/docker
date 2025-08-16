#!/bin/sh
set -e

# Генерируем ключи
UUID=$(xray uuid)
KEYS=$(xray x25519)
PRIVATE_KEY=$(echo "$KEYS" | grep "Private key:" | awk '{print $3}')
PUBLIC_KEY=$(echo "$KEYS" | grep "Public key:" | awk '{print $3}')

# Создаем конфиг
cat > /etc/xray/config.json <<EOL
{
    "log": {"loglevel": "warning"},
    "inbounds": [{
        "port": 443,
        "protocol": "vless",
        "settings": {
            "clients": [{
                "id": "$UUID",
                "flow": "xtls-rprx-vision"
            }],
            "decryption": "none"
        },
        "streamSettings": {
            "network": "tcp",
            "security": "reality",
            "realitySettings": {
                "dest": "${DOMAIN:-habr.com}:443",
                "serverNames": ["${DOMAIN:-habr.com}"],
                "privateKey": "$PRIVATE_KEY",
                "shortIds": ["0a381e1f", "be0ce047"]
            }
        }
    }],
    "outbounds": [{"protocol": "freedom"}]
}
EOL

echo "=== Конфигурация ==="
echo "UUID: $UUID"
echo "Public Key: $PUBLIC_KEY"

exec xray -c /etc/xray/config.json
