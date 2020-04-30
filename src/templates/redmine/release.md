Descripción del pase, se debe indicar el motivo del pase e indicar a nivel macro los cambios enviados. En este sección no se considera un título ya que Redmine coloca por default "Descripción".

### Plataforma

**[Aplicación]**

- Desplegar el tag `2.3.9`
- Retirar los siguientes valores del archivo de configuracion:

<pre>
  resources.export.format.csv.path = APPLICATION_PATH "/../data/csv/"
</pre>

**[BD]**

# Ejecutar el script del adjunto en mysql query.2.3.9

**[Ejecución de Scripts]**

# make build

_[Pantalla de Mantenimiento]_

Requiere/No Requiere pantalla de mantenimiento.

### QA

- Se requiere su apoyo para validar las tareas asociadas al Pase, en estado Desarrollo resuelto o Completado.
- El detalle del cambio a nivel de Análisis Funcional se encuentra en la sección Documentos (http://docs.equipindustry.com/equipay/documents).
