#!/bin/bash
set -e

PROJECT_NAME="${PROJECT_NAME}"

TARGET="/var/www/${PROJECT_NAME}"

if [ ! -f "${TARGET}/artisan" ]; then
    echo "==> Ensuring laravel installer is available..."
    if ! command -v laravel >/dev/null 2>&1; then
        composer global require laravel/installer --no-interaction --prefer-dist
    fi

    echo "==> Creating Laravel project: ${PROJECT_NAME} at ${TARGET} (in-place)..."
    mkdir -p "${TARGET}"
    cd "${TARGET}"

    # Prefer the installer to create files in the current directory; fall back to composer create-project
    if [ -z "$(ls -A .)" ]; then
        laravel new . --no-interaction || composer create-project --prefer-dist laravel/laravel . --no-interaction
    else
        echo "==> Target not empty — attempting in-place create (may overwrite)..."
        laravel new . --no-interaction 2>/dev/null || composer create-project --prefer-dist laravel/laravel . --no-interaction
    fi

    echo "==> Adjusting permissions (if applicable)..."
    chown -R www-data:www-data "${TARGET}" 2>/dev/null || true
else
    echo "==> Project ${PROJECT_NAME} already exists at ${TARGET}, skipping."
fi

exec "$@"