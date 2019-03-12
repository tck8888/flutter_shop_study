import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter_shop/config/service_url.dart';

//获取首页数据

Future getHomePageContent() async {
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.headers = {'accessToken': '1E09C957630248E7890528BBDB61FE81'};
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");

    var formData = {''};

    response = await dio.get(servicePath['homPageContent']);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('服务器异常');
    }
  } catch (e) {
    return print('ERROR:=================>${e}');
  }
}
