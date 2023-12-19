import 'package:get_it/get_it.dart';
import 'package:main_library/common/di/injector_configurator.dart';
import 'package:main_library/common/models/main_library_options.dart';

void configureMainLibrary({required String baseUrl}) {
  assert(baseUrl.isNotEmpty, 'Main library base url must not be empty');

  GetIt.I.registerSingleton<MainLibraryOptions>(
    MainLibraryOptions(
      baseUrl: baseUrl,
    ),
  );

  configureDependencies();
}
