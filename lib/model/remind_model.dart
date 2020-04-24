// 返回值字段	字段类型	字段说明
// status	int	新微博未读数
// follower	int	新粉丝数
// cmt	int	新评论数
// dm	int	新私信数
// mention_status	int	新提及我的微博数
// mention_cmt	int	新提及我的评论数
// group	int	微群消息未读数
// private_group	int	私有微群消息未读数
// notice	int	新通知未读数
// invite	int	新邀请未读数
// badge	int	新勋章数
// photo	int	相册消息未读数
// msgbox	int	{{{3}}}

import 'package:json_annotation/json_annotation.dart'; // JSON 数据模型 序列化

part 'remind_model.g.dart';

@JsonSerializable()
class Remind {
  int status;
  int follower;
  int cmt;
  int dm;
  int mention_status;
  int mention_cmt;
  int group;
  int private_group;
  int notice;
  int invite;
  int badge;
  int photo;
  int msgbox;
  Remind(
      this.status,
      this.follower,
      this.cmt,
      this.dm,
      this.mention_status,
      this.mention_cmt,
      this.group,
      this.private_group,
      this.notice,
      this.invite,
      this.badge,
      this.photo,
      this.msgbox);
  factory Remind.fromJson(Map<String, dynamic> json) => _$RemindFromJson(json);
  Map<String, dynamic> toJson() => _$RemindToJson(this);
}
