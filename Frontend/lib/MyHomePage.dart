class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return AccueilOne();
  }
  void goTo(){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
      return AccueilOne();
    } ));
  }
}

