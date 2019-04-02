FROM wordpress:5.0

VOLUME /var/www/html

ENV WORDPRESS_VERSION 5.0.4
ENV WORDPRESS_SHA1 74f499c2abf18625a8400a93c97c5d87d682e798
ENV WORDPRESS_LANG pl_PL

RUN set -ex; \
	curl -o wordpress.tar.gz -fSL "https://pl.wordpress.org/wordpress-${WORDPRESS_VERSION}-${WORDPRESS_LANG}.tar.gz"; \
	echo "$WORDPRESS_SHA1 *wordpress.tar.gz" | sha1sum -c -; \
	tar -xzf wordpress.tar.gz -C /usr/src/; \
	rm wordpress.tar.gz; \
chown -R www-data:www-data /usr/src/wordpress
