import 'package:flutter/foundation.dart';

import '../../exceptions/null_attribute_exception.dart';

class Artist {
  Artist({
    @required this.artistName,
    @required this.artworkURL,
  })  : assert(artistName != null, throw NullAttributeException('artistName')),
        assert(artworkURL != null, throw NullAttributeException('artworkURL'));

  final String artistName;

  final String artworkURL;
}
