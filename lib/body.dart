import 'package:flutter/material.dart';

class MainBody extends StatefulWidget {
  const MainBody({super.key});

  final String title = 'Kidney Savers';

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 0.0),
              height: MediaQuery.of(context).size.height,
              width:MediaQuery.of(context).size.width ,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/Mascott.png'),
                  alignment: Alignment.topCenter,
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset('images/Background.png',alignment: Alignment.bottomCenter),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('so a lot of text here bla bla bla bla bla bla....'),
                      Text('End a bold text there',)

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
