class LivenessVerifyModel{
  String? invalidCode;
  String? invalidMessage;
  String? matching_mid_left;
  String? matching_mid_right;
  String? valid;

  LivenessVerifyModel({this.invalidCode, this.invalidMessage,
      this.matching_mid_left, this.matching_mid_right, this.valid});

  LivenessVerifyModel.fromJson(Map<String, dynamic> json) {
    invalidCode = json['invalidCode'];
    invalidMessage = json['invalidMessage'];
    matching_mid_left = json['matching_mid_left'];
    matching_mid_right = json['matching_mid_right'];
    valid = json['valid'];

  }

  @override
  String toString() {
    return '{invalidCode: $invalidCode, invalidMessage: $invalidMessage, matching_mid_left: $matching_mid_left, matching_mid_right: $matching_mid_right, valid: $valid}';
  }
}