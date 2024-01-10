# Terraform Triton Provider Example

## Requirements for use
Terraform must be installed and ideally in your PATH.
To utilize the `joyent/triton` provider you must have an account on a Triton installation, to use as-is in the example requires an `mnx.io` Triton account with an ssh-key uploaded to your account.


## Using the example main.tf
In this repo you will find an example main.tf that includes the joyent/triton provider declared. It also includes a terraform plan to deploy one version 22.4.0 base-64-lts SmartOS instance in the mnx.io us-central datacenter.

