build-drupal:
  source
	composer install
	./vendor/bin/drush cr
  drupal-install

drupal-install:
  ./vendor/bin/drush site-install standard --db-url=$DB_URL --site-name=$SITE_NAME --account-name=$DRUPAL_USER --account-pass=$DRUPAL_PASSWORD -y

