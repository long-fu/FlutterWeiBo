// privacy
// comment	int	是否可以评论我的微博，0：所有人、1：关注的人、2：可信用户
// geo	int	是否开启地理信息，0：不开启、1：开启
// message	int	是否可以给我发私信，0：所有人、1：我关注的人、2：可信用户
// realname	int	是否可以通过真名搜索到我，0：不可以、1：可以
// badge	int	勋章是否可见，0：不可见、1：可见
// mobile	int	是否可以通过手机号码搜索到我，0：不可以、1：可以
// webim	int	是否开启webim， 0：不开启、1：开启

import 'package:json_annotation/json_annotation.dart'; // JSON 数据模型 序列化

part 'privacy_model.g.dart';

@JsonSerializable()
class Privacy {
  int comment;
  int geo;
  int message;
  int realname;
  int badge;
  int mobile;
  int webim;
  Privacy(this.comment, this.geo, this.message, this.realname, this.badge,
      this.mobile, this.webim);
  factory Privacy.fromJson(Map<String, dynamic> json) =>
      _$PrivacyFromJson(json);
  Map<String, dynamic> toJson() => _$PrivacyToJson(this);
}
