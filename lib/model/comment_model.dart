// comment
// created_at	string	评论创建时间
// id	int64	评论的ID
// text	string	评论的内容
// source	string	评论的来源
// user	object	评论作者的用户信息字段 详细
// mid	string	评论的MID
// idstr	string	字符串型的评论ID
// status	object	评论的微博信息字段 详细

// - 赞为实现
// reply_comment	object	评论来源评论，当本评论属于对另一评论的回复时返回此字段

import 'package:json_annotation/json_annotation.dart'; // JSON 数据模型 序列化
import 'package:weibo/model/status_model.dart';
import 'package:weibo/model/user_model.dart';
import 'dart:ffi';

part 'comment_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Comment {
  String created_at;
  int id;
  String text;
  String source;
  User user;
  String mid;
  String idstr;
  Status status;
  Comment(this.created_at, this.id, this.text, this.source, this.user,
      this.mid, this.idstr, this.status);
  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
