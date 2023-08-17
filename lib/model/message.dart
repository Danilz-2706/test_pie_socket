import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';
@JsonSerializable(nullable:true)
class Message {
  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'time')
  final String? time;

  @JsonKey(name: 'sender')
  final bool? sender;

  Message({this.message, this.time, this.sender});

  Map<String, dynamic> toJson() => _$MessageToJson(this);

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
