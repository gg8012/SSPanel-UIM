FROM php:8.1-apache

# 安装依赖
RUN apt-get update && apt-get install -y \
    git unzip libonig-dev libzip-dev zip curl libpq-dev \
    && docker-php-ext-install pdo pdo_mysql zip

# 拷贝代码
COPY . /var/www/html/

# 设置工作目录
WORKDIR /var/www/html/

# 权限
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# 启用 Apache mod_rewrite
RUN a2enmod rewrite
