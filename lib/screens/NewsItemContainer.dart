import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/NewsDataResponce.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsItemContainer extends StatelessWidget {
  Articles articles;
  NewsItemContainer(this.articles);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: CachedNetworkImage(
              imageUrl: articles.urlToImage ?? "",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Text(
            " ${articles.author}",
            style: TextStyle(fontSize: 15, color: Colors.grey[500]),
          ),
          Text(
            "${articles.description}",
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
          Text(
            "${articles.publishedAt!.substring(0, 10)} ",
            textAlign: TextAlign.end,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
