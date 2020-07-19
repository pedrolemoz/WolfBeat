import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../../utils/custom_track_shape.dart';

class PlayerPage extends StatefulWidget {
  static const String id = 'player_page';

  @override
  PlayerPageState createState() => PlayerPageState();
}

class PlayerPageState extends State<PlayerPage> {
  double _value = 50; // Tempo atual em segundos
  // double _duration = 100; // Duração total da música

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF38744c),
            Colors.black38,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Column(
            children: [
              Text(
                'Tocando de'.toUpperCase(),
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Text(
                'Suas Músicas',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Image.network(
                    'https://images-na.ssl-images-amazon.com/images/I/815aiIN6wmL.jpg',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Scary Monsters And Nice Sprites',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        'Skrillex',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                  Icon(
                    FlutterIcons.favorite_border_mdi,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ],
              ),
              Column(
                children: [
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Theme.of(context).primaryColor,
                      thumbColor: Theme.of(context).primaryColor,
                      inactiveTrackColor: Colors.grey[400],
                      trackShape: CustomTrackShape(),
                      trackHeight: 1.0,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 7.0),
                      overlayColor:
                          Theme.of(context).primaryColor.withAlpha(80),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 20.0),
                    ),
                    child: Slider(
                      min: 0,
                      max: 170, // 2 min e 50 seg em segundos
                      value: _value,
                      onChanged: (newValue) {
                        setState(() {
                          _value = newValue;
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '0:50',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                        '2:50',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    FlutterIcons.repeat_mco,
                    color: Color(0xFFF0F0F5),
                    size: 30.0,
                  ),
                  Icon(
                    FlutterIcons.skip_previous_mco,
                    color: Color(0xFFF0F0F5),
                    size: 40.0,
                  ),
                  RawMaterialButton(
                    onPressed: () {},
                    fillColor: Color(0xFFF0F0F5),
                    splashColor: Colors.grey[400],
                    shape: CircleBorder(),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(
                        FlutterIcons.play_mco,
                        size: 40.0,
                        color: Theme.of(context).backgroundColor,
                      ),
                    ),
                  ),
                  Icon(
                    FlutterIcons.skip_next_mco,
                    color: Color(0xFFF0F0F5),
                    size: 40.0,
                  ),
                  Icon(
                    FlutterIcons.shuffle_mco,
                    color: Color(0xFFF0F0F5),
                    size: 30.0,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
