import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_shop/model/HomeBean.dart';
import 'package:flutter_shop/model/HomeBannerBean.dart';
import 'package:flutter_shop/model/home_module_list_bean.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          HomeBean homeBean = HomeBean.fromJson(snapshot.data);
          return Column(
            children: <Widget>[
              Banner(banners: homeBean.broadcastList),
              HomeModule(
                moduleList: homeBean.moduleList,
              )
            ],
          );
        } else {
          return Center(
            child: Text(
              "加载中",
              style: TextStyle(color: Color(0xff333740)),
            ),
          );
        }
      },
      future: getHomePageContent(),
    ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class Banner extends StatelessWidget {
  final List<HomeBannerBean> banners;

  Banner({Key key, this.banners}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(320),
      width: ScreenUtil().setHeight(690),
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

class HomeModule extends StatelessWidget {
  final List<HomeModuleListBean> moduleList;

  HomeModule({Key key, this.moduleList}) : super(key: key);

  Widget _gridViewItem(BuildContext context, HomeModuleListBean item) {
    return InkWell(
      onTap: () {
        print("点击了导航");
      },
      child: Column(
        children: <Widget>[
          Image.network(
            item.imgUrl,
            width: ScreenUtil().setWidth(96),
            height: ScreenUtil().setHeight(96),
          ),
          Text(item.title,
              style: TextStyle(
                  color: Color(0xff333740),
                  fontSize: ScreenUtil().setSp(26)))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(220),
      padding: EdgeInsets.only(
          left: ScreenUtil().setHeight(30), right: ScreenUtil().setHeight(30)),
      child: GridView.count(
        crossAxisCount: 4,
        children: moduleList.map((item) {
          return _gridViewItem(context, item);
        }).toList(),
      ),
    );
  }
}
