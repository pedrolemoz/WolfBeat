import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../ui_components/music_tile.dart';
import '../../ui_components/rounded_text_field.dart';
import '../view_model/search_view_model.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchTextController = TextEditingController();
  final searchViewModel = GetIt.I.get<SearchViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: RoundedTextField(
              textController: _searchTextController,
              hintText: 'Buscar músicas, artistas ou álbuns',
              icon: Icon(FlutterIcons.search_mdi),
              onChanged: () {
                _searchTextController.text == ''
                    ? searchViewModel.cleanResults()
                    : searchViewModel.performSearch(_searchTextController.text);
              },
              onIconTap: () {
                searchViewModel.performSearch(_searchTextController.text);
              },
            ),
          ),
          body: searchViewModel.searchResult.length != 0
              ? ListView.builder(
                  itemCount: searchViewModel.searchResult.length,
                  padding: const EdgeInsets.only(top: 20.0),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: MusicTile(
                        song: searchViewModel.searchResult.elementAt(index),
                      ),
                    );
                  },
                )
              : Container(
                  child: Center(
                    child: Text(
                      'Pesquise alguma música',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ),
        );
      },
    );
  }
}

// body: GridView.builder(
//   // ignore: lines_longer_than_80_chars
//   // Usar uma lista contendo os estilos, e buscar usando o where do Firebase
//   itemCount: 15,
//   shrinkWrap: true,
//   padding: EdgeInsets.all(15.0),
//   physics: BouncingScrollPhysics(),
//   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//     crossAxisCount: 2,
//     crossAxisSpacing: 15.0,
//     mainAxisSpacing: 15.0,
//     childAspectRatio: 0.85,
//   ),
//   itemBuilder: (context, index) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(10.0),
//           child: Image.network(
//             'https://images-na.ssl-images-amazon.com/images/I/815aiIN6wmL.jpg',
//           ),
//         ),
//         Text(
//           'Gênero ${index + 1}',
//           overflow: TextOverflow.ellipsis,
//           style: Theme.of(context).textTheme.subtitle1,
//         ),
//       ],
//     );
//   },
// ),
