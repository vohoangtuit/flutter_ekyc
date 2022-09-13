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

  @MultiPart()
  @POST('ekyc/face_matching')
  Future<ResponseModel> faceMatching(@Query('format_type') String? format_type,@Query('type1') String? type1,@Part(name: 'img1') File img1,@Part(name: 'img2') File img2);

  @MultiPart()
  @POST('ekyc/verify_liveness')
  Future<ResponseModel> verifyLiveness(@Query('format_type') String? format_type,@Part(name: 'portrait_left') File portrait_left,@Part(name: 'portrait_mid') File portrait_mid,@Part(name: 'portrait_right') File portrait_right);
}


