# cloud-courses
deployment of a wordpress using Ansible, Packer, Terraform

1) Ansible

I have a hosts file that contains the IP address of my server
Then, in my playbook.yml i apply to my server different commands defined in my roles. To run a wordpress, I need 4 things: wordpress, php, mysql and server.

the command to run the playbook is: ansible-playbook playbook.yml -i hosts -u root 

2)Packer

I exported my organization ID and a token as environment variable in the bashrc.
then, I modified the template with my own variables and added my ansible playbook in the provisioners.

command to run packer:

packer build scaleway-cloud-courses-template.json

3) terraform

I defined my infrastructure in scaleway.tf and my variables with variables.tf.
my tokens are stored in a configuration file variables.tfvars

commands to  run terraform:
terraform init
terraform plan -var-file="variables.tfvars"
terraform apply -var-file="variables.tfvars"


