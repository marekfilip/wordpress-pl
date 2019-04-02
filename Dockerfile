FROM wordpress:5.0

RUN mkdir -p /var/www/html/wp-content/languages \
    && curl -o /var/www/html/wp-content/languages/pl.mo https://translate.wordpress.org/projects/wp/5.0.x/pl/default/export-translations/?format=mo

RUN apt-get update && apt-get install -y \
    unzip \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html/wp-content/plugins \
    && curl -o /var/www/html/wp-content/plugins/woocommerce.zip https://downloads.wordpress.org/plugin/woocommerce.3.5.7.zip \
    && unzip /var/www/html/wp-content/plugins/woocommerce.zip -d /var/www/html/wp-content/plugins \
    && rm /var/www/html/wp-content/plugins/woocommerce.zip