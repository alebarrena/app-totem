part of screen;

class ScreenPage extends StatefulWidget {
  const ScreenPage({super.key, required this.title});
  final String title;
  @override
  State<ScreenPage> createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  bool init = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        init = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
          child: Stack(
            children: [
              Container(
                      padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .1),
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
                              horizontal: (init)
                                  ? MediaQuery.of(context).size.width * .1
                                  : MediaQuery.of(context).size.width * .2),
                          child: Logo()),
                    ))),
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
                                child: LargeButton(
        image:"assets/product-2.png",
                                    onPressed: () {
                                    },
                                    child: Text("Sobre Nosotros")),
                              ),
                              Expanded(
                                child: LargeButton(
        image:"assets/product-2.png",
                                    onPressed: () {
                                    },
                                    child: Text("Sobre Nosotros")),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: LargeButton(
        image:"assets/product-2.png",
                                    onPressed: () {
                                    },
                                    child: Text("Sobre Nosotros")),
                              ),
                              Expanded(
                                child: LargeButton(
        image:"assets/product-2.png",
                                    onPressed: () {
                                    },
                                    child: Text("Sobre Nosotros")),
                              ),
                            ],
                          ),
                          LargeButton(
        image:"assets/product-2.png",
                              onPressed: () {
                              },
                              child: Text("Sobre Nosotros")),
                        ],
                      ))),
                    ],
                  ),
                ),
              ],
                      ),
                    ),
            
            ],
          )),
    );
  }
}
