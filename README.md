# lara_teach

Коротко: учебный Laravel-проект с конфигом для Docker.

Быстрый старт (Docker):

Переименовать .env.example в .env в корневой папке и в папке проекта. При необходимости, поменять значения переменных.

Обращаю внимание, что название проекта берется из PROJECT_NAME и формируется при сборке

```bash
docker compose up -d --build
docker compose exec php composer install
docker compose exec php php artisan migrate --seed
```

Можно использовать как стартовый шаблон для разворачивания проектов на Laravel.

Создан для внутреннего использования, но если будет полезен кому-то еще, буду рад.