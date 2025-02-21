import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatsticPage extends StatelessWidget{
  // Static list of items for the DropdownButton
  static const List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  // Static selected value
  static String? selectedValue;

  final List<double> dynamicData = [1200, 900, 600, 300, 200]; // Dynamic values for the graph lines


  final List<Map<String, dynamic>> sections = [
    {'percentage': 30, 'color': Colors.red},
    {'percentage': 25, 'color': Colors.blue},
    {'percentage': 15, 'color': Colors.green},
    {'percentage': 10, 'color': Colors.orange},
    {'percentage': 5, 'color': Colors.purple},
    {'percentage': 5, 'color': Colors.red},
  ];

  List<Map<String, dynamic>> expenseItems = [
    {
      'image': 'assets/images/mobile.png',
      'title': 'Home',
      'price': '-\$1190',
    },
    {
      'image': 'assets/images/cart.png',
      'title': 'Work',
      'price': '-\$867',
    },
    {
      'image': 'assets/images/car.png',
      'title': 'School',
      'price': '-\$569',
    },
    {
      'image': 'assets/images/mobile.png',
      'title': 'Fitness',
      'price': '-\$987',
    },
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/logo.png', height: 32,),
              SizedBox(
                width: 4,
              ),
              Text('Monety',style: TextStyle(fontSize:22,fontWeight: FontWeight.bold),),
              Spacer(),
              InkWell(
                onTap: () {},
                child: Icon(Icons.search, size: 37,),
              )
            ],

          ),
        ),
        automaticallyImplyLeading: false,
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Ensures children align properly
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      'Statistic',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,),
                    ),
                  ),
                  Spacer(),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 124,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Color(0xffeff1fe), // Background color of the dropdown button
                        borderRadius: BorderRadius.circular(8), // Optional: rounded corners
                      ),
                      child:  DropdownButton<String>(
                        value: selectedValue,
                        hint: Text(' This month',style: TextStyle(fontSize: 19,color:Colors.black),),
                        onChanged: (String? newValue) {
                          // setState(() {
                          //   selectedValue = newValue;
                          // });
                        },
                        items: items.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        style: TextStyle(color: Colors.black), // Text color for selected item
                        dropdownColor: Colors.red.shade100, // Background color of the dropdown menu
                        icon: Icon(Icons.keyboard_arrow_down, color: Colors.black), // Dropdown arrow icon color
                        // To remove the underline below the text
                        underline: SizedBox(),
                      ),
                    ),
                  ),
                ],
              ),

              Card(
                 color: Colors.indigo,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(11),
                 ),


                   child: Padding(
                     padding: const EdgeInsets.only(top: 15.0,bottom: 8,left: 16,right: 8),
                     child: Column(
                       children: [
                         Row(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text('Total expense', style: TextStyle(fontSize: 20,color: Colors.white),),
                             Spacer(),
                             Container(
                               height: 30,
                               width: 30,
                               decoration: BoxDecoration(
                                 color: Colors.white38,
                                 border: Border.all(width:2,color: Colors.transparent),
                                 // borderRadius: BorderRadius.circular(21)
                                 shape: BoxShape.circle,
                               ),

                                 child: IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz),
                                   padding: EdgeInsets.zero, // Removes default padding
                                   constraints: BoxConstraints(), // Removes size constraints
                                 )),
                           ],
                         ),

                         SizedBox(
                           height: 3,
                         ),

                         Row(
                           children: [
                             Text('\$3,734',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.white),),
                             Text('  / \$4,000 per month',style: TextStyle(fontSize: 16,color: Colors.white),)
                           ],
                         ),

                         SizedBox(
                           height: 9,
                         ),

                         LinearProgressIndicator(
                           borderRadius: BorderRadius.circular(12),
                           value: 0.8, // Progress value (0.0 to 1.0)
                           minHeight: 4, // Thickness of the line
                           backgroundColor: Colors.white38, // Line background color
                           valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent), // Active color
                         ),

                         SizedBox(
                           height: 10,
                         ),


                       ],
                     ),


                   ),


              ),

              SizedBox(
                height: 12,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Expense Breakdown', style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                          Text('Limit \$900 / week', style: TextStyle(fontSize:14,fontWeight: FontWeight.bold,color: Colors.grey),)
                        ],
                      ),

                    Spacer(),


                    Container(
                        width: 85,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Color(0xffeff1fe), // Background color of the dropdown button
                          borderRadius: BorderRadius.circular(8), // Optional: rounded corners
                        ),
                        child:  DropdownButton<String>(
                          value: selectedValue,
                          hint: Padding(
                            padding: const EdgeInsets.only(right: 6.0,left: 6),
                            child: Text('Week',style: TextStyle(fontSize: 19,color:Colors.black),),
                          ),
                          onChanged: (String? newValue) {
                            // setState(() {
                            //   selectedValue = newValue;
                            // });
                          },
                          items: items.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          style: TextStyle(color: Colors.black), // Text color for selected item
                          dropdownColor: Colors.red.shade100, // Background color of the dropdown menu
                          icon: Icon(Icons.keyboard_arrow_down, color: Colors.black), // Dropdown arrow icon color
                          // To remove the underline below the text
                          underline: SizedBox(),
                        ),
                      ),

                  ],
                ),
              ),

              // SizedBox(
              //   height: 4,
              // ),


              // Padding(
              //   padding: const EdgeInsets.only(left: 12.0, right: 12, top: 0),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start, // Align the column to the left
              //     children: [
              //       // Container for the graph
              //       Container(
              //         height: 220, // Height of the graph
              //         child: Row(
              //           children: [
              //             // Column for the left-side numbers (readings)
              //             Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: List.generate(5, (index) {
              //                 double reading = 1200 - index * 300; // Reverse readings (1200, 900, 600, 300, 0)
              //                 return Padding(
              //                   padding: const EdgeInsets.symmetric(vertical: 8.0),
              //                   child: Text(
              //                     '\$${reading.toStringAsFixed(0)}', // Display the reading
              //                     style: TextStyle(fontSize: 14,color: Colors.grey),
              //                   ),
              //                 );
              //               }),
              //             ),
              //             // Column for the vertical lines and the red horizontal line
              //             Expanded(
              //               child: Stack(
              //                 children: [
              //                   // Red horizontal line to denote the highest point
              //                   Positioned(
              //                     top: 40.0, // Position the red line at the highest value (adjust this value if needed)
              //                     left: 0,
              //                     right: 0,
              //                     child: Container(
              //                       height: 2, // Height of the red line
              //                       color: Colors.red, // Color of the line
              //                     ),
              //                   ),
              //                   // Vertical lines
              //                   Row(
              //                     children: List.generate(5, (index) {
              //                       // Sample data for the statistic lines
              //                       double lineHeight = (index + 1) * 35.0; // Dynamic height for each line
              //                       Color lineColor = Colors.primaries[index % Colors.primaries.length]; // Different color for each line
              //
              //                       return Expanded(
              //                         child: Padding(
              //                           padding: const EdgeInsets.symmetric(horizontal: 4.0), // Reduced space between lines
              //                           child: Column(
              //                             mainAxisAlignment: MainAxisAlignment.end, // Align items to the bottom
              //                             children: [
              //                               // Thick and colored vertical line
              //                               Container(
              //                                 width: 35, // Increased thickness of the line
              //                                 height: lineHeight, // Dynamic height for the line
              //                                 color: lineColor, // Line color
              //                               ),
              //                               // X-Axis Labels just below each vertical line
              //                               Text(
              //                                 'W${1 + (index * 1)}', // Labels for each line (W1, W2, ...)
              //                                 style: TextStyle(fontSize: 14,color: Colors.grey),
              //                               ),
              //                             ],
              //                           ),
              //                         ),
              //                       );
              //                     }),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),


            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12, top: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align the column to the left
                children: [
                  // Container for the graph
                  Container(
                    height: 220, // Height of the graph
                    child: Row(
                      children: [
                        // Static Column for the left-side numbers (readings)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) {
                            double reading = 1200 - index * 300; // Static readings (1200, 900, 600, 300, 0)
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                '\$${reading.toStringAsFixed(0)}', // Display the static reading
                                style: TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            );
                          }),
                        ),
                        // Column for the vertical lines and the red horizontal line
                        Expanded(
                          child: Stack(
                            children: [
                              // Red horizontal line to denote the highest point
                              Positioned(
                                top: 40.0, // Position the red line at the highest value (adjust this value if needed)
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 2, // Height of the red line
                                  color: Colors.red, // Color of the line
                                ),
                              ),
                              // Vertical lines
                              Row(
                                children: List.generate(5, (index) {
                                  // Sample data for the statistic lines
                                  double dynamicValue = dynamicData[index]; // Get dynamic value from the list
                                  double lineHeight = (dynamicValue / 1200) * 140; // Dynamic height for each line based on left-side values

                                  // Different color for each line
                                  Color lineColor = Colors.primaries[index % Colors.primaries.length];

                                  return Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 4.0), // Reduced space between lines
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end, // Align items to the bottom
                                        children: [
                                          // Thick and colored vertical line
                                          Container(
                                            width: 35, // Increased thickness of the line
                                            height: lineHeight, // Dynamic height for the line
                                            color: lineColor, // Line color
                                          ),
                                          // X-Axis Labels just below each vertical line (Static)
                                          Text(
                                            'W${index + 1}', // Static labels for each line (W1, W2, W3, W4, W5)
                                            style: TextStyle(fontSize: 14, color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Spending Details', style: TextStyle(fontSize:23,fontWeight: FontWeight.bold),),
                    Text('Your expenses are divided into 6 categories',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.grey),),


                  ],
                ),
              ),



          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Horizontal divider
                Row(
                  children: sections.map((section) {
                    return Expanded(
                      flex: section['percentage'],
                      child: Container(
                        height: 6, // Height of the divider
                        color: section['color'], // Dynamic color
                      ),
                    );
                  }).toList(),
                ),
                // Row for percentage labels
                Row(
                  children: sections.map((section) {
                    return Expanded(
                      flex: section['percentage'],
                      child: section['color'] != Colors.transparent // Skip label for transparent sections
                          ? Center(
                        child: Text(
                          '${section['percentage']}%', // Dynamic percentage
                          style: TextStyle(fontSize: 14),
                        ),
                      )
                          : SizedBox(),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),










              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 11,
                  mainAxisSpacing: 18,
                  childAspectRatio: 2 / 1,
                ),
                itemCount: expenseItems.length,
                itemBuilder: (context, index) {
                  final item = expenseItems[index];
                  return Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Icon/Image Container
                            Container(
                              padding: EdgeInsets.all(5),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.primaries[Random().nextInt(Colors.primaries.length-1)].shade50,
                                borderRadius: BorderRadius.circular(4.0),
                                // image: DecorationImage(
                                //   image: AssetImage(item['image']),
                                //   fit: BoxFit.cover,
                                // ),
                              ),
                              child: Image.asset(item['image']),
                            ),
                            SizedBox(width: 15),
                            // Text Column
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    item['title'],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis, // Prevent overflow
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    item['price'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[700],
                                    ),
                                    // overflow: TextOverflow.ellipsis, // Prevent overflow
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),






            ],
          ),
        ),
      ),


    );
  }

}