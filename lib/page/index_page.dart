import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/page/category_page.dart';
import 'package:flutter_shop/page/home_page.dart';
import 'package:flutter_shop/page/member_page.dart';
import 'package:flutter_shop/page/shop_cart_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home),
        title: Text("首页")
    ), BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search),
        title: Text("分类")
    ), BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart),
        title: Text("购物车")
    ), BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled),
        title: Text("会员")
    )
  ];

  final List tabBodies = [
    HomePage(),
    CategoryPage(),
    ShopCartPage(),
    MemberPage(),
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
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: bottomTabs,
        onTap: (index) {
          setState(() {
          currentIndex = index;
          currentPage = tabBodies[currentIndex];
          });
        },
        currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,),
      body: currentPage,
    );
  }
}
