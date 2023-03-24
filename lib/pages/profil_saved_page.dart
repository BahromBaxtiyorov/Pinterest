import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../items/home_page_item_.dart';
import '../models/home_page_model.dart';
import '../service/photo_service.dart';
import '../storage/get_storage.dart';
import '../storage/storage.dart';
import 'details/image_detail_page.dart';

class ProfilSavedPage extends StatefulWidget {
  const ProfilSavedPage({Key? key}) : super(key: key);

  @override
  State<ProfilSavedPage> createState() => _ProfilSavedPageState();
}

class _ProfilSavedPageState extends State<ProfilSavedPage> {
  // final ScrollController _scrollController = ScrollController();
  List<PhotoModel> photoList = [];
  // int _currentPage = 1;

  // @override
  // void initState() {
  //
  //   super.initState();
  //   _loadMoreData();
  //   _scrollController.addListener(() {
  //     if(_scrollController.position.pixels ==
  //         _scrollController.position.maxScrollExtent) {
  //       _loadMoreData();
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.74,
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade700,
                      filled: true,
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      prefixIcon: const Icon(Icons.search, color: Colors.white,),
                      hintText: 'Search pins',
                      hintStyle: TextStyle(color: Colors.grey.shade300),
                    ),
                  ),
                ),
                Icon(Icons.add, color: Colors.white,size: 35,),
              ],
            ),
            SizedBox(height:20),
             SizedBox(
               height: 2900,
               width: MediaQuery.of(context).size.width,
               child: MasonryGridView.count(
                // controller: _scrollController,
                 physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                itemCount: box!.values.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context){
                            return box!.isNotEmpty ? ImageDetail(box!.getAt(index)!) :
                                Container(
                                  color: Colors.grey,
                                );
                          }));
                    },
                    child: HomeItem(
                      context,
                      box!.getAt(index)!,
                    ),
                  );
                },
            ),
             )
          ],
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   _scrollController.dispose();
  //   super.dispose();
  // }
  //
  // Future<void> _loadMoreData() async {
  //   var res = await  PhotoService.getPhotos(_currentPage);
  //   res.fold((l) {
  //     EasyLoading.showError(l);
  //   }, (r) {
  //     setState(() {
  //       photoList.addAll(r);
  //       _currentPage++;
  //     });
  //     return photoList;
  //   }
  //   );
  // }
}
