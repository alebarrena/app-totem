part of screen;

class ScreenPage extends StatefulWidget {
  const ScreenPage({super.key, required this.title});
  final String title;
  @override
  State<ScreenPage> createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [ 
            Container(padding:EdgeInsets.all( MediaQuery.of(context).size.width*.05),width: MediaQuery.of(context).size.width*.6,child:Logo()),
            Expanded(
              child: Row(children: [
                Expanded(child: Container(color:Colors.white,child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LargeButton(onPressed:(){
                      Navigator.pushNamed(context,"/company");
                    }),
                    LargeButton(onPressed:(){
                      Navigator.pushNamed(context,"/product",arguments: {"id":1});
                    }),
                  ],
                ))),
              ],),
            ),
          ],
        )
      ),
    );
  }
}
