***
# Soluciones
## (¡y nuevos problemas!)
---

## Introducción

En este apartado veremos qué metodologías y/o herramientas han surgido
para **solucionar** algunas de las problemáticas mencionadas.
<div class="fragment">
Asimismo, mostraremos que estas soluciones introdujeron nuevos **problemas**.
</div>
---

## Virtualización

* Existen diferentes alternativas de virtualización, tanto libres como
  licenciadas, con diferentes capacidades.
* El uso de cualquier herramienta disponible para virtualizar, ofrece mejoras
  sustanciales:
  * Backup de VMs.
  * Gestión simplificada de servidores, virtuales en lugar de físicos.
  * Migración en caliente de VMs entre equipos físicos.
  * Mejor aprovechamiento de recursos de hardware.
  * Instalación de SO basada en templates que permite disponer rápidamente de
    servidores pre-instalados.
---

## Complicaciones con la virtualización

* Muchas de sus ventajas requieren un storage.
* Las características más atractivas suelen proveerse en versiones licenciadas.
* Se administran más servidores que si se utilizaran equipos físicos:
  * Esto se debe a que un servicio aislado es más seguro e independiente, con lo
    cuál su reemplazo o actualización se simplifica.
  * Por esta razón, crece el uso de VMs, dificultando el mantenimiento de su 
    inventario, que rápidamente se desactualiza.
---

## Distribución de aplicaciones

* Cuando varias aplicaciones comparten requerimientos, es tentador utilizar el
  mismo servidor para alojarlas:
  * Se reduce la cantidad de servidores a gestionar.
  * Se compromete la seguridad de todas las aplicaciones instaladas.
* Los sistemas pueden agruparse por distintos criterios. Por ejemplo, por:
  * criticidad,
  * tecnologías,
  * conjuntos de usuarios.
---

## Alta disponibilidad / Failover / Actualizaciones

* Los stacks de un servicio determinado se componen de partes diferentes sobre
  las cuales quizá sea necesario garantizar alta disponibilidad y/o failover.
* Actualizar un servicio es una tarea artesanal y costosa.
  * Sobre todo si es un servicio distribuido con muchas dependencias.
***
