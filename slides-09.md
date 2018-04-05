***
# Flujo de trabajo
---

## Introducción

Es importante definir un flujo de trabajo que considere completamente las tareas
desde que comienza el desarrollo hasta que se ponen los sistemas en producción.

¡Considerando que todas son tareas iterativas y continuas!
---

## Gestión de proyectos

* Sistema de tickets para seguimiento del proyecto.
* Respetar estándares de codificación.
* Utilizar una herramienta de versionado de código.
* Gestionar los cambios en la base de datos.
* Determinar versionado del producto.
* Establecer un flujo de trabajo y reglas para el equipo de desarrollo.
* Testing del software.
* Reglas para pasaje a producción.
---

## Versionado del código

* Versionar el código: hoy en día, GIT.
* Commits atómicos:
  * Cada commit debe atacar un problema específico.
  * Documentar correctamente el propio commit.
      * Simplifica la comunicación del equipo.
  * Relacionar los commits con tickets en el sistema correspondiente.
* Usar plataforma de gestión del código.
  * Gitlab, Github, Bitbucket.
---

## Versionado del código

* Adoptar un flujo de trabajo para la gestión del código:
  * [git-flow](https://github.com/nvie/gitflow): trabajo con estrategias de
    branches y manejo de releases.
      * Concepto de [hotfix
        branches](http://nvie.com/posts/a-successful-git-branching-model/#hotfix-branches).
      * Punto débil: no considera que se puedan mantener varias versiones
        productivas del software (solución con support branches, cherry pick).
  * Permisos sobre las ramas: desarrolladores experimentados revisan el código
    de programadores nóveles. Por ejemplo: [flujo tipo
    GitHub](https://guides.github.com/introduction/flow/).
---

## Versionado de la base de datos

* Versionar la base de datos no es algo habitual pero sí importante.
* Necesitamos disponer de un mecanismo para poder ir hacia adelante y hacia
  atrás en la estructura de una base de datos.
* Algunos frameworks incorporan mecanismos para gestionar el versionado de la
  base de datos.
* Un parche no es versionado, dado que no permite volver atrás en la historia.
---

## Versionado del software

* Es importante disponer de una convención para versionar cada release del
  software.
  * [Semantic Versioning](http://semver.org/)
      * Define claramente el significado de cada número en un esquema X.Y.Z.
      * Permite establecer reglas de dependencia y automatización (ejemplo: si
        sólo cambia el último número aplicar directamente en producción).
* Establecer una correspondencia entre la versión del código y la del modelo de
  datos.
* La creación de un release implica que se hayan cumplido todos los requisitos
  de calidad del software.
---

## Calidad del software

* Aplicar buenas prácticas de calidad:
  * TDD con alta cobertura.
  * Tests de aceptación.
  * Tests de estilo (y estándares) de codificación.
* Considerar en el flujo que se pueda lograr:
  * Integración continua.
  * Entrega continua.
  * Despliegue continuo.
---

## TDD

* **Test-driven development** es una técnica que promueve que primero se
  escriban los tests y luego el código que pase esos tests.
* Simplifica el desarrollo, al conocer exactamente lo que el código debe hacer.
* Garantiza que todo el código tenga tests (o la mayoría del mismo).
* Incrementa significativamente la calidad del software.
---

## TDD

* Los tests deben controlarse por un área de QA en cada etapa del desarrollo,
  estableciendo políticas de aceptación para cada etapa.
* Ejemplos de políticas:
  * El código no es revisado antes de mergerarse si no pasan los test de unidad,
    funcionales e integración. Tampoco si el analizador de código no garantiza
    que se respetan los estándares.
  * Un release no se pone en producción si no pasa todos los tests de unidad,
    funcionales, integración y aceptación.
---

## Despliegues

* Establecer reglas para desplegar el software en producción.
* Automatizar todas las tareas repetitivas.
* Según las reglas definidas, considerar la posibilidad de poder automatizar
  también la puesta en producción.
* La automatización puede hacerse mediante scripts caseros o con herramientas
  específicas.
---

## Mantenimiento del software

* El trabajo no termina cuando el software se pone en producción.
* Mecanismos para:
  * Backups
  * Monitoreo y estadísticas.
* Automatizar esas configuraciones:
  * Al desplegar un software en producción, disponer de mecanismos que
    actualicen automáticamente los productos de backups y monitoreo.
  * Se garantiza que todo sistema en producción dispone de lo anterior.
---

## Monitoreo y estadísticas

* Recolectar constantemente información del software en producción.
  * Uso de recursos.
  * Tiempos de respuesta de cada componente.
  * Errores en cada capa.
* Lo anterior permite:
  * Conocer el comportamiento normal del software.
  * Detectar y corregir errores: **mejora continua.**
  * ¡Aprender!
---

## Monitoreo y estadísticas

* Si conocemos el comportamiento normal del software entonces podemos:
  * Identificar los momentos en que los valores se escapan de lo normal.
  * “Personalizar” el monitoreo para cada sistema.
  * ¡Generar alertas significativas!
* Las estadísticas permiten:
  * Tomar decisiones informadas.
  * Entender el uso del hardware.
  * **Escalar los servicios de forma automática.**
---

## Escalamiento horizontal

* Dos formas de hacerlo:
  * Alguien detecta que el servicio está lento (o se prevé un uso intensivo) y
    se escala manualmente.
  * El software de monitoreo detecta que los valores normales cambiaron y
    dispara una acción para escalar de forma automática.
* Escalado:
  * *Hacia arriba:* para atender mayor cantidad de usuarios.
  * *Hacia abajo:* para ahorrar costos.
---

## Escalamiento horizontal

* El escalamiento de un sistema no es trivial.
  * Debe considerarse desde el diseño del software y de la propia
    infraestructura.
* Los microservicios simplificaron el escalamiento, al permitir escalar sólo las
  componentes saturadas.
***
