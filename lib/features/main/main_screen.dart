import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:innvatti/components/layout/layout.dart';
import 'package:innvatti/features/main/pages/company_screen.dart';
import 'package:innvatti/features/main/pages/home_screen.dart';
import 'package:innvatti/features/main/pages/product_screen.dart';
import 'package:innvatti/features/screen/pages/company_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Timer _timer;
  late bool screenSaver;
  String page = 'home';
  dynamic products = [];
  @override
  void initState() {
    super.initState();
    screenSaver = true;
    rootBundle.loadString("assets/data.json").then((dynamic data){
      setState(() {
        this.products = jsonDecode(data);
      });
    });
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(const Duration(seconds: 60), () {
      print("Timer");
      setState(() {
        screenSaver = true;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF243c9c),
        body: (screenSaver)
            ? Container(child: ScreenSaver(callback: () {
                _timer.cancel();
                _timer = Timer(const Duration(seconds: 60), () {
                  setState(() {
                    screenSaver = true;
                    page = 'home';
                  });
                });
                setState(() {
                  screenSaver = false;
                });
                print(screenSaver);
              }))
            : GestureDetector(
                onTap: () {
                  print("REfresh");
                  _timer.cancel();
                  _startTimer();
                },
                child: Stack(
                  children: [
                    //Home
                    (page == 'home')?HomeScreen(go:(p){
                      setState(() {
                        page = p;
                      });
                    }):Container(),
                    //Company(),
                    (page == 'about-us')?CompanyScreen():Container(),
                    (page == 'product-1')?ProductScreen(product:products[0]):Container(),
                    (page == 'product-2')?ProductScreen(product:products[1]):Container(),
                    (page == 'product-3')?ProductScreen(product:products[2]):Container(),
                    (page == 'product-4')?ProductScreen(product:products[3]):Container(),
                    //CompanyScreen(),
                    //Product()
                    //ProductScreen()
                    Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.width * .1),
                              child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      screenSaver = (page=='home')?true:false;
                                      page = 'home';
                                    });
                                  },
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 100, vertical: 10),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: (page == 'home')?Colors.white:Color(0xFF243c9c), width: 3),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Text("<< Volver",
                                          style:
                                              GoogleFonts.inter(textStyle: TextStyle(color: (page == 'home')?Colors.white:Color(0xFF243c9c)),fontSize: MediaQuery.of(context).size.width * .03)))),
                            ),
                          ),
                        )),
                  ],
                ),
              ));
  }
}
