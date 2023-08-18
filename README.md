Docker Base Drupal 10 Setup

## How to setup
- Build the docker image using following command ```docker compose up -d```
- Execute the Drupal container ```docker exec -it drupal-fpm sh```
- Inside the Drupal container run composer command to install Drupal ```composer install```
- Visit the localhost ```http://localhost```
- 
