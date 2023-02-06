import 'package:flutter/material.dart';

import '../models/SourceResponce.dart';

class TabItem extends StatelessWidget {
  Sources source;
  bool isSeleted;
  TabItem(this.source, this.isSeleted);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: isSeleted ? Colors.green : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.green),
      ),
      child: Tab(
        child: Text(
          source.name.toString(),
          style: TextStyle(color: isSeleted ? Colors.white : Colors.green),
        ),
      ),
    );
  }
}
