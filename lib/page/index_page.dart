import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/page/tool_page.dart';
import 'package:flutter_shop/page/home_page.dart';
import 'package:flutter_shop/page/message_page.dart';
import 'package:flutter_shop/page/site_page.dart';
import 'package:flutter_shop/page/mine_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home),
        title: Text("首页",style: TextStyle(color: Color(0xff333740)),)
    ), BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search),
        title: Text("工具")
    ), BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart),
        title: Text("中心")
    ), BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled),
        title: Text("消息")
    )
    , BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled),
        title: Text("我的")
    )
  ];

  final List<Widget> tabBodies = [
    HomePage(),
    ToolPage(),
    SitePage(),
    MessagePage(),
    MinPage(),
  ];

  var currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    currentPage = tabBodies[currentIndex];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: bottomTabs,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });
        },
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed, fixedColor:Color(0xff2cc17b),),
      body: IndexedStack(
        index: currentIndex,
        children: tabBodies,
      ),
    );
  }
}
