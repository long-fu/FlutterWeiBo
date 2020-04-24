// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url_short_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UrlShort _$UrlShortFromJson(Map<String, dynamic> json) {
  return UrlShort(
    json['url_short'] as String,
    json['url_long'] as String,
    json['type'] as int,
    json['result'] as bool,
  );
}

Map<String, dynamic> _$UrlShortToJson(UrlShort instance) => <String, dynamic>{
      'url_short': instance.url_short,
      'url_long': instance.url_long,
      'type': instance.type,
      'result': instance.result,
    };
