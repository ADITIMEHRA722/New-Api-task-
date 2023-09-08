import 'package:book_app_task/controller/expense_controller.dart';
import 'package:book_app_task/login.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Expense App',
      home: LogInScreen(),
    );
  }
}

// class ExpensePage extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final RxList<String> expenses = <String>[].obs;
//   final expenseController = Get.put(ExpenseController());

//   Future<void> fetchExpenses(String email) async {
//     try {
//       final dio = Dio();
//       final response = await dio.post(
//         'https://staging.thenotary.app/doLogin',
//         data: {'email': email},
//       );

//       if (response.statusCode == 200) {
//         final Map<String, dynamic>? data = response.data; // Use nullable Map
//         if (data != null && data.containsKey('expenses')) {
//           final List<dynamic> expenseList = data['expenses'];

//           final box = GetStorage();
//           box.write('expenses', expenseList);

//           // Update the observable expenses list with the data
//           expenses.assignAll(expenseList.map((e) => e.toString()));
//         } else {
//           Get.snackbar(
//             'Error',
//             'Failed to fetch expenses. Please try again later.',
//             snackPosition: SnackPosition.BOTTOM,
//           );
//         }
//       } else {
//         Get.snackbar(
//           'Error',
//           'Failed to fetch expenses. Please try again later.',
//           snackPosition: SnackPosition.BOTTOM,
//         );
//       }
//     } catch (error) {
//       print("Error $error");
//       Get.snackbar(
//         'Error',
//         'An error occurred: $error',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     }
//   }

 
 
 
 
//   @override
//   Widget build(BuildContext context) {
//     final box = GetStorage();
//     final storedExpenses = box.read<List<dynamic>>('expenses');

//     if (storedExpenses != null && storedExpenses.isNotEmpty) {
//       // If storedExpenses is not null and not empty, update the expenses list with it
//       expenses.assignAll(storedExpenses.map((e) => e.toString()));
//     }
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Expense App'),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 'Enter your email:',
//                 style: TextStyle(fontSize: 18),
//               ),
//               SizedBox(height: 10),
//               Container(
//                 width: 300,
//                 child: TextField(
//                   controller: emailController,
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                     hintText: 'Email',
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () async {
//                   // final email = 'demo@gmail.com'; // Set the email as required.

//                   final email = emailController.text;
//                   await fetchExpenses(email);
//                   if (email.isNotEmpty) {
//                     fetchExpenses(email);
//                   } else {
//                     Get.snackbar(
//                       'Error',
//                       'Please enter an email address.',
//                       snackPosition: SnackPosition.BOTTOM,
//                     );
//                   }
//                 },
//                 child: Text('Submit'),
//               ),
//               SizedBox(height: 20),
//               Obx(() {
//                 if (expenses.isEmpty) {
//                   return Text('Expenses will be displayed here.');
//                 } else {
//                   return Expanded(
//                     child: Obx(
//                       () => ListView.builder(
//                         itemCount: expenseController.expenses.length,
//                         itemBuilder: (context, index) {
//                           final expense = expenseController.expenses[index];
//                           return ListTile(
//                             title: Text(expense.expenseName),
//                             subtitle: Text(expense.expenseName),
//                           );
//                         },
//                       ),
//                     ),
//                   );
//                 }
//               }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
