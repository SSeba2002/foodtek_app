import 'package:flutter/material.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';

class EmptyHistoryScreen extends StatelessWidget {
  const EmptyHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/Empty-amico.png", width: 200),
          SizedBox(height: 20),
          Text(
            AppLocalizations.of(context)!.historyEmpty,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            AppLocalizations.of(context)!.historyEmptyMsg,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
