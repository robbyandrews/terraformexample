# Terraform Triton Provider Example

## Requirements for use
* Terraform must be installed and ideally in your PATH.

* To utilize the `joyent/triton` provider you must have an account on a Triton installation, to use as-is in the example requires an `mnx.io` Triton account with an ssh-key uploaded to your account.

* The Triton CLI is recommended but not required.


## Using the example main.tf
In this repo you will find an example main.tf that includes the joyent/triton provider declared. It also includes a terraform plan to deploy one version 22.4.0 base-64-lts SmartOS instance in the mnx.io us-central datacenter.

After cloning this repo, `cd` to the directory where you have cloned this repo and run `terraform init` to install the Triton provider. Next, check if you have `SDC_ACCOUNT` and `SDC_KEY_ID` environment varibles set, if you choose not to use the env variables, you must set the `account` and `key_id` options in the `main.tf` file.  It is also recommended to run `ssh-agent` and use `ssh-add` to add your ssh key associated with your Triton account to the `ssh-agent`.  

Once you have either set your environment variables or filled out the options in the `main.tf`, use `terraform plan` to validate your settings and verify that your file is formatted correctly.  If there are no errors, you can then use `terraform apply` to provision.  If you wish to provision something other than a base-64-lts SmartOS image, in the Triton CLI please use the `triton img ls` and `triton pkg ls` to list alternative images and packages.



