\# Proyecto Clase Persona - Programación Orientada a Objetos



\## Descripción



Este proyecto es una implementación práctica del \*\*Paradigma de Orientación a Objetos (POO)\*\* en Java. Consiste en el diseño y desarrollo de una clase llamada `Persona` que modela las características básicas de una persona, incluyendo atributos como nombre, edad, DNI, sexo, peso y altura.



El proyecto aplica conceptos fundamentales de la POO como \*\*encapsulación\*\*, \*\*constructores sobrecargados\*\*, \*\*métodos de instancia\*\*, \*\*validación de datos\*\* y \*\*generación automática de DNI\*\* con su letra correspondiente según la normativa española.



El proyecto ha sido desarrollado como parte de la Unidad Formativa \*\*UF2404\*\* del módulo de Desarrollo de Aplicaciones con Tecnologías Web.



\---



\## Objetivos



\- Dominar los conceptos fundamentales del paradigma orientado a objetos.

\- Aplicar \*\*encapsulación\*\* mediante atributos privados y métodos de acceso.

\- Implementar \*\*constructores sobrecargados\*\* (por defecto, parcial y completo).

\- Trabajar con \*\*constantes\*\* para valores fijos.

\- Validar datos de entrada mediante métodos privados.

\- Generar automáticamente un DNI válido con su letra correspondiente.

\- Calcular el \*\*Índice de Masa Corporal (IMC)\*\* y determinar el estado de peso.

\- Utilizar `this` para diferenciar atributos de parámetros.

\- Sobrescribir el método `toString()` para una representación textual del objeto.



\---



\## Estructura del Proyecto

ProyectoPersona/

│

├── Persona.java # Clase principal con los atributos y métodos

├── Main.java # Clase de prueba con casos de uso

├── ejecutar\_persona.bat # Script para compilar y ejecutar (Windows)

└── README.md # Este archivo





\---



\## Clase `Persona`



\### Atributos (privados - encapsulación)



| Atributo | Tipo | Descripción | Valor por defecto |

|----------|------|-------------|-------------------|

| `nombre` | String | Nombre de la persona | "" |

| `edad` | int | Edad en años | 0 |

| `dni` | String | DNI generado automáticamente | Generado |

| `sexo` | char | 'H' (hombre) o 'M' (mujer) | 'H' |

| `peso` | double | Peso en kilogramos | 0.0 |

| `altura` | double | Altura en metros | 0.0 |



\### Constructores



1\. \*\*Constructor por defecto\*\*: Inicializa todos los atributos con valores por defecto y genera un DNI aleatorio.

2\. \*\*Constructor parcial\*\*: Recibe nombre, edad y sexo. El resto se inicializa por defecto.

3\. \*\*Constructor completo\*\*: Recibe todos los atributos (excepto DNI, que se genera automáticamente).



\### Métodos



| Método | Visibilidad | Descripción |

|--------|-------------|-------------|

| `calcularIMC()` | Público | Calcula el IMC y devuelve -1 (bajo peso), 0 (peso ideal) o 1 (sobrepeso) |

| `esMayorDeEdad()` | Público | Devuelve `true` si la persona tiene 18 años o más |

| `comprobarSexo(char)` | Privado | Valida el sexo; si no es 'H' o 'M', devuelve 'H' |

| `generaDNI()` | Privado | Genera un DNI aleatorio de 8 cifras con su letra |

| `toString()` | Público | Devuelve una cadena con toda la información del objeto |

| `getters` | Público | Métodos de lectura para todos los atributos |

| `setters` | Público | Métodos de escritura (excepto para DNI) |



\### Constantes utilizadas



```java

private static final int IMC\_BAJO = -1;

private static final int IMC\_IDEAL = 0;

private static final int IMC\_ALTO = 1;

private static final char SEXO\_POR\_DEFECTO = 'H';

private static final int LONGITUD\_DNI = 8;

private static final String LETRAS\_DNI = "TRWAGMYFPDXBNJZSQVHLCKE";



\--



\## Cómo Compilar y Ejecutar

Opción 1: Usando el script .bat (Windows)

Simplemente haz doble clic en el archivo ejecutar\_persona.bat o ejecútalo desde la consola:

ejecutar\_persona.bat



Opción 2: Manualmente desde la terminal

Compilar:

javac Persona.java Main.java



Ejecutar:

java Main



\--



\## Ejemplo de Uso

// Crear una persona con constructor por defecto

Persona persona1 = new Persona();



// Crear una persona con nombre, edad y sexo

Persona persona2 = new Persona("María García", 25, 'M');

persona2.setPeso(65.0);

persona2.setAltura(1.65);



// Crear una persona con todos los atributos

Persona persona3 = new Persona("Juan López", 17, 'H', 75.0, 1.80);



// Comprobar si es mayor de edad

System.out.println(persona3.esMayorDeEdad()); // false



// Calcular IMC

int resultadoIMC = persona2.calcularIMC();

// resultadoIMC = 0 (peso ideal)



// Mostrar información

System.out.println(persona2.toString());



\--



\## Salida Esperada

============================================

&#x20; PRUEBA DE LA CLASE PERSONA

============================================



\--- Prueba 1: Constructor por defecto ---

Persona{nombre='', edad=0, dni='37657879W', sexo=H, peso=0.0 kg, altura=0.0 m, IMC=en su peso ideal, mayorDeEdad=No}



\--- Prueba 2: Constructor con nombre, edad y sexo ---

Persona{nombre='María García', edad=25, dni='95763599V', sexo=M, peso=65.0 kg, altura=1.65 m, IMC=en su peso ideal, mayorDeEdad=Sí}



\--- Prueba 3: Constructor con todos los atributos ---

Persona{nombre='Juan López', edad=17, dni='33282475A', sexo=H, peso=75.0 kg, altura=1.8 m, IMC=en su peso ideal, mayorDeEdad=No}



\--- Prueba 4: Verificación de métodos ---

¿María García es mayor de edad? Sí

¿Juan López es mayor de edad? No



\--- Prueba 5: Cálculo de IMC ---

Ana: Persona{..., IMC=por debajo de su peso ideal, mayorDeEdad=Sí}

Carlos: Persona{..., IMC=en su peso ideal, mayorDeEdad=Sí}

Luis: Persona{..., IMC=con sobrepeso, mayorDeEdad=Sí}



\--- Prueba 6: Validación de sexo ---

Sexo introducido: 'X', Sexo asignado: 'H'



\--- Prueba 7: Generación de DNI ---

DNI generado para persona1: 37657879W

DNI generado para persona2: 95763599V

DNI generado para persona3: 33282475A



============================================

&#x20; FIN DE LAS PRUEBAS

============================================



\--



\## Conceptos POO Aplicados

Concepto		Dónde se aplica

Clases y Objetos	Clase Persona y sus instancias

Encapsulación		Atributos privados + getters/setters

Constructores		Por defecto, parcial y completo

Constantes		IMC\_BAJO, IMC\_IDEAL, IMC\_ALTO, SEXO\_POR\_DEFECTO, LETRAS\_DNI

Métodos de instancia	calcularIMC(), esMayorDeEdad(), toString()

Métodos privados	comprobarSexo(), generaDNI()

Uso de this		En constructores y métodos setter

Validación de datos	En comprobarSexo() y en la generación del DNI

Sobrescritura		Método toString()



\--



\##  Fórmula del IMC

El Índice de Masa Corporal se calcula con la siguiente fórmula:

IMC = peso (kg) / altura² (m)



Clasificación utilizada en el proyecto:

IMC		Resultado	

< 20		Por debajo de su peso ideal (-1)

20 - 25		En su peso ideal (0)

> 25		Con sobrepeso (1)





\--



\## Autor

Desarrollado como actividad práctica de la UF2404

Módulo: Desarrollo de Aplicaciones con Tecnologías Web

Tema: Creación de una Clase - Paradigma de Orientación a Objetos

By Sara Lopez Figueredo Sainz



\--



\## Fecha

Septiembre 2026



\--



\##  Referencias

Documentos de apoyo UF2404 (UD1, UD2, UD4, UD6, UD7, UD9)

Bertrand Meyer - Object Oriented Software Construction

Timothy Budd - An Introduction to OO Programming

Normativa española de generación de DNI (letras TRWAGMYFPDXBNJZSQVHLCKE)







