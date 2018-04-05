***
# La perspectiva de infraestructura
---

## Gestión de servicios

* Infraestructura gestiona:
  * Hardware
  * Red de la organización y proveedores de servicios.
      * Ruteo, firewalls, switches, VPN.
  * Plataformas de virtualización.
  * Servicios en la nube.
  * Servidores de correo, DNS, sistemas web, LDAP, controladores de dominio,
    etc.
* Organizaciones grandes explotan el área en aplicaciones, comunicaciones y
  seguridad, pero no ocurre siempre.
* Cuántos más usuarios acceden a los servicios, más complejos se vuelven.
---

## Gestión de servicios

* Para todos los servicios debe asegurar:
  * Backups
  * Monitoreo
  * Disponibilidad: tolerancia a fallos, HA.
  * Seguridad
  * Integridad
* ¡Todos los servicios son críticos!
* La clave del éxito: **ser invisibles**.
---

## Gestión de servicios

* El mantenimiento de los servicios también implica:
  * Actualizar las versiones de software.
  * Actualizar los sistemas operativos.
* Es común que la gestión de cuentas de usuarios siga siendo una tarea más del
  área de infraestructura.

<small>
Atender a todas las cuestiones mencionadas demanda tiempo y esfuerzo que no
dejan lugar para la investigación de nuevas tendencias, prácticas ágiles o
automatización.
</small>
---

## Gestión manual

* En los grupos de desarrollo, es habitual programar o automatizar cualquier
  paso repetible, pero no siempre aplica esto mismo en infraestructura.
* *Si se automatizan* las tareas repetitivas, se se suele hacer con scripts de
  shell que utilizan herramientas auxiliares: awk, perl, python, sed, php, bc,
  etc.
  * Soluciones muy acopladas que no pueden reusarse en todos los casos.
---

## Desarrollo como cliente

* El área de desarrollo es un cliente más al que se le brinda servicio.
* Debido a que produce constantemente aplicaciones o cambios en las mismas, la
  demanda es muy alta.
  * Las metodologías ágiles acentúan mucho más esta situación.
* Es el cliente más demandante, pero no necesariamente el más prioritario.
---

## Desarrollo como cliente

* Los servidores son responsabilidad de infraestructura.
  * El acceso a los mismos debería ser exclusivo de esa área.
  * Infraestructura debe seguir atendiendo todas sus obligaciones.
  * Se transforma en un cuello de botella para los despliegues en producción.
* Desarrollo demanda respuestas.
* Se buscan soluciones alternativas.
---

## Desarrollo como cliente

* Acceso a los servidores productivos:
  * Usuario administrador: desarrollo instala los paquetes que necesita.
  * Usuario limitado: se le da un espacio donde alojar el código y credenciales
    para acceder a la base de datos.
  * ¿Equipos compartidos entre diferentes sistemas?
      * ¡Impacto en otras aplicaciones!
* Servidores dedicados:
  * Desarrollo gestiona su infraestructura, sea en equipos físicos o virtuales.
---

## Desarrollo como cliente

* El área de desarrollo debería desarrollar.
  * Pierde tiempo gestionando infraestructura.
  * No es en lo que se especializa.
      * ¡Esto trae problemas que impactan en el área de infraestructura!
---

## Desarrollo como cliente

* Además de los sistemas en producción, se tiene:
  * **Gestión de ambientes:** surge la necesidad de disponer de ambientes con
    diferentes objetivos: desarrollo, testing, staging, QA, producción.
  * **Servicios para la gestión de proyectos:** también se brindan servicios que
    permiten a los desarrolladores manejar tickets, versionado, comunicación de
    equipos, integración continua, etc.
---

## Entornos heterogéneos

* Las organizaciones intentaron hace un tiempo homogeneizar tecnologías.
  * En los hechos esto se ha vuelto un fracaso.
  * Tecnologías cambian, evolucionan, pasan de moda.
  * Nuevos paradigmas requieren arquitecturas heterogéneas.
  * Sistemas legados.
---

## Entornos heterogéneos

* La heterogeneidad trae problemas:
  * Surgen tendencias que se convierten en requisitos: Java, Elixir, Rails,
    Django, NodeJS, Erlang, Redis, Memcached, Websockets, MongoDB, Hadoop,
    Spark, ElasticSearch, etc.
  * Infraestructura se enfrenta a:
      * ¿Cómo gestionar todos los nuevos servicios?
      * ¿Cómo monitorear?
      * ¿Cómo backupear?
      * ¿Seguridad?
---

## Compromiso de la seguridad por hosting

* Asegurar equipos y entornos compartidos.
* Aislar diferentes sistemas que se ejecutan en los mismos servidores.
* Limitar el impacto por problemas de seguridad.
* ¡Todo lo anterior se debe hacer desconociendo cómo funcionan y qué hacen los
  sistemas!
---

## Backups, monitoreo y estadísticas

* Infraestructura define:
  * Políticas de backup.
  * Mecanismos de monitoreo.
  * Recolección de datos para generar estadísticas.
* Lo anterior está bien para los servicios propios de infraestructura, ¿pero
  para los sistemas?
  * Backup de las máquinas completas:
      * ¿Hace falta hacer copias de seguridad del código?
  * Monitoreo de los servicios:
      * ¿Garantiza que anden los sistemas?
  * ¿Y las estadísticas?
---

## Backups, monitoreo y estadísticas

* En este punto, desarrollo debería:
  * Explicar cómo se monitorea el sistema (y mejor aún, disponer en la propia
    aplicación de un mecanismo para hacerlo).
  * Hacer un **buen uso de los logs**.
  * Indicar qué datos son los que deben resguardarse (¡y la periodicidad!).
      * ¿Política de backup corresponde a desarrollo? ¿Al dueño del sistema?
  * Usar herramientas de profiling que permitan evaluar el comportamiento de la
    aplicación.
---

## Y no es todo...

* El área de infraestructura tiene que atender muchas más cuestiones, como por
ejemplo:
  * Vencimientos de certificados.
  * Gestión de SPAM para evitar la llegada y salida.
  * Problemas de hardware habituales.
  * Pruebas de restauración de backups.
  * Migraciones de datos entre productos.
***
