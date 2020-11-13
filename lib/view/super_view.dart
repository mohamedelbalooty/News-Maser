import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsmaser/core/server_errors.dart';
import 'package:newsmaser/model/article_model.dart';
import 'package:newsmaser/provider/modal_hud.dart';
import 'package:newsmaser/controller/article_controller.dart';
import 'package:provider/provider.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:toast/toast.dart';
import 'package:newsmaser/widgets/shared_widgets/custom_appBar.dart';
import 'package:newsmaser/widgets/shared_widgets/custom_newsItem.dart';
import 'package:newsmaser/widgets/shared_widgets/custom_newsScreen.dart';

// ignore: must_be_immutable
class SuperView extends StatelessWidget {

  String _title, _category;
  SuperView(this._title, this._category);

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
        appBar: customAppBar(context, _title, _modelController, _category),
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<ModalHud>(context).isLoading,
          child: FutureBuilder<List<Article>>(
            future: _modelController.getTopHeadlinesByCategory(_category),
            // ignore: missing_return
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return loading();
                  break;
                case ConnectionState.active:
                  return loading();
                  break;
                case ConnectionState.none:
                  return connectionError();
                  break;
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    snapshotError();
                  } else {
                    if (snapshot.hasData) {
                      if (snapshot.data != null) {
                        try {
                          List<Article> _articles = snapshot.data;
                          return ListView.builder(
                            itemCount: _articles.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CustomNewsScreen(
                                        articleIndex: index,
                                        articles: _articles,
                                      ),
                                    ),
                                  );
                                },
                                child: customNewsItem(height, width, isPortrait,
                                    newspaperName: _articles[index].source.name,
                                    newsDate: _articles[index].newsPublishedAt,
                                    newsTitle: _articles[index].newsTitle,
                                    newsImage: _articles[index].newsUrlToImage),
                              );
                            },
                          );
                        } on PlatformException catch (e) {
                          Toast.show(e.message, context,
                              duration: Toast.LENGTH_LONG,
                              gravity: Toast.BOTTOM);
                        }
                      } else {
                        return noDataError();
                      }
                    } else {
                      return dataError();
                    }
                  }
                  break;
              }
            },
          ),
        ),
      ),
    );
  }
}
