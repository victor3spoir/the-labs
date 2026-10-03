# readme

## dynamic dns

Providers: <https://registry.terraform.io/providers/darkhonor/technitium/1.2.1>

Go to settings
Go to TSIG

- Create TSIG key
- Enable dynamic update in zone config (make sure to enable it only for the TSIG key you created, unless, everyone will be able to dynamically update the records)

## Tools

- moggo (<https://github.com/mr-karan/doggo>): Command-line DNS Client for Humans. Written in Golang

Providers api token to terraform.
`export TF_VAR_TECHNITIUM_API_TOKEN=10f79f0664c1b2bfc39453679cef73b3f49f19458dd5536cac328b42c105ab77`

or use `local.auto.tfvars` file

Zone content

```txt
$ORIGIN multipass.
@                     0         IN  SOA           localhost. invalid. 1 900 300 604800 900
@                     0         IN  FWD           Udp "10.96.7.1" False DefaultProxy 0
```

```txt
$ORIGIN lab.victor3spoir.de.
@                     900       IN  SOA           localhost. hostadmin 13 900 300 604800 900
@                     14400     IN  NS            localhost.
*                     3600      IN  CNAME         srv-gateway.multipass.
```

## Terraform

if ressource exists, you can import it

`terraform import technitium_zone.lab lab.victor3spoir.de`

## Resolved config

Dans la partie, l'interface de multipass etait en avant, maintent, il faut mettre le localhost host en avant.

```sh
cat /etc/systemd/resolved.conf.d/extend.conf 
```

```txt
[Resolve]
DNS=127.0.0.1 10.96.7.1
#Domains=~multipass ~home.victor3spoir.de

```
