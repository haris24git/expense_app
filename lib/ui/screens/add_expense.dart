


import 'package:expense_app/ui/custom_widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/local/db_helper.dart';
import '../../data/models/expenses_model.dart';
import 'package:expense_app/domain/app_constants.dart';
import '../../domain/app_constants.dart';
import '../../domain/ui_helper.dart';
import '../custom_widgets/custom_button.dart';
import 'bloc/expense_bloc.dart';

class AddExpensePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AddExpensePageState();

}

class _AddExpensePageState extends State<AddExpensePage> {

  DBHelper db = DBHelper.getInstance();

  TextEditingController titleController = TextEditingController();

  TextEditingController descController = TextEditingController();

  TextEditingController amtController = TextEditingController();

  List<String> mType = ["Debit", "Credit", "Loan", "Borrow", "Lend"];

  String selectedType = "Debit";

  int selectedCatIndex = -1;

  DateTime? selectedDateTime;

  DateFormat df = DateFormat.MMMEd();

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
          title: Text('Add Expense'),
        ),

       body: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           children: [
             CustomTextfield(labelText: "Title", controller: titleController),
             mSpacer(),
             CustomTextfield(labelText: "Desc", controller: descController),
             mSpacer(),
             CustomTextfield(labelText: "Amount", controller: amtController),
             mSpacer(),

             DropdownMenu(
                 width: double.infinity,
                 label: Text('Expense Type'),
                 inputDecorationTheme: InputDecorationTheme(
                     fillColor: Colors.white,
                     filled: true,
                     enabledBorder: OutlineInputBorder(
                         borderSide: const BorderSide(
                           width: 1,
                           color: Colors.indigo,
                         ),
                         borderRadius: BorderRadius.circular(40)),
                     focusedBorder: OutlineInputBorder(
                         borderSide: const BorderSide(
                           width: 1,
                           color: Colors.indigo,
                         ),
                         borderRadius: BorderRadius.circular(40))),
                 initialSelection: selectedType,
                 onSelected: (value) {
                   selectedType = value!;
                 },

                 dropdownMenuEntries: mType.map((value) {
               return DropdownMenuEntry(value: value, label: value);
             }).toList()),
             mSpacer(),

             //Category sheet button
             InkWell(
               onTap: () {
                 showModalBottomSheet(                //bottom sheet code
                   context: context,
                   builder: (context) =>
                       Container(
                         padding: EdgeInsets.only(top: 11),
                         child: GridView.builder(
                             itemCount: AppConstant.mCat.length,
                             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                 crossAxisCount: 4),
                             itemBuilder: (_, index) {
                               return InkWell(
                                 onTap: () {
                                   selectedCatIndex = index;
                                   Navigator.pop(context);
                                   setState(() {});
                                 },
                                 child: Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Column(
                                     children: [
                                       Image.asset(
                                         AppConstant.mCat[index].cat_img,
                                         width: 30,
                                         height: 30,
                                       ),
                                       //Icon(Icons.account_circle_rounded, color: Colors.green, size: 50,),
                                       mSpacer(),
                                       Text(AppConstant.mCat[index].cat_title)
                                     ],
                                   ),
                                 ),
                               );
                             }),
                       ),
                 );
               },
               child: Container(                      //Button code
                 width: double.infinity,
                 height: 53,
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(40),
                   border: Border.all(
                     width: 1,
                     color: Colors.indigo,
                   ),
                 ),
                 child: selectedCatIndex >= 0
                     ? Center(
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Image.asset(
                             AppConstant.mCat[selectedCatIndex].cat_img),
                       ),
                       Text(
                           "-  ${AppConstant.mCat[selectedCatIndex].cat_title}")
                     ],
                   ),
                 )
                     : Center(
                     child: Text(
                       "Choose a Category",
                       style: TextStyle(fontSize: 16),
                     )),
               ),
             ),
             mSpacer(),



             //DataPicker Button
             InkWell(
               onTap: () async {
                 selectedDateTime = await showDatePicker(
                     context: context,
                     firstDate: DateTime(2023),
                     lastDate: DateTime.now());
                 setState(() {

                 });
               },
               child: Container(
                   width: double.infinity,
                   height: 53,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(40),
                     border: Border.all(
                       width: 1,
                       color: Colors.indigo,
                     ),
                   ),
                   child: Center(
                       child: Text(
                         df.format(selectedDateTime ?? DateTime.now()),
                         style: TextStyle(fontWeight: FontWeight.bold),
                       ))),
             ),
             mSpacer(),



             CustomButton(
                 title: "Add Expense",
                 onClick: () async {

               var prefs = await SharedPreferences.getInstance();
               int uid = prefs.getInt("UID") ?? 0;
               ///implement same with Bloc
               context.read<ExpenseBloc>().add(AddExpenseEvent(newExpense: ExpensesModel(
                   uid: uid,
                   amt: double.parse(amtController.text),
                   bal: 0,
                   cid: AppConstant.mCat[selectedCatIndex].cid,
                   title: titleController.text,
                   desc: descController.text,
                   exp_type: selectedType,
                   created_at: (selectedDateTime ?? DateTime.now()).millisecondsSinceEpoch.toString())));

               /* db.addExpense(expense: ExpensesModel(
                    uid: uid,
                    amt: double.parse(amtController.text),
                    bal: 0,
                    cid: AppConstant.mCat[selectedCatIndex].cid,
                    title: titleController.text,
                    desc: descController.text,
                    exp_type: selectedType,
                    created_at: (selectedDateTime ?? DateTime.now()).millisecondsSinceEpoch.toString()));*/


               // ScaffoldMessenger.of(context).showSnackBar(
               //
               //   const SnackBar(
               //     content: Text("Expense added!!"),
               //   ),
               // );

               Navigator.pop(context);


             }, loading: false),
             mSpacer(),
           ],
         ),
       ),
     );
  }

}