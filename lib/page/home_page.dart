import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';

import 'package:flutter_shop/model/HomeBean.dart';
import 'package:flutter_shop/model/HomeBannerBean.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("首页"),
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
          print(json.decode(snapshot.data))  ;
             // List<Map> list = json.decode(data);

              return Column(
                children: <Widget>[
                 // Banner(banners: banners),
                ],
              );
            } else {
              return Center(
                child: Text("加载中"),
              );
            }
          },
          future: getHomePageContent(),
        ));
  }
}

class Banner extends StatelessWidget {
  final List<HomeBannerBean> banners;

  Banner({Key key, this.banners}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 333,
      child: Swiper(
        itemCount: banners.length,
        pagination: SwiperPagination(),
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            banners[index].imgUrl,
            fit: BoxFit.fill,
          );
        },
      ),
    );
  }
}
