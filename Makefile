build:
	docker compose up -d
	docker exec -it drupal-fpm sh

build-minikube:
	minikube start
	kubectl apply -f iac/docker/helm
	helm install ngnix iac/docker/helm/charts/ngnix/ --values iac/docker/helm/charts/ngnix/values.yaml
	helm install drupal-fpm iac/docker/helm/charts/drupal-fpm/ --values iac/docker/helm/charts/drupal-fpm/values.yaml
	helm install mysql iac/docker/helm/charts/mysql/ --values iac/docker/helm/charts/mysql/values.yaml
	helm install phpmyadmin iac/docker/helm/charts/phpmyadmin/ --values iac/docker/helm/charts/phpmyadmin/values.yaml

build-tunnel:
	minikube tunnel

run-minikube:
	minikube service ngnix

deploy-minikube:
	cd app && composer install && cd ..
	chmod +x scripts/deploy-k8s && scripts/deploy-k8s

update-minikube:
	cd app && composer install && cd ..
	chmod +x scripts/update-k8s && scripts/update-k8s
