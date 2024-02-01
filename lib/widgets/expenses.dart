import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Bakso Royal',
      amount: 18000,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Aqua Indomaret',
      amount: 8000,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Bakwan',
      amount: 10000,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Pisgor',
      amount: 5000,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
      ),
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
