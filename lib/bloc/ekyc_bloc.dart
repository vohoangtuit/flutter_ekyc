import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ekyc/bloc/base_bloc.dart';
import 'package:flutter_ekyc/models/lveness_verify_model.dart';
import 'package:flutter_ekyc/models/data_card_model.dart';
import 'package:flutter_ekyc/models/data_chip_model.dart';
import 'package:flutter_ekyc/models/face_matching_model.dart';
import 'package:flutter_ekyc/network/base/dio_exceptions.dart';
import 'dart:io';

import 'package:flutter_ekyc/utils/validators.dart';

class EKycBloc extends BaseBloc {
  EKycBloc({required super.screen});

  Future<List<DataCardModel>> verifyCards(File img1, File img2) async {
    List<DataCardModel> list = <DataCardModel>[];
    screen.showLoading(true);
    try {
      await restApi.verifyCards('file', false, img1, img2).then((response) {
        if(response.errorCode!=null){
          if(response.errorCode!.compareTo('0')==0){
            list = DataCardModel().listFromJson(response);
          }
        }
      });
    } on DioError catch (dioError) {
      screen.showLoading(false);
      print('Error:: ${DioExceptions.fromDioError(dioError).toString()}');
    }
    screen.showLoading(false);
    return list;
  }
  Future<List<DataChipMode>> verifyChip(File img1, File img2) async {
    List<DataChipMode> list = <DataChipMode>[];
    screen.showLoading(true);
    try {
      await restApi.verifyCards('file', false, img1, img2).then((response) {
        if(response.errorCode!=null){
          if(response.errorCode!.compareTo('0')==0){
            list = DataChipMode().listFromJson(response);
          }
        }
      });
    } on DioError catch (dioError) {
      screen.showLoading(false);

      print('Error:: ${DioExceptions.fromDioError(dioError).toString()}');
    }
    screen.showLoading(false);
    return list;
  }

  Future<FaceMatchingModel> faceMatching(File img1, File img2) async {
    FaceMatchingModel data =FaceMatchingModel();
    screen.showLoading(true);
    try {
      await restApi.faceMatching('file', 'card', img1, img2).then((response) {// todo 'card' || 'portrait'
        if(response.data!=null){
          data =FaceMatchingModel.fromJson(response.data);
        }

      });
    } on DioError catch (dioError) {
      screen.showLoading(false);
      print('Error:: ${DioExceptions.fromDioError(dioError).toString()}');
    }
    screen.showLoading(false);
    screen.log('data ${data.toString()}');
    return data;
  }
  Future<LivenessVerifyModel> verifyLiveness(File portrait_left, File portrait_mid, File portrait_right) async {
    LivenessVerifyModel data =LivenessVerifyModel();
    screen.showLoading(true);
    try {
      await restApi.verifyLiveness('file', portrait_left, portrait_mid,portrait_right).then((response) {// todo 'card' || 'portrait'
        if(response.data!=null){
          data =LivenessVerifyModel.fromJson(response.data);
        }

      });
    } on DioError catch (dioError) {
      screen.showLoading(false);
      print('Error:: ${DioExceptions.fromDioError(dioError).toString()}');
    }
    screen.showLoading(false);
    screen.log('data ${data.toString()}');
    return data;
  }
}
