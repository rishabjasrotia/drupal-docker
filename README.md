**Docker Base Drupal 10 Container Setup**

## How to setup
- Build the setup using following command ```make build```
- Execute the Drupal container ```docker exec -it drupal-fpm sh```
- Inside the Drupal container run composer command to install Drupal ```make build-drupal```
- Visit the localhost your local vhost domain example ```http://www.your_domain```
- Done now you should be able to ready to use your Drupal Local Setup.
- Refer: https://www.drupal.org/docs/user_guide/en/install-run.html


## Post Installation

- How to fix the config sync site uuid => Export the current site uuid ```./vendor/bin/drush config-get "system.site" uuid``` 
- Replace the **exported uuid** with the value in `app/config/sync/system.site.yml` **uuid**
