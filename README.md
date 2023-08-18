Docker Base Drupal 10 Setup

## How to setup
- Build the docker image using following command ```docker compose up -d```
- Execute the Drupal container ```docker exec -it drupal-fpm sh```
- Inside the Drupal container run composer command to install Drupal ```composer install```
- Visit the localhost your local vhost domain example ```http://www.your_domain```
- Run the installation script: Visit your site in a web browser. You should be redirected to the installer page at /core/install.php
- Refer: https://www.drupal.org/docs/user_guide/en/install-run.html


