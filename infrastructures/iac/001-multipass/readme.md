# Working with multipass (basics)

This show basics instructions to work with multipass & create servers.

## Create simple machine

```bash
multipass launch  --disk 10G --memory 1G --cpus 1 --name srv-demo
```

## Create machine using cloud-init file

```bash
multipass launch --disk 10G --memory 1G --cpus 1 --name srv-01 --cloud-init ./srv-01.yml 24.04
multipass launch --disk 10G --memory 1G --cpus 1 --name srv-02 --cloud-init ./srv-02.yml 24.04
```
