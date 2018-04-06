***
# Herramientas
---

# Vagrant
![Vagrant background](images/vagrant-background.png)
---

## Vagrant

* Permite construir y gestionar máquinas virtuales con un flujo de trabajo
  sencillo y rápido.
* Reduce significativamente el tiempo necesario para generar ambientes de
  desarrollo.
* Aisla las dependencias y sus configuraciones en un ambiente consistente y
  descartable.
* Utiliza un archivo de texto plano (`Vagrantfile`) para definir la
  configuración completa.
* Disponible para Mac, Linux y Windows.
---

## Providers

* Virtualbox
* Hyper-V
* VMWare
* Docker
* AWS
---

## Provisioners

* File
* Shell
* Ansible
* CFEngine
* Chef
* Puppet
* Docker
* Salt
---

## Comandos

```bash
vagrant up
vagrant destroy
vagrant ssh
vagrant provision
vagrant reload [--provision]
vagrant box list
```
---

## Ejemplo: shell provisioning

```ruby
Vagrant.configure(2) do |config|
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.box_check_update = false
  config.vm.network "private_network", ip: "192.168.222.22"

  config.vm.provision "shell", inline: <<-SHELL
     sudo apt-get update
     sudo apt-get install -y apache2
  SHELL
end
```
<small class="fragment">
[Ejemplo de un servidor con Apache](images/samples/02-vagrant/01-simple/Vagrantfile)
</small>
---

## Ejemplos: multimachine

```ruby
Vagrant.configure(2) do |config|
  config.vm.define 'master', primary: true do |app|
    app.vm.box = "bento/ubuntu-16.04"
    app.vm.network "private_network", ip: "192.168.222.20"
    app.vm.provision "docker" do |d|
      ...
    end
  end
  (1..3).each do |num|
    config.vm.define "node-#{num}" do |app|
      app.vm.box = "bento/ubuntu-16.04"
      app.vm.network "private_network", ip: "192.168.222.2#{num}"
      app.vm.provision "docker" do |d|
        ...
      end
    end
  end
```

<small class="fragment">
[Ejemplo de un cluster de Docker Swarm](images/samples/02-vagrant/02-multi-machines/Vagrantfile)
</small>
---

## Ejemplo: cluster de Rancher

* Este ejemplo levanta 3 máquinas:
  * 1 será el servidor de Rancher.
  * 2 máquinas actúan como nodos de procesamiento.
* Instala todo el software necesario.
* Registra ambos nodos en el servidor de Rancher.
* Deja el cluster listo para ser usado.

<small class="fragment">
[Vagrantfile](images/samples/02-vagrant/03-rancher/Vagrantfile)<br>
[Repositorio completo](https://github.com/leoditommaso/demo-docker)
</small>
---

# Docker
![Docker logo](images/docker-logo.png)
---

## Docker

* Permite correr contenedores aislados unos de otros.
* Promueve la portabilidad, permitiendo contenedores autosuficientes que son
  creados según las necesidades de una aplicación.
* Los contenedores usados en desarrollo pueden usarse en ambientes de testing y
  producción.
  * Minimiza la brecha entre desarrollo e infraestructura.
* Se basa en en el concepto de inmutabilidad.
* Funciona en Mac, Linux y Windows.
* Los contenedores pueden ejecutar tanto Linux como Windows.
* Puede utilizarse para aplicaciones gráficas.
---

## Docker: conceptos

* Docker funciona a partir de:
  * **Docker engine:** set de herramientas para gestionar Docker. Incluye el
    servicio de Docker, una API REST y un cliente de línea de comandos para
    interactuar con el daemon.
  * **Docker hub/registry:** repositorio de imágenes públicas o privadas a
    partir de las cuales se crean los contenedores.
---

## Docker: comandos

```bash
docker search
docker images
docker pull
docker run
docker ps
docker diff
docker commit
docker inspect
docker log
```
---

## Ejemplo: MySQL

**Iniciamos una instancia de Mysql con Docker**

```bash
docker run -p 33060:3306 -e MYSQL_ROOT_PASSWORD=devops -d mysql:5.7

mysql -u root -h 127.0.0.1 --port 33060 -pdevops
```
<small class="fragment">
*¿Qué sucede si eliminamos el contenedor?*
</small>
---

## Volúmenes

```bash
docker volume ls
docker volume create
docker volume rm
docker volume inspect
```
---

## Ejemplo: MySQL con volúmenes

**Iniciamos una instancia de Mysql con docker**

```bash
docker run -p 33060:3306 -e MYSQL_ROOT_PASSWORD=devops -v /tmp/mysql:/var/lib/mysql -d mysql:5.7

mysql -u root -h 127.0.0.1 --port 33060 -pdevops
```
<small class="fragment">
*¿Qué sucede si eliminamos el contenedor?*
</small>
---

## Docker Compose

Se describe una aplicación compuesta por más de un contenedor mediante un **yml**

```yml
version: "2"
services:
  wordpress:
    image: wordpress
    links:
      - db:mysql
    ports:
      - 8080:80
  db:
    image: mysql:5.7
```
<small class="fragment">
[Ver ejemplo completo](images/samples/03-docker/docker-compose.yml)
</small>
---

## Docker Compose: comandos

```bash
docker-compose up
docker-compose ps
docker-compose stop
docker-compose rm
docker-compose scale
```
---

![Capistrano Logo](images/capistrano-logo.png)
---

## Automatizando los deploys

* El objetivo es automatizar la instalación/actualización de una aplicación en
  un servidor remoto.
* No todos los desarrollos tienen las mismas necesidades:
  * Realizar un build.
  * Publicar un artefacto.
  * Instalar dependencias.
  * Subir/Descargar código/artefacto.
  * Correr scripts.
---

## Un ejemplo: Capistrano

```ruby
role :demo, %w{srv-01 srv-02 srv-03}
task :uptime do
  on roles(:demo), in: :parallel do |host|
    uptime = capture(:uptime)
    puts "#{host.hostname} reports: #{uptime}"
  end
end
```

<small class="fragment">
[Ver ejemplo](images/samples/01-capistrano/00-sample/config/deploy.rb)
</small>
---

## Uso de Capistrano

```bash
cap install # Inicializa el directorio
cap -T # Lista todas las posibles tareas disponibles
```
---

## Uso de Capistrano

* Instaura la noción de ambientes:
  * Por defecto inicializa dos ambientes: *production y staging*.
  * Los ambientes configuran los accesos.
  * Las tareas son las mismas para cada ambiente.

`production.rb`

```ruby
role :demo, %w{localhost}

server '192.168.222.22',
   roles: %w(demo),
   ssh_options: {
     user: 'vagrant',
     forward_agent: true,
     auth_methods: %w(publickey password),
     password: 'vagrant'
   }
```
---

## Uso de Capistrano

* Además de los ambientes, Capistrano define **roles**. Por ejemplo: *web, app,
  db*.
  * Un servidor tiene un rol.
  * En un server con un determinado rol, hay que realizar diferentes tareas. Por
    ejemplo: assets en *web*, deploy en *app*, dump en *db*.
* Además de las tareas predefinidas, permite extenderlo con tareas propias, ya
  sean locales como remotas.
* Las tareas predefinidas permiten realizar **deploy** y **rollback**.

<small>
*Veremos ejemplos de uso de capistrano deployando en un servidor virtual con IP
__192.168.23.22__*
---

## Ejemplo de Capistrano y Jekyll

* [Jekyll](https://jekyllrb.com/) es un generador de sitios web estáticos.
  * El sitio web de [Mikroways](http://www.mikroways.net/) fue desarrollado con
    Jekyll.
* Desplegaremos en la VM el sitio usando Jekyll. Para ello:
  * El servidor debe tener instalado Ruby.
  * Se debe descargar el código del sitio desde
    [GitHub](https://github.com/Mikroways/mikroways.net).
  * Se debe correr el comando `jekyll build`
  * ¡Listo!
* Para probarlo: http://192.168.23.22

<small class="fragment">
  [Ver el ejemplo](images/samples/01-capistrano/01-jekyll/config/deploy.rb)
</small>
---

## Ejemplo de Capistrano y Jekyll

* Con Capistrano:
  * Hacemos el despliegue del sitio: `cap production deploy`
  * *En el servidor ejecutamos* `jekyll build`
  * *Probamos acceder al sitio con el navegador*
* Probamos una nueva versión del sitio.
* Hacemos un rollback: `cap production deploy:rollback`
---

## Capistrano y desarrollos dinámicos

* En sitios que no son estáticos, existen archivos que deben mantenerse entre
  despliegues:
  * Configuración de la base de datos o software.
  * Uploads o archivos generados por la aplicación.
* Capistrano permite definir qué archivos y qué directorios son *compartidos*.
* De aquí la estructura propuesta por Capistrano es:

```bash
  base_dir
  ├── current -> /opt/sites/jekyll/releases/20180405173257
  ├── releases
  │   └── YYYYMMDDHHmmii
  ├── repo
  └── shared
```
---

## Otras Herramientas

* [RUNDECK](http://rundeck.org/)
* [Fabric](http://www.fabfile.org/)
* [Rocketeer](http://rocketeer.autopergamene.eu/)
* [Deployer](http://deployer.org/)
---

![Chef Logo](images/chef-white-logo.png)
---

## Chef

* Chef permite modelar y automatizar la infraestructura y aplicaciones como si
  fueran código.
* Es altamente flexible y potente.
* La consecuencia es que la infraestructura se vuelve:
  * Versionable
  * Testeable
  * Replicable
  * Idempotente
* Se programa en Ruby usando una DSL (domain-specific language).
---

## Conceptos de Chef

* Para lograr su objetivo se utilizan definiciones reutilizables llamadas
  **cookbooks** y **recipes**.
* El **Chef server** reúne todo el repositorio de configuraciones que utilizarán
  luego los nodos para configurarse.
* Se interactúa con los nodos y el servidor usando el comando **knife**.
* Los **nodos** representan a cada equipo gestionado con Chef.
* Por medio de **data bags**, **roles** y **atributos** se personaliza cada
  servidor.
* Cada nodo tiene una **run list** que indica todas las recetas que se le
  aplicarán.
* Se puede buscar sobre todas las entidades de Chef.
---

## Arquitectura

<img alt="Chef architecture" src="images/chef-architecture.png" height="500" />
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
* Ejemplo de [test de
  unidad](images/samples/04-chef/spec/unit/recipes/web-server-test_spec.rb).
  * Basados en [ChefSpec](https://github.com/sethvargo/chefspec).
  * `rspec`
  * `rubocop`
  * `foodcritic`
* Ejemplo de [test de
  integración](images/samples/04-chef/test/integration/default/serverspec/integration-web-server_spec.rb)
  * Basados en [Test Kitchen](http://kitchen.ci/).
  * Probamos un test implementado con [ServerSpec](http://serverspec.org/) en
    plataformas Debian 7 y Ubuntu 14.04.
  * `kitchen`
---

## Desplegando el potencial de Chef

Video
---

## Alternativas a Chef

* Ansible: muy sencillo, más tentador para administradores de sistemas.
* Saltstack
* Puppet: principal competencia.
***
