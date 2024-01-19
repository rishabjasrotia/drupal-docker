# AWS Terraform EKS Setup

https://developer.hashicorp.com/terraform/tutorials/kubernetes/eks


This tutorial assumes that you are familiar with the Terraform workflow. If you are new to Terraform, complete the [Get Started collection](https://developer.hashicorp.com/terraform/tutorials/aws-get-started) first.
For this tutorial, you will need:
* Terraform v1.3+ installed locally.
* an [AWS account](https://portal.aws.amazon.com/billing/signup?nc2=h_ct&src=default&redirect_url=https%3A%2F%2Faws.amazon.com%2Fregistration-confirmation#/start)
* the AWS CLI v2.7.0/v1.24.0 or newer, [installed](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) and [configured](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)
* [AWS IAM Authenticator](https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html)
* kubectl v1.24.0 or newer


# Deploy Steps

```
terraform init
terraform plan -out tfplan
terraform apply “tfplan”
```

# Destroy Steps
```
terraform destroy
```
