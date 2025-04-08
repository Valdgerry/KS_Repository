import 'package:flutter/material.dart';



class AccueilTwo extends StatefulWidget {
  const AccueilTwo({super.key});

  final String title = 'Kidney Savers';


  @override
  State<AccueilTwo> createState() => _AccueilTwoState();
}

class _AccueilTwoState extends State<AccueilTwo> {
  @override
  Widget build(BuildContext context) {
    double theHeight = MediaQuery.of(context).size.height;
    double theWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                    image: AssetImage('images/heroF.png'),
                    alignment: Alignment(0, -0.4),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset('images/Background 2.png',alignment: Alignment.bottomCenter),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:<Widget> [
                        Container(
                          width:theWidth,
                          height:theHeight/3,
                          padding: EdgeInsets.only(left: 20,right: 20),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Text('Connection',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),

                              SizedBox(
                                //height: 7.0,
                                height : theHeight/110,
                              ),

                              Text('Connectez vous et continuez votre partie!',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                ),
                              ),

                              SizedBox(
                                //height: 25.0,
                                height : theHeight/30,
                              ),

                              Container(
                                //height: 50.0,
                                height : theHeight/15.5,
                                color: Colors.white,
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    prefixIcon: Icon(Icons.account_circle_outlined),
                                  ),
                                ),
                              ),

                              SizedBox(
                                //height: 25.0,
                                height : theHeight/30,

                              ),

                              FilledButton(
                                onPressed: null,
                                child: Text('Se connecter',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight:FontWeight.w800 ,
                                  ),
                                ),
                                style:ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll<Color>(Colors.teal),
                                  fixedSize: WidgetStatePropertyAll(Size.fromWidth(theWidth/1.12)) ,
                                ),
                              ),

                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text('Vous n \'avez pas de compte ? ',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                 ),
                                 TextButton(
                                     onPressed: (){
                                       context.go('/create_account');
                                     },
                                     child:
                                     Text('S\'inscrire', style: TextStyle(
                                        color: Colors.orangeAccent,
                                        fontStyle: FontStyle.italic,
                                       ),
                                      ),
                                 ),
                               ],
                             )

                            ],
                          ),
                        ),

                      ],
                    )
                  ],
                )
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
}
