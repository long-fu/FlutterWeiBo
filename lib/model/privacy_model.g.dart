// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Privacy _$PrivacyFromJson(Map<String, dynamic> json) {
  return Privacy(
    json['comment'] as int,
    json['geo'] as int,
    json['message'] as int,
    json['realname'] as int,
    json['badge'] as int,
    json['mobile'] as int,
    json['webim'] as int,
  );
}

Map<String, dynamic> _$PrivacyToJson(Privacy instance) => <String, dynamic>{
      'comment': instance.comment,
      'geo': instance.geo,
      'message': instance.message,
      'realname': instance.realname,
      'badge': instance.badge,
      'mobile': instance.mobile,
      'webim': instance.webim,
    };
