
# create machine
multipass launch --disk 10G --memory 1G --cpus 1 --name srv-01 --cloud-init ./srv-01.yml 24.04
multipass launch --disk 10G --memory 1G --cpus 1 --name srv-02 --cloud-init ./srv-02.yml 24.04

# configs
# sudo sysctl -w net.ipv4.ip_forward=1