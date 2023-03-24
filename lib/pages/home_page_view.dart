import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinterest_project/pages/yellow_rush_page.dart';

import 'home_page.dart';
import 'luxury_page.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> with SingleTickerProviderStateMixin  {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelStyle: TextStyle(fontSize: 18, color: Colors.blue),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            controller: _tabController,
            isScrollable: true,
            tabs: [
              Tab(text: "Home Page",),
              Tab(text: "Yellow Rush Page",),
              Tab(text: "Luxury Page",),
            ],),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            HomePage(),
            YellowRush(),
            LuxuryPage(),
          ],
        )
    );
  }
}

