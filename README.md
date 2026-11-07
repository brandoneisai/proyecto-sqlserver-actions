# Proyecto Integrador: CI/CD con SQL Server, Docker y GitHub Actions

## Tecnologías Involucradas
* **GitHub Actions**: Automatización de flujos de trabajo en respuesta a eventos.
* **Docker**: Despliegue de instancias efímeras de SQL Server.
* **Microsoft SQL Server**: Motor de base de datos transaccional.
* **sqlcmd**: Ejecución de scripts T-SQL remotamente.

## Retos Resueltos
**1. Trigger para inserciones múltiples:** En T-SQL, el trigger se dispara una vez por instrucción. Para manejar múltiples registros, implementamos un cursor iterando sobre la tabla lógica `inserted`.

**2. Tabla lógica inserted:** Tabla en memoria exclusiva de los triggers `INSERT` y `UPDATE` que contiene copias de las filas nuevas introducidas a la tabla física.

**3. Procesamiento por Conjuntos (Set-Based):** Operación nativa del álgebra relacional donde el motor optimiza matemáticamente el procesamiento del bloque entero.

**4. Fila a Fila vs Por Conjunto:** La iteración fila a fila (cursores) bloquea recursos secuencialmente, mientras que una operación por conjunto delega la eficiencia de inserción completa al optimizador del motor en un solo paso.