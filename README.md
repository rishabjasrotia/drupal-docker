Docker Base Drupal 10 Container Setup

## How to setup
- Build the docker image using following command ```docker compose up -d```
- Execute the Drupal container ```docker exec -it drupal-fpm sh```
- Inside the Drupal container run composer command to install Drupal ```composer install```
- Visit the localhost your local vhost domain example ```http://www.your_domain```
- Run the installation script: Visit your site in a web browser. You should be redirected to the installer page at /core/install.php
- Refer: https://www.drupal.org/docs/user_guide/en/install-run.html

Drupal Setup:
- Step 1: Select Language
  ![image](https://github.com/rishabjasrotia/d10docker/assets/33950743/f4c53116-42c5-48c3-94c1-158374972a5f)
- Step 2: Select Site Profile
  ![image](https://github.com/rishabjasrotia/d10docker/assets/33950743/aab1af97-c0ee-4395-bc59-b140cbb09fe7)
- Step 3: Setup Database
  ![image](https://github.com/rishabjasrotia/d10docker/assets/33950743/2289998d-d742-4a88-8bf9-64ef3203543e)
- Step 4: Drupal Installation Begins
  ![image](https://github.com/rishabjasrotia/d10docker/assets/33950743/d8c0a8a5-6bc0-4f9a-a997-fd5573781b2e)


