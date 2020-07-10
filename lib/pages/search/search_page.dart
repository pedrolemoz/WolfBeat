import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchTextController,
          textInputAction: TextInputAction.search,
          textCapitalization: TextCapitalization.sentences,
          enableSuggestions: true,
          enableInteractiveSelection: true,
          textAlign: TextAlign.center,
          showCursor: false,
          maxLines: 1,
          autocorrect: true,
          cursorColor: Theme.of(context).primaryColor,
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(color: Theme.of(context).scaffoldBackgroundColor),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            suffixIcon: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              color: Theme.of(context).scaffoldBackgroundColor,
              icon: Icon(FlutterIcons.search_mdi),
              iconSize: 30.0,
              onPressed: () {
                print(_searchTextController.text);
              },
            ),
            filled: true,
            fillColor: Color(0xFFF0F0F5),
            hintMaxLines: 1,
            hintText: 'Buscar músicas, artistas ou álbuns',
            hintStyle: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: Theme.of(context).scaffoldBackgroundColor),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
          onChanged: (input) {
            print(_searchTextController.text);
          },
        ),
      ),
      body: GridView.builder(
        // Usar uma lista contendo os estilos, e buscar usando o where do Firebase
        itemCount: 15,
        shrinkWrap: true,
        padding: EdgeInsets.all(15.0),
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
          childAspectRatio: 0.85,
        ),
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  'https://images-na.ssl-images-amazon.com/images/I/815aiIN6wmL.jpg',
                ),
              ),
              Text(
                'Gênero ${index + 1}',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          );
        },
      ),
    );
  }
}
