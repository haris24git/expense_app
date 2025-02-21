// import 'package:expense_app/ui/screens/statistic_page.dart';
// import 'package:expense_app/ui/screens/user_onboarding/splash_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'add_expense.dart';
//
// void main(){
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'app',
//       home: SplashScreen(),
//     );
//   }
//
// }
//
// class HomePage extends StatelessWidget{
//
//   // Static list of items for the DropdownButton
//   static const List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
//
//   // Static selected value
//   static String? selectedValue;
//
//   final List<Map<String, dynamic>> data = [
//     {
//       'date': 'Tuesday 14',
//       'amount': '-\$1380',
//       'expenses': [
//         {
//           'name': 'Shop',
//           'message': 'Buy new cloths',
//           'price': '-\$90',
//           "image": "assets/images/cart.png",
//         },
//         {
//           'name': 'Electronics',
//           'message': 'Buy new Iphone16',
//           'price': '-\$1290',
//           'image': 'assets/images/mobile.png',
//         },
//       ],
//     },
//     {
//       'date': 'Wednesday 15',
//       'amount': '-\$980',
//       'expenses': [
//         {
//           'name': 'Transportation',
//           'message': 'Trip to Hyderabad',
//           'price': '-\$980',
//           'image': 'assets/images/car.png',
//         },
//       ],
//     },
//   ];
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Padding(
//           padding: const EdgeInsets.only(bottom: 18.0),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Image.asset('assets/images/logo.png', height: 32,),
//               SizedBox(
//                 width: 4,
//               ),
//               Text('Monety',style: TextStyle(fontSize:22,fontWeight: FontWeight.bold),),
//               Spacer(),
//               InkWell(
//                 onTap: () {},
//                 child: Icon(Icons.search, size: 37,),
//               )
//             ],
//
//           ),
//         ),
//         automaticallyImplyLeading: false,
//       ),
//
//       body: Padding(
//         padding: const EdgeInsets.only(left: 14,right: 14,top: 4),
//         child: ListView(   //list view makes body scrollable
//           children: [
//             Row(
//               children: [
//                 Container(
//                   width: 50,
//                   height: 50,
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       image : DecorationImage(
//                         fit: BoxFit.cover,
//                         image: NetworkImage("https://t4.ftcdn.net/jpg/02/24/86/95/360_F_224869519_aRaeLneqALfPNBzg0xxMZXghtvBXkfIA.jpg"),
//                       )
//                   ),
//                 ),
//                 SizedBox(
//                   width: 12,
//                 ),
//                 Column(
//                   children: [
//                     Text('Good Morning',style: TextStyle(fontSize:16,color: Colors.grey),),
//                     Text('harishashmi',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
//
//                   ],
//                 ),
//
//                 Spacer(),
//
//                 Padding(
//                   padding: const EdgeInsets.only(right: 8.0),
//                   child: Container(
//                     width: 124,
//                     height: 36,
//                     decoration: BoxDecoration(
//                       color: Color(0xffeff1fe), // Background color of the dropdown button
//                       borderRadius: BorderRadius.circular(8), // Optional: rounded corners
//                     ),
//                     child:  DropdownButton<String>(
//                       value: selectedValue,
//                       hint: Text(' This month',style: TextStyle(fontSize: 19,color:Colors.black),),
//                       onChanged: (String? newValue) {
//                         // setState(() {
//                         //   selectedValue = newValue;
//                         // });
//                       },
//                       items: items.map<DropdownMenuItem<String>>((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                       style: TextStyle(color: Colors.black), // Text color for selected item
//                       dropdownColor: Colors.red.shade100, // Background color of the dropdown menu
//                       icon: Icon(Icons.keyboard_arrow_down, color: Colors.black), // Dropdown arrow icon color
//                       // To remove the underline below the text
//                       underline: SizedBox(),
//                     ),
//                   ),
//                 )
//
//               ],
//             ),
//
//             SizedBox(
//               height: 12,
//             ),
//
//
//             Stack(
//               children: [
//                 Card(
//                   color: Colors.indigo,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0), // Padding inside the card
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align text group and image at opposite sides
//                       crossAxisAlignment: CrossAxisAlignment.center, // Align text and image vertically
//                       children: [
//                         // Text group aligned to the left
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start of the column
//                           children: [
//                             Text(
//                               'Expense total',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 12,
//                             ),
//                             Text(
//                               '\$3,734',
//                               style: TextStyle(
//                                 fontSize: 34,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             Row(
//                               children: [
//                                 Container(
//                                   width:70,
//                                   height: 34,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(9),
//                                     color: Colors.red,
//                                   ),
//                                   child: Center(child: Text('+\$240',style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),)),
//                                 ),
//                                 SizedBox(
//                                   width: 12,
//                                 ),
//                                 Text('than last month',style: TextStyle(fontSize: 14,color: Colors.white),),
//                               ],
//                             )
//                           ],
//                         ),
//
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: 25,
//                   left: 200,
//                   right: 0,
//                   child: Image.asset(
//                     'assets/images/home.png',
//                     height: 120,
//                     width: 120,
//                   ),
//                 ),
//
//               ],
//             ),
//
//             SizedBox(
//               height: 12,
//             ),
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 5.0),
//                   child: Text('Expense List', style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
//                 ),
//               ],
//             ),
//
//             SizedBox(
//               height: 12,
//             ),
//
//             SizedBox(
//               height: 360,
//               child: ListView.builder(
//                 itemCount: data.length,
//                 itemBuilder: (context, index) {
//                   final item = data[index];
//                   return Card(
//                     color: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       side: BorderSide(
//                         color: Colors.grey,
//                         width: 1,
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Row for date and amount
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 item['date'],
//                                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                               ),
//                               Text(
//                                 item['amount'],
//                                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                           Divider(
//                             color: Colors.grey, // Line color
//                             thickness: 1, // Line thickness
//                             height: 20, // Space around the line
//                           ),
//                           // Nested ListView.builder for expenses listing
//                           ListView.builder(
//                             shrinkWrap: true, // Ensures it fits within the parent
//                             // physics: NeverScrollableScrollPhysics(), // Disables scrolling for inner ListView
//                             itemCount: item['expenses'].length,
//                             itemBuilder: (context, contactIndex) {
//                               final expense = item['expenses'][contactIndex];
//                               return ListTile(
//                                 leading: Container(
//                                   width: 50, // Set the desired width
//                                   height: 50, // Set the desired height
//                                   decoration: BoxDecoration(
//                                     color: Colors.grey[200], // Placeholder background color
//                                     borderRadius: BorderRadius.circular(4.0), // Rounded corners
//                                     image: DecorationImage(
//                                       image: AssetImage(expense['image']),
//                                       fit: BoxFit.cover, // Ensure the image fills the square
//                                     ),
//                                   ),
//                                 ),
//                                 title: Text(
//                                   expense['name'],
//                                   style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
//                                 ),
//                                 subtitle: Text(expense['message']),
//                                 trailing: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       expense['price'],
//                                       style: TextStyle(fontSize: 20,color: Colors.pinkAccent),
//                                     ),
//
//
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//
//
//
//           ],
//
//         ),
//
//
//
//       ),
//
//
//
//       // bottomNavigationBar: BottomNavigationBar(
//       //   backgroundColor: Colors.grey,
//       //   items: const <BottomNavigationBarItem>[
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.home, size: 30,),
//       //       label: 'Home',
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.stacked_bar_chart_outlined, size: 30,),
//       //       label: 'Home',
//       //
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.add,size: 30,),
//       //       label: 'Home',
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.notifications, size: 30,),
//       //       label: 'Search',
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.person, size: 30,),
//       //       label: 'Profile',
//       //     ),
//       //   ],
//       //   currentIndex: 0, // please fix it because its stateless
//       //   selectedItemColor: Colors.blue,
//       //   unselectedItemColor: Colors.grey,
//       //   onTap: (index) {
//       //     // Navigation Logic
//       //     switch (index) {
//       //       case 0:
//       //         Navigator.push(
//       //           context,
//       //           MaterialPageRoute(builder: (context) => HomePage()),
//       //         );
//       //         break;
//       //       case 1:
//       //         Navigator.push(
//       //           context,
//       //           MaterialPageRoute(builder: (context) => StatsticPage()),
//       //         );
//       //         break;
//       //       case 2:
//       //         Navigator.push(
//       //           context,
//       //           MaterialPageRoute(builder: (context) => HomePage()),
//       //         );
//       //         break;
//       //     }
//       //   },
//       // ),
//
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => AddExpensePage(),
//               ));
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
//
// }