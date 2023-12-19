import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:main_library/features/character/models/character_response.dart';
import 'package:main_library/features/common/models/pagination_body_response.dart';
import 'package:retrofit/http.dart';

part 'character_repository.g.dart';

@RestApi()
@injectable
abstract class CharacterRepository {
  @factoryMethod
  factory CharacterRepository(Dio dio) => _CharacterRepository(dio);

  @GET('/api/character/')
  Future<PaginationBodyResponse<CharacterResponse>> getCharacter();
}
