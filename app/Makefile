build-drupal:
  source
	composer install
	./vendor/bin/drush cr
  drupal-install
  ./vendor/bin/drush cr

drupal-install:
  ./vendor/bin/drush site-install standard --db-url=$DB_URL --site-name=$SITE_NAME --account-name=$DRUPAL_USER --account-pass=$DRUPAL_PASSWORD -y

drupal-update:
	composer install
	./vendor/bin/drush updb -y
  ./vendor/bin/drush cr
  ./vendor/bin/drush cim -y
  ./vendor/bin/drush cr

