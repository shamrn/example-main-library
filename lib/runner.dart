import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:main_library/common/app.dart';
import 'package:main_library/common/di/injector_configurator.dart';
import 'package:main_library/common/loggers/provider_logger.dart';
import 'package:main_library/common/ui/app_assets.dart';

Future<void> mainLibraryConfigurator() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await dotenv.load(fileName: 'res/config/.env');

  await configureDependencies();

  await Future.wait(
    AppAssets.svgAssetsForPrecache.map(
      (svgAsset) {
        final loader = SvgAssetLoader(svgAsset);

        return svg.cache.putIfAbsent(
          loader.cacheKey(null),
          () => loader.loadBytes(null),
        );
      },
    ),
  );

  runApp(ProviderScope(
    observers: [ProviderLogger()],
    child: const App(),
  ));
}
