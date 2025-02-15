import 'dart:developer';

import 'package:finance_tracker_app/models/transaction_model.dart';
import 'package:finance_tracker_app/models/transactionsType/expense_transaction.dart';
import 'package:finance_tracker_app/models/transactionsType/income_transacrion.dart';
import 'package:finance_tracker_app/models/transactionsType/saving_transaction.dart';
import 'package:finance_tracker_app/models/transactionsType/transactions_type.dart';
import 'package:finance_tracker_app/statemanagement/cubit/transaction_cubit.dart';
import 'package:finance_tracker_app/statemanagement/cubit/transaction_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final List<TransactionType> type = [
    IncomeTransacrion(),
    ExpenseTransaction(),
    SavingTransaction(),
  ];
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  TextEditingController amountController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  late Transaction transaction;
  late TransactionPageCubit cubit;

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
        transaction.date = dateController.text;
        context.read<TransactionPageCubit>().updateTransactionPage(transaction);
        log(transaction.date);
      });
    }
  }

  // Function to pick a time
  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
        timeController.text = pickedTime.format(context);
        transaction.time = timeController.text;
        context.read<TransactionPageCubit>().updateTransactionPage(transaction);
        log(transaction.time);
      });
    }
  }

  @override
  void initState() {
    cubit = TransactionPageCubit(
      Transaction(
        id: context.read<TransactionCubit>().getTransactionBoxLength() + 1,
        amount: 0,
        type: type[0].transactionTypeName,
        category: "",
        subcategory: "",
        date: DateTime.now().toIso8601String(),
        time: DateFormat('HH:mm a').format(DateTime.now()),
        notes: "",
      ),
    );

    transaction = cubit.transaction;
    amountController.text = cubit.transaction.amount.toString();
    DateTime dateTime = DateTime.parse(cubit.transaction.date);
    String date = DateFormat('yyyy-MM-dd').format(dateTime);
    String time = cubit.transaction.time;
    dateController.text = date;
    timeController.text = time;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: DefaultTabController(
        length: type.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Add Transaction'),
            bottom: TabBar(
              tabs: List<Tab>.generate(type.length, (index) {
                return Tab(text: type[index].transactionTypeName);
              }),
              onTap: (value) {
                cubit.transaction.type = type[value].transactionTypeName;
                log(cubit.transaction.type);
              },
            ),
          ),
          body: BlocBuilder<TransactionPageCubit, TransactionPageState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                  child: Column(
                    spacing: 16,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Amount",
                          prefixIcon: Icon(Icons.toll_rounded),
                        ),
                        keyboardType: TextInputType.number,
                        controller: amountController,
                        onTap: () {
                          double amt =
                              double.tryParse(amountController.text) != null
                                  ? double.parse(amountController.text)
                                  : 0.0;
                          if (amt <= 0) {
                            amountController.text = "";
                          }
                        },
                        onChanged: (value) {
                          transaction.amount = double.parse(value);
                          context
                              .read<TransactionPageCubit>()
                              .updateTransactionPage(transaction);
                          log(transaction.amount.toString());
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Notes",
                          prefixIcon: Icon(Icons.note_alt),
                        ),
                        maxLines: 5,
                        minLines: 1,
                        controller: notesController,
                        onChanged: (value) {
                          transaction.notes = value;
                          context
                              .read<TransactionPageCubit>()
                              .updateTransactionPage(transaction);
                          log(transaction.notes.toString());
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Date",
                          prefixIcon: Icon(Icons.calendar_month_rounded),
                        ),
                        readOnly: true,
                        controller: dateController,
                        onTap: () {
                          _selectDate(context);
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Time",
                          prefixIcon: Icon(Icons.timelapse_rounded),
                        ),
                        readOnly: true,
                        controller: timeController,
                        onTap: () {
                          _selectTime(context);
                        },
                      ),
                      ElevatedButton(onPressed: () {}, child: Text("Add")),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
