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

lib/
|- data/
|   |- models/
|   |- repositories/
|   |- datasources/
|- domain/
|   |- entities/
|   |- repositories/
|- presentation/
|   |- pages/
|   |- widgets/
|   |- blocs/
|- core/
|   |- error/
|   |- utils/
|- main.dart

