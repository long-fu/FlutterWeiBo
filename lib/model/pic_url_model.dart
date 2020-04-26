import 'package:json_annotation/json_annotation.dart'; // JSON 数据模型 序列化

part 'pic_url_model.g.dart';

enum EnumPicUrl {
  thumbnail_pic,
  bmiddle_pic,
  original_pic
}

@JsonSerializable()
class PicUrl {
  String thumbnail_pic;
  PicUrl(this.thumbnail_pic);
  factory PicUrl.fromJson(Map<String, dynamic> json) => _$PicUrlFromJson(json);
  Map<String, dynamic> toJson() => _$PicUrlToJson(this);
}