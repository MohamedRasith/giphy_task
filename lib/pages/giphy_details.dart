import 'package:flutter/material.dart';
import 'package:giphy_task/models/giphy_model.dart';


class GiphyDetailPage extends StatelessWidget {
  final giphy_model model;
  int index;
  GiphyDetailPage({super.key,required this.model, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${model.data![index].title}"),),
      body: Column(
        children: [
          Image.network("${model.data![index].images!.original!.url}"),
          const SizedBox(height: 30,),
          Text("${model.data![index].title}")
        ],
      ),
    );
  }
}
