import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_library/common/extensions/localization_extension.dart';
import 'package:main_library/common/routing/routes.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  void _onTapToHome(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.home);
  }

  void _onTapToProfile(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.profile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () => _onTapToHome(context),
                child: Text(context.locale.initialToHomeButtonLabel),
              ),
              SizedBox(height: 20.h),
              OutlinedButton(
                onPressed: () => _onTapToProfile(context),
                child: Text(context.locale.initialToProfileButtonLabel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
