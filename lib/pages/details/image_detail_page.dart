import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/home_page_model.dart';
import '../../storage/get_storage.dart';
import '../../storage/storage.dart';
import '../../utils/gallery_saver.dart';


class ImageDetail extends StatefulWidget {
  ImageDetail(this.detail, {Key? key}) : super(key: key);
  PhotoModel detail;

  @override
  State<ImageDetail> createState() => _ImageDetailState();
}

class _ImageDetailState extends State<ImageDetail> {
  bool boolling = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top:15.0),
          child: Container(
            child: Column(
              children: [
                Stack(children: [
                  FadeInImage(
                    image: NetworkImage(widget.detail.urls!.small! ?? ''),
                    placeholder: const AssetImage('assets/images/pintetersrt.png'),
                    width: MediaQuery.of(context).size.width,
                  ),
                  Positioned(
                    right: 20,
                    top: 25,
                    child: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.white,
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 300,
                                  child: Padding(
                                    padding: EdgeInsets.all(15),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text("Copy link",
                                            style: TextStyle(fontSize: 20)),
                                        SizedBox(height: 10),
                                        TextButton(
                                          onPressed:() async{
                                            await saveGallery(widget.detail.urls!.small! ?? '');
                                          },
                                            child: Text("Download image",
                                          style: TextStyle(fontSize: 20),),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        icon: Icon(Icons.more_horiz,
                            size: 35, color: Colors.white)),
                  )
                ]),
                Padding(padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image(
                              image: NetworkImage(widget.detail.urls!.small! ?? ''),
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,),
                          ),
                          SizedBox(width: 5),
                          SizedBox(
                            width: 220,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    widget.detail.user!.name! ?? '',
                                    style: TextStyle(fontWeight: FontWeight.w700,
                                        fontSize: 18)),
                                SizedBox(height: 5,),
                                Text("${widget.detail.likes} followers",
                                    style: TextStyle(fontWeight: FontWeight.w500,
                                        fontSize: 16)),
                              ],
                            ),
                          ),
                          Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(20),),
                              child: Center(
                                child: Text("Follows", style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 20)
                                ),
                              ))
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.message, size: 25, color: Colors.black),
                          SizedBox(width: 15),
                          Container(
                              height: 50,
                              width: 145,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(20),),
                              child: Center(
                                child: Text("View", style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 20)
                                ),
                              )),
                          SizedBox(width: 20),
                          boolling == false ?
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.red,shape: StadiumBorder()),
                            onPressed: (){
                            box!.add(widget.detail);
                            boolling = true;
                            setState(() {});
                            },
                            child: Text("Save", style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20)
                            ),
                          ) :
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.black,shape: StadiumBorder()),
                              onPressed: (){},
                              child: Text("Save", style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 20)
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          IconButton(
                              onPressed: () {
                                IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              height: 400,
                                              width: MediaQuery.of(context).size.width,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(30),
                                                    topRight: Radius.circular(30),
                                                  )),
                                              child: Padding(
                                                padding: const EdgeInsets.all(15.0),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        SizedBox(width: 15),
                                                        Text("Share",
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                            )),
                                                      ],
                                                    ),
                                                    SizedBox(height: 15),
                                                    Row(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            InkWell(
                                                                onTap: () async {
                                                                  launchUrl(Uri
                                                                      .parse(
                                                                      "https://t.me/+wCysFA83ZHtiYTQy"),
                                                                      mode: LaunchMode
                                                                          .externalApplication);
                                                                },
                                                                child: SizedBox(
                                                                    height: 50,
                                                                    width: 50,
                                                                    child: ClipRRect(
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          300),
                                                                      child: Image
                                                                          .asset(
                                                                          "assets/images/i (20).webp",
                                                                          fit: BoxFit
                                                                              .cover),))),
                                                            SizedBox(height: 8),
                                                            Text("Telegram",
                                                                style: TextStyle(
                                                                  fontSize: 13,))
                                                          ],
                                                        ),
                                                        SizedBox(width: 8),
                                                        Column(
                                                          children: [
                                                            InkWell(
                                                                onTap: () async {
                                                                  launchUrl(
                                                                      Uri.parse(
                                                                        "https://instagram.com/pinterest?igshid=YmMyMTA2M2Y=",),
                                                                      mode: LaunchMode
                                                                          .externalApplication);
                                                                },
                                                                child: SizedBox(
                                                                    height: 50,
                                                                    width: 50,
                                                                    child: ClipRRect(
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          300),
                                                                      child: Image
                                                                          .asset(
                                                                          "assets/images/i (21).webp",
                                                                          fit: BoxFit
                                                                              .cover),
                                                                    ))),
                                                            SizedBox(height: 8),
                                                            Text("Instagram",
                                                                style: TextStyle(
                                                                  fontSize: 13,
                                                                ))
                                                          ],
                                                        ),
                                                        SizedBox(width: 8),
                                                        Column(
                                                          children: [
                                                            InkWell(
                                                                onTap: () async {
                                                                  launchUrl(Uri.parse("https://pinterest.com/",),
                                                                      mode: LaunchMode.externalApplication);
                                                                },
                                                                child: SizedBox(
                                                                    height: 50,
                                                                    width: 50,
                                                                    child: ClipRRect(
                                                                      borderRadius:
                                                                      BorderRadius.circular(300),
                                                                      child: Image.asset("assets/images/kisspng-facebook-logo-social-media-computer-icons-icon-facebook-drawing-5ab02fb6d19745.4745474715214959908585.jpg", fit: BoxFit.cover),
                                                                    ))),
                                                            SizedBox(height: 8),
                                                            Text("Facebook", style: TextStyle(fontSize: 13,))
                                                          ],
                                                        ),
                                                        SizedBox(width: 8),
                                                        Column(
                                                          children: [
                                                            InkWell(
                                                                onTap: () async {
                                                                  launchUrl(Uri.parse("https://pinterest.com/",),
                                                                      mode: LaunchMode.externalApplication);
                                                                },
                                                                child: SizedBox(height: 50,
                                                                    width: 50,
                                                                    child: ClipRRect(
                                                                      borderRadius: BorderRadius.circular(300),
                                                                      child: Image.asset("https://pinterest.com/", fit: BoxFit.cover),
                                                                    ))),
                                                            SizedBox(height: 8),
                                                            Text("WhatsApp", style: TextStyle(fontSize: 13,))
                                                          ],
                                                        ),
                                                        SizedBox(width: 8),
                                                        Column(
                                                          children: [
                                                            InkWell(
                                                                onTap: () async {_composeSms();
                                                                },
                                                                child: SizedBox(
                                                                    height: 50,
                                                                    width: 50,
                                                                    child: ClipRRect(
                                                                      borderRadius: BorderRadius.circular(300),
                                                                      child: Image.asset("assets/images/i (23).webp", fit: BoxFit.cover),
                                                                    ))),
                                                            SizedBox(height: 8),
                                                            Text("Message", style: TextStyle(fontSize: 13,))
                                                          ],
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                    icon: Icon(Icons.more_horiz_outlined,
                                        size: 30, color: Colors.white));
                              },
                              icon: Icon(
                                  Icons.share, size: 30, color: Colors.black)),
                        ],
                      )
                    ],
                  ),)
              ],
            ),
          ),
        )
    );
  }
}

void _composeSms() {
  final Uri smsLaunchUri = Uri(
      scheme: 'sms',
      path: "+998933993323",
      queryParameters: <String, String>{
        'body': Uri.encodeComponent("Example Subject & Symbols are allowed!"),
      });
  launchUrl(smsLaunchUri);
}

Future<void> _sendSMS(String phone, String message) async {
  String result =
      await sendSMS(message: message, recipients: [phone], sendDirect: true)
          .catchError((onError) {
    print(onError);
  });
  print(result);
}

Future<bool> requestPermission(Permission per) async {
  var status = await per.status;
  if (status.isGranted) {
    return true;
  } else {
    await per.request();
  }
  return false;
}