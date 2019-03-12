class HomeBannerBean {
  String content;
  int id;
  String imgUrl;
  String module;
  int noticeType;
  String routingParameter;
  String routingType;
  int showTimes;
  String url;

  HomeBannerBean.fromJson(Map<String, dynamic> data) {
    content = data['content'];
    id = data['id'];
    imgUrl = data['imgUrl'];
    module = data['module'];
    noticeType = data['noticeType'];
    routingParameter = data['routingParameter'];
    routingType = data['routingType'];
    showTimes = data['showTimes'];
    url = data['url'];
  }
}
