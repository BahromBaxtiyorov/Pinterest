import 'package:flutter/material.dart';
import 'package:pinterest_project/pages/add_page.dart';
import 'package:pinterest_project/pages/comment_page.dart';
import 'package:pinterest_project/pages/home_page.dart';
import 'package:pinterest_project/pages/home_page.dart';
import 'package:pinterest_project/pages/home_page_view.dart';
import 'package:pinterest_project/pages/profil_page.dart';
import 'package:pinterest_project/pages/search_page.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  var _pages = [
    HomePageView(),
    SearchPage(),
    AddPage(),
    CommentPage(),
    ProfilPage(),
  ];
  int currentPage =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (i){
          setState(() {
            currentPage = i;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor:  Colors.grey.shade500,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined),label: "Add"),
          BottomNavigationBarItem(icon: Icon(Icons.comment),label: "Comment"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Person"),
        ],
      ),
    );
  }
}