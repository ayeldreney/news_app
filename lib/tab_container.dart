import 'package:flutter/material.dart';
import 'package:news/models/NewsDataResponce.dart';
import 'package:news/network/remote/api_manager.dart';
import 'package:news/screens/NewsItemContainer.dart';
import 'package:news/screens/tab_item.dart';
import 'models/SourceResponce.dart';

class Tabs extends StatefulWidget {
  List<Sources>? sources;

  Tabs(this.sources);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources!.length,
          child: TabBar(
            onTap: (value) {
              selectedIndex = value;
              setState(() {});
            },
            isScrollable: true,
            indicatorColor: Colors.transparent,
            tabs: widget.sources!
                .map((source) => Tab(
                    child: TabItem(source,
                        widget.sources?.indexOf(source) == selectedIndex)))
                .toList(),
          ),
        ),
        FutureBuilder(
          future: ApiManager.getNewsData(widget.sources![selectedIndex].id!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Text("Something went wrong");
            }
            var news = snapshot.data?.articles ?? [];
            return Expanded(
              child: ListView.builder(
                itemCount: news.length,
                itemBuilder: (context, index) {
                  return NewsItemContainer(news[index]);
                },
              ),
            );
          },
        )
      ],
    );
  }
}
