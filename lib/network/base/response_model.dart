
import 'package:flutter_ekyc/utils/validators.dart';

class ResponseModel {
  String? errorCode;
  String? errorMessage;
  String? message;
  String? exception;
  dynamic data;

  ResponseModel({this.errorCode, this.errorMessage, this.message, this.exception,this.data});

  ResponseModel.fromJson(Map<String, dynamic> json) {

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
    // if(errorCode!.compareTo('0')==0){
    //
    // }
    if(json['data']!=null){
      if(Utils.isNotEmpty(json['response'].toString())??true){
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
