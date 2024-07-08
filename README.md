# onmi_pro_app

A new Flutter project to omni pro company.

## Getting Started

- Before you start developing with omniPro App, ensure you have the following prerequisites:

## Dependencies

* Dart 3.2.3
* Flutter 3.16.6

## Installation

1. Install Dart and Flutter.
2. Clone this [repository](https://github.com/cafoga98/omniProApp.git) .
3. Run `flutter pub get` to get the dependencies of this project.
4. Run `flutter pub run build_runner build --delete-conflicting-outputs` to generate code derived
   from annotations and generated sources that depend on `build_runner`, `json_annotation`, `freezed` & `injectable`.
5. Run `flutter run` to build and run the app.

## Project Structure

```
lib/
├── core/
│   ├── error/      // Manejo de errores: clases y funciones relacionadas
│   └── utils/      // Utilidades generales: funciones y clases de utilidad
├── data/
│   ├── datasources/  // Acceso a datos: capa de acceso a datos (red, almacenamiento local)
│   ├── models/       // Modelos de datos: representación de los datos de la aplicación
│   └── repositories/ // Repositorios: lógica de negocio que interactúa con las fuentes de datos
├── domain/
│   ├── entities/     // Entidades del dominio: modelos de datos que representan entidades del negocio
│   └── repositories/ // Repositorios del dominio: abstracciones de repositorios específicos del dominio
├── presentation/
│   ├── blocs/     // BLoC: Componentes de lógica de negocio para la gestión de estado
│   ├── pages/     // Páginas: pantallas (componentes UI) para diferentes partes de la aplicación
│   └── widgets/   // Widgets: componentes UI reutilizables
└── main.dart      // Punto de entrada principal de tu aplicación
```

## UI
- **Warning Page**: Whenever the pad issues an error, the warning screen will look like this, showing the warning message and a button to "retry" consuming the API.:

  <p float="left">
  <img src="https://github.com/cafoga98/omniProApp/blob/main/assets/img/warning_page.png" width="200" />
  </p>
  
- **Main Page**: When the list consumed through the api https://jsonplaceholder.typicode.com/photos returns results, it will appear as follows:

  <p float="left">
  <img src="https://github.com/cafoga98/omniProApp/blob/main/assets/img/main_page.png" width="200" />
  </p>