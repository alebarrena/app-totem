import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:innvatti/components/large-button/largebutton_component.dart';
import 'package:innvatti/components/logo/logo.dart';

class HomeScreen extends StatefulWidget {
  final Function go;
  const HomeScreen({super.key, required this.go});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            child: Center(
                child: AnimatedContainer(
              curve: Curves.easeIn,
              duration: const Duration(seconds: 1),
              child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * .1,
                      horizontal: (true)
                          ? MediaQuery.of(context).size.width * .1
                          : MediaQuery.of(context).size.width * .2),
                  child: Logo()),
            ))),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 130),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                        child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 7),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(child: Text("Nuestros productos"))),
                    Wrap(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          width: (MediaQuery.of(context).size.width - 260) * .5,
                          child: LargeButton(
                              onPressed: () {
                                widget.go('product-1');
                              },
                              child: Text("Pick/Put To Light",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 35))),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          width: (MediaQuery.of(context).size.width - 260) * .5,
                          child: LargeButton(
                              onPressed: () {
                                widget.go('product-2');
                              },
                              child: Text("Pick To Cart",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 35))),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          width: (MediaQuery.of(context).size.width - 260) * .5,
                          child: LargeButton(
                              onPressed: () {
                                widget.go('product-3');
                              },
                              child: Center(
                                  child: Text("RFID",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 35)))),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          width: (MediaQuery.of(context).size.width - 260) * .5,
                          child: LargeButton(
                              onPressed: () {
                                widget.go('product-4');
                              },
                              child: Container(
                                  width: 200,
                                  child: Text("Soluciones Logisticas",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize:  (MediaQuery.of(context).size.width) * .01,
                                      )))),
                        ),
                      ],
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: LargeButton(
                          onPressed: () {
                            widget.go('about-us');
                          },
                          child: Container(
                              child: Text("Sobre Nosotros",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 35)))),
                    ),
                  ],
                ))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
