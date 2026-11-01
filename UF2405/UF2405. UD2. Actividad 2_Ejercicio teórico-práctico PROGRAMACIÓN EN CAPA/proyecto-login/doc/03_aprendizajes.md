# Aprendizajes obtenidos

**Proyecto:** `proyecto-login`  
**Unidad formativa:** UF2405 — Modelo de programación web y bases de datos  
**Ámbito:** UD2 — Programación en capas

---

## 1. Arquitectura multicapa y patrón MVC

El desarrollo ha permitido comprender la importancia de separar responsabilidades. El patrón MVC y la arquitectura por capas facilitan la organización del código y el mantenimiento de la aplicación.

Los principales aprendizajes son:

- Un cambio en la presentación —JSP o CSS— puede realizarse sin modificar necesariamente la lógica de negocio.
- Un cambio en el acceso a datos puede aislarse en el DAO, evitando que el controlador gestione directamente las consultas.
- La separación de responsabilidades facilita las pruebas, la reutilización y la detección de errores.

## 2. Ciclo de vida de un servlet

El contenedor web administra el ciclo de vida de los servlets. Entre los métodos relevantes se encuentran:

- `init()`: inicializa el servlet.
- `doGet()` y `doPost()`: procesan las peticiones HTTP correspondientes.
- `destroy()`: permite realizar tareas de cierre antes de retirar el servlet.

Las peticiones pueden atenderse de forma concurrente. Por ello, es importante evitar el uso compartido inseguro de datos mutables dentro de un servlet.

## 3. Gestión de sesiones HTTP

HTTP es un protocolo sin estado: cada petición es independiente si no se implementa un mecanismo para mantener el contexto. `HttpSession` permite conservar información asociada a un usuario entre distintas peticiones.

En el flujo de autenticación, la sesión puede utilizarse para mantener la identidad del usuario tras validar sus credenciales.

En una aplicación real, también deben contemplarse:

- El cierre de sesión.
- La expiración de la sesión.
- La protección frente a accesos no autorizados.
- La regeneración del identificador de sesión cuando corresponda.

## 4. Portabilidad y despliegue

La preparación de scripts de ejecución y la gestión de dependencias permiten simplificar la puesta en marcha del proyecto en otros equipos.

El uso de Maven facilita la descarga y administración de bibliotecas. Si se utiliza una distribución local de Maven o un mecanismo equivalente, se reduce la necesidad de modificar las variables de entorno globales del sistema.

La portabilidad final depende de que Java esté instalado, las dependencias sean accesibles y los scripts estén adaptados al entorno de destino.

## 5. Conceptos de bases de datos

Aunque esta versión utiliza datos simulados en memoria, el proyecto permite relacionar la arquitectura DAO con los conceptos de bases de datos estudiados.

### 5.1. Lenguajes de definición, manipulación y control de datos

- **DDL (Data Definition Language):** instrucciones para definir estructuras, como `CREATE`, `ALTER` y `DROP`.
- **DML (Data Manipulation Language):** instrucciones para consultar y modificar datos, como `SELECT`, `INSERT`, `UPDATE` y `DELETE`.
- **DCL (Data Control Language):** instrucciones para gestionar permisos, como `GRANT` y `REVOKE`.

### 5.2. Aplicación práctica

En una versión conectada a una base de datos, `UsuarioDAO` podría utilizar JDBC y consultas parametrizadas mediante `PreparedStatement` para reducir el riesgo de inyección SQL.

Esta separación permitiría sustituir la simulación en memoria por persistencia real sin trasladar las operaciones de base de datos al controlador web.

## 6. Validación y seguridad

La validación del lado del cliente mejora la experiencia de uso, pero no sustituye a las comprobaciones realizadas en el servidor.

Entre los aspectos que conviene reforzar se encuentran:

- Validar los datos recibidos en el servidor.
- Evitar almacenar contraseñas en texto plano.
- Gestionar adecuadamente las sesiones.
- Controlar los errores sin revelar información interna.
- Probar tanto los accesos correctos como los intentos fallidos.

## 7. Conclusiones

El proyecto permite aplicar conceptos esenciales del desarrollo web Java: separación de responsabilidades, procesamiento de peticiones, gestión de sesiones, organización del código y gestión de dependencias.

Como siguiente paso, sería conveniente incorporar persistencia real, reforzar la seguridad de la autenticación y añadir pruebas automatizadas que validen los principales flujos de la aplicación.