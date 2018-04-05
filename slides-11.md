***
# chef-provisioning
---

## Introducción
* Chef-provisioning extiende chef permitiendo crear VMs en diferentes
  plataformas de virtualización. Algunas de ellas son:
  * Vagrant
  * AWS
  * Azure
  * DigitalOcean
  * VMWare
  * XenServer
  * Google Compute Engine
  * IBM SoftLayer
---

## ¿Para qué sirve?

* Permite crear, iniciar y aprovisionar máquinas, abstrayendo al usuario de la
  plataforma subyacente.
* Evita el uso reiterativo de knife para iniciar VMs.
* Posibilita restaurar de forma completa una infraestructura.
---

## Ejemplo

```ruby
chef_role 'web-server' do
  run_list ["recipe[apt]","recipe[web-server]"]
end

machine_batch do
  machine 'web-01' do
    run_list ['role[web-server]']
  end
  machine 'web-02' do
    run_list ['role[web-server]']
  end
end

machine 'proxy' do
  run_list ['recipe[myhaproxy]']
end

```

*__Corremos en nuestra PC__*

```bash
chef-client -z -r 'my-infra::chef,my-infra::aws,my-infra'
```
---

## Eliminando todo
```ruby
chef_role 'web-server' do
  action :delete
end

machine_batch do
  action :destroy
  machines 'web-01', 'web-02', 'proxy'
end
```

*__Corremos en nuestra PC__*

```bash
chef-client -z -r 'my-infra::chef,my-infra::aws,my-infra::delete'
```
---

## Y ahora con Vagrant

```bash

chef-client -z -r 'my-infra::chef,my-infra::vagrant,my-infra'

```

Esto es muy importante, porque sólo cambiando el driver de aprovisionamiento,
podemos reusar nuestra infraestructura definida.

<small class="fragment">
Podemos incluso tener un cluster con VMs de diferentes proveedores.
</small>
---

## Terraform

<a href="https://www.terraform.io/">
<img alt="Terraform logo" src="images/terraform-logo.png" height="300px" />
</a>

*__La alternativa a chef-provisioning__*
***
