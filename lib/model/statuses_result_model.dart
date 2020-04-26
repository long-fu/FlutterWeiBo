import 'package:json_annotation/json_annotation.dart'; // JSON 数据模型 序列化
import 'package:weibo/model/status_model.dart';

part 'statuses_result_model.g.dart';

@JsonSerializable(explicitToJson: true)
class StatusesResult {

  List<Status> statuses;
  int total_number;

  StatusesResult(this.statuses, this.total_number);

  factory StatusesResult.fromJson(Map<String, dynamic> json) =>
      _$StatusesResultFromJson(json);

  Map<String, dynamic> toJson() => _$StatusesResultToJson(this);
}
