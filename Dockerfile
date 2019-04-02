FROM wordpress:5.1

VOLUME /var/www/html

ENV WORDPRESS_VERSION 5.1.1
ENV WORDPRESS_SHA1 75f0786b3ccdfba9628f6b7d7695fb350f3153a6
ENV WORDPRESS_LANG pl_PL

RUN set -ex; \
	curl -o wordpress.tar.gz -fSL "https://pl.wordpress.org/wordpress-${WORDPRESS_VERSION}-${WORDPRESS_LANG}.tar.gz"; \
	echo "$WORDPRESS_SHA1 *wordpress.tar.gz" | sha1sum -c -; \
	tar -xzf wordpress.tar.gz -C /usr/src/; \
	rm wordpress.tar.gz; \
chown -R www-data:www-data /usr/src/wordpress
