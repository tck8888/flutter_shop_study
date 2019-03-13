import 'HomeBannerBean.dart';
import 'article_list_bean.dart';
import 'home_activity_list_bean.dart';
import 'tast_list_bean.dart';
import 'home_module_list_bean.dart';

class HomeBean {
  List<HomeBannerBean> broadcastList;
  List<ArticleListBean> articleList;
  List<HomeActivityListBean> activityList;
  List<TaskListBean> taskList;
  List<HomeModuleListBean> moduleList;

  HomeBean.fromJson(Map<String, dynamic> data) {
    broadcastList = (data['broadcastList'] as List)
        .map((i) => HomeBannerBean.fromJson(i))
        .toList();
    articleList = (data['articleList'] as List)
        .map((i) => ArticleListBean.fromJson(i))
        .toList();
    activityList = (data['activityList'] as List)
        .map((i) => HomeActivityListBean.fromJson(i))
        .toList();
    moduleList = (data['moduleList'] as List)
        .map((i) => HomeModuleListBean.fromJson(i))
        .toList();
    taskList = (data['taskList'] as List)
        .map((i) => TaskListBean.fromJson(i))
        .toList();
  }
}
