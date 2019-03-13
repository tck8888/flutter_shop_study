class HomeModuleListBean {
  int id;
  int sort;
  int type;
  String imgUrl;
  String routingParameter;
  String routingType;
  String routingUrl;
  String title;

  HomeModuleListBean.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    sort = data['sort'];
    type = data['type'];
    imgUrl = data['imgUrl'];
    routingParameter = data['routingParameter'];
    routingType = data['routingType'];
    routingUrl = data['routingUrl'];
    title = data['title'];
  }
}
