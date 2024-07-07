import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async => $initGetIt(getIt);

@module
abstract class RegisterModule {
  @lazySingleton
  http.Client get client => http.Client();
}