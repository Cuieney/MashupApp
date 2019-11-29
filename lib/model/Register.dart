import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Register{
  String email;
  String phone;
  String password;
  Register({this.email,this.phone,this.password});
}