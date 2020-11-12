import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsmaser/model/article_model.dart';
import 'package:newsmaser/view/newsUrl_view.dart';
import '../../constants.dart';
import 'custom_newsImage.dart';

class CustomNewsScreen extends StatelessWidget {
  final int articleIndex;
  final List<Article> articles;

  CustomNewsScreen({
    @required this.articleIndex,
    @required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _customNewsScreenAppBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _customNewsScreenNewsImage(isPortrait, height, width),
              Padding(
                padding: EdgeInsets.fromLTRB(25.0, 10.0, 10.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          articles[articleIndex].source.name,
                          style: TextStyle(
                              color: KMainColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              height: 1.5),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsUrlView(
                                  newsUrl: articles[articleIndex].newsURL,
                                ),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.link,
                            color: KMainColor,
                            size: 28.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    _customNewsScreenNewsTitle(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _customNewsScreenNewsDescription(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Text(
                  'الأخبار المقترحة :-',
                  style: TextStyle(
                    color: KMainColor,
                    fontSize: 14.0,
                  ),
                ),
              ),
              SizedBox(
                height: 120.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: articles.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _customSuggestedNewsItem(context, index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customNewsScreenAppBar() {
    return AppBar(
      iconTheme: IconThemeData(
        color: KMainColor,
      ),
      automaticallyImplyLeading: true,
      backgroundColor: KWhiteColor,
      centerTitle: true,
      title: const Text(
        'الخبر',
        style: TextStyle(
          color: KMainColor,
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _customNewsScreenNewsImage(
      bool isPortrait, double height, double width) {
    return SizedBox(
      height: isPortrait ? height * 0.35 : height * 0.5,
      width: width,
      child: customNewsImage(imageUrl: articles[articleIndex].newsUrlToImage),
    );
  }

  Widget _customNewsScreenNewsTitle() {
    return Text(
      '${articles[articleIndex].newsTitle}.',
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: KBlackColor,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _customNewsScreenNewsDescription() {
    return Text(
      '${articles[articleIndex].newsDescription}.',
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: Colors.grey.shade600,
        fontSize: 15.0,
        height: 1.4,
      ),
    );
  }

  Widget _customSuggestedNewsItem(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CustomNewsScreen(articleIndex: index, articles: articles),
          ),
        );
      },
      child: Container(
        height: 120.0,
        width: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: KBlackColor, width: 1.0),
        ),
        margin: EdgeInsets.only(
          right: 10.0,
          bottom: 5.0,
          left: 5.0,
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SizedBox(
                height: 120.0,
                width: 100.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child:
                      customNewsImage(imageUrl: articles[index].newsUrlToImage),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black26.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  articles[index].source.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: KWhiteColor,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
