import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:finance_tracker_app/models/category_model.dart';
import 'package:finance_tracker_app/models/transaction_model.dart';
import 'package:finance_tracker_app/models/transactionsType/expense_transaction.dart';
import 'package:finance_tracker_app/models/transactionsType/income_transacrion.dart';
import 'package:finance_tracker_app/models/transactionsType/saving_transaction.dart';
import 'package:finance_tracker_app/models/transactionsType/transactions_type.dart';
import 'package:finance_tracker_app/statemanagement/cubit/transaction_cubit.dart';
import 'package:finance_tracker_app/statemanagement/cubit/transaction_page_cubit.dart';

class TransactionScreen extends StatefulWidget {
  final Transaction? transaction;

  const TransactionScreen({super.key, this.transaction});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final List<TransactionType> type = [
    IncomeTransacrion(),
    ExpenseTransaction(),
    SavingTransaction(),
  ];

  late Transaction transaction;
  late TransactionPageCubit cubit;

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  final TextEditingController amountController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  @override
  void initState() {
    super.initState();

    transaction =
        widget.transaction ??
        Transaction(
          id: context.read<TransactionCubit>().getTransactionBoxLength() + 1,
          amount: 0,
          type: type[0].transactionTypeName,
          category: type[0].categories[0].name,
          date: DateTime.now().toIso8601String(),
          time: DateFormat('HH:mm a').format(DateTime.now()),
          notes: "",
        );

    // Set the first category of the selected transaction type
    final initialCategoryList = type[0].categories;
    final initialCategory =
        initialCategoryList.isNotEmpty
            ? initialCategoryList.first
            : CategoryModel(
              name: '',
              color: Colors.transparent,
              icon: Icons.category,
            );

    cubit = TransactionPageCubit(transaction, initialCategory);

    amountController.text = transaction.amount.toString();
    dateController.text = DateFormat(
      'yyyy-MM-dd',
    ).format(DateTime.parse(transaction.date));
    timeController.text = transaction.time;
    categoryController.text = initialCategory.name;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: DefaultTabController(
        length: type.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Add Transaction'),
            bottom: TabBar(
              tabs: type.map((t) => Tab(text: t.transactionTypeName)).toList(),
              onTap: (index) {
                cubit.transaction.type = type[index].transactionTypeName;

                // Set category to the first available category when switching tabs
                final categoryList = type[index].categories;
                if (categoryList.isNotEmpty) {
                  cubit.currentCategory = categoryList.first;
                  cubit.transaction.category = categoryList.first.name;
                  categoryController.text = categoryList.first.name;
                } else {
                  categoryController.clear();
                }

                cubit.updateTransactionPage();
              },
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child: BlocBuilder<TransactionPageCubit, TransactionPageState>(
              builder: (context, state) {
                return Column(
                  children: [
                    _buildTextField(
                      controller: amountController,
                      label: "Amount",
                      icon: Icons.attach_money,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        transaction.amount = double.tryParse(value) ?? 0;
                        cubit.updateTransactionPage();
                      },
                    ),
                    _buildTextField(
                      controller: notesController,
                      label: "Notes",
                      icon: Icons.note,
                      maxLines: 5,
                      onChanged: (value) {
                        transaction.notes = value;
                        cubit.updateTransactionPage();
                      },
                    ),
                    _buildReadOnlyTextField(
                      controller: dateController,
                      label: "Date",
                      icon: Icons.calendar_today,
                      onTap: () => _selectDate(context),
                    ),
                    _buildReadOnlyTextField(
                      controller: timeController,
                      label: "Time",
                      icon: Icons.access_time,
                      onTap: () => _selectTime(context),
                    ),
                    _buildCategorySelector(),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (cubit.transaction.amount == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Amount cannot be zero"),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 2),
                            ),
                          );
                        } else {
                          log(cubit.transaction.toString());
                        }
                      },
                      child: const Text("Add"),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    void Function(String)? onChanged,
    void Function()? onTap, // <-- Added onTap parameter
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(),
        ),
        onChanged: onChanged,
        readOnly: onTap != null, // Make it read-only if onTap is provided
        onTap: onTap, // <-- Assign onTap
      ),
    );
  }

  Widget _buildReadOnlyTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    void Function()? onTap,
  }) {
    return _buildTextField(
      controller: controller,
      label: label,
      icon: icon,
      onChanged: null,
      onTap: onTap,
    );
  }

  Widget _buildCategorySelector() {
    return TextField(
      controller: categoryController,
      readOnly: true,
      decoration: InputDecoration(
        labelText: "Category",
        prefixIcon: Icon(cubit.currentCategory.icon),
        border: OutlineInputBorder(),
        suffixIcon:
            cubit.transaction.type == "Saving"
                ? null // Disable dropdown icon for "Saving"
                : const Icon(Icons.arrow_drop_down),
      ),
      onTap:
          cubit.transaction.type == "Saving"
              ? null // Disable tap for "Saving"
              : () {
                final categoryList =
                    type
                        .firstWhere(
                          (t) =>
                              t.transactionTypeName == cubit.transaction.type,
                          orElse: () => type[0],
                        )
                        .categories;

                showCategoryBottomSheet(context, categoryList);
              },
    );
  }

  void showCategoryBottomSheet(
    BuildContext context,
    List<CategoryModel> categories,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return ListView.builder(
          itemCount: categories.length,
          itemBuilder: (_, index) {
            final category = categories[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: category.color,
                foregroundColor: Colors.white,
                child: Icon(category.icon),
              ),
              title: Text(category.name),
              onTap: () {
                cubit.currentCategory = category;
                categoryController.text = category.name;
                cubit.transaction.category = category.name;
                cubit.updateTransactionPage();
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      selectedDate = pickedDate;
      dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      transaction.date = dateController.text;
      cubit.updateTransactionPage();
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null) {
      selectedTime = pickedTime;
      timeController.text = pickedTime.format(context);
      transaction.time = timeController.text;
      cubit.updateTransactionPage();
    }
  }
}
