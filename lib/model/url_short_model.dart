// url_short	string	短链接
// url_long	string	原始长链接
// type	int	链接的类型，0：普通网页、1：视频、2：音乐、3：活动、5、投票
// result	boolean	短链的可用状态，true：可用、false：不可用。

import 'package:json_annotation/json_annotation.dart'; // JSON 数据模型 序列化

part 'url_short_model.g.dart';

@JsonSerializable()
class UrlShort {
  String url_short;
  String url_long;
  int type;
  bool result;
  UrlShort(this.url_short, this.url_long, this.type, this.result);
  factory UrlShort.fromJson(Map<String, dynamic> json) =>
      _$UrlShortFromJson(json);
  Map<String, dynamic> toJson() => _$UrlShortToJson(this);
}
