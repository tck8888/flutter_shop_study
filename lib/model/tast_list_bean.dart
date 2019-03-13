import 'recommend_users.dart';

class TaskListBean {
  String categoryName;
  String content;
  String createTime;
  String endTime;
  String endTimeDetail;
  String imgUrl;
  String relationFactName;
  String shareId;
  String shareUrl;
  String title;
  int additionalMoney;
  int hospitalNumber;
  int id;
  int isend;
  int ishot;
  int isofflinePayment;
  int isqualification;
  int istop;
  int limitNumber;
  int money;
  int partInNumber;
  int points;
  int relationFactId;
  int relationType;
  int restNumber;
  int ruleId;
  int selectNumber;
  int sort;
  int surplusNumber;
  int taskCount;
  int taskQuestionnaireId;
  int type;
  bool answer;
  bool answerFull;
  bool finished;
  List<RecommendUsers> users;

  TaskListBean.fromJson(Map<String, dynamic> data) {
    categoryName = data['categoryName'];
    content = data['content'];
    createTime = data['createTime'];
    endTime = data['endTime'];
    endTimeDetail = data['endTimeDetail'];
    imgUrl = data['imgUrl'];
    relationFactName = data['relationFactName'];
    shareId = data['shareId'];
    shareUrl = data['shareUrl'];
    title = data['title'];
    additionalMoney = data['additionalMoney'];
    hospitalNumber = data['hospitalNumber'];
    id = data['id'];
    isend = data['isend'];
    ishot = data['ishot'];
    isofflinePayment = data['isofflinePayment'];
    isqualification = data['isqualification'];
    istop = data['istop'];
    limitNumber = data['limitNumber'];
    money = data['money'];
    partInNumber = data['partInNumber'];
    points = data['points'];
    relationFactId = data['relationFactId'];
    relationType = data['relationType'];
    restNumber = data['restNumber'];
    ruleId = data['ruleId'];
    selectNumber = data['selectNumber'];
    sort = data['sort'];
    surplusNumber = data['surplusNumber'];
    taskCount = data['taskCount'];
    taskQuestionnaireId = data['taskQuestionnaireId'];
    type = data['type'];
    answer = data['answer'];
    answerFull = data['answerFull'];
    finished = data['finished'];

    users = (data['users'] as List)
        .map((user) => RecommendUsers.fromJson(user))
        .toList();
  }
}
