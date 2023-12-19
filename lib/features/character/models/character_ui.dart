import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:main_library/features/character/models/character_response.dart';

part 'character_ui.freezed.dart';

@freezed
class CharacterUi with _$CharacterUi {
  const factory CharacterUi({
    required int id,
    required String name,
    required String image,
  }) = _CharacterUi;

  factory CharacterUi.fromResponse(CharacterResponse response) => CharacterUi(
        id: response.id,
        name: response.name,
        image: response.image,
      );
}
