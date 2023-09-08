

import 'dart:convert';

import 'package:book_app_task/model/expense_list.dart';
import 'package:dio/dio.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ExpenseController extends GetxController {

  final Rx<ExpenseList> expenses = ExpenseList(status: 0, expenseList: []).obs;


 final String _localStorageKey = 'expenses'; // Key for local storage

  @override
  void onInit() {
    super.onInit();
    // Load expenses data from local storage when the controller is initialized
    final storedData = GetStorage().read(_localStorageKey);
    if (storedData != null) {
      final expenseList = ExpenseList.fromJson(storedData);
      setExpenses(expenseList);
    }
  }


  void setExpenses(ExpenseList data) {
    expenses.value = data;
  }





void filterExpenses(String query) {
  if (query.isEmpty) {
    // Reset the filtered expenses if the query is empty
    final originalExpenses = Get.find<ExpenseController>().expenses.value;
    expenses.value = ExpenseList(
      status: originalExpenses.status,
      expenseList: List.from(originalExpenses.expenseList), // Create a copy of the original list
    );
    expenses.refresh();
    return;
  }

  // Filter the expenses based on the query
  final filteredExpenses = expenses.value.expenseList.where((expense) {
    return expense.expenseName.toLowerCase().contains(query.toLowerCase()) ||
        (expense.expenseName != null &&
            expense.expenseName!.toLowerCase().contains(query.toLowerCase()));
  }).toList();

  // Create a new ExpenseList instance with the filtered data
  final filteredExpenseList = ExpenseList(
    status: expenses.value.status,
    expenseList: filteredExpenses,
  );

  // Update the observable expenses with the new filtered data
  expenses.value = filteredExpenseList;

  // Refresh the data to notify listeners
  expenses.refresh();
}

void refreshExpenses() {
   
    final storedData = GetStorage().read(_localStorageKey);
    if (storedData != null) {
      final expenseList = ExpenseList.fromJson(storedData);
      setExpenses(expenseList);
    }
  }

 



}
