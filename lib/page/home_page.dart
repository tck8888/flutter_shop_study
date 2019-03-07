import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController typeController = TextEditingController();

  String showText = "欢迎";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("ceshi "),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: typeController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      labelText: "类型",
                      helperText: "请输入类型"),
                  autofocus: false,
                ),
                RaisedButton(
                  onPressed: () {
                    _choice();
                  },
                  child: Text("选择"),
                ),
                Text(
                  showText,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _choice() {
    print("开始");
    if (typeController.text.toString() == '') {
      showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(
                title: Text("类型不能为空"),
              ));
    } else {
      getHttp(typeController.text.toString()).then((val) {
        setState(() {
          showText = val['data']['name'].toString();
        });
      });
    }
  }

  Future getHttp(String text) async {
    try {
      Response response;
      var data = {'name': text};
      response = await new Dio().get("https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian", queryParameters: data);
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
}
