import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    required this.expenses,
    required this.onDismisableItem,
    super.key,
  });

  final List<Expense> expenses;
  final void Function(Expense) onDismisableItem;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          onDismisableItem(expenses[index]);
        },
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
