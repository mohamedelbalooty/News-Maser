import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:newsmaser/model/article_model.dart';
import '../../constants.dart';

class CustomNewsScreen extends StatelessWidget {
  final int articleIndex;
  final int numberArticles;
  final Article article;

  CustomNewsScreen(
      {@required this.articleIndex,
      @required this.numberArticles,
      @required this.article});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: Icon(
                Icons.arrow_forward,
                size: 26.0,
                color: KWhiteColor,
              ),
              onPressed: () {
                Navigator.pop(context);
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
            '${articleIndex + 1}/${numberArticles + 1}',
            style: TextStyle(
              color: KWhiteColor,
              fontSize: 20.0,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: height * 0.3,
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: article.newsUrlToImage != null
                      ? NetworkImage(article.newsUrlToImage)
                      : ExactAssetImage('assets/images/photos/emptyPhoto.png'),
                  fit: BoxFit.fill,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 3),
                    blurRadius: 2.5,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        article.source.name,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        intl.DateFormat.yMMMd().format(
                          DateTime.parse(article.newsPublishedAt),
                        ),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${article.newsTitle}.',
                    style: TextStyle(
                      color: KBlackColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
