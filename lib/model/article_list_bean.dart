class ArticleListBean {
  int commentCount;
  int id;
  int likeCount;
  String title;

  ArticleListBean.fromJson(Map<String, dynamic> data) {
    commentCount = data['commentCount'];
    id = data['id'];
    likeCount = data['likeCount'];
    title = data['title'];
  }
}
