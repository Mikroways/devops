***
# Herramientas
---
## Introducción

En este apartado veremos ejemplos de algunas herramientas que promueven la
práctica DevOps, pero más importante aún, que simplifican tareas repetitivas y
promueven el desempeño ágil de nuestra tarea

* Presentaremos entonces, herramientas que sirven:
  * Desde la perspectiva de desarrollo
  * Desde la perspectiva de infraestructura
---
## Desde la perspectiva de desarrollo

* Si bien cada proyecto es un mundo diferente, trataremos de dar ejemplos que se
  dan en gran parte de los proyectos de desarrollo
  * El primero considera el deploy automatizado
  * Luego hablaremos de cómo simplificar el desarrollo en ambientes complejos:
      * Usando Vagrant
      * Usando Docker
---
## Automatizando los deploys
---
## Capistrano

gem install capistrano o bundler

cap install

* Nocion de ambiemntes: prod, staging, etc
* Nocion de roles: web, app, db
* Custom tasks: locales y remotos
* Deploy y rollback

***
