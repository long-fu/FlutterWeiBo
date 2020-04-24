// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as int,
    json['idstr'] as String,
    json['screen_name'] as String,
    json['name'] as String,
    json['province'] as int,
    json['city'] as int,
    json['location'] as String,
    json['description'] as String,
    json['url'] as String,
    json['profile_image_url'] as String,
    json['profile_url'] as String,
    json['domain'] as String,
    json['weihao'] as String,
    json['gender'] as String,
    json['followers_count'] as int,
    json['friends_count'] as int,
    json['statuses_count'] as int,
    json['favourites_count'] as int,
    json['created_at'] as String,
    json['following'] as bool,
    json['allow_all_act_msg'] as bool,
    json['geo_enabled'] as bool,
    json['verified'] as bool,
    json['verified_type'] as int,
    json['remark'] as String,
    json['allow_all_comment'] as bool,
    json['avatar_large'] as String,
    json['avatar_hd'] as String,
    json['verified_reason'] as String,
    json['follow_me'] as bool,
    json['online_status'] as int,
    json['bi_followers_count'] as int,
    json['lang'] as String,
    json['status'] == null
        ? null
        : Status.fromJson(json['status'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'idstr': instance.idstr,
      'screen_name': instance.screen_name,
      'name': instance.name,
      'province': instance.province,
      'city': instance.city,
      'location': instance.location,
      'description': instance.description,
      'url': instance.url,
      'profile_image_url': instance.profile_image_url,
      'profile_url': instance.profile_url,
      'domain': instance.domain,
      'weihao': instance.weihao,
      'gender': instance.gender,
      'followers_count': instance.followers_count,
      'friends_count': instance.friends_count,
      'statuses_count': instance.statuses_count,
      'favourites_count': instance.favourites_count,
      'created_at': instance.created_at,
      'following': instance.following,
      'allow_all_act_msg': instance.allow_all_act_msg,
      'geo_enabled': instance.geo_enabled,
      'verified': instance.verified,
      'verified_type': instance.verified_type,
      'remark': instance.remark,
      'allow_all_comment': instance.allow_all_comment,
      'avatar_large': instance.avatar_large,
      'avatar_hd': instance.avatar_hd,
      'verified_reason': instance.verified_reason,
      'follow_me': instance.follow_me,
      'online_status': instance.online_status,
      'bi_followers_count': instance.bi_followers_count,
      'lang': instance.lang,
      'status': instance.status?.toJson(),
    };
