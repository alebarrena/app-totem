import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:innvatti/components/layout/layout.dart';
import 'package:innvatti/features/screen/pages/company_page.dart';
import 'package:innvatti/features/screen/pages/product_detail_page.dart';
import 'package:innvatti/features/screen/pages/products_page.dart';
import 'package:innvatti/features/screen/screen.dart';
import 'package:innvatti/shared/theme/theme.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license =
        await rootBundle.loadString('google_fonts/Roboto/LICENSE.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Totem',
      theme: InnovattiTheme.light,
      home: const ScreenPage(title: 'Totem Homepage'),
      builder: (context, widget) => Layout(initialWidget: widget!),
      routes: {
        CompanyPage.route: (context) => CompanyPage(),
        ProductsPage.route: (context) => ProductsPage(),
        ProductDetailPage.route: (context) => ProductDetailPage()
      },
    );
  }
}