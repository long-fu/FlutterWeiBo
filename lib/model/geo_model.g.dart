// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Geo _$GeoFromJson(Map<String, dynamic> json) {
  return Geo(
    json['longitude'] as String,
    json['latitude'] as String,
    json['city'] as String,
    json['province'] as String,
    json['city_name'] as String,
    json['province_name'] as String,
    json['address'] as String,
    json['pinyin'] as String,
    json['more'] as String,
  );
}

Map<String, dynamic> _$GeoToJson(Geo instance) => <String, dynamic>{
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'city': instance.city,
      'province': instance.province,
      'city_name': instance.city_name,
      'province_name': instance.province_name,
      'address': instance.address,
      'pinyin': instance.pinyin,
      'more': instance.more,
    };
