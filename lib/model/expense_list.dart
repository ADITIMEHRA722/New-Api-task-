class ExpenseList {
  final int status;
  final List<ExpenseItem> expenseList;

  ExpenseList({
    required this.status,
    required this.expenseList,
  });

  // Factory constructor to parse JSON into ExpenseList
  factory ExpenseList.fromJson(Map<String, dynamic> json) {
    final status = json['status'] as int;
    final expenseListData = json['expenseList'] as List<dynamic>;

    final expenseList = expenseListData
        .map((item) => ExpenseItem.fromJson(item as Map<String, dynamic>))
        .toList();

    return ExpenseList(
      status: status,
      expenseList: expenseList,
    );
  }

  // Method to serialize ExpenseList into JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'expenseList': expenseList.map((expense) => expense.toJson()).toList(),
    };
  }
}

class ExpenseItem {
  final String expenseName;
  final String description;
  final String? vendorName;
  final String? notes;
  final int cost;
  final String category;
  final String internalKeyForKnownExpenses;
  final String serviceId;

  ExpenseItem({
    required this.expenseName,
    required this.description,
    this.vendorName,
    this.notes,
    required this.cost,
    required this.category,
    required this.internalKeyForKnownExpenses,
    required this.serviceId,
  });

  // Factory constructor to parse JSON into ExpenseItem
  factory ExpenseItem.fromJson(Map<String, dynamic> json) {
    return ExpenseItem(
      expenseName: json['expenseName'] as String,
      description: json['description'] as String,
      vendorName: json['vendorName'] as String?,
      notes: json['notes'] as String?,
      cost: json['cost'] as int,
      category: json['category'] as String,
      internalKeyForKnownExpenses: json['internalKeyForKnownExpenses'] as String,
      serviceId: json['serviceId'] as String,
    );
  }

  // Method to serialize ExpenseItem into JSON
  Map<String, dynamic> toJson() {
    return {
      'expenseName': expenseName,
      'description': description,
      'vendorName': vendorName,
      'notes': notes,
      'cost': cost,
      'category': category,
      'internalKeyForKnownExpenses': internalKeyForKnownExpenses,
      'serviceId': serviceId,
    };
  }
}
