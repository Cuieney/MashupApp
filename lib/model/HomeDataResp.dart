
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class HomeDataResp{
  String url;
  String headUrl;
  String userName;
  String time;
  String title;
  String from;
  String desc;
  int like;
  int comment;
  int repost;
  int collect;
  List<String> imgs;

  HomeDataResp({this.url, this.headUrl, this.userName, this.time, this.title,
    this.from, this.desc, this.like, this.comment, this.repost, this.collect,this.imgs});



  factory HomeDataResp.homeDataRespFromJson(Map<String, dynamic> json) {
    return HomeDataResp(
        url: json['url'] as String,
        headUrl: json['headUrl'] as String,
        userName: json['userName'] as String,
        time: json['time'] as String,
        title: json['title'] as String,
        from: json['from'] as String,
        desc: json['desc'] as String,
        like: json['like'] as int,
        comment: json['comment'] as int,
        repost: json['repost'] as int,
        collect: json['collect'] as int);
  }

  Map<String, dynamic> _$HomeDataRespToJson(HomeDataResp instance) =>
      <String, dynamic>{
        'url': instance.url,
        'headUrl': instance.headUrl,
        'userName': instance.userName,
        'time': instance.time,
        'title': instance.title,
        'from': instance.from,
        'desc': instance.desc,
        'like': instance.like,
        'comment': instance.comment,
        'repost': instance.repost,
        'collect': instance.collect
      };

}
