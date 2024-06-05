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
    return Container(
      child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .1),
            child: Column(
                    children: [
            Container(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width * .05),
                width: MediaQuery.of(context).size.width * .6,
                child: Logo()),
            Expanded(
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
                      Row(
                        children: [
                          Expanded(
                            child: LargeButton(onPressed: () {
                              Navigator.pushNamed(context, "/company");
                            },child:Text("Sobre Nosotros")),
                          ),
                          Expanded(
                            child: LargeButton(onPressed: () {
                              Navigator.pushNamed(context, "/company");
                            },child:Text("Sobre Nosotros")),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: LargeButton(onPressed: () {
                              Navigator.pushNamed(context, "/company");
                            },child:Text("Sobre Nosotros")),
                          ),
                          Expanded(
                            child: LargeButton(onPressed: () {
                              Navigator.pushNamed(context, "/company");
                            },child:Text("Sobre Nosotros")),
                          ),
                        ],
                      ),
                      TextButton(onPressed: () {
                        Navigator.of(context).pushNamed( "/company");
                      },child:Text("Sobre Nosotros")),
                    ],
                  ))),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(MediaQuery.of(context).size.width * .05),
                width: MediaQuery.of(context).size.width * .3 ,
                child: TextButton(onPressed: (){},child:Container(child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RotatedBox(quarterTurns: 2,child: Icon(Icons.fast_forward_rounded,size:MediaQuery.of(context).size.width * .05,color:Colors.white)),
                    Text("Atras",style:TextStyle(color:Colors.white,fontSize: Theme.of(context).textTheme.titleLarge!.fontSize)),
                  ],
                )))),
                    ],
                  ),
          )),
    );
  }
}
