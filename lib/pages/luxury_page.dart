import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../items/luxury_item.dart';
import '../models/luxury_model.dart';
import '../service/luxury_service.dart';
import 'details/image_detail_page.dart';
import 'details/luxury_detail_page.dart';

class LuxuryPage extends StatefulWidget {
  const LuxuryPage({Key? key}) : super(key: key);

  @override
  State<LuxuryPage> createState() => _LuxuryPageState();
}

class _LuxuryPageState extends State<LuxuryPage> {
  final ScrollController _scrollController = ScrollController();
  List<LuxuryModel> photoList = [];
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
                      return LuxuryDetail(photoList[index]);
                    }));
              },
              child: LuxuryItem(
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
    var res = await  LuxuryService.getPhotos(_currentPage);
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
