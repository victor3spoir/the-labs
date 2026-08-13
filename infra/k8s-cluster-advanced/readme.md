# Setup Kubernetes Cluster (k3s) with Terraform & Ansible

This project provisions infrastructure with **Terraform** and configures a **k3s Kubernetes cluster** using **Ansible**.

The workflow is:

```txt
Terraform → create servers
Ansible → install and configure k3s
kubectl → manage the cluster
```

# Project Structure

```
.
├── compose.yml
├── readme.md
├── ansible
│   ├── inventory
│   │   └── hosts.yml
│   └── playbooks
│       └── setup-k3s.yml
└── terraform
    ├── main.tf
    ├── providers.tf
    ├── variables.tf
    └── config
        ├── srv-master.yml
        └── srv-worker.yml
```

| Folder      | Purpose                                |
| ----------- | -------------------------------------- |
| terraform   | Infrastructure provisioning            |
| ansible     | Server configuration and cluster setup |
| compose.yml | Runs Ansible container                 |
| readme.md   | Project documentation                  |

## 01. Infrastructure Provisioning (Terraform)

Terraform creates two servers:

* **srv-master** → Kubernetes control plane
* **srv-worker** → Kubernetes worker node

Configuration files are located in:

```
terraform/config/
```

Initialize Terraform:

```bash
cd terraform
terraform init
```

Review the execution plan:

```bash
terraform plan
```

Apply infrastructure:

```bash
terraform apply
```

After completion Terraform will provision the servers defined in:

```
terraform/config/srv-master.yml
terraform/config/srv-worker.yml
```

## 02. Configure Servers (Ansible)

Once the servers are created, Ansible installs **k3s** and configures the cluster.

Inventory file:

```
ansible/inventory/hosts.yml
```

Playbook:

```
ansible/playbooks/setup-k3s.yml
```

The playbook will:

1. Install **k3s server** on the master node
2. Retrieve the **cluster token**
3. Install **k3s agent** on worker nodes
4. Join workers to the cluster

## 03. Run Ansible

Ansible runs inside a container defined in:

```
compose.yml
```

Start the container:

```bash
docker compose up -d
```

Enter the container:

```bash
docker compose exec ansible sh
```

Run the playbook:

```bash
ansible-playbook ansible/playbooks/setup-k3s.yml
```

## 04. Verify Cluster

Login to the **master node**:

```bash
ssh ubuntu@srv-master
```

Export kubeconfig:

```bash
mkdir -p ~/.kube

sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
sudo chown ubuntu:ubuntu ~/.kube/config
chmod 600 ~/.kube/config
```

Check cluster nodes:

```bash
kubectl get nodes
```

Expected output:

```
NAME         STATUS   ROLES                  AGE
srv-master   Ready    control-plane,master
srv-worker   Ready    <none>
```

## 05. Manage Cluster from Host

Copy the kubeconfig from the master server to your host:

```bash
scp ubuntu@srv-master:~/.kube/config ~/.kube/config
```

Edit the configuration:

Change

```
https://127.0.0.1:6443
```

to

```yml
https://srv-master:6443
```

For development environments you may also add:

```yml
insecure-skip-tls-verify: true
```

Test access:

```bash
kubectl get nodes
```

## 06. Useful Tools

Managing Kubernetes contexts with `kubectl` can be tedious.

Two useful utilities:

### kubectx

Switch contexts quickly.

[https://github.com/ahmetb/kubectx](https://github.com/ahmetb/kubectx)

### kubens

Switch namespaces quickly.

[https://github.com/ahmetb/kubectx](https://github.com/ahmetb/kubectx)

Examples:

| Action           | kubectl                                                | kubectx / kubens |
| ---------------- | ------------------------------------------------------ | ---------------- |
| Switch context   | `kubectl config use-context k3s`                       | `kubectx k3s`    |
| List contexts    | `kubectl config get-contexts`                          | `kubectx`        |
| Change namespace | `kubectl config set-context --current --namespace=dev` | `kubens dev`     |

## 07. Destroy Infrastructure

To remove all servers:

```bash
cd terraform
terraform destroy
```
