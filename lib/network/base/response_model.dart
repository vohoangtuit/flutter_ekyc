
import 'package:flutter_ekyc/utils/validators.dart';

class ResponseModel {
  String? errorCode;
  String? errorMessage;
  String? message;
  String? exception;
  dynamic data;

  ResponseModel({this.errorCode, this.errorMessage, this.message, this.exception,this.data});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    // if(json['Exception']!=null){
    //   print('Exception::: ${json['Exception']}');
    //   exception = json['Exception'];
    // }
    // if(exception!=null){
    //   print('no Exception');
    //   errorCode ='2022';
    // }else{
    //   errorCode = json['errorCode'];
    // }
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    if(json['errorMessage']!=null){
      if(Utils.isNotEmpty(json['errorMessage'])??true){
        errorMessage = json['errorMessage'];
      }
    }
    if(json['message']!=null){
      message = json['message'];
    }

    if(errorCode!.compareTo('0')==0){
      if(json['data']!=null){
        data = json['data'];
      }
    }

    //print('errorCode::: $errorCode');
  }

  @override
  String toString() {
    return 'ResponseModel{errorCode: $errorCode, errorMessage: $errorMessage, message: $message, exception: $exception, data: $data}';
  }
}
