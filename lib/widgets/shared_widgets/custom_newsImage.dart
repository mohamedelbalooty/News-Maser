import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:newsmaser/core/widget_errors.dart';

Widget customNewsImage({@required String imageUrl}) {
  return CachedNetworkImage(
    errorWidget: (context, url, error) => imageWidgetError(),
    imageUrl: imageUrl != null
        ? imageUrl
        : 'https://www.namepros.com/attachments/empty-png.89209/',
    fit: BoxFit.fill,
    placeholder: (context, url) => imageLoading(),
  );
}
