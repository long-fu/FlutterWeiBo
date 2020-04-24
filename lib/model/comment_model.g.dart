// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(
    json['created_at'] as String,
    json['id'] as int,
    json['text'] as String,
    json['source'] as String,
    json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    json['mid'] as String,
    json['idstr'] as String,
    json['status'] == null
        ? null
        : Status.fromJson(json['status'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'created_at': instance.created_at,
      'id': instance.id,
      'text': instance.text,
      'source': instance.source,
      'user': instance.user?.toJson(),
      'mid': instance.mid,
      'idstr': instance.idstr,
      'status': instance.status?.toJson(),
    };
