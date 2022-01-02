import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_store_app/pages/Detailpage.dart';
import 'package:mobile_store_app/pages/Mobiletab.dart';
import 'package:mobile_store_app/pages/Detailpage.dart';
import 'package:mobile_store_app/pages/Mobiletab.dart';

class Home extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController( length: 4, vsync: this);
  }

  Widget customBox(
      var text, var price, var textColor, var backgroundColor, var img) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(text, price, img)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          color: Color(backgroundColor),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Container(
            height: 220,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircleAvatar(
                  radius: 38.0,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Image(
                      image: AssetImage(img),
                    ),
                  ),
                ),
                Text(
                  "$text\n$price",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color(textColor),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            
            SizedBox(
              height: 22.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "SEARCH FOR",
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "MOBILES",
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            SizedBox(
              height: 22.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 52.0,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                      hintStyle: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 26.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Trending",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.75,
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  customBox("Galaxy S12", "₹ 55552", 0xffDE9B4F, 0xffFFEAC5,
                      "lib/images/samsung.jpg"),
                  customBox("Realme 14", "₹ 24448", 0xff698CAC, 0xffC3E3FF,
                      "lib/images/samsung.jpg"),
                  customBox("Oneplus 9 pro", "₹ 91117", 0xff51CF79, 0xffD7FBD9,
                      "lib/images/samsung.jpg"),
                  customBox("Redmi note 9 ", "₹ 19999", 0xffffa194, 0xffFFE4E0,
                      "lib/images/samsung.jpg"),
                ],
              ),
            ),
            SizedBox(
              height: 22.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBar(
                controller: tabController,
                isScrollable: true,
                indicatorColor: Colors.transparent,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.0,
                ),
                tabs: <Widget>[
                  Tab(child: Text("SAMSUNG")),
                  Tab(child: Text("XIOAMI")),
                  Tab(child: Text("VIVO")),
                  Tab(child: Text("REALME")),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 450,
              child: TabBarView(
                controller: tabController,
                children: <Widget>[
                  Mobiletab(),
                  Mobiletab(),
                  Mobiletab(),
                  Mobiletab(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
