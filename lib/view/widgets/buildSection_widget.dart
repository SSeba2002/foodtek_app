import 'package:flutter/material.dart';

Widget buildSection(String title, List<Widget> children) {
  return Container(
    margin: EdgeInsets.only(bottom: 16.0),
    padding: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1),
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

Widget buildListTile(IconData icon, String title,
    {Widget? trailing, Color? iconColor, VoidCallback? onTap}) {
  return ListTile(
    leading: Icon(icon, color: iconColor ?? Colors.black),
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
