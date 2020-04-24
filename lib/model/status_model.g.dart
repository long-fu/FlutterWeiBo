// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Status _$StatusFromJson(Map<String, dynamic> json) {
  return Status(
    json['created_at'] as String,
    json['id'] as int,
    json['mid'] as int,
    json['idstr'] as String,
    json['text'] as String,
    json['source'] as String,
    json['favorited'] as bool,
    json['truncated'] as bool,
    json['in_reply_to_status_id'] as String,
    json['in_reply_to_user_id'] as String,
    json['in_reply_to_screen_name'] as String,
    json['thumbnail_pic'] as String,
    json['bmiddle_pic'] as String,
    json['original_pic'] as String,
    json['reposts_count'] as int,
    json['comments_count'] as int,
    json['attitudes_count'] as int,
    json['mlevel'] as int,
    json['geo'] == null
        ? null
        : Geo.fromJson(json['geo'] as Map<String, dynamic>),
    json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    json['retweeted_status'] == null
        ? null
        : Status.fromJson(json['retweeted_status'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'created_at': instance.created_at,
      'id': instance.id,
      'mid': instance.mid,
      'idstr': instance.idstr,
      'text': instance.text,
      'source': instance.source,
      'favorited': instance.favorited,
      'truncated': instance.truncated,
      'in_reply_to_status_id': instance.in_reply_to_status_id,
      'in_reply_to_user_id': instance.in_reply_to_user_id,
      'in_reply_to_screen_name': instance.in_reply_to_screen_name,
      'thumbnail_pic': instance.thumbnail_pic,
      'bmiddle_pic': instance.bmiddle_pic,
      'original_pic': instance.original_pic,
      'reposts_count': instance.reposts_count,
      'comments_count': instance.comments_count,
      'attitudes_count': instance.attitudes_count,
      'mlevel': instance.mlevel,
      'geo': instance.geo?.toJson(),
      'user': instance.user?.toJson(),
      'retweeted_status': instance.retweeted_status?.toJson(),
    };
