import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:main_library/features/character/models/character_ui.dart';
import 'package:main_library/features/character/widgets/character_list_view_item.dart';

class CharacterListView extends StatelessWidget {
  const CharacterListView({
    required List<CharacterUi> characters,
    super.key,
  }) : _characters = characters;

  final List<CharacterUi> _characters;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      itemBuilder: (_, index) => CharacterListViewItem(
        character: _characters[index],
      ),
      separatorBuilder: (_, __) => SizedBox(height: 20.h),
      itemCount: _characters.length,
    );
  }
}
