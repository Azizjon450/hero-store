// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..status = json['status'] as int?
  ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

CustomerResponce _$CustomerResponceFromJson(Map<String, dynamic> json) =>
    CustomerResponce(
      json['id'] as String?,
      json['name'] as String?,
      json['numofNotifications'] as int?,
    );

Map<String, dynamic> _$CustomerResponceToJson(CustomerResponce instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'numofNotifications': instance.numofNotifications,
    };

ContactsResponce _$ContactsResponceFromJson(Map<String, dynamic> json) =>
    ContactsResponce(
      json['email'] as String?,
      json['phone'] as String?,
      json['link'] as String?,
    );

Map<String, dynamic> _$ContactsResponceToJson(ContactsResponce instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
      'link': instance.link,
    };

AuthenticationResponce _$AuthenticationResponceFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponce(
      json['customer'] == null
          ? null
          : CustomerResponce.fromJson(json['customer'] as Map<String, dynamic>),
      json['contacts'] == null
          ? null
          : ContactsResponce.fromJson(json['contacts'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AuthenticationResponceToJson(
        AuthenticationResponce instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'customer': instance.customer,
      'contacts': instance.contacts,
    };
