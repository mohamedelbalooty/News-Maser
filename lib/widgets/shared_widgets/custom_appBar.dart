import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsmaser/controller/article_controller.dart';
import 'package:newsmaser/provider/modal_hud.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import '../../constants.dart';

Widget customAppBar(
    BuildContext context, String title, ModelController modelController, String category) {
  return AppBar(
    backgroundColor: KWhiteColor,
    automaticallyImplyLeading: true,
    actions: [
      IconButton(
        icon: Icon(
          Icons.refresh,
          size: 26.0,
          color: KWhiteColor,
        ),
        tooltip: 'اعادة تحميل',
        onPressed: () async {
          final ModalHud modalHud =
              Provider.of<ModalHud>(context, listen: false);
          modalHud.isLoadingChanging(true);
          try {
            await modelController.getTopHeadlinesByCategory(category);
            modalHud.isLoadingChanging(false);
          } on PlatformException catch (exception) {
            Toast.show(exception.message, context,
                duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
          }
        },
      ),
    ],
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.redAccent, KMainColor],
        ),
      ),
    ),
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
        color: KWhiteColor,
        fontSize: 20.0,
      ),
    ),
  );
}
