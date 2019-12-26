class UserInfo {
  String head_img;
  String user_name;
  String user_signature;

  UserInfo({this.head_img, this.user_name, this.user_signature});

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      head_img: json['head_img'],
      user_name: json['user_name'],
      user_signature: json['user_signature'],
    );
  }

  static Map<String, dynamic> userInfo2Json(UserInfo userInfo) =>
      <String, dynamic>{
        'head_img': userInfo.head_img,
        'user_name': userInfo.user_name,
        'user_signature': userInfo.user_signature,
      };
}
