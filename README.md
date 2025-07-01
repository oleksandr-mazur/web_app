### How to setup

```sh
git clone https://github.com/oleksandr-mazur/web_app.git

cd web_app/terraform
```
Before run terraform

```sh
export TF_VAR_hcloud_token="XXXXXXXXXXXXXXXX" # hetzner token
export TF_VAR_cf_email="XXXXXX@XXXXXXX.XX"  # cloudflare email
export TF_VAR_cf_api_key="XXXXXXXXXXXXXXXX" # cloudflare api key
export TF_VAR_zone_id="XXXXXXXXXXXXXX" # cloudflare zone id
```

```sh
tearraform init
terraform apply
```

#### Example [web.devops.kyiv.ua](https://web.devops.kyiv.ua/)