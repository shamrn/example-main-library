import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:main_library/common/di/injector_configurator.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  getIt.init();
  await getIt.allReady();
}
