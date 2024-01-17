build:
	docker compose up -d
	docker exec -it drupal-fpm sh

build-minikube:
	minikube start
	Kubectl apply -f iac/docker/helm
	Kubectl apply -f iac/docker/helm/nginx
	Kubectl apply -f iac/docker/helm/drupal
	Kubectl apply -f iac/docker/helm/mysql

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