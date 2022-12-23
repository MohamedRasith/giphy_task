import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giphy_task/blocs/giphy_bloc/giphy_bloc.dart';
import 'package:giphy_task/models/giphy_model.dart';
import 'package:giphy_task/pages/giphy_details.dart';


class GiphyPage extends StatefulWidget {
  const GiphyPage({super.key});

  @override
  State<GiphyPage> createState() => _GiphyPageState();
}

class _GiphyPageState extends State<GiphyPage> {
  final GiphyBloc _newsBloc = GiphyBloc();


  @override
  void initState() {
    _newsBloc.add(GetGiphyList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Giphy List')),
      body: _buildListGiphy(),
    );
  }

  Widget _buildListGiphy() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<GiphyBloc, GiphyState>(
          listener: (context, state) {
            if (state is GiphyError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<GiphyBloc, GiphyState>(
            builder: (context, state) {
              if (state is GiphyInitial) {
                return _buildLoading();
              } else if (state is GiphyLoading) {
                return _buildLoading();
              } else if (state is GiphyLoaded) {
                return _buildCard(context, state.giphyModel, state.data);
              } else if (state is GiphyError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, giphy_model model, Data data) {
    return ListView.builder(
      itemCount: model.data!.length,
      itemBuilder: (context, index) {
        return Container(
            margin: const EdgeInsets.all(8.0),
            child: Card(
              child: Container(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text("${model.data![index].title}",textAlign: TextAlign.center,),
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child:  Image.network('${model.data![index].images!.original!.url}',width: 100,height: 100,),
                  ),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>GiphyDetailPage(model: model,index: index,)));
                  },
                ),
              ),
            ),
        );
      },
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
