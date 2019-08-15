// GENERATED CODE - DO NOT MODIFY BY HAND


// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


import '../HomePage.dart';

HomeDataResp _$HomeDataRespFromJson(Map<String, dynamic> json) {
  return HomeDataResp(
      url: json['url'] as String,
      headUrl: json['headUrl'] as String,
      userName: json['userName'] as String,
      time: json['time'] as String,
      title: json['title'] as String,
      from: json['from'] as String,
      desc: json['desc'] as String,
      like: json['like'] as int,
      commit: json['commit'] as int,
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
      'commit': instance.commit,
      'repost': instance.repost,
      'collect': instance.collect
    };
