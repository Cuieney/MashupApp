import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class DiscoverModel {
  String title;
  int id;
  String image_url;

  DiscoverModel({this.title, this.id, this.image_url});

}
