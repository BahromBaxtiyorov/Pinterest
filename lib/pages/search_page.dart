import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../service/photo_service.dart';
import '../items/home_page_item_.dart';
import '../models/home_page_model.dart';
import 'details/image_detail_page.dart';
import 'home_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  List<PhotoModel> searchList = [];
  var searchCtr = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;

  // @override
  // void initState() {
  //   super.initState();
  //
  //   _scrollController.addListener(() {
  //     if(_scrollController.position.pixels ==
  //         _scrollController.position.maxScrollExtent) {
  //
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black54,
        title: TextFormField(
          onChanged: (value) async {
            if(value.length > 2){
              searchList.clear();
              var res = await PhotoService.searchPhotos(search: value, page: _currentPage );
              res.fold((l) {
                EasyLoading.showError(l);
              }, (r) {
                searchList = r;
                setState(() {});
                searchList.addAll(r);
                _currentPage++;
              });
            }
          },
          controller: searchCtr,
          decoration: InputDecoration(
            fillColor: Colors.grey.shade700,
            filled: true,
            border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            prefixIcon: const Icon(Icons.search, color: Colors.grey,),
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey),
            suffixIcon: const Icon(Icons.camera_alt,color: Colors.grey,),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: searchList.isEmpty?
          const Center(child: Text('No result'),)
              :MasonryGridView.count(
               controller: _scrollController,
               crossAxisCount: 2,
               mainAxisSpacing: 4,
               crossAxisSpacing: 4,
               itemCount: searchList.length,
               itemBuilder: (context, index) {
              return InkWell(
                  child: HomeItem(
                    context,
                    searchList[index],
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>  ImageDetail(searchList[index])));
                },
              );
            },
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

}
