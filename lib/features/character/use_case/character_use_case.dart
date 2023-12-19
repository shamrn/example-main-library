import 'package:dio/dio.dart';
import 'package:main_library/common/di/injector_configurator.dart';
import 'package:main_library/features/character/models/character_ui.dart';
import 'package:main_library/features/character/repositories/character_repository.dart';
import 'package:main_library/features/common/exceptions/server_error_exception.dart';
import 'package:main_library/features/common/exceptions/unknown_error_exception.dart';

class CharacterUseCase {
  final _characterRepository = getIt<CharacterRepository>();

  Future<List<CharacterUi>> getCharacters() async {
    try {
      final response = await _characterRepository.getCharacter();

      return response.results.map(CharacterUi.fromResponse).toList();
    } on DioException catch (_) {
      throw ServerErrorException();
    } on Exception catch (_) {
      throw UnknownErrorException();
    }
  }
}
