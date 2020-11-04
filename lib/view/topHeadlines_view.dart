import 'package:flutter/material.dart';
import 'package:newsmaser/controller/article_controller.dart';
import 'package:newsmaser/widgets/shared_widgets/custom_appBar.dart';
import 'package:toast/toast.dart';
import '../constants.dart';

class TopHeadlinesView extends StatelessWidget {
  static String id = 'TopHeadlinesView';

  ModelController _modelController = ModelController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppBar(context, 'أحدث الاخبار'),
        body: FutureBuilder(
          future: _modelController.getTopHeadlinesByCountry(),
          // ignore: missing_return
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case ConnectionState.active:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case ConnectionState.none:
                return Text('No Data Available');
                break;
              case ConnectionState.done:
                if (snapshot.hasError) {
                  Toast.show(snapshot.error.toString(), context,
                      duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                } else {
                  if (snapshot.hasData) {
                    //TODO SOME THING
                    return Text('Data Available');
                  } else {
                    return Text('No Data Available');
                  }
                }
                break;
            }
          },
        ),
      ),
    );
  }
}
