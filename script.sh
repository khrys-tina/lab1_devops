#!/bin/bash

# Встановлюємо URL-адресу сервера та код відповіді, який очікується
SERVER_URL="https://www.example.com"
EXPECTED_RESPONSE_CODE="2xx 3xx"

# Встановлюємо шлях до лог-файлу
LOG_FILE="/var/log/mylog.log"

# Виконуємо запит до сервера та отримуємо код відповіді
RESPONSE_CODE=$(curl -s -o /dev/null -w "%{http_code}" $SERVER_URL)

# Перевіряємо, чи є код відповіді очікуваним
if ! [[ "$EXPECTED_RESPONSE_CODE" =~ "$RESPONSE_CODE" ]]; then
    # Якщо код відповіді не є очікуваним, то записуємо помилку до лог-файлу
    echo "Error: unexpected response code $RESPONSE_CODE from $SERVER_URL" >> $LOG_FILE
fi
