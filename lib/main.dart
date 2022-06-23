import 'package:doctor/constant/color_constant.dart';
import 'package:doctor/route/app_pages.dart';
import 'package:doctor/route/routes.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: const NeumorphicThemeData(
        baseColor: ColorConstant.neuMorphicBaseColor,
        lightSource: LightSource.topLeft,
        depth: 5,
        intensity: 0.9,
      ),
      home: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.launch.name,
        getPages: AppPages.pages,
        builder: EasyLoading.init(),
      ),
    );
  }
}

