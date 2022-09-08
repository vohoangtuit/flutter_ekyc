import 'package:dio/dio.dart';
import 'package:flutter_ekyc/network/base/dio_exceptions.dart';
import 'package:flutter_ekyc/network/network_config.dart';
import 'package:flutter_ekyc/screens/base_screen.dart';
 class BaseBloc extends NetworkConfig{
  final BaseScreen screen;
  BaseBloc({required this.screen}) : super.internal();

  void handleError(DioError dioError){
    String error =DioExceptions.fromDioError(dioError).toString();
    
  }
  void dispose() {}
  void showLoading(bool show){
    
  }

}