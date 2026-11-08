# Desafío práctico 2 - AdventureWorksDW

Estudiante: Kevin Martínez · Carné: MC200314

El proyecto contiene un cubo multidimensional de Analysis Services y un informe de Power BI para analizar ventas en línea por año, categoría de producto y país de territorio.

## Archivos

- `Entrega_DMD941/CuboAdventureWorksDMD941/`: solución y proyecto multidimensional de Visual Studio, con las dimensiones, el cubo y el origen de datos.
- `Entrega_DMD941/DMD941_AdventureWorks.pbix`: informe de Power BI con conexión en vivo al cubo.
- `consultas.sql`: vistas de apoyo y consultas SQL de análisis para las ventas en USD.
- `Informe_DMD941_Desafio_Practico_2.pdf`: informe de la entrega con portada, procedimiento, capturas de pantalla, resultados y anexo de consultas.

## Preparación y ejecución

1. Restaurar `AdventureWorksDW2022` en SQL Server a partir del respaldo oficial de [AdventureWorks](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure).
2. Ejecutar `consultas.sql` en SQL Server para crear las vistas de análisis y consultar los resultados por año, categoría y país.
3. En Windows, abrir la solución `CuboAdventureWorksDMD941.sln` en Visual Studio con la extensión de proyectos de Analysis Services. La instancia de destino configurada es `localhost\OLAP`; actualizarla si el nombre de la instancia SSAS multidimensional es diferente.
4. Comprobar la conexión del origen de datos a `AdventureWorksDW2022` y que la cuenta del servicio SSAS tenga permisos de lectura. Implementar y procesar el proyecto.
5. Abrir el `.pbix` en Power BI Desktop. El informe utiliza una conexión en vivo a `localhost\OLAP` y al catálogo `CuboAdventureWorksDMD941`; necesita acceso a esa instancia y al cubo procesado. Las visualizaciones aplican un filtro de moneda USD en el informe; el cubo contiene todas las monedas.

Los valores exactos de las consultas SQL y los del cubo deben cotejarse en el entorno de ejecución. Los nombres de servidor y los permisos dependen de la instalación local.
