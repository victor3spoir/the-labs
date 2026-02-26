# Setup Kuberenetes cluster (basics)

For this setup, we will use k3s distro from rancher avalaible on: <https://k3s.io/>

## 01. **Setup VMs**

02 VMs will be used for this setup.

```bash
multipass launch --memory 2G --disk 20G --name srv-k3s-01  24.04 # master node
multipass launch --memory 1G --disk 10G --name srv-k3s-02 24.04 # worker node
```

To get shell in the instances, use this command : `multipass shell srv-name`

## 02. **Setup master node**

The most of what is done is avalaible at the <https://docs.k3s.io/>. I recommand to read a bit the docs to get all what is going on here.

Open shell in the **srv-k3s-01** & run the command below:  

```bash
curl -sfL https://get.k3s.io | sh -
```

## 03. **Setup worker node**

> Before all setup, make sure srv-k3s-02 1 can srv-k3s-01 and vis-versa

Open shell int the **srv-k3s-02** & run the command below :

```bash
curl -sfL https://get.k3s.io |  \
  K3S_URL=https://srv-k3s-01.mshome.net:6443 \ # the IP address of the server
  K3S_TOKEN=complex-token-value-from-srv-k3s-01 \
  sh -
```

> Get token value by running this command on srv-k3s-01

```bash
sudo cat /var/lib/rancher/k3s/server/token
# Something like: K10d28a28bc37ff088a4a325e98fb2d1293d9009a0ffbe94693e4c52f6e2f673d64::server:28e7c3223ee4ab4c0d22785156121321
```

## 04. **Work with cluster**

All done, the cluster is setup.

By default, only root user can access to kube-config located under `/etc/rancher/k3s/k3s.yaml` on the **srv-k3s-01**. For the simple user of the server, execute theses instructions

```bash
# Create kube folder
mkdir ~/.kube

# Copy the config & change ownership & permissions
sudo cp /etc/rancher/k3s/k3s.yaml /home/ubuntu/.kube/config
sudo chown ubuntu:ubuntu ~/.kube/config
sudo chmod 600 ~/.kube/config

## Export KUBECONFIG
export KUBECONFIG=~/.kube/config
# or
echo "export KUBECONFIG=~/.kube/config" >> ~/.bashrc
```

Tapez la commande ci-après et voyez par vous-même:

```bash
kubectl get nodes
```

## 05. **Manage cluster from you host**

It is good to be able to manage your cluster from cluster master, but it is better to manage it from your host like you were working with remote servers.

### Step 01

Make sure `kubectl` is installed on your host.

You should have the folder `~/.kube` with `config` file on your user home dir; if not so, create them.

### Step 02

Copy the `~/.kube/config` from you srv-k3s-01 to you host. then adjust :

* Change server from  <https://127.0.0.1:6443> to <https://srv-k3s-01.mshome.net:6443>

* Add `tls-skip-verify: true` to cluster instructions

* Delete `certificate-authority-data` (never do in prod): this will fix tls error in dev mode.

* you can rename cluster, user & context if you have previous ones. (here, i will use k3s)

Your config will pass...

<details>
<summary>From</summary>

```yml
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUJkekNDQVIyZ0F3SUJBZ0lCQURBS0JnZ3Foa2pPUFFRREFqQWpNU0V3SHdZRFZRUUREQmhyTTNNdGMyVnkKZG1WeUxXTmhRREUzTnpJd05EWTNNRE13SGhjTk1qWXdNakkxTVRreE1UUXpXaGNOTXpZd01qSXpNVGt4TVRRegpXakFqTVNFd0h3WURWUVFEREJock0zTXRjMlZ5ZG1WeUxXTmhRREUzTnpJd05EWTNNRE13V1RBVEJnY3Foa2pPClBRSUJCZ2dxaGtqT1BRTUJCd05DQUFTQkZVQmJranQvc3htcy85c2EvMmR6UTdmVlVQcmczZ01FZWJmSmgyZGMKNWhIakdsMkpaeHN3aEFSaHN3ejF6VTZZTHJYcjhwWnI5MEJLcDdiSGtOU1RvMEl3UURBT0JnTlZIUThCQWY4RQpCQU1DQXFRd0R3WURWUjBUQVFIL0JBVXdBd0VCL3pBZEJnTlZIUTRFRmdRVStERHFtS0I1UHJtVDlqWUxGUTdUCk5PQ0pJemN3Q2dZSUtvWkl6ajBFQXdJRFNBQXdSUUloQU4wemdDUmhwT2t3K3JhMkYzSHpzb3N5VkY5cmxHQ1oKRkN6b3o5QUR3S0syQWlBMDlINWZJbWI4dDZTQlY0a1RTUFFURTQyWU5HUnY5elg1WlhSK2w4cVlFQT09Ci0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K
    server: https://127.0.0.1:6443
  name: default
contexts:
- context:
    cluster: default
    user: default
  name: default
current-context: default
kind: Config
users:
- name: default
  user:
    client-certificate-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUJrakNDQVRlZ0F3SUJBZ0lJWHBuNk9Ed2lKckV3Q2dZSUtvWkl6ajBFQXdJd0l6RWhNQjhHQTFVRUF3d1kKYXpOekxXTnNhV1Z1ZEMxallVQXhOemN5TURRMk56QXpNQjRYRFRJMk1ESXlOVEU1TVRFME0xb1hEVEkzTURJeQpOVEU1TVRFME0xb3dNREVYTUJVR0ExVUVDaE1PYzNsemRHVnRPbTFoYzNSbGNuTXhGVEFUQmdOVkJBTVRESE41CmMzUmxiVHBoWkcxcGJqQlpNQk1HQnlxR1NNNDlBZ0VHQ0NxR1NNNDlBd0VIQTBJQUJNelRJQmtLd01KeVp5ZzAKNEJhdWkwcVdZZ3lweWlscHptbFd3eW9Zb1dOaE1qT1NPSHJUa3R1UFpvS0liemlhRVFmd3htdDhrZktZVHMzUwpKSlJHeDc2alNEQkdNQTRHQTFVZER3RUIvd1FFQXdJRm9EQVRCZ05WSFNVRUREQUtCZ2dyQmdFRkJRY0RBakFmCkJnTlZIU01FR0RBV2dCU1VqS2k0aGVVY3pjYVd6M2pXZUUrTDZ1RXBRREFLQmdncWhrak9QUVFEQWdOSkFEQkcKQWlFQXl0VlVRV2hVMm5DZEkyRmNOaFFRUDg0WU5FWkNzclB4aTc3T2NnZ2ZseThDSVFDdkt2eFhUOFpDbjJ0UgovNkN3aE0wUVNIR1Vtcnd1aFpzcWgvUko3VkdnQ1E9PQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCi0tLS0tQkVHSU4gQ0VSVElGSUNBVEUtLS0tLQpNSUlCZGpDQ0FSMmdBd0lCQWdJQkFEQUtCZ2dxaGtqT1BRUURBakFqTVNFd0h3WURWUVFEREJock0zTXRZMnhwClpXNTBMV05oUURFM056SXdORFkzTURNd0hoY05Nall3TWpJMU1Ua3hNVFF6V2hjTk16WXdNakl6TVRreE1UUXoKV2pBak1TRXdId1lEVlFRRERCaHJNM010WTJ4cFpXNTBMV05oUURFM056SXdORFkzTURNd1dUQVRCZ2NxaGtqTwpQUUlCQmdncWhrak9QUU1CQndOQ0FBU1NmVDZ2WURacVBsZnRIdDdUTldVMGNwdnpsUWJoWjFvNzhwQStsMDQ3CkdZVEY4V2FkbzhOeGZmY3ZBM2JWakdrSmJ5NTUvTG5ieU1uS0FFU1VvaVBqbzBJd1FEQU9CZ05WSFE4QkFmOEUKQkFNQ0FxUXdEd1lEVlIwVEFRSC9CQVV3QXdFQi96QWRCZ05WSFE0RUZnUVVsSXlvdUlYbEhNM0dsczk0MW5oUAppK3JoS1VBd0NnWUlLb1pJemowRUF3SURSd0F3UkFJZ1g4cDlpWVVYUXhxTHNQa29rVTB6SEVEL1AwbEM1cnFKCnZUWTVSRmZJS0VnQ0lFRHRJWVQ2K1lSMUVQVkpmc2NTWGh3SzB4bGtLNnpBSTViK2tqNEJ1bFNRCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K
    client-key-data: LS0tLS1CRUdJTiBFQyBQUklWQVRFIEtFWS0tLS0tCk1IY0NBUUVFSUd2N0NreHlqWDRHQkM1bm5QYjRrRlRsY2FUV1VwczRhaEYzbmUzRDR4ZG9vQW9HQ0NxR1NNNDkKQXdFSG9VUURRZ0FFek5NZ0dRckF3bkpuS0RUZ0ZxNkxTcFppREtuS0tXbk9hVmJES2hpaFkyRXlNNUk0ZXRPUwoyNDltZ29odk9Kb1JCL0RHYTN5UjhwaE96ZElrbEViSHZnPT0KLS0tLS1FTkQgRUMgUFJJVkFURSBLRVktLS0tLQo=
```

</details>

<details>
<summary>To</summary>

```yml
apiVersion: v1
clusters:
- cluster:
    server: https://srv-k3s-01.mshome.net:6443
    insecure-skip-tls-verify: true
  name: k3s
contexts:
- context:
    cluster: k3s
    user: k3s
  name: k3s
kind: Config
users:
- name: k3s
  user:
    client-certificate-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUJrakNDQVRlZ0F3SUJBZ0lJWHBuNk9Ed2lKckV3Q2dZSUtvWkl6ajBFQXdJd0l6RWhNQjhHQTFVRUF3d1kKYXpOekxXTnNhV1Z1ZEMxallVQXhOemN5TURRMk56QXpNQjRYRFRJMk1ESXlOVEU1TVRFME0xb1hEVEkzTURJeQpOVEU1TVRFME0xb3dNREVYTUJVR0ExVUVDaE1PYzNsemRHVnRPbTFoYzNSbGNuTXhGVEFUQmdOVkJBTVRESE41CmMzUmxiVHBoWkcxcGJqQlpNQk1HQnlxR1NNNDlBZ0VHQ0NxR1NNNDlBd0VIQTBJQUJNelRJQmtLd01KeVp5ZzAKNEJhdWkwcVdZZ3lweWlscHptbFd3eW9Zb1dOaE1qT1NPSHJUa3R1UFpvS0liemlhRVFmd3htdDhrZktZVHMzUwpKSlJHeDc2alNEQkdNQTRHQTFVZER3RUIvd1FFQXdJRm9EQVRCZ05WSFNVRUREQUtCZ2dyQmdFRkJRY0RBakFmCkJnTlZIU01FR0RBV2dCU1VqS2k0aGVVY3pjYVd6M2pXZUUrTDZ1RXBRREFLQmdncWhrak9QUVFEQWdOSkFEQkcKQWlFQXl0VlVRV2hVMm5DZEkyRmNOaFFRUDg0WU5FWkNzclB4aTc3T2NnZ2ZseThDSVFDdkt2eFhUOFpDbjJ0UgovNkN3aE0wUVNIR1Vtcnd1aFpzcWgvUko3VkdnQ1E9PQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCi0tLS0tQkVHSU4gQ0VSVElGSUNBVEUtLS0tLQpNSUlCZGpDQ0FSMmdBd0lCQWdJQkFEQUtCZ2dxaGtqT1BRUURBakFqTVNFd0h3WURWUVFEREJock0zTXRZMnhwClpXNTBMV05oUURFM056SXdORFkzTURNd0hoY05Nall3TWpJMU1Ua3hNVFF6V2hjTk16WXdNakl6TVRreE1UUXoKV2pBak1TRXdId1lEVlFRRERCaHJNM010WTJ4cFpXNTBMV05oUURFM056SXdORFkzTURNd1dUQVRCZ2NxaGtqTwpQUUlCQmdncWhrak9QUU1CQndOQ0FBU1NmVDZ2WURacVBsZnRIdDdUTldVMGNwdnpsUWJoWjFvNzhwQStsMDQ3CkdZVEY4V2FkbzhOeGZmY3ZBM2JWakdrSmJ5NTUvTG5ieU1uS0FFU1VvaVBqbzBJd1FEQU9CZ05WSFE4QkFmOEUKQkFNQ0FxUXdEd1lEVlIwVEFRSC9CQVV3QXdFQi96QWRCZ05WSFE0RUZnUVVsSXlvdUlYbEhNM0dsczk0MW5oUAppK3JoS1VBd0NnWUlLb1pJemowRUF3SURSd0F3UkFJZ1g4cDlpWVVYUXhxTHNQa29rVTB6SEVEL1AwbEM1cnFKCnZUWTVSRmZJS0VnQ0lFRHRJWVQ2K1lSMUVQVkpmc2NTWGh3SzB4bGtLNnpBSTViK2tqNEJ1bFNRCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K
    client-key-data: LS0tLS1CRUdJTiBFQyBQUklWQVRFIEtFWS0tLS0tCk1IY0NBUUVFSUd2N0NreHlqWDRHQkM1bm5QYjRrRlRsY2FUV1VwczRhaEYzbmUzRDR4ZG9vQW9HQ0NxR1NNNDkKQXdFSG9VUURRZ0FFek5NZ0dRckF3bkpuS0RUZ0ZxNkxTcFppREtuS0tXbk9hVmJES2hpaFkyRXlNNUk0ZXRPUwoyNDltZ29odk9Kb1JCL0RHYTN5UjhwaE96ZElrbEViSHZnPT0KLS0tLS1FTkQgRUMgUFJJVkFURSBLRVktLS0tLQo=
```

</details>

### Step 03

All done, you from host terminal or other tool, you can manage your cluster

```bash
# Change context
kubectl config use-context k3s

# Get clusters
kubectl config get-clusters

# Get nodes
kubectl get nodes
```

## 06. Some tips

Find kubectl to bothering in managing context, namespace ??

Use these two tools (avalaible on all plateforms)

* **kubectx**: <https://github.com/ahmetb/kubectx> (list & change contexts easly)
* **kubens**: <https://github.com/ahmetb/kubectx/blob/master/kubens> (list & change namespaces easly)

| Action | kubectl | kubectx / kubens |
|--------|----------|------------------|
| Switch context to `k3s` | `kubectl config use-context k3s` | `kubectx k3s` |
| Show current context | `kubectl config current-context` | `kubectx` |
| List all contexts | `kubectl config get-contexts` | `kubectx` |
| Switch namespace to `dev` | `kubectl config set-context --current --namespace=dev` | `kubens dev` |
| Show current namespace | `kubectl config view --minify --output 'jsonpath={..namespace}'` | `kubens` |
| List namespaces | `kubectl get ns` | `kubens` |
