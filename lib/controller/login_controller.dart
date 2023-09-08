import 'package:book_app_task/api/api.dart';
import 'package:book_app_task/controller/expense_controller.dart';
import 'package:book_app_task/model/expense_list.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
 
  TextEditingController emailController = TextEditingController(); 
final expenseController = Get.put(ExpenseController());



 
final Dio _dio = Dio();
  Future<ExpenseList> fetchExpenses(String email) async {
    final response = await _dio.post(
      'https://staging.thenotary.app/doLogin',
      data: {'email': email},
    );

    if (response.statusCode == 200) {
      final data = response.data;
      final expenseList = data['expenseList'] as List<dynamic>;
        Get.snackbar(
            'Successfully',
            'Login Successfully',
            snackPosition: SnackPosition.BOTTOM,
          );
      final expenses = expenseList.map((item) {
        return ExpenseItem(
          expenseName: item['expenseName'],
          description: item['description'],
          vendorName: item['vendorName'],
          notes: item['notes'],
          cost: item['cost'],
          category: item['category'],
          internalKeyForKnownExpenses: item['internalKeyForKnownExpenses'],
          serviceId: item['serviceId'],
        );
      }).toList();

      return ExpenseList(status: data['status'], expenseList: expenses);
       

    } else {
      throw Exception(
       Get.snackbar(
            'Failed',
            'Failed to load expenses',
            snackPosition: SnackPosition.BOTTOM,
          ));
    }
  }
}



