class ChipBackModel{
  String? identification_sign; // todo dấu vết dị hình
  String? issue_date; // todo ngày cấp
  String? issued_at; // todo nơi cấp

// todo -- khac
  String? country;
  String? dob;
  String? due_date;
  String? gender;
  String? sur_name;
  String? given_name;
  String? nationality;
  String? person_number;


  ChipBackModel({
      this.identification_sign,
      this.issue_date,
      this.issued_at,

      this.country,
      this.dob,
      this.due_date,
      this.gender,
      this.sur_name,
      this.given_name,
      this.nationality,
      this.person_number,
  });
  ChipBackModel.fromJson(Map<String, dynamic> json) {
    identification_sign = json['identification_sign'];
    issue_date = json['issue_date'];
    issued_at = json['issued_at'];

    country = json['country'];
    dob = json['dob'];
    due_date = json['due_date'];
    gender = json['gender'];
    sur_name = json['sur_name'];
    given_name = json['given_name'];
    nationality = json['nationality'];
    person_number = json['person_number'];
  }

  @override
  String toString() {
    return '{identification_sign: $identification_sign, issue_date: $issue_date, issued_at: $issued_at, country: $country, dob: $dob, due_date: $due_date, gender: $gender, sur_name: $sur_name, given_name: $given_name, nationality: $nationality, person_number: $person_number}';
  }
}