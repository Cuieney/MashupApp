

class DiscoverDataResp{
  String type;
  List<DiscoverItem> list;
  String url;
  DiscoverDataResp({this.type,this.list});

}

class DiscoverItem{
  String url;
  String desc;
  DiscoverItem({this.url,this.desc});
}