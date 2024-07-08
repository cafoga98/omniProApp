import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)

void configureInjection(String environment) async {
  $initGetIt(getIt, environment: environment);
}

@module
abstract class RegisterModule {
  @lazySingleton
  http.Client get client => http.Client();
}