// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessToken _$AccessTokenFromJson(Map<String, dynamic> json) {
  return AccessToken(
    json['access_token'] as String,
    json['remind_in'] as String,
    json['expires_in'] as String,
    json['uid'] as String,
    json['isRealName'] as String,
  );
}

Map<String, dynamic> _$AccessTokenToJson(AccessToken instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'remind_in': instance.remind_in,
      'expires_in': instance.expires_in,
      'uid': instance.uid,
      'isRealName': instance.isRealName,
    };
