import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';

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
      title: 'Kurinai Beach',
      amount: 10000,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: 'Neflix',
      amount: 45000,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Pisgor',
      amount: 5000,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

  void _showModalNewExpense() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(_addExpense),
    );
  }

  void _addExpense(Expense newExpense) {
    setState(() {
      _registeredExpenses.add(newExpense);
    });
  }

  void _removeExpense(Expense item) {
    final removedIndex = _registeredExpenses.indexOf(item);

    setState(() {
      _registeredExpenses.remove(item);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Data di hapus...'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(removedIndex, item);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _registeredExpenses.sort((a, b) => b.date.compareTo(a.date));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pengeluaran'),
        actions: [
          IconButton(
            onPressed: _showModalNewExpense,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(
            child: ExpensesList(
              expenses: _registeredExpenses,
              onDismisableItem: _removeExpense,
            ),
          ),
        ],
      ),
    );
  }
}
