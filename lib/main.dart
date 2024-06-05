import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:innvatti/components/layout/layout.dart';
import 'package:innvatti/features/main/main_screen.dart';
import 'package:innvatti/features/screen/pages/company_page.dart';
import 'package:innvatti/features/screen/pages/product_detail_page.dart';
import 'package:innvatti/features/screen/pages/products_page.dart';
import 'package:innvatti/features/screen/screen.dart';
import 'package:innvatti/shared/theme/theme.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LicenseRegistry.addLicense(() async* {
    final license =
        await rootBundle.loadString('google_fonts/Roboto/LICENSE.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  if(Platform.isWindows){
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = const WindowOptions(
    size: Size(800, 600),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
    windowButtonVisibility: false,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
    await windowManager.setFullScreen(true);
  });
  }
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Totem',
      theme: InnovattiTheme.light,
      home:MainScreen(),
      /*routes: {
        '/': (context) => Layout(initialWidget: ScreenPage(title: 'Totem Homepage'),screenSaver: true,),
        CompanyPage.route: (context) => Layout(initialWidget: CompanyPage(),screenSaver: false,),
        ProductsPage.route: (context) => ProductsPage(),
        ProductDetailPage.route: (context) => ProductDetailPage()
      },*/
    );
  }
}
