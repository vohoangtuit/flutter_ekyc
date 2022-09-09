import 'package:flutter_ekyc/network/base/error_model.dart';

class FaceMatchingModel{
  // String? face1;
  // String? face1_score;
  // String? face2;
  // String? face2_score;
  int? invalidCode;
  String? invalidMessage;
  String? match;
  String? matching;

  FaceMatchingModel({
      this.invalidCode, this.invalidMessage, this.match, this.matching});


  FaceMatchingModel.fromJson(Map<String, dynamic> json) {
    invalidCode = json['invalidCode'];
    invalidMessage = json['invalidMessage'];
    match = json['match'];
    matching = json['matching'];
  }

  @override
  String toString() {
    return 'FaceMatchingModel{invalidCode: $invalidCode, invalidMessage: $invalidMessage, match: $match, matching: $matching}';
  }
}