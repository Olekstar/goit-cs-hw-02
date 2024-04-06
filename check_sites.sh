#!/bin/bash

# Визначення масиву з URL вебсайтів
sites=("https://google.com" "https://facebook.com" "https://twitter.com")

# Визначення назви файлу логів
logfile="website_status.log"

# Очищення файлу логів перед запуском
> $logfile

# Функція для перевірки сайту
check_site() {
    if curl -s --head  --request GET $1 | grep "200 OK" > /dev/null; then 
        echo "$1 is UP"
        echo "$1 is UP" >> $logfile
    else
        echo "$1 is DOWN"
        echo "$1 is DOWN" >> $logfile
    fi
}

# Перебір усіх сайтів з масиву та виклик функції перевірки
for site in "${sites[@]}"; do
    check_site $site
done

# Виведення повідомлення про запис у файл логів
echo "Results have been written to $logfile"
