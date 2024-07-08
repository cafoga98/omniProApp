import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/mockito.dart';
import 'package:onmi_pro_app/data/datasource/photo_remote_datasource.dart';
import 'package:onmi_pro_app/domain/repositories/photo_repository.dart';
import 'package:onmi_pro_app/core/utils/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void configureTestInjection() {
  $initGetIt(getIt, environment: 'test');
}