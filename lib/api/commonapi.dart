import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:writer/model/cat_api.dart';

part 'commonapi.g.dart';

@RestApi(baseUrl: 'https://catfact.ninja')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/fact')
  Future<Cat> getCatFact();
}
