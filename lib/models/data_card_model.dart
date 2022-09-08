import 'package:flutter_ekyc/models/card_front_model.dart';
import 'package:flutter_ekyc/utils/constant.dart';

import '../network/base/response_model.dart';
import '../utils/validators.dart';
import 'card_back_model.dart';

class DataCardModel {// todo giấy CMND
  String? invalidCode;
  String? invalidMessage;
  String?type; // todo : 9_id_card_front (mặc truớc) || 9_id_card_back ((mặc sau)
  String? valid;
  CardFrontModel? infoCardFront;
  CardBackModel? infoCardBack;

  DataCardModel(
      {this.invalidCode,
      this.invalidMessage,
      this.type,
      this.valid,
      this.infoCardFront,
      this.infoCardBack});

  DataCardModel.fromJson(Map<String, dynamic> json) {
    if (Utils.isNotEmpty(json['invalidCode']) ?? true) {
      invalidCode = json['invalidCode'];
    } else {
      invalidCode = '2022';
    }
    if (Utils.isNotEmpty(json['type']) ?? true) {
      type = json['type'];
    }
    if (Utils.isNotEmpty(json['valid']) ?? true) {
      valid = json['valid'];
    }
    invalidMessage = json['invalidMessage'];
    if (invalidCode!.compareTo('0')==0 && Utils.isNotEmpty(type) == true) {
      if (type!.compareTo(Constants.cardFront) == 0) {
        if (json['info']!=null) {
          infoCardFront = CardFrontModel.fromJson(json['info']);
        }
      }
     else if (type!.compareTo(Constants.cardBack) == 0) {
        if (json['info']!=null) {
          infoCardBack = CardBackModel.fromJson(json['info']);
        }
      }
    }
  }

  List<DataCardModel> listFromJson(ResponseModel response) {
    List<DataCardModel> list = <DataCardModel>[];
    if (response.errorCode!.compareTo('0')==0) {
      if (response.data != null) {
        response.data!.forEach((v) {
          list.add(DataCardModel.fromJson(v));
        });
      }
    }
    return list;
  }

  @override
  String toString() {
    return '{invalidCode: $invalidCode, invalidMessage: $invalidMessage, type: $type, valid: $valid, infoCardFront: $infoCardFront, infoCardBack: $infoCardBack}';
  }
}
