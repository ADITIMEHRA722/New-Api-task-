import 'package:book_app_task/controller/expense_controller.dart';
import 'package:book_app_task/controller/login_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ExpensesScreen extends StatelessWidget {
  ExpensesScreen({super.key});

  final loginController = Get.put(LoginController());
  final expenseController = Get.put(ExpenseController());
  final TextEditingController searchController = TextEditingController();

// Function to handle refreshing expenses
  void refreshExpenses() {
    // Call a function in your ExpenseController to reset or refresh the expenses data
    expenseController.refreshExpenses();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Expenses List', style: TextStyle(
          color: Colors.black
        ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                
                            height: 50,

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                                
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder:  OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey), 
                        
                        ),
                    
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue), 
                        
                        ),
                        
                      
                    hintText: 'Search by expenseName',
                    prefixIcon: Icon(Icons.search),
                  ),
                  
                  onChanged: (query) {
                    // Call a function to filter expenses based on the query
                    expenseController.filterExpenses(query);
                  },
                ),
              ),
            ),
            Obx(() {
              if (expenseController.expenses.value.status == 0) {
                return Text('Expenses will be displayed here.');
              } else {
                return ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        expenseController.expenses.value.expenseList.length,
                    itemBuilder: (context, index) {
                      final expense =
                          expenseController.expenses.value.expenseList[index];
                      return ListTile(
                        title: Container(
                            decoration: BoxDecoration(),
                            child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.blue)),
                                child: Center(
                                    child: Text(
                                  expense.expenseName,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                )))),
                        subtitle: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.blue)),
                            child: Center(
                                child: Text(expense.description,
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 18)))),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ));
              }
            }),
          ],
        ),
      ),
    
     floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.black,
        onPressed: refreshExpenses, // Call the refresh function when the FAB is pressed
        child: Icon(Icons.refresh),
      ),
    );
  }
}
