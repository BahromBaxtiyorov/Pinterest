import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/home_page_model.dart';
import '../utils/gallery_saver.dart';

Widget HomeItem(BuildContext context, PhotoModel post){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      FadeInImage(
        image: NetworkImage(post.urls!.small!),
        placeholder: const AssetImage('assets/images/pintetersrt.png'),
        width: MediaQuery.of(context).size.width,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.favorite, color: Colors.red,size: 20,),
              Text(post.likes.toString())
            ],
          ),
          IconButton(
            onPressed: (){
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
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.delete, size: 28)),
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
                                          launchUrl(
                                              Uri.parse(
                                                  "https://t.me/+wCysFA83ZHtiYTQy"),
                                              mode: LaunchMode.externalApplication);
                                        },
                                        child: SizedBox(
                                            height: 60,
                                            width: 60,
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  300),
                                              child: Image.asset(
                                                  "assets/images/i (20).webp",
                                                  fit: BoxFit.cover),
                                            ))),
                                    SizedBox(height: 8),
                                    Text("Telegram",
                                        style: TextStyle(
                                          fontSize: 13,
                                        ))
                                  ],
                                ),
                                SizedBox(width:8),
                                Column(
                                  children: [
                                    InkWell(
                                        onTap: () async {
                                          launchUrl(
                                              Uri.parse("https://instagram.com/pinterest?igshid=YmMyMTA2M2Y=",),
                                              mode: LaunchMode.externalApplication);
                                        },
                                        child: SizedBox(
                                            height: 60,
                                            width: 60,
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  300),
                                              child: Image.asset(
                                                  "assets/images/i (21).webp",
                                                  fit: BoxFit.cover),
                                            ))),
                                    SizedBox(height: 8),
                                    Text("Instagram",
                                        style: TextStyle(
                                          fontSize: 13,
                                        ))
                                  ],
                                ),
                                SizedBox(width:8),
                                Column(
                                  children: [
                                    InkWell(
                                        onTap: () async {
                                          launchUrl(
                                              Uri.parse(
                                                "https://pinterest.com/",
                                              ),
                                              mode: LaunchMode
                                                  .externalApplication);
                                        },
                                        child: SizedBox(
                                            height: 60,
                                            width: 60,
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  300),
                                              child: Image.asset(
                                                  "assets/images/i (26).webp",
                                                  fit: BoxFit.cover),
                                            ))),
                                    SizedBox(height: 8),
                                    Text("Facebook",
                                        style: TextStyle(
                                          fontSize: 13,
                                        ))
                                  ],
                                ),
                                SizedBox(width:8),
                                Column(
                                  children: [
                                    InkWell(
                                        onTap: () async {
                                          launchUrl(
                                              Uri.parse(
                                                "https://pinterest.com/",),
                                              mode: LaunchMode.externalApplication);
                                        },
                                        child: SizedBox(
                                            height: 60,
                                            width: 60,
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(300),
                                              child: Image.asset("assets/images/whatsapp.jpg",
                                                  fit: BoxFit.cover),
                                            ))),
                                    SizedBox(height: 8),
                                    Text("WhatsApp",
                                        style: TextStyle(
                                          fontSize: 13,
                                        )),
                                  ],
                                ),
                                SizedBox(width:8),
                                Column(
                                  children: [
                                    InkWell(
                                        onTap: () async {
                                          _composeSms();
                                        },
                                        child: SizedBox(
                                            height: 60,
                                            width: 60,
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(300),
                                              child: Image.asset(
                                                  "assets/images/i (23).webp",
                                                  fit: BoxFit.cover),
                                            ))),
                                    SizedBox(height: 8),
                                    Text("Message",
                                        style: TextStyle(fontSize: 13,))
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height:10),
                            Divider(thickness: 1,color: Colors.grey),
                            SizedBox(height:10),
                            TextButton(
                                onPressed:() async{
                                  await saveGallery(post.urls!.small! ?? '');
                                },
                                child: Text("Download image",style: TextStyle(fontSize: 20))),
                            SizedBox(height:10),
                            Text("Hide pin",style: TextStyle(fontSize: 20))
                          ],
                        ),
                      ),
                    );
                  });
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      Text(post.altDescription ??'',
          maxLines: 2)
    ],
  );
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