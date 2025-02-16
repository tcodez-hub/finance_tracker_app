import 'package:finance_tracker_app/models/category_model.dart';
import 'package:finance_tracker_app/statemanagement/cubit/transaction_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBottomSheet {
  static void showCategoryBottonSheet(
    BuildContext context,
    List<CategoryModel> categories,
    TransactionPageCubit cubit,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, state) {
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(categories[index].name),
                  leading: CircleAvatar(
                    backgroundColor: categories[index].color,
                    child: Icon(categories[index].icon),
                  ),
                  onTap: () {
                    cubit.currentCategory = categories[index];
                    cubit.updateTransactionPage();
                    Navigator.pop(context);
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
