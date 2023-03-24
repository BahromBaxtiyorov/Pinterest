import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinterest_project/pages/profil_page_made.dart';
import 'package:pinterest_project/pages/profil_saved_page.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> with SingleTickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SingleChildScrollView(
       child: Padding(
          padding: EdgeInsets.all(15),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Padding(
                 padding: const EdgeInsets.only(top:20.0,right:15),
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     Icon(Icons.share,size: 30,color: Colors.black),
                     SizedBox(width:15),
                     Icon(Icons.more_horiz_outlined,size: 30,color: Colors.black)
                   ],
                 ),
               ),
               SizedBox(height:20),
               Center(
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(100),
                   child: Image(
                     image: AssetImage("assets/images/pintetersrt.png"),
                     width: 200,
                     height: 200,
                     fit: BoxFit.cover,),
                 ),
               ),
               SizedBox(height: 15,),
               Text("Baxtiyorov Bahrom",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
               SizedBox(height:10),
               Text("@bahrombaxtiyorov",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
               SizedBox(height:10),
               Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('10 followers',),
                   SizedBox(width: 10,),
                   Text('10 followers',),
                 ],
               ),
               SizedBox(height: 20,),
               DefaultTabController(
                   length: 2,
                   child: Column(
                     children: [
                       SizedBox(
                         width: 180,
                         height: 90,
                         child: TabBar(
                           controller: tabController,
                           labelColor: Colors.white,
                           indicatorColor: Colors.white,
                           tabs: const [
                             Text('Made', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14,color: Colors.black),),
                             Text('Saved', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14,color: Colors.black),
                             ),
                           ],
                         ),
                       ),
                       // SizedBox(
                       //     width: 180,
                       //     height: 90,
                       //     child: AppBar(
                       //       elevation: 0,
                       //       backgroundColor: Colors.transparent,
                       //       bottom: const TabBar(
                       //           indicatorWeight: 3,
                       //           indicatorColor:
                       //           Color.fromARGB(255, 70, 69, 69),
                       //           indicatorPadding: EdgeInsets.only(
                       //             left: 10,
                       //             right: 10,
                       //           ),
                       //           tabs: [
                       //             Tab(text: 'Created',),
                       //             Tab(text: 'Saved',),
                       //           ]),
                       //     )),
                       SizedBox(
                         height: 3000,
                         width: MediaQuery.of(context).size.width,
                         child: TabBarView(
                             controller: tabController,
                             children: const [
                               ProfilMadePage(),
                               ProfilSavedPage(),
                             ]),
                       )
                     ],
                   )),
             ],
           )
        ),
     )
    );
  }
}
