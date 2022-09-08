import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_ekyc/network/base/response_model.dart';
import 'package:retrofit/retrofit.dart';
part 'api_provider.g.dart';

@RestApi(baseUrl: '')
abstract class ApiProvider {
  factory ApiProvider(Dio dio, {String? baseUrl}) {
    return _ApiProvider(dio, baseUrl: baseUrl);
  }

  @MultiPart()
  @POST('ekyc/cards')
  Future<ResponseModel> verifyCards(@Query('format_type') String? format_type,@Query('get_thumb') bool? get_thumb,@Part(name: 'img1') File img1,@Part(name: 'img2') File img2);

}

