#!/bin/sh
sed "s/\${PROJECT_NAME}/$PROJECT_NAME/g" /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
nginx -g "daemon off;"
