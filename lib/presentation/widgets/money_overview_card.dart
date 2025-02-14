import 'package:flutter/material.dart';

class MoneyOverviewCard extends StatelessWidget {
  const MoneyOverviewCard({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.body
  });

  final String title;
  final Icon icon;
  final Color iconColor;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(50),
          offset: Offset(2, 2),
          blurRadius: 8,
        ),
        ],
      ),
      child: Column(
        spacing: 12,
        children: [
          Text(title, style: TextTheme.of(context).bodyLarge),
          Row(
            spacing: 4,
            children: [
              CircleAvatar(
                radius: 12,
                backgroundColor: iconColor,
                child: icon,
              ),
              Text(body, style: TextTheme.of(context).titleMedium),
            ],
          ),
        ],
      ),
    );
  }
}
