# Working with multipass - terraform - ansible

## Setup ansible in docker-image

First of all, make sure to add the private key of your root/admin user in the config folder `./config/private_key` (this will be used in compose file).

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
docker-compose exec -it ansible ansible all -m ping -i inventory.yml
```

```bash
docker-compose exec -it ansible ansible-playbook playbooks/main.yml -i inventory.yml

```
