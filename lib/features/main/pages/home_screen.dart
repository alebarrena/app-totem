import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
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
    dynamic products = [
      {
        "image":"assets/product-1.png",
        "label": Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Pick/Put",
                style: GoogleFonts.inter(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: (MediaQuery.of(context).size.width) * .014,
                ))),
            Text("To Light",
                style: GoogleFonts.inter(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: (MediaQuery.of(context).size.width) * .014,
                ))),
          ],
        )
      },
      {
        "image":"assets/product-2.png",
        "label": Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Pick/Put",
                style: GoogleFonts.inter(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: (MediaQuery.of(context).size.width) * .014,
                ))),
            Text("Cart",
                style: GoogleFonts.inter(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: (MediaQuery.of(context).size.width) * .014,
                ))),
          ],
        )
      },
      {
        "image":"assets/product-3.png",
        "label": Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("RFID",
                style: GoogleFonts.inter(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: (MediaQuery.of(context).size.width) * .014,
                ))),
          ],
        )
      },
      {
        "image":"assets/product-4.png",
        "label": Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Soluciones",
                style: GoogleFonts.inter(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: (MediaQuery.of(context).size.width) * .014,
                ))),
            Text("Logisticas",
                style: GoogleFonts.inter(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: (MediaQuery.of(context).size.width) * .014,
                ))),
          ],
        )
      }
    ];
    return Stack(
      children: [
        Positioned(bottom:0,right:0,child: Container(width:MediaQuery.of(context).size.width * .8,child: Image.asset("assets/bg-vector.png"))),
        Container(
          child: Column(
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
                  margin: EdgeInsets.only(top:MediaQuery.of(context).size.width *
                                                  .1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Container(
                              child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                  right: MediaQuery.of(context).size.width * .08,
                                  left: MediaQuery.of(context).size.width * .08),
                              width: double.infinity,
                              padding: EdgeInsets.all(MediaQuery.of(context).size.width *
                                                  .03),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white, width: 5),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                  child: Text("Nuestros productos".toUpperCase(),
                                      style: TextStyle(fontWeight: FontWeight.bold,
                                          fontSize:
                                              MediaQuery.of(context).size.width *
                                                  .025)))),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * .08,
                                left: MediaQuery.of(context).size.width * .08),
                            height: MediaQuery.of(context).size.height * .085 * 2.8,
                            child: GridView.count(
                              childAspectRatio: 2,
                              // Create a grid with 2 columns. If you change the scrollDirection to
                              // horizontal, this produces 2 rows.
                              crossAxisCount: 2,
                              // Generate 100 widgets that display their index in the List.
                              shrinkWrap: true,
                              children: List.generate(products.length, (index) {
                                return LargeButton(
                              image:products[index]['image'],
                                    onPressed: () {
                                      widget.go('product-'+(index+1).toString());
                                    },
                                    child: products[index]['label']);
                              }),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * .08,
                                left: MediaQuery.of(context).size.width * .08),
                            child: LargeButton(
                              image:"assets/about-us.png",
                                onPressed: () {
                                  widget.go('about-us');
                                },
                                child: Container(
                                    child: Text("Sobre Nosotros",
                                        style: GoogleFonts.inter(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: (MediaQuery.of(context).size.width) * .020,
                ))))),
                          ),
                        ],
                      ))),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
