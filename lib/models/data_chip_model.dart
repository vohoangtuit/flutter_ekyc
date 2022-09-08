import 'package:flutter_ekyc/models/chip_back_model.dart';
import 'package:flutter_ekyc/models/chip_front_model.dart';
import 'package:flutter_ekyc/network/base/response_model.dart';
import 'package:flutter_ekyc/utils/constant.dart';
import 'package:flutter_ekyc/utils/validators.dart';

class DataChipMode{// todo thẻ CCCD
  String? invalidCode;
  String? invalidMessage;
  String?type; // todo : chip_id_card_front (mặc truớc) || chip_id_card_back ((mặc sau)
  String? valid;
  ChipFrontModel? infoChipFront;
  ChipBackModel? infoChipBack;

  DataChipMode({this.invalidCode, this.invalidMessage, this.type, this.valid,
      this.infoChipFront, this.infoChipBack});

  DataChipMode.fromJson(Map<String, dynamic> json) {
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
      if (type!.compareTo(Constants.chipFront) == 0) {
        if (json['info']!=null) {
          infoChipFront = ChipFrontModel.fromJson(json['info']);
        }
      }
      else if (type!.compareTo(Constants.chipBack) == 0) {
        if (json['info']!=null) {
          infoChipBack = ChipBackModel.fromJson(json['info']);
        }
      }
    }
  }
  List<DataChipMode> listFromJson(ResponseModel response) {
    List<DataChipMode> list = <DataChipMode>[];
    if (response.errorCode!.compareTo('0')==0) {
      if (response.data != null) {
        response.data!.forEach((v) {
          list.add(DataChipMode.fromJson(v));
        });
      }
    }
    return list;
  }
  @override
  String toString() {
    return 'DataChipMode{invalidCode: $invalidCode, invalidMessage: $invalidMessage, type: $type, valid: $valid, infoChipFront: $infoChipFront, infoChipBack: $infoChipBack}';
  }
}