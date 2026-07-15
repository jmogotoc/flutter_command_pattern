# Command Pattern

## Introducción

El patrón de diseño Comando brinda una solución estructurada para encapsular solicitudes o acciones como objetos independientes, lo que permite desacoplar al invocador de la lógica de ejecución. Esta desacoplamiento facilita la extensibilidad, el mantenimiento y la pruebas unitarias, al margen de habilitar funcionalidades como deshacer/rehacer o colas de operaciones. Al basarse en abstracciones comunes (interfaces o clases base), el patrón se adapta a una amplia variedad de dominios y arquitecturas sin depender de tecnologías específicas.

## Conceptos clave

### Comando (Command)  

Interfaz que encapsula una solicitud/acción como un objeto, permitiendo desacoplador el emisor del receptor. Facilita la reutilización, la gestión de transacciones y la extensión del sistema sin modificar código existente.

### Comando concreto (Concrete Command)

Una implementación específica del interfaz de comando. Realiza una acción concreta y puede interactuar directamente con el receptor para ejecutar la tarea asignada.

### Emisor (Invoker)

Objeto que invoca el comando cuando se requiere ejecutar una acción. No conoce los detalles del receptor, solo la interfaz del comando, lo que permite separar la solicitud de su ejecución.

### Receptor (Receiver)

Objeto que contiene la lógica necesaria para ejecutar la acción. El comando le envía un mensaje al receptor, que realiza la operación, sin que el emisor o el cliente conozcan los detalles de dicha ejecución.

### Cliente (Client)

Entidad que solicita una acción (ej: un botón en una interfaz). El cliente genera el comando concreto e interactúa con el emisor para delegar la ejecución de la tarea.

## Ejemplificando la aplicación command pattern en Flutter

Vamos a construir una calculadora de operaciones basicas (suma, resta, multiplicación y divición) que opere sobre numeros enteros para implementar cada operación como un comando.

1. La aplicación tendrá los siguientes botones:

   - Numeros digitos: Un botón por cada numero que permitirá agregar un digito al que se le aplicará una operación matematica.
   - Operaciones basicas. Un botón para la operación de suma, resta multiplicación y divición.
   - Limpieza: Un botón que permita deshacer la operación que se está construyendo actualmente.

2. Tendremos la siguiente estructura en nuestro proyecto. Pueden hacer falta muchos más archivos, pero para ser un ejemplo base se manejará de esta manera, es solo para tener una aproximación general.

    ```plain
    ├── core
    │   ├── command.dart
    │   ├── invoker.dart
    │   ├── receiver.dart
    │   └── types
    │       ├── number_button_enum.dart
    │       └── option_button_enum.dart
    ├── domain
    │   ├── calculator_invoker.dart
    │   ├── calculator_receiver.dart
    │   └── commands
    │       ├── addition_command.dart
    │       ├── divide_command.dart
    │       ├── multiply_command.dart
    │       └── subtract_command.dart
    ├── main.dart
    └── ui
        ├── calculator_page.dart
        └── widgets
            ├── calculator_command_button.dart
            ├── calculator_number_button.dart
            ├── calculator_screen_widget.dart
            └── calculator_widget.dart
    ```

    La interacción general de las clases que componen la implementación de nuestro patrón comando es la siguiente:

    ![Command](readme_assets/diagram.png)

3. Para nuestro ejemplo así se van a definir como luce un `Command`, `Invoker` y `Receiver`

    ```dart
    abstract class Command {
      final Receiver receiver;

      Command(this.receiver);
      void execute();
      void undo();
    }
    ```

    ```dart
    abstract class Invoker {
      final Receiver receiver;
      Invoker(this.receiver);
      void execute(Command command);
      void undo();
    }
    ```

    ```dart
    abstract class Receiver {
      void add(int value);
      void subtract(int value);
      void multiply(int value);
      void divide(int value);

      int get result => 0;
    }
    ```

4. Implementamos como será concretamente el "Invoker"

    ```dart
    class CalculatorInvoker extends Invoker {
      CalculatorInvoker(super.receiver);

      final List<Command> _history = [];
      List<Command> get history => _history;

      @override
      void execute(Command command) {
        command.execute();
        _history.add(command);
      }

      @override
      void undo() {
        if (_history.isNotEmpty) {
          final lastCommand = _history.removeLast();
          lastCommand.undo();
        }
      }
    }
    ```

5. Implementamos como será concretamente el "Receiver".

    ```dart
    class CalculatorReceiver extends Receiver {
      int _result = 0;

      @override
      void add(int value) => _result += value;
      @override
      void subtract(int value) => _result -= value;
      @override
      void multiply(int value) => _result *= value;
      @override
      void divide(int value) => _result ~/= value;

      @override
      int get result => _result;
    }
    ```

6. Implementamos como será concretamente cada uno de nuestros "Command".

    ```dart
    class AdditionCommand extends Command {
      AdditionCommand(super.receiver, this._value);

      final int _value;

      @override
      void execute() {
        receiver.add(_value);
      }
      
      @override
      void undo() {
        receiver.subtract(_value);
      }
    }
    ```

    ```dart
    class SubtractCommand extends Command {
      SubtractCommand(super.receiver, this._value);

      final int _value;

      @override
      void execute() {
        receiver.subtract(_value);
      }
      
      @override
      void undo() {
        receiver.add(_value);
      }
    }

    ```

    ```dart
    class MultiplyCommand extends Command {
      MultiplyCommand(super.receiver, this._value);

      final int _value;

      @override
      void execute() {
        receiver.multiply(_value);
      }
      
      @override
      void undo() {
        receiver.divide(_value);
      }
    }
    ```

    ```dart
    class DivideCommand extends Command {
      DivideCommand(super.receiver, this._value);

      final int _value;

      @override
      void execute() {
        receiver.divide(_value);
      }
      
      @override
      void undo() {
        receiver.multiply(_value);
      }
    }
    ```

    Y con esto ya tenemos construida nuestra logica por la cual se implementa el patrón comando.<>

Nuestro resultado final será así: