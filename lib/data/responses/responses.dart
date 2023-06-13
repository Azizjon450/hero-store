import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class CustomerResponce {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "numofNotifications")
  int? numofNotifications;

  CustomerResponce(this.id, this.name, this.numofNotifications);

  //form json
  factory CustomerResponce.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponceFromJson(json);

//to json
  Map<String, dynamic> toJson() => _$CustomerResponceToJson(this);
}

@JsonSerializable()
class ContactsResponce {
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "link")
  String? link;

  ContactsResponce(this.email, this.phone, this.link);

  //form json
  factory ContactsResponce.fromJson(Map<String, dynamic> json) =>
      _$ContactsResponceFromJson(json);

//to json
  Map<String, dynamic> toJson() => _$ContactsResponceToJson(this);
}

@JsonSerializable()
class AuthenticationResponce extends BaseResponse {
  @JsonKey(name: "customer")
  CustomerResponce? customer;
  @JsonKey(name: "contacts")
  ContactsResponce? contacts;

  AuthenticationResponce(this.customer, this.contacts);

//form json
  factory AuthenticationResponce.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponceFromJson(json);

//to json
  Map<String, dynamic> toJson() => _$AuthenticationResponceToJson(this);
}
