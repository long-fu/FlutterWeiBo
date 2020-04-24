// status
// created_at	string	微博创建时间
// id	int64	微博ID
// mid	int64	微博MID
// idstr	string	字符串型的微博ID
// text	string	微博信息内容
// source	string	微博来源
// favorited	boolean	是否已收藏，true：是，false：否
// truncated	boolean	是否被截断，true：是，false：否
// in_reply_to_status_id	string	（暂未支持）回复ID
// in_reply_to_user_id	string	（暂未支持）回复人UID
// in_reply_to_screen_name	string	（暂未支持）回复人昵称
// thumbnail_pic	string	缩略图片地址，没有时不返回此字段
// bmiddle_pic	string	中等尺寸图片地址，没有时不返回此字段
// original_pic	string	原始图片地址，没有时不返回此字段
// geo	object	地理信息字段 详细
// user	object	微博作者的用户信息字段 详细
// retweeted_status	object	被转发的原微博信息字段，当该微博为转发微博时返回 详细
// reposts_count	int	转发数
// comments_count	int	评论数
// attitudes_count	int	表态数
// mlevel	int	暂未支持
// visible	object	微博的可见性及指定可见分组信息。该object中type取值，0：普通微博，1：私密微博，3：指定分组微博，4：密友微博；list_id为分组的组号
// pic_ids	object	微博配图ID。多图时返回多图ID，用来拼接图片url。用返回字段thumbnail_pic的地址配上该返回字段的图片ID，即可得到多个图片url。
// ad	object array	微博流内的推广微博ID

// -- 一下为实现
// ad	object array	微博流内的推广微博ID
// visible	object	微博的可见性及指定可见分组信息。该object中type取值，0：普通微博，1：私密微博，3：指定分组微博，4：密友微博；list_id为分组的组号
// pic_ids	object	微博配图ID。多图时返回多图ID，用来拼接图片url。用返回字段thumbnail_pic的地址配上该返回字段的图片ID，即可得到多个图片url。

import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart'; // JSON 数据模型 序列化
import 'package:weibo/model/geo_model.dart';
import 'package:weibo/model/user_model.dart';

part 'status_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Status {
  String created_at;
  int id;
  int mid;
  String idstr;
  String text;
  String source;
  bool favorited;
  bool truncated;
  String in_reply_to_status_id;
  String in_reply_to_user_id;
  String in_reply_to_screen_name;
  String thumbnail_pic;
  String bmiddle_pic;
  String original_pic;
  int reposts_count;
  int comments_count;
  int attitudes_count;
  int mlevel;
  Geo geo;
  User user;
  Status retweeted_status;

  Status(
      this.created_at,
      this.id,
      this.mid,
      this.idstr,
      this.text,
      this.source,
      this.favorited,
      this.truncated,
      this.in_reply_to_status_id,
      this.in_reply_to_user_id,
      this.in_reply_to_screen_name,
      this.thumbnail_pic,
      this.bmiddle_pic,
      this.original_pic,
      this.reposts_count,
      this.comments_count,
      this.attitudes_count,
      this.mlevel,
      this.geo,
      this.user,
      this.retweeted_status);

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
  Map<String, dynamic> toJson() => _$StatusToJson(this);
}
