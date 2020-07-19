import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../../components/rounded_text_field.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RoundedTextField(
          textController: _textController,
          hintText: 'Buscar músicas, artistas ou álbuns',
          icon: Icon(FlutterIcons.search_mdi),
          onChanged: (){},
          onIconTap: () {},
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
