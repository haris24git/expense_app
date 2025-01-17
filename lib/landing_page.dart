import 'package:expense_app/home.dart';
import 'package:expense_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'app',
       home: MyHomePage(),
     );
  }

}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return  Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 28.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png', height: 32,),
                SizedBox(
                  width: 4,
                ),
                Text('Monety', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold ),),
              ],
            ),
          ),
          centerTitle: true,
        ),

        body: Stack(
          // clipBehavior: Clip.none, // Allows the image to overflow outside the card
          children: [
            Padding(
              padding: const EdgeInsets.only(top:250,right: 12,left: 12),
              child: Card(
                color: Colors.white60,
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 150), // Space for the image to overlap
                      Text(
                        'Easy way to monitor your expense',
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold,height: 1.0),textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 14),
                      Text(
                        'Safe your future by managing your expense right now',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20,color: Colors.grey),
                      ),
                      SizedBox(height: 56),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -140, // Adjust this value to control the overlap
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/landing.png',
                height: 570,
                width: 570,
              ),
            ),

            Positioned(
              bottom: 25, // Adjust as needed for positioning
              left: 34, // Adjust as needed for horizontal positioning
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(3, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == 0 ? Colors.blue : Colors.grey, // Active and inactive colors
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
          },
          backgroundColor: Colors.pink[200],
          child: Icon(Icons.arrow_forward, color: Colors.white,),
        ),

      );



  }

}