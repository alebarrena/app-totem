import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:innvatti/components/layout/layout.dart';
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
  /*if(Platform.isWindows){
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
  }*/
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Totem',
      theme: InnovattiTheme.light,
      builder: (context, widget) => Layout(initialWidget: widget!),
      initialRoute: "/",
      routes: {
        '/': (context) => ScreenPage(title: 'Totem Homepage'),
        CompanyPage.route: (context) => CompanyPage(),
        ProductsPage.route: (context) => ProductsPage(),
        ProductDetailPage.route: (context) => ProductDetailPage()
      },
    );
  }
}
