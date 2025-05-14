import 'package:flutter/material.dart';

Widget buildSection(
  BuildContext? context,
  String title,
  List<Widget> children,
) {
  return Container(
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Theme.of(context!).cardColor,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey.shade300),
      boxShadow: [
        BoxShadow(color: Colors.grey.shade200, blurRadius: 5, spreadRadius: 2),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        ...children,
      ],
    ),
  );
}

Widget buildListTile(
  IconData icon,
  String title, {
  Widget? trailing,
  Color? iconColor,
  VoidCallback? onTap,
}) {
  return ListTile(
    leading: Icon(icon, color: iconColor),
    title: Text(title),
    trailing:
        trailing ?? Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
    onTap: onTap,
  );
}

Widget buildSwitchTile(String title, bool value) {
  return SwitchListTile(
    title: Text(title),
    value: value,
    onChanged: (bool newValue) {},
    activeColor: Colors.green,
  );
}
