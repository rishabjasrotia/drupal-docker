build-drupal: build-composer drupal-install fix-permissions

build-composer:
	composer install

drupal-install:
	./vendor/bin/drush site-install standard --db-url="$${DB_URL}" --site-name="$${SITE_NAME}" --account-name="$${DRUPAL_USER}" --account-pass="$${DRUPAL_PASSWORD}" -y \
	  --verbose;

fix-permissions:
	chown -R www-data:www-data web/sites/default/files
	chmod -R 775 web/sites/default/files

drupal-update:
	composer install
	./vendor/bin/drush updb -y
	./vendor/bin/drush cr
	./vendor/bin/drush cim -y
	./vendor/bin/drush cr
