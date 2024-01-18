build:
	docker compose up -d
	docker exec -it drupal-fpm sh

build-minikube:
	minikube start
	kubectl apply -f iac/docker/helm
	kubectl apply -f iac/docker/helm/nginx
	kubectl apply -f iac/docker/helm/drupal
	kubectl apply -f iac/docker/helm/mysql
	kubectl apply -f iac/docker/helm/phpmyadmin

build-tunnel:
	minikube tunnel

run-minikube:
	minikube service ngnix

deploy-minikube:
	cd app && composer install && cd ..
	chmod +x scripts/deploy-k8s && scripts/deploy-k8s

update-minikube:
	cd app && composer install && cd ..
	chmod +x scripts/deploy-k8s && scripts/deploy-k8s