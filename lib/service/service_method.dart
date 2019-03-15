import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter_shop/model/HomeBean.dart';


import 'package:flutter_shop/config/service_url.dart';

//获取首页数据

Future getHomePageContent() async {
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.headers = {
      'accessToken': '1D0AECC2983F4E01AD9995BD97B09374'
    }; //
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");

    var formData = {''};

    response = await dio.get(servicePath['homPageContent']);

    if (response.statusCode == 200) {
      var data = response.data;
      print(data['errorMessage']);
      print(data['subMessage']);
      if (data['status'] == 0 && data['data'] != null) {
        return data['data'];
      } else {
        print('ERROR:接口请求错误===============>${data['subMessage']}');
      }
    } else {
      throw Exception('服务器异常');
    }
  } catch (e) {
    return print('ERROR:===============>${e}');
  }
}
