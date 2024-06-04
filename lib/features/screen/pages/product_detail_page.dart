import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  static String route = "/product";
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as dynamic;
    return Scaffold(backgroundColor: Colors.blue,body: SafeArea(child: Container(child:Text(args.toString()))));
  }
}