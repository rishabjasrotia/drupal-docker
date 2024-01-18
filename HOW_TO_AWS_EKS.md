## AWS EKS

Amazon Elastic Kubernetes Service

Prerequisite:
- AWS CLI configured.
- IAM role has Administrator Access Permission.

Steps to follow:
1. Create AWS EKS Cluster i.e. https://docs.aws.amazon.com/eks/latest/userguide/create-cluster.html
2. Create Node Role i.e https://docs.aws.amazon.com/eks/latest/userguide/create-node-role.html
  - Run the following command to create the node-role-trust-relationship.json file.
    ```cat >node-role-trust-relationship.json <<EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Effect": "Allow",
          "Principal": {
            "Service": "ec2.amazonaws.com"
          },
          "Action": "sts:AssumeRole"
        }
      ]
    }
    EOF```
  - Create the IAM role.
    ```
    aws iam create-role \
      --role-name AmazonEKSNodeRole \
      --assume-role-policy-document file://"node-role-trust-relationship.json"
    ```
  - Attach two required IAM managed policies to the IAM role.
    ```
    aws iam attach-role-policy \
      --policy-arn arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy \
      --role-name AmazonEKSNodeRole
    aws iam attach-role-policy \
      --policy-arn arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly \
      --role-name AmazonEKSNodeRole
    ```
3. Create Node Groups i.e. https://docs.aws.amazon.com/eks/latest/userguide/create-managed-node-group.html
4. Connect to AWS eks
    ```
    aws eks --region <region> update-kubeconfig --name <cluster_name>
    aws eks --region ap-south-1 update-kubeconfig --name artworks
    ```
5. Clone the code to AWS CLI or Local terminal ```git checkout aws-k8s```
6. Apply helm files
    ```
    kubectl apply -f iac/docker/helm
    kubectl apply -f iac/docker/helm/phpmyadmin
    kubectl apply -f iac/docker/helm/mysql
    kubectl apply -f iac/docker/helm/drupal
    kubectl apply -f iac/docker/helm/nginx
    ```
7. Make /var/www/html path in ngnix container
    ```
    kubectl exec -it ngnix-6978c9db6f-7rthm  -- /bin/sh 

    mkdir -p /var/www/html    
    ```
8. Composer Install & copy files to containers
    ```
    composer install
    chmod +x scripts/deploy-k8s && scripts/deploy-k8s
    ```
9. Copy nginx.conf to nginx container 
    ```
    kubectl cp iac/docker/nginx-conf/ ngnix-6978c9db6f-7rthm:/etc/nginx/conf.d/ -c ngnix -n default 
    ```
10. Expose External IP
    ```
    kubectl expose deployment ngnix --type=LoadBalancer --name=ngnix-expose

    //Verify

    [cloudshell-user@ip-XX-XX-40-248 drupal-docker]$ kubectl get services
    NAME           TYPE           CLUSTER-IP       EXTERNAL-IP                                                               PORT(S)        AGE
    drupal-fpm     ClusterIP      XX.XX.206.124   <none>                                                                    9000/TCP       19m
    kubernetes     ClusterIP      XX.XX.0.1       <none>                                                                    443/TCP        28m
    mysql          ClusterIP      XX.XX.33.90     <none>                                                                    3306/TCP       20m
    ngnix          NodePort       XX.XX.125.9     <none>                                                                    80:31960/TCP   19m
    ngnix-expose   LoadBalancer   XX.XX.130.181   b54896f17b3a644698d9ee63a41a17dc-378462229.ap-south-1.elb.amazonaws.com   80:30307/TCP   11s
    phpmyadmin     ClusterIP      XX.XX.174.52    <none>                                                                    8080/TCP       20m
    [cloudshell-user@ip-XX-XX-40-248 drupal-docker]$ 
    ```
11. Visit your public IP i.e. b54896f17b3a644698d9ee63a41a17dc-378462229.ap-south-1.elb.amazonaws.com


