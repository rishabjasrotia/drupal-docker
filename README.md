
**Docker Base Drupal 10 Container Setup with Kubernetes Support**

## Support
- AWS EKS
- Minkube


## How to setup
- Build the setup using following command ```make build```
- Execute the Drupal container ```docker exec -it drupal-fpm sh```
- Inside the Drupal container run composer command to install Drupal ```make build-drupal```
- Visit the localhost your local vhost domain example ```http://www.your_domain```
- Done now you should be able to ready to use your Drupal Local Setup.
- Refer: https://www.drupal.org/docs/user_guide/en/install-run.html


## Post Installation

 - Fix Site UUID:
	 - How to fix the config sync site uuid => Export the current site uuid ```./vendor/bin/drush config-get "system.site" uuid``` 
	 - Replace the **exported uuid** with the value in `app/config/sync/system.site.yml` **uuid**
- Fix the Shortcut link and Default:
	- Go to => Home > Administration > Configuration > User interface > Shortcuts (admin/config/user-interface/shortcut), than in "List links" of "Default"
	- Delete every shortcut.
	- Rebuild Drupal Cache.


## Kubernetes MiniKube

- Build Minikube Helm Files:
	- ```make build-minikube```
- Deploy code to minkube containers:
	- ```make deploy-minikube```
- Run Minikube Tunnel and expose Nginx container port:
	- ```make build-tunnel```
	- ```make run-minikube```
- Add domain to local host i.e. ```/etc/host``` file

## Post Deployment to minikube 
- We can use following command to just update drupal & nginx containers files:
	- ```make update-minikube```
