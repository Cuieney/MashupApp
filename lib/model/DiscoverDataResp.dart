
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class DiscoverDataResp{
  String type;
  List<DiscoverItem> list;
  DiscoverDataResp({this.type,this.list});

}

@JsonSerializable()
class DiscoverItem{
  String url;
  String desc;
  DiscoverItem({this.url,this.desc});
}