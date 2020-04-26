import 'package:json_annotation/json_annotation.dart'; // JSON 数据模型 序列化

// Token
//{"access_token":"2.00uTREvDCtU4UCa619e61046pWUUWB","remind_in":"157679999","expires_in":157679999,"uid":"3591670162","isRealName":"true"}

part 'access_token_model.g.dart';

@JsonSerializable()
class AccessToken {
  String access_token;
  String remind_in;
  int expires_in;
  String uid;
  String isRealName;
  AccessToken(this.access_token,this.remind_in,this.expires_in,this.uid,this.isRealName);
  factory AccessToken.fromJson(Map<String, dynamic> json) => _$AccessTokenFromJson(json);
  Map<String, dynamic> toJson() => _$AccessTokenToJson(this);
}