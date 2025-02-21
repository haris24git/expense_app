import 'dart:math';

import 'package:expense_app/ui/screens/statistic_page.dart';
import 'package:expense_app/ui/screens/user_onboarding/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/local/db_helper.dart';
import '../../data/models/expense_filter_model.dart';
import 'package:expense_app/data/models/expenses_model.dart';
import '../../domain/app_constants.dart';
import 'add_expense.dart';
import 'bloc/expense_bloc.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ExpenseBloc(db: DBHelper.getInstance()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'app',
      home: SplashScreen(),
    );
  }

}

class HomePage extends StatefulWidget{

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<ExpenseFilterModel> filteredExpenses = [];

  // Static selected value
  // final List<Map<String, dynamic>> data = [
  //   {
  //     'date': 'Tuesday 14',
  //     'amount': '-\$1380',
  //     'expenses': [
  //       {
  //         'name': 'Shop',
  //         'message': 'Buy new cloths',
  //         'price': '-\$90',
  //         "image": "assets/images/cart.png",
  //       },
  //       {
  //         'name': 'Electronics',
  //         'message': 'Buy new Iphone16',
  //         'price': '-\$1290',
  //         'image': 'assets/images/mobile.png',
  //       },
  //     ],
  //   },
  //   {
  //     'date': 'Wednesday 15',
  //     'amount': '-\$980',
  //     'expenses': [
  //       {
  //         'name': 'Transportation',
  //         'message': 'Trip to Hyderabad',
  //         'price': '-\$980',
  //         'image': 'assets/images/car.png',
  //       },
  //     ],
  //   },
  // ];


  @override
  void initState() {
    super.initState();
    context.read<ExpenseBloc>().add(FetchFilteredExpense(type: 0));
  }

  String selectedFilter = "Date wise";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),

            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: 40,
                  width: 40,
                ),
                SizedBox(width: 20),
                Text(
                  "Monety",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Spacer(),
                Icon(Icons.search, size: 28),
              ],
            ),
            const SizedBox(height: 20),

            // Greeting and Filter Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        Container(
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/U4.jpg",
                              height: 60,
                              width: 60,
                              fit: BoxFit.cover, // Ensures the image fills the circle properly
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Good Morning",
                                style: TextStyle(color: Colors.grey, fontSize: 16)),
                            Text(
                              "Haris Hashmi",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ],
                ),
                DropdownButton<String>(
                  value: selectedFilter,
                  onChanged: (String? newValue) {

                    int selectedType=0;

                    if(newValue=="Date wise"){
                      selectedType=0;
                    } else if(newValue=="Month wise"){
                      selectedType=1;
                    } else if(newValue=="Year wise") {
                      selectedType=2;
                    } else {
                      selectedType=3;
                    }
                    context.read<ExpenseBloc>().add(FetchFilteredExpense(type: selectedType));
                    setState(() {
                      selectedFilter = newValue!;
                    });
                  },
                  items: <String>["Date wise", "Month wise", "Year wise", "Cat wise"]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Expense Total Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF727DD6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Expense total",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                      const SizedBox(height: 8),
                      Text("\$3,734",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "+\$240",
                              style:
                              TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text("than last month",
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Image.asset(
                    "assets/images/home.png",
                    height: 85,
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Expense List Title
            Text(
              "Expense List",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Expense List
            Expanded(
              child:
              BlocBuilder<ExpenseBloc, ExpenseState>(
                  builder: (_, state) {
                    if (state is ExpenseLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state is ExpenseErrorState) {
                      return Center(
                        child: Text(state.errorMsg),
                      );
                    }

                    if (state is ExpenseFilterLoadedState) {


                      return state.mFilteredExpenses.isNotEmpty
                          ? ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: state.mFilteredExpenses.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // Navigate to StatisticPage
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            },
                            child: state.mFilteredExpenses[index].allExpenses.isNotEmpty ? Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Color(0xFFF5F5F5),
                                border: Border.all(
                                    color:  Colors.grey.shade400,
                                    width: 1
                                ),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade200,
                                    blurRadius: 6,
                                    offset: Offset(0, 4),
                                  )
                                ],
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(state.mFilteredExpenses[index].type,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold
                                          )),
                                      Spacer(),
                                      Text(
                                        "\$${state.mFilteredExpenses[index].balance}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: state.mFilteredExpenses[index].balance < 0
                                              ? Colors.red
                                              : Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Divider(),
                                  ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: state.mFilteredExpenses[index].allExpenses.length,
                                      itemBuilder: (_, childIndex){
                                        return ListTile(
                                          contentPadding: EdgeInsets.zero,
                                          leading: Container(
                                            padding: EdgeInsets.all(7),
                                            width: 50,
                                            height: 50,
                                            child: Image.asset(AppConstant.mCat.where((eachCat){
                                              return eachCat.cid==state.mFilteredExpenses[index].allExpenses[childIndex].cid;
                                            }).toList()[0].cat_img),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(11),
                                                color: Colors.primaries[Random().nextInt(Colors.primaries.length-1)].shade100
                                            ),
                                          ),
                                          title: Text(state.mFilteredExpenses[index].allExpenses[childIndex].title,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          subtitle: Text(state.mFilteredExpenses[index].allExpenses[childIndex].desc,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey)),
                                          trailing: Text(
                                            "\$${state.mFilteredExpenses[index].allExpenses[childIndex].amt}",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: state.mFilteredExpenses[index].allExpenses[childIndex].amt! < 0
                                                  ? Colors.red
                                                  : Colors.green,
                                            ),
                                          ),
                                        );
                                      })
                                ],
                              ),
                            ) : Container(),
                          );
                        },
                      )
                          : Center(
                        child: Text('No Expenses yet!!'),
                      );
                    }

                    return Container();
                  }),
            ),
          ],
        ),
      ),






floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddExpensePage(),
              ));
        },
        child: Icon(Icons.add),
      ),


    );

  }
}