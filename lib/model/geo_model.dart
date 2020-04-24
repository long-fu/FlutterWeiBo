// longitude	string	经度坐标
// latitude	string	维度坐标
// city	string	所在城市的城市代码
// province	string	所在省份的省份代码
// city_name	string	所在城市的城市名称
// province_name	string	所在省份的省份名称
// address	string	所在的实际地址，可以为空
// pinyin	string	地址的汉语拼音，不是所有情况都会返回该字段
// more	string	更多信息，不是所有情况都会返回该字段

import 'package:json_annotation/json_annotation.dart'; // JSON 数据模型 序列化

part 'geo_model.g.dart';

@JsonSerializable()
class Geo {
  String longitude;
  String latitude;
  String city;
  String province;
  String city_name;
  String province_name;
  String address;
  String pinyin;
  String more;
  Geo(this.longitude, this.latitude, this.city, this.province, this.city_name,
      this.province_name, this.address, this.pinyin, this.more);
  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);
  Map<String, dynamic> toJson() => _$GeoToJson(this);
}
