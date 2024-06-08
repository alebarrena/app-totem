import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LargeButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;
  final String image;
  const LargeButton({super.key, required this.onPressed, required this.child,required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: TextButton(
          onPressed: () => this.onPressed(),
          child: Stack(
            children: [
              Container(
                  margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * .04),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20),),boxShadow: [
      BoxShadow(
        color: Color(0xFF333333).withOpacity(.6),
        spreadRadius: 10,
        blurRadius: 20,
        offset: Offset(0, 0), // changes position of shadow
      ),
    ],
                      ),
                      height: MediaQuery.of(context).size.height * .085,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
        flex: 47,
                            child: Container(
                              width: MediaQuery.of(context).size.width * .15,
                              decoration: BoxDecoration(
                                image:DecorationImage(image:AssetImage(this.image),fit: BoxFit.cover),
                                borderRadius:
                                    BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                              ),
                            ),
                          ),
                          Expanded(
        flex: 53,child: Container(padding:EdgeInsets.only(left:   MediaQuery.of(context).size.width * .02   ,right:MediaQuery.of(context).size.width * .05),child: Center(child: child))),
                        ],
                      ))),
              Positioned(
                  top: MediaQuery.of(context).size.width * .04,
                  right: 0,
                  child: Container(
                      width: MediaQuery.of(context).size.width * .08,
                      height: MediaQuery.of(context).size.width * .08,
                      decoration: BoxDecoration(
                          color: Color(0xFFF3B63D),
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width )),
                      child: Image.asset('assets/arrow.png', scale: 4)))
            ],
          )),
    );
  }
}
