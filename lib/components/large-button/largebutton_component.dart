import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final Function onPressed;
  const LargeButton({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: ()=>this.onPressed(),
        child: Container(
            padding: EdgeInsets.all(10),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: Colors.grey)),
                height: MediaQuery.of(context).size.height*.1,
                width: double.infinity,
                child: Text("Menu"))));
  }
}
