# Terraform Monitoring

This project aims to show how to use infrastucture as code to deliver
monitoring, alerting and incident creation.

## Creating a new environment

In oder to create a new env from scratch you need to:

1) Run the terraform-state module
2) Run the base module

## Docker

### Pre-requisites

Ensure you have AWS `~.aws/credentials` and `~/.aws/config` files and that the
user has permissions to create and manage AWS resources.

Ensure you have `~/.ssh/id_rsa.pub` and `~/.ssh/id_rsa` files that can be used
to create connect to the EC2 instances created.

### Running

From the `docker` directory

```sh
make terraform
```


