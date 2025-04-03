import 'package:flutter/material.dart';
import 'acc_two.dart';
class AccueilOne extends StatefulWidget {
  const AccueilOne({super.key});

  final String title = 'Kidney Savers';

  @override
  State<AccueilOne> createState() => _AccueilOneState();
}

class _AccueilOneState extends State<AccueilOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 0.0),
              height: MediaQuery.of(context).size.height,
              width:MediaQuery.of(context).size.width ,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/Mascott.png'),
                  alignment: Alignment.center,
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset('images/Background 1.png',alignment: Alignment.bottomCenter),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width:MediaQuery.of(context).size.width ,
                        height:MediaQuery.of(context).size.height/2.8,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Amusez-vous tout en apprenant sur les maladies rénales et devenez un vrai',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:16.0 ,

                              ),
                            ),

                            SizedBox(
                              height: 10.0,
                            ),
                            Text('Kidney Saver',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),

                            SizedBox(
                              height: 30.0,
                            ),

                            FilledButton(
                                onPressed: goTo,
                                child: Text('Commencer',
                                  style: TextStyle(
                                    color: Colors.teal,
                                  ),
                                ),
                              style:ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll<Color>(Colors.white),
                                 fixedSize: WidgetStatePropertyAll(Size.fromWidth(350)) ,
                              ),

                            ),
                          ],
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),
            // Container(
            //   height:MediaQuery.of(context).size.height / 3 ,
            //   width:MediaQuery.of(context).size.width ,
            //
            // ),
          ],
        ) ,
      ),

    );
  }
  void goTo(){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
      return AccueilTwo();
    } ));
  }
}
