import 'package:json_annotation/json_annotation.dart';

part 'users.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String name;
  final String email;
  final String phone;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
