<h1 align="center">
  <br>
  <a href="http://www.amitmerchant.com/electron-markdownify"><img src="https://f.hubspotusercontent20.net/hubfs/2829524/Copia%20de%20LOGOTIPO_original-2.png"></a>
  <br>
  Pragma
  <br>
</h1>

<h4 align="center">Ejemplo de implementación de patrón de diseño comando en Flutter</h4>

<p align="center">
  <a href="https://docs.flutter.dev/">
    <img src="https://img.shields.io/badge/Flutter-v3.38.1-0488D7?style=flat&logo=Flutter" alt="Flutter" />
  </a>
  <a href="https://dart.dev/"><img src="https://img.shields.io/badge/Dart-v3.10.0-1C2834?style=flat&logo=dart" alt="Dart" /></a>
</p>

Este proyecto se enmarca en un artefacto asociado a la aplicación del patrón de diseño comando, enfocado en encapsular acciones del usuario como objetos que pueden ser ejecutados, desacoplados y gestionados independientemente de los invocadores. Dentro del contexto de una arquitectura limpia en Flutter, su implementación prioriza un diseño minimalista que evite la sobreingeniería y mantenga una separación limpia entre las capas de presentación, dominio y datos.  

Para demostrar su uso, este proyecto aplica el patrón comando en una calculadora Flutter, donde operaciones como adición, divición, multiplicación y sustracción se encapsulan como objetos independientes, permitiendo su ejecución sin vincularlos directamente a la interfaz, facilitando escalabilidad y gestión de acciones como deshacer.

A continuación, se detalla el diagrama del proyecto, resaltando la estructura y responsabilidades de los componentes clientes (originadores de comandos), manejadores (invocadores) y comandos (objetos que encapsulan la acción y su lógica).  

![Command](readme_assets/diagram.png)

<p align="center">
  <a href="#topicos">Topicos</a> •
  <a href="#instalación-y-ejecución">Instalación y ejecución</a> •
  <a href="#consideraciones">Consideraciones</a> •
  <a href="#tecnologias">Tecnologías</a> •
  <a href="#credits">Autores</a> •
  <a href="#related">Relacionados</a>
</p>

## Topicos

* Flutter
* Dart
* Command Pattern

## Instalación y ejecución

Para clonar y ejecutar está aplicación, necesitas [Git](https://git-scm.com) y [Flutter SDK](https://docs.flutter.dev/get-started/install) instalados en tu equipo. Una vez clonado el repositorio, tu IDE te recomendará hacer `flutter pub get`, una vez obtenidas las dependencias necesarias del proyecto mendiante el anterior comando. Podemos compilar el proyecto ya sea en el navegador, emulador, simulador o dispositivo físico.

## Consideraciones

Para decidir si el patrón de diseño comando es adecuado dentro de una arquitectura limpia, es esencial evaluar varios aspectos que aseguren una solución clara, mantenible y flexible:

1. **Separación de responsabilidades y desacoplamiento**

    El patrón permite encapsular una solicitud como objeto independiente, de modo que el invocador no conoce los detalles de la acción ni quién la ejecuta, separando claramente la lógica de negocio de la interfaz que la dispara.

2. **Extensibilidad y escalabilidad**

    Al agregar nuevos comandos (por ejemplo, operaciones aritméticas adicionales) solo se crea una nueva clase que implementa la interfaz de comando, sin modificar el código existente, lo que favorece la evolución del sistema con bajo impacto.

3. **Alineación con principios SOLID**

   - Principio de Inversión de Dependencias (DIP): Los componentes de alto nivel (invokers) dependen de abstracciones (la interfaz de comando) y no de implementaciones concretas.  
   - Principio de Abierto/Cerrado (OCP): Se pueden introducir nuevos comandos sin alterar el código de los invocadores o de los comandos ya existentes.
   - Principio de Responsabilidad Única (SRP): Cada comando tiene una única razón de cambio: ejecutar una acción específica.

4. **Mantenibilidad y pruebas**  

    Al encapsular la acción en un objeto, es fácil inyectar dependencias simuladas (mocks) o valores de prueba, facilitando pruebas unitarias aisladas y confiables para cada comando y para el flujo de invocación.

5. **Simplicidad estructural y bajo acoplamiento**

    El patrón introduce una capa ligera de objetos de comando que no impone estructuras rígidas, adaptándose tanto a aplicaciones simples (como una calculadora) como a sistemas más complejos donde se requiera deshacer/rehacer, colas de comandos o registro de operaciones.

## Autores

| [<img src="https://avatars.githubusercontent.com/u/206239634?v=4?width=400" width=115><br><sub>Jorge Mogotocoro</sub>](https://github.com/jmogotoc) <br/> | 
:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|

## Relacionados

- El patrón de diseño Comando ofrece soluciones estructuradas a problemas comunes en el desarrollo de aplicaciones Flutter, especialmente relacionados con la encapsulación de acciones, la gestión de operaciones y la separación de responsabilidades. Funciona como una herramienta reutilizable y adaptable que permite organizar mejor el código, mejorar la escalabilidad y facilitar el mantenimiento. Para profundizar en su uso y beneficios, recomendamos visitar el siguiente [enlace](https://refactoring.guru/design-patterns/command).