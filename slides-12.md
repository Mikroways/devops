***
# Clusters de contenedores

<img src="images/docker-cluster.png" height="350"/>
---

## Productos para clusters

* [Docker Swarm](https://docs.docker.com/swarm/)
* [Cattle](http://rancher.com/)
* [Kubernetes](http://kubernetes.io/)
* [Mesos](http://mesos.apache.org/)
---

## Características

* Scheduling de contenedores.
  * Importancia de los labels en Docker.
* Service discovery:
  * Zookeper
  * Consul
  * Etcd
* Complicaciones:
  * Volúmenes compartidos.
  * Monitoreo y logs.
---

## Sistemas operativos para Docker

* [Rancher OS](http://rancher.com/rancher-os/)
* [CoreOS](https://coreos.com/)
* [Boot2docker](http://boot2docker.io/)
---

![Rancher logo](images/rancher-logo-white.png)
---

## Rancher

* Permite configurar ambientes con:
  * Cattle, Swarm, Kubernetes y Mesos.
* Los ambientes se componen de nodos.
* Los contenedores se agrupan en stacks y se crean con docker-compose.
* Provee un catálogo de aplicaciones que se puede extender.
* Simplifica la integración con registries privadas.
* Proxy reverso basado en service discovery.
* Simplifica el escalamiento de contenedores.
* Tiene una API REST que permite interactuar con el cluster.
---

## Ejemplo

* Desplegar un Wordpress desde el catálogo.
  * Establecer una restricción para que el RDBMS corra en un nodo determinado.
* Escalar el servicio.
---

## Otro ejemplo

* Aplicación propia:
  * El nombre del directorio es importante ya que le da el nombre al stack.
  * Crear:
    [`docker-compose.yml`](images/samples/07-rancher/my-custom-app/docker-compose.yml)
  * Iniciar el stack: `rancher-compose up`
  * *Verificar*
  * Actualizar: `rancher-compose up -u my-app`
  * *Verificar*
  * Realizar un rollback.
***
