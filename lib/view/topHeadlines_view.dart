import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsmaser/constants.dart';
import 'package:newsmaser/controller/article_controller.dart';
import 'package:newsmaser/model/article_model.dart';
import 'package:newsmaser/widgets/shared_widgets/custom_appBar.dart';
import 'package:toast/toast.dart';

class TopHeadlinesView extends StatelessWidget {
  static String id = 'TopHeadlinesView';

  ModelController _modelController = ModelController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppBar(context, 'أحدث الاخبار'),
        body: FutureBuilder<List<Article>>(
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
                    //TODO SOMETHING
                    try {
                      List<Article> _articles = snapshot.data;
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListView.builder(
                          itemCount: _articles.length,
                          itemBuilder: (context, index) {
                            // return Container(
                            //   height: height * 0.2,
                            //   width: width,
                            //   margin: EdgeInsets.all(5.0),
                            //   decoration: BoxDecoration(
                            //     image: DecorationImage(
                            //       image: _articles[index].newsUrlToImage != null
                            //           ? NetworkImage(
                            //               _articles[index].newsUrlToImage)
                            //           : ExactAssetImage(
                            //               'assets/images/photos/emptyPhoto.png'),
                            //       fit: BoxFit.cover,
                            //     ),
                            //   ),
                            // );
                            return SizedBox(
                              height: height*0.3,
                              width: width,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            _articles[index].source.name,
                                            style: TextStyle(
                                              color: KMainColor,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            _articles[index].newsPublishedAt,
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } on PlatformException catch (e) {
                      Toast.show(e.message, context,
                          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                    }
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
