# Working with multipass - terraform - ansible

## Setup ansible in docker-image

First of all, make sure to add the private key of your root/admin user in the config folder `./config/private_key` (this will be used in compose file).

- Si vous n'avez pas de clée ssh, vous générer avec la commande ci-après

```bash
ssh-keygen -f ed25519 -f ~/.ssh/local
```

- Create the _ansible_ image that will help you work with ansible

```bash
docker buildx bake -f docker-bake.hcl ansible --call build
```

Your ansible image is ready for use.

- Create/Start hosts instances

Here, you use terraform to create or restart servers if they are down.

```bash
terraform init
terraform plan
terraform apply
```

## Start

- First, start the container

```bash
docker-compose up -d ansible
```

- Test if ansible is working well

```bash
docker-compose exec -it ansible sh -c "ansible all -m ping -i inventory/hosts.yml"
```

```bash
docker-compose exec -it ansible ansible-playbook playbooks/main.yml -i inventory/hosts.yml

```

### Work with ad-hoc modules

Use docker-compose exec -it to get in the container

```bash
# Gather information about hosts
anisble -i inventory/hosts.yml prod -m setup

# Run shell command on hosts
anisble -i inventory/hosts.yml prod -m shell -a 'df -h'

# Running script on the hosts
anisble -i inventory/hosts.yml prod -m script -a "./script.sh" --become 

# Install package using apt
ansible -i inventory/hosts.yml prod -m apt -a "name=nmap state=present update_cache=true" --become

# Get service state
ansible -i inventory/hosts.yml prod -m service -a "name=ssh state=started" --become

# Manage group & users
ansible -i inventory/hosts.yml prod -m group -a "name=developers state=present" --become #present != absend
ansible -i inventory/hosts.yml prod -m user -a "name=john state=present group=developers create_home=yes shell=/bin/bash"
```

### Deal with playbooks

```bash
ansible-playbook  playbooks/demo.yml -i inventory/hosts.yml
```

### Deal with roles

Set of predefined playbooks downloadable by using `ansible-galaxy install`
