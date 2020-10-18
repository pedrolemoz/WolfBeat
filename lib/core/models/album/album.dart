import 'package:flutter/foundation.dart';

import '../../exceptions/null_attribute_exception.dart';

class Album {
  Album({
    @required this.artist,
    @required this.albumName,
    @required this.artworkURL,
  })  : assert(artist != null, throw NullAttributeException('artist')),
        assert(albumName != null, throw NullAttributeException('albumName')),
        assert(artworkURL != null, throw NullAttributeException('artworkURL'));

  final String artist;

  final String albumName;

  final String artworkURL;
}
