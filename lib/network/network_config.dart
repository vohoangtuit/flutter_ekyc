import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ekyc/network/api_provider.dart';

abstract class NetworkConfig {
  final String baseUrl = 'https://demo.computervision.com.vn/api/v2/';
//  final String baseUrl = 'https://cloud.computervision.com.vn/api/v2/';

  late ApiProvider restApi ;

  String? token='';
  NetworkConfig.internal(){
    if (kDebugMode) {
      print('NetworkConfig.internal()');
    }
    Dio dio= Dio();
    dio.options.baseUrl=baseUrl;
    //   _dio!.options.receiveTimeout = 3000;
    dio.interceptors.add(AppInterceptors());
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(requestBody: true,responseBody: true));
    }
    restApi =ApiProvider(dio, baseUrl: baseUrl);
  }
}

class AppInterceptors extends InterceptorsWrapper {
   String username = 'a03b1d72a8d54daf967f12cfa16839e8';
   String password = '1115f52f2ffd51359babc5c7c38af673db1fe9b6ac0641d7fd0d3fd2ff5f4bf5';

 // String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
  final String basicAuth = 'Basic ${base64Encode(utf8.encode('a03b1d72a8d54daf967f12cfa16839e8:1115f52f2ffd51359babc5c7c38af673db1fe9b6ac0641d7fd0d3fd2ff5f4bf5'))}';

  // final String basicAuth = 'Basic ${base64Encode(utf8.encode('1a03b1d72a8d54daf967f12cfa16839e8:1115f52f2ffd51359babc5c7c38af673db1fe9b6ac0641d7fd0d3fd2ff5f4bf5'))}';


  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String token='';

    Map<String, dynamic> requestHeaders = {
      'contentType': 'application/json',
      'Authorization': basicAuth,
      'Language': 'vi',
      'Connection':'keep-alive'
    };
    options.headers =requestHeaders;
    return super.onRequest(options, handler);
  }
  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    // print('response ${response.data.toString()}');
    return super.onResponse(response, handler);
  }

  @override
  onError(DioError err, ErrorInterceptorHandler handler) {
    // var url = err.request.uri;
    print("************************************************");
    print(err);
    super.onError(err, handler);
  }
}