import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ekyc/bloc/base_bloc.dart';
import 'package:flutter_ekyc/models/data_card_model.dart';
import 'package:flutter_ekyc/models/data_chip_model.dart';
import 'package:flutter_ekyc/network/base/dio_exceptions.dart';
import 'dart:io';

import 'package:flutter_ekyc/utils/validators.dart';

class EKycBloc extends BaseBloc {
  EKycBloc({required super.screen});

  Future<List<DataCardModel>> verifyCards(File img1, File img2,ValueChanged<String>error) async {
    List<DataCardModel> list = <DataCardModel>[];
    screen.showLoading(true);
    try {
      await restApi.verifyCards('file', false, img1, img2).then((response) {
        if(response.errorCode!=null){
          if(response.errorCode!.compareTo('0')==0){
            list = DataCardModel().listFromJson(response);
          }else{
            error(Utils.isNotEmpty(response.errorMessage!)??true?response.errorMessage!:'Ảnh không đúng định dạng');
          }
        }else{
          error(Utils.isNotEmpty(response.errorMessage!)??true?response.errorMessage!:'Ảnh không đúng định dạng');
        }
      });
    } on DioError catch (dioError) {
      screen.showLoading(false);
      error('Có lỗi xẩy ra');
      print('Error:: ${DioExceptions.fromDioError(dioError).toString()}');
    }
    screen.showLoading(false);
    return list;
  }
  Future<List<DataChipMode>> verifyChip(File img1, File img2,ValueChanged<String>error) async {
    List<DataChipMode> list = <DataChipMode>[];
    screen.showLoading(true);
    try {
      await restApi.verifyCards('file', false, img1, img2).then((response) {
        if(response.errorCode!=null){
          if(response.errorCode!.compareTo('0')==0){
            list = DataChipMode().listFromJson(response);
          }else{
            error(Utils.isNotEmpty(response.errorMessage!)??true?response.errorMessage!:'Ảnh không đúng định dạng');
          }
        }else{
          error(Utils.isNotEmpty(response.errorMessage!)??true?response.errorMessage!:'Ảnh không đúng định dạng');
        }
      });
    } on DioError catch (dioError) {
      screen.showLoading(false);
      error('Có lỗi xẩy ra');
      print('Error:: ${DioExceptions.fromDioError(dioError).toString()}');
    }
    screen.showLoading(false);
    return list;
  }
}
