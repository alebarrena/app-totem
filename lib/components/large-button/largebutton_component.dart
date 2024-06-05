import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;
  const LargeButton({super.key,required this.onPressed,required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.all(10),
      child: TextButton(
          onPressed: ()=>this.onPressed(),
          child: Container(
              padding: EdgeInsets.all(10),
              child: Container(
                  decoration: BoxDecoration(
            color:Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.white,width: 5)),
                  height: MediaQuery.of(context).size.height*.1,
                  width: double.infinity,
                  child: Center(child: child)))),
    );
  }
}
