import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
   const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  int _selectedIndex = -1;

  void _onContainerTap(int index){
    setState((){
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body:Column(
        children: [
          SizedBox(height: screenHeight*0.15,width: screenWidth*0.95,),
          Image(image: AssetImage("assets/images/Group.png"),alignment: Alignment.center,),
          Text("Inscription",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          SizedBox(height: screenHeight*0.05),
          Padding(
        padding: EdgeInsets.all(16.0),
        child: RichText(
          textAlign: TextAlign.center, // Alignement du texte
          text: TextSpan(
            style: TextStyle(fontSize:16,color: Colors.black), // Style par défaut
            children: [
              TextSpan(text: "Rejoignez "),
              TextSpan(
                text: "Kidney Savers : Utilisateur simple ou Docteur ? ",
                style: TextStyle(fontWeight: FontWeight.bold), // Texte en gras
              ),
              TextSpan(
                text: "Apprenez et sensibilisez.",
                style: TextStyle(color: Colors.blue), // Texte en couleur
              ),
            ],
          ),
          ),
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _onContainerTap(0),
                child: Container(
                  width: screenWidth*0.4,
                  height: screenWidth*0.45,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: _selectedIndex == 0 ? Color.fromRGBO(24, 124, 139, 0.15) : Colors.white, // Changement de couleur si sélectionné
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color.fromRGBO(24, 122, 139, 0.15),width: 3,style: BorderStyle.solid),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(height: screenHeight*0.045,width: screenWidth*0.3,),
                                Icon(_selectedIndex == 0 ?Icons.check_circle : Icons.check_circle_outlined,color: Color.fromRGBO(24, 124, 139, 1),),
                              ],
                            ),
                            Image(image: AssetImage("assets/images/User.png")),
                            SizedBox(height: screenHeight*0.02,),
                            Text("Utilisateur",style: TextStyle(fontSize: screenHeight*0.02,fontWeight: FontWeight.bold),),
                          ],
                      ),
                  ),
                ),
              GestureDetector(
                onTap: () => _onContainerTap(1),
                child: Container(
                  width: screenWidth*0.4,
                  height: screenWidth*0.45,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: _selectedIndex == 1 ? Color.fromRGBO(24, 124, 139, 0.15) : Colors.white, // Changement de couleur si sélectionné
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color.fromRGBO(24, 122, 139, 0.15),width: 3,style: BorderStyle.solid),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(height: screenHeight*0.045,width: screenWidth*0.3,),
                          Icon(_selectedIndex == 1 ?Icons.check_circle : Icons.check_circle_outlined,color: Color.fromRGBO(24, 124, 139, 1),),
                        ],
                      ),
                      Image(image: AssetImage("assets/images/30-Doctor.png")),
                      SizedBox(height: screenHeight*0.02,),
                      Text("Docteur",style: TextStyle(fontSize: screenHeight*0.02,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight*0.2),
          ElevatedButton(
            onPressed: () 
            {
              if(_selectedIndex == 0)
                {
  
                }
              if(_selectedIndex==1)
                {
  
                }
            }, 
            child: const Text("Confirmer",style: TextStyle(color: Colors.white),),
            style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(25, 165, 142, 1)),fixedSize: WidgetStatePropertyAll(Size(screenWidth*0.8,screenHeight*0.05))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("J'ai déjà un compte?"),
            TextButton(onPressed: (){}, child: Text("Se connecter",style: TextStyle(color:Color.fromRGBO(22,124,139,1)),))
          ],),
        ]
      )
    );
  }
}
