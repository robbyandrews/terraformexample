# This is an example main.tf file for Triton that has the provider declared and will provision a base-64-lts
# SmartOS 22.4.0 instance in a c1.small package on mnx.io.  To use please either set your env variables 
# using the triton cli, manually, or set your account details in the provider block below.


# This will install the Triton provider when used with "terraform init" when this is placed in your .tf files
# such as this example main.tf

terraform {
  required_providers {
    triton = {
      source = "joyent/triton"
      version = "0.8.2"
    }
  }
}


provider "triton" {

# The Triton Provider can take advantage of Triton env variables "SDC_ACCOUNT" and "SDC_KEY_ID"
# If these are set then the "account" and "key_id"/"key_material" options do not need to be set.
   # account = "accountname"

   # To use key_id you must use ssh-agent and add your key to the agent with ssh-add.
   # key_id  = "keyid"
   
   # If not using ssh-agent, you must provide your private key in the key_material option
   # key_material = "private key here"


  # If using a private installation of Triton, specify the URL, otherwise
  # set the URL according to the region you wish to provision.
  url = "https://us-central-1.api.mnx.io/"

  # If you want to use a triton account other than the main account, then
  # you can specify the username as follows (this is for subaccounts based on the main account)

  # If using a test Triton installation (self-signed certifcate), use:
  insecure_skip_tls_verify = false
}

data "triton_image" "base" {
  name    = "base-64-lts"
  version = "22.4.0"
} 

resource "triton_machine" "test-cns" {
    name    = "test-cns"
    package = "c1.small"
    image   = "${data.triton_image.base.id}"

    cns {
        services = ["frontend", "app"]
    }
}
