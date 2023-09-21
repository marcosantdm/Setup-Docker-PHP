# Define a versão do PHP que deseja utilizar
FROM php:8.1-fpm

# Coloque seu nome. Ex: user=marcos  
# NÃO ALTERE O uid!
ARG user=marcos
ARG uid=1000

# Instala as dependências de sistema ou atualiza as existentes
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Limpa o cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Instala as extensões necessárias do PHP
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd sockets

# Instala a ultima versão do Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Cria um usuário root para rodar os comandos do Composer e Artisan
RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

# Instala o redis
RUN pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    &&  docker-php-ext-enable redis

# Define o diretório workdir
WORKDIR /var/www

# Copia configurações customizadas do PHP
COPY docker/php/custom.ini /usr/local/etc/php/conf.d/custom.ini

USER $user