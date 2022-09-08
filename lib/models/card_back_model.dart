class CardBackModel{// todo mặc sau CMND : type = 9_id_card_back
  String? ethnicity; // todo dân tọc
  String? religious; // todo tôn giáo
  String? identification_sign; // todo dấu vết dị hình
  String? issue_date; // todo ngày cấp
  String? issued_at; // todo nơi cấp
  String? issued_at_town;// todo nơi cấp

  CardBackModel({this.ethnicity, this.religious, this.identification_sign,
    this.issue_date, this.issued_at, this.issued_at_town});

  CardBackModel.fromJson(Map<String, dynamic> json) {
    ethnicity = json['ethnicity'];
    religious = json['religious'];
    identification_sign = json['identification_sign'];
    issue_date = json['issue_date'];
    issued_at = json['issued_at'];
    issued_at_town = json['issued_at_town'];
  }
  @override
  String toString() {
    return 'CardBackModel{ethnicity: $ethnicity, religious: $religious, identification_sign: $identification_sign, issue_date: $issue_date, issued_at: $issued_at, issued_at_town: $issued_at_town}';
  }
}