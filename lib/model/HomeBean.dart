import 'HomeBannerBean.dart';
import 'dart:convert';

class HomeBean {
  List<HomeBannerBean> broadcastList;

  HomeBean.fromJson(jsonStr) {
    var data = json.decode(jsonStr);
    for (var dataItem in data['data']['broadcastList']) {
      broadcastList.add(HomeBannerBean.fromJson(dataItem));
    }
  }
}
