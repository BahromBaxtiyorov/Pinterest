import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../items/yellow_rush_item.dart';
import '../models/yellow_rush_model.dart';
import '../service/photo_service.dart';
import '../service/yellow_rush_service.dart';
import 'details/image_detail_page.dart';
import 'details/yellow_rush_detail.dart';

class YellowRush extends StatefulWidget {
  const YellowRush({Key? key}) : super(key: key);

  @override
  State<YellowRush> createState() => _HomePageState();
}

class _HomePageState extends State<YellowRush> {

  final ScrollController _scrollController = ScrollController();
  List<YellowRushModel> photoList = [];
  int _currentPage = 1;

  @override
  void initState() {

    super.initState();
    _loadMoreData();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MasonryGridView.count(
          controller: _scrollController,
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemCount: photoList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context){
                      return YellowRushDetail(photoList[index]);
                    }));
              },
              child: YellowRushItem(
                context,
                photoList[index],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadMoreData() async {
    var res = await  YellowRushService.getPhotos(_currentPage);
    res.fold((l) {
      EasyLoading.showError(l);
    }, (r) {
      setState(() {
        photoList.addAll(r);
        _currentPage++;
      });
      return photoList;
    }
    );
  }
}
