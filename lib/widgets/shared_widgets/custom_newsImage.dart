import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:newsmaser/core/widget_errors.dart';

Widget customNewsImage({@required String imageUrl}) {
  return CachedNetworkImage(
    errorWidget: (context, url, error) => imageWidgetError(),
    imageUrl: imageUrl != null
        ? imageUrl
        : 'https://www.google.com/search?q=empty+image&rlz=1C1CHWL_enEG917EG917&sxsrf=ALeKk01IlTI0-7JRMtlQidQFxru04-g_fw:1605105740239&tbm=isch&source=iu&ictx=1&fir=Om5MqfyAxBtPXM%252C9vLorK8tuPAIgM%252C_&vet=1&usg=AI4_-kR8-vaNFF4FbvdaKnU3PYtfDBapZw&sa=X&ved=2ahUKEwi97OTr3PrsAhUCsXEKHWllApIQ9QF6BAgLEE0&biw=1366&bih=657#imgrc=FnVSbtCfdAfhgM',
    fit: BoxFit.fill,
    placeholder: (context, url) => imageLoading(),
  );
}
