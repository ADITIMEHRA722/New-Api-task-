
import 'package:book_app_task/controller/expense_controller.dart';
import 'package:book_app_task/controller/login_controller.dart';
import 'package:book_app_task/expenses_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInScreen extends StatelessWidget {
  final loginController = Get.put(LoginController());
  final expenseController = Get.put(ExpenseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      body:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[ 
              SizedBox(height: 10),
              Center(
                child: Container(
                  width: 300,
                  child: TextField(
                    controller: loginController.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                      )
                    ),
                    
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style:  ElevatedButton.styleFrom(
                  primary: Colors.black, 
                  shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0))),
                  
                  
                onPressed: () async {
                  final email = loginController.emailController.text;
                  final expenseList = await loginController.fetchExpenses(email);
                  expenseController.setExpenses(expenseList);
                  Get.to(ExpensesScreen());
                },
                child: Text('Login'),
              ),
              SizedBox(height: 20),
             
            ],
          ),
        
      
    );
  }
}

