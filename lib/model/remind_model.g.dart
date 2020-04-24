// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remind_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Remind _$RemindFromJson(Map<String, dynamic> json) {
  return Remind(
    json['status'] as int,
    json['follower'] as int,
    json['cmt'] as int,
    json['dm'] as int,
    json['mention_status'] as int,
    json['mention_cmt'] as int,
    json['group'] as int,
    json['private_group'] as int,
    json['notice'] as int,
    json['invite'] as int,
    json['badge'] as int,
    json['photo'] as int,
    json['msgbox'] as int,
  );
}

Map<String, dynamic> _$RemindToJson(Remind instance) => <String, dynamic>{
      'status': instance.status,
      'follower': instance.follower,
      'cmt': instance.cmt,
      'dm': instance.dm,
      'mention_status': instance.mention_status,
      'mention_cmt': instance.mention_cmt,
      'group': instance.group,
      'private_group': instance.private_group,
      'notice': instance.notice,
      'invite': instance.invite,
      'badge': instance.badge,
      'photo': instance.photo,
      'msgbox': instance.msgbox,
    };
