import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../items/home_page_item_.dart';
import '../models/home_page_model.dart';
import '../service/photo_service.dart';
import 'details/image_detail_page.dart';


List<PhotoModel> photoList = [];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();

  final ScrollController _scrollController = ScrollController();
 // List<PhotoModel> photoList = [];
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
        child: SizedBox(
          child: RefreshIndicator(
              key: _refreshIndicatorKey,
              color: Colors.white,
              backgroundColor: Colors.blue,
              strokeWidth: 4.0,
              child: MasonryGridView.count(
                controller: _scrollController,
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                itemCount: photoList.length,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context){
                        return ImageDetail(photoList[index]);
                      }));
                    },
                    child: HomeItem(context, photoList[index],
                    ),);
                },),
              onRefresh:  () async {
                return Future<void>.delayed(const Duration(seconds: 3));
              },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Show refresh indicator programmatically on button tap.
          _refreshIndicatorKey.currentState?.show();
        },
        icon: const Icon(Icons.refresh),
        label: const Text('Show Indicator'),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadMoreData() async {
   var res = await  PhotoService.getPhotos(_currentPage);
    res.fold((l) {
      EasyLoading.showError(l);
    }, (r) {
      setState(() {
        if(photoList.isEmpty) {
          photoList.addAll(r);
          _currentPage++;
        }
        else {
           photoList;
        }
      });
      return photoList;
    }
    );
  }
}





// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   List<PhotoModel> photoList = [];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: FutureBuilder(
//             future: PhotoService.getPhotos(),
//             builder: (ctx,snapshot){
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 EasyLoading.show();
//                 return const SizedBox();
//               }else if (snapshot.hasData) {
//                 snapshot.data?.fold((l) {
//                   EasyLoading.showError(l);
//                 }, (r) {
//                   EasyLoading.dismiss();
//                   photoList = r;
//                 });
//                 return Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: MasonryGridView.count(
//                     crossAxisCount: 2,
//                     mainAxisSpacing: 4,
//                     crossAxisSpacing: 4,
//                     itemCount: photoList.length,
//                     itemBuilder: (context, index) {
//                       return HomeItem(
//                         context,
//                         photoList[index],
//                         // index: index,
//                         // extent: (index % 5 + 1) * 100,
//                       );
//                     },
//                   ),
//                 );
//               }
//               else  {
//                 return Text("Error: ${snapshot.error}");
//               }
//             })
//     );
//   }
// }