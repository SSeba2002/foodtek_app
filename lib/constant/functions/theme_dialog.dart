import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek_project/cubit/theme_cubit.dart';

void showThemeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Choose Theme"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.light_mode_outlined),
              title: Text("Light"),
              onTap: () {
                context.read<AppCubit>().changeTheme(false);

                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.dark_mode_outlined),
              title: Text("Dark"),
              onTap: () {
                context.read<AppCubit>().changeTheme(true);

                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
