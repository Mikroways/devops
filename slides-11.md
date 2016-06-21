***
# Desde la perspectiva de infraestructura
---
## Desde la perspectiva de infraestructura

* Se intenta capturar una configuración funcional que permita:
  * Replicar un ambiente
  * Recuperación ante desastres
* Surge la posibilidad de versionar la infraestructura
  * Esto implica poder repetir la instalación de un server
* Surgen nuevas necesidades:
  * Orden en cuanto al inicio de servicios
  * Cambios de plataformas de virtualización por costos o funcionalidad
---
## Herramientas

* Gestión de las configuraciones usando Chef
* Gestión de la infraestrcutura usando chef-provisioning
* Docker en producción con Rancher
---
![Chef Logo](images/chef-logo.png)
---
## Chef

* Chef permite modelar la evolución de nuestra infraestructura y aplicaciones como
  si fueran código
* No impone restricciones
* Permite describir y automatizar los procesos e infraestructura
* La consecuencia es que la infraestructura se vuelve:
  * Versionable
  * Testeable
  * Replicable
  * Idempotente
---
## Conceptos de chef

* Para lograr su objetivo se utilizan definiciones reutilizables llamadas
  **cookbooks** y **recipes**
* Se programa en Ruby usando una DSL
---
## Arquitectura
<img alt="Chef architecture" src="images/chef-architecture.png" height="500" />
---
## Entidades de chef

* Roles
* Nodos
  * Atributos
* Data Bags

Además, es posible realizar búsquedas sobre estas entidades
---
## Ejemplo de una receta

```ruby
package 'nginx'

service 'nginx' do
  action [:enable, :start]
end

template '/etc/nginx/sites-enabled/www.conf' do
  source 'nginx-default.conf.erb'
  variables(
    server_name: 'www.mikroways.net',
    document_root: '/var/www'
  )
  notifies :restart, 'service[nginx]', :immediately
end
```
<small class="fragment">
[Ver ejemplo completo](images/samples/04-chef/recipes/default.rb)
<br />
*Es posible probar las recetas con una versión de chef llamada
chef-zero/chef-solo*
</small>
---
## TDD
* Ejemplo de [test de unidad](images/samples/04-chef/spec/unit/recipes/web-server-test_spec.rb)
  * Basados en [ChefSpec](https://github.com/sethvargo/chefspec)
  * `rspec`
  * `rubocop`
  * `foodcritic`
* Ejemplo de [test de
  integración](images/samples/04-chef/test/integration/default/serverspec/integration-web-server_spec.rb)
  * Basados en [Test Kitchen](http://kitchen.ci/)
  * Probamos un test implementado con [ServerSpec](http://serverspec.org/) en
    plataformas Debian 7 y Ubuntu 14.04
  * `kitchen`
---

## Desplegando el potencial de chef

* Bootstrap de nodos
* Búsquedas
* Ambientes
* ssh en paralelo
* Búsquedas en recetas
  * _Ejemplo con ha-proxy_

<small>
[Ver ejemplo]()
</small>

---
## Chef no es el único

* Y... ¿por qué chef?
* Hoy día Ansible es la alternativa más elegida
* Puppet es la principal competencia

***
***
# chef-provisioning
---
## Introducción
* Chef provisioning extiende chef permitiendo crear VMs en diferentes plataformas
de virtualización
  * Vagrant
  * AWS
  * Azure
  * DigitalOcean
  * VMWare
  * XenServer
  * Google Compute Engine
  * IBM SoftLayer
  * Y varios más
---
## ¿Qué es entonces?
* Permite configurar nuestro cluster de máquinas de forma agnóstica de la
  plataforma
* 
---
## Ejemplo
---
## Alternativas

* Terraform


***
