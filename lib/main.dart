import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pinterest_project/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pinterest_project/storage/get_storage.dart';
import 'package:pinterest_project/storage/storage.dart';
import 'core/constans/app_init.dart';
import 'main_view.dart';
import 'models/home_page_model.dart';


void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PhotoModelAdapter());
  Hive.registerAdapter(PhotoModelLinksAdapter());
  Hive.registerAdapter(TopicSubmissionsAdapter());
  Hive.registerAdapter(ArtsCultureAdapter());
  Hive.registerAdapter(FilmAdapter());
  Hive.registerAdapter(UrlsAdapter());
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(UserLinksAdapter());
  Hive.registerAdapter(ProfileImageAdapter());
  Hive.registerAdapter(SocialAdapter());
  box = await Hive.openBox('box');
  user = await Hive.openBox('user');
  AppInit.configLoading();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainView(),
    );
  }
}

