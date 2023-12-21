import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_library/common/extensions/localization_extension.dart';
import 'package:main_library/common/utils/consumer_state_with_provider.dart';
import 'package:main_library/features/home/provider/home_provider.dart';
import 'package:main_library/features/home/provider/home_state.dart';
import 'package:main_library/features/home/widgets/home_character_list_view.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomeState();
}

class _HomeState
    extends ConsumerStateWithProvider<HomeProvider, HomeState, HomePage> {
  void _errorsListener(HomeState? previous, HomeState next) {
    if (next.errors?.isServerError ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.locale.serverError)),
      );
    }

    if (next.errors?.isUnknownError ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.locale.unknownError)),
      );
    }
  }

  Widget _buildTitle() {
    return Text(
      context.locale.homeTitle,
      style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildBody() {
    final state = ref.watch(provider);

    return Column(
      children: [
        _buildTitle(),
        SizedBox(height: 40.h),
        HomeCharacterListView(characters: state.characters),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(provider, _errorsListener);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
            child: _buildBody(),
          ),
        ),
      ),
    );
  }
}
