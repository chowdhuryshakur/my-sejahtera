// To parse this JSON data, do
//
//     final User = TokenWithUserFromJson(jsonString);

import 'dart:convert';

class TokenWithUser {
  TokenWithUser({
    this.accessToken,
    this.tokenType,
    this.expiresAt,
    this.user,
  });

  String accessToken;
  String tokenType;
  DateTime expiresAt;
  User user;

  factory TokenWithUser.fromRawJson(String str) =>
      TokenWithUser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TokenWithUser.fromJson(Map<String, dynamic> json) => TokenWithUser(
        accessToken: json["accessToken"],
        tokenType: json["tokenType"],
        expiresAt: DateTime.parse(json["expiresAt"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "tokenType": tokenType,
        "expiresAt": expiresAt.toIso8601String(),
        "user": user.toJson(),
      };
}

class User {
  User({
    this.id,
    this.patientName,
    this.gender,
    this.result,
    this.number,
    this.mysjId,
    this.email,
    this.passport,
    this.dateOfBirth,
    this.age,
    this.state,
    this.confirmationDate,
    this.doseOneDate,
    this.doseOneTime,
    this.doseOneManufacturer,
    this.doseOneBatch,
    this.doseTwoDate,
    this.doseTwoTime,
    this.doseTwoManufacturer,
    this.doseTwoBatch,
    this.doseOneFacility,
    this.doseTwoFacility,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String patientName;
  String gender;
  String result;
  String number;
  String mysjId;
  String email;
  String passport;
  DateTime dateOfBirth;
  String age;
  String state;
  DateTime confirmationDate;
  DateTime doseOneDate;
  String doseOneTime;
  String doseOneManufacturer;
  String doseOneBatch;
  DateTime doseTwoDate;
  String doseTwoTime;
  String doseTwoManufacturer;
  String doseTwoBatch;
  String doseOneFacility;
  String doseTwoFacility;
  String image;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        patientName: json["patient_name"],
        gender: json["gender"],
        result: json["result"],
        number: json["number"],
        mysjId: json["mysj_id"],
        email: json["email"],
        passport: json["passport"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        age: json["age"],
        state: json["state"],
        confirmationDate: DateTime.parse(json["confirmation_date"]),
        doseOneDate: DateTime.parse(json["dose_one_date"]),
        doseOneTime: json["dose_one_time"],
        doseOneManufacturer: json["dose_one_manufacturer"],
        doseOneBatch: json["dose_one_batch"],
        doseTwoDate: DateTime.parse(json["dose_two_date"]),
        doseTwoTime: json["dose_two_time"],
        doseTwoFacility: json["dose_two_faculty"],
        doseOneFacility: json["dose_one_faculty"],
        doseTwoManufacturer: json["dose_two_manufacturer"],
        doseTwoBatch: json["dose_two_batch"],
        image: json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "patient_name": patientName,
        "gender": gender,
        "result": result,
        "number": number,
        "mysj_id": mysjId,
        "email": email,
        "passport": passport,
        "date_of_birth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "age": age,
        "state": state,
        "confirmation_date":
            "${confirmationDate.year.toString().padLeft(4, '0')}-${confirmationDate.month.toString().padLeft(2, '0')}-${confirmationDate.day.toString().padLeft(2, '0')}",
        "dose_one_date":
            "${doseOneDate.year.toString().padLeft(4, '0')}-${doseOneDate.month.toString().padLeft(2, '0')}-${doseOneDate.day.toString().padLeft(2, '0')}",
        "dose_one_time": doseOneTime,
        "dose_one_manufacturer": doseOneManufacturer,
        "dose_one_batch": doseOneBatch,
        "dose_two_date":
            "${doseTwoDate.year.toString().padLeft(4, '0')}-${doseTwoDate.month.toString().padLeft(2, '0')}-${doseTwoDate.day.toString().padLeft(2, '0')}",
        "dose_two_time": doseTwoTime,
        "dose_two_manufacturer": doseTwoManufacturer,
        "dose_two_batch": doseTwoBatch,
        "dose_two_faculty": doseTwoFacility,
        "dose_one_faculty": doseOneFacility,
        "image": image,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
