class ChipFrontModel {
  String? id; // todo id cmnd
  String? name; // todo fullname
  String? dob; // todo ngày sinh

  String? address; // todo thuờng trú
  String? address_district; // todo quận - huyện
  String? address_town; // todo tỉnh - thành
  String? address_ward; // todo xã - phuờng

  String? hometown; // todo Nguyên quán
  String? hometown_district; // todo quận - huyện
  String? hometown_ward; // todo xã - phuờng

  //---todo ---------------  khác so voi cmnnd
  String? gender;
  String? nationality;
  String? due_date;

  ChipFrontModel({
      this.id,
      this.name,
      this.dob,
      this.address,
      this.address_district,
      this.address_town,
      this.address_ward,
      this.hometown,
      this.hometown_district,
      this.hometown_ward,

      this.gender,
      this.nationality,
      this.due_date}); // todo ngày hết hạn

  ChipFrontModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dob = json['dob'];

    address = json['address'];
    address_district = json['address_district'];
    address_town = json['address_town'];
    address_ward = json['address_ward'];

    hometown = json['hometown'];
    hometown_district = json['hometown_district'];
    hometown_ward = json['hometown_ward'];

    gender = json['gender'];
    nationality = json['nationality'];
    due_date = json['due_date'];
  }

  @override
  String toString() {
    return '{id: $id, name: $name, dob: $dob, address: $address, address_district: $address_district, address_town: $address_town, address_ward: $address_ward, hometown: $hometown, hometown_district: $hometown_district, hometown_ward: $hometown_ward, gender: $gender, nationality: $nationality, due_date: $due_date}';
  }
}
