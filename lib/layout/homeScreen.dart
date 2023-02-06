import 'package:flutter/material.dart';
import 'package:news/models/SourceResponce.dart';
import 'package:news/network/remote/api_manager.dart';
import 'package:news/tab_container.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "homepage";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"), fit: BoxFit.fill),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0.0,
            title: Text('News'),
            centerTitle: true,
            backgroundColor: Colors.green,
            shape: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
          ),
          body: FutureBuilder<SourceResponce>(
            future: ApiManager.getResource(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Text(snapshot.data?.message ?? "has error");
              }

              return Tabs(snapshot.data?.sources);
            },
          )),
    );
  }
}
