import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsmaser/model/article_model.dart';
import '../../constants.dart';

class CustomNewsScreen extends StatelessWidget {
  final int articleIndex;

  // final int numberArticles;
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
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: KMainColor,
          ),
          automaticallyImplyLeading: true,
          backgroundColor: KWhiteColor,
          centerTitle: true,
          title: Text(
            'الخبر',
            style: TextStyle(
              color: KMainColor,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.35,
                width: width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: articles[articleIndex].newsUrlToImage != null
                        ? NetworkImage(articles[articleIndex].newsUrlToImage)
                        : ExactAssetImage(
                            'assets/images/photos/emptyPhoto.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
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
                          onTap: () {},
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
                    Text(
                      '${articles[articleIndex].newsTitle}.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: KBlackColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '${articles[articleIndex].newsDescription}.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 15.0,
                        height: 1.4,
                      ),
                    ),
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
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CustomNewsScreen(
                                articleIndex: index, articles: articles),
                          ),
                        );
                      },
                      child: Container(
                        height: 120.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: articles[index].newsUrlToImage != null
                                ? NetworkImage(articles[index].newsUrlToImage)
                                : ExactAssetImage(
                                    'assets/images/photos/emptyPhoto.png'),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: KBlackColor, width: 1.0),
                        ),
                        margin: EdgeInsets.only(
                            right: 10.0, bottom: 5.0, left: 5.0,),
                        child: Container(
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
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// CustomScrollView(
// slivers: [
// SliverAppBar(
// automaticallyImplyLeading: true,
// floating: true,
// pinned: true,
// expandedHeight: height * 0.35,
// flexibleSpace: FlexibleSpaceBar(
// background: article.newsUrlToImage != null
// ? Image.network(article.newsUrlToImage, fit: BoxFit.fill,)
// : AssetImage('assets/images/photos/emptyPhoto.png'),
// ),
// ),
// SliverToBoxAdapter(
// child: Padding(
// padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// article.newsTitle,
// style: TextStyle(
// color: KBlackColor,
// fontSize: 18.0,
// fontWeight: FontWeight.bold,
// ),
// ),
// SizedBox(height: 10.0,),
// Text(
// intl.DateFormat.yMMMd()
// .format(DateTime.parse(article.newsPublishedAt),),
// style: TextStyle(
// color: Colors.grey,
// fontSize: 16.0,
// ),
// ),
// SizedBox(height: 10.0,),
// Text(
// article.newsDescription,
// style: TextStyle(
// color: Colors.grey,
// fontSize: 16.0,
// ),
// ),
// ],
// ),
// ),
// ),
// ],
// ),

// Stack(
// alignment: Alignment.topCenter,
// children: [
// Container(
// height: height * 0.5,
// width: width,
// decoration: BoxDecoration(
// image: DecorationImage(
// image: article.newsUrlToImage != null
// ? NetworkImage(article.newsUrlToImage)
// : ExactAssetImage('assets/images/photos/emptyPhoto.png'),
// fit: BoxFit.fill,
// ),
// ),
// ),
// Scaffold(
// backgroundColor: Colors.transparent,
// appBar: AppBar(
// backgroundColor: Colors.transparent,
// elevation: 0.0,
// automaticallyImplyLeading: true,
// ),
// body: Column(
// children: [
// SizedBox(height: height * 0.3, width: width),
// Expanded(
// child: Container(
// width: width,
// decoration: BoxDecoration(
// color: Color(0xFF32292e),
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(40.0),
// topRight: Radius.circular(40.0),
// ),
// ),
// child: Column(
// children: [
// Padding(
// padding: EdgeInsets.symmetric(
// vertical: 10.0, horizontal: 25.0),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// height: 25.0,
// width: 70.0,
// decoration: BoxDecoration(
// color: KMainColor,
// borderRadius: BorderRadius.circular(20.0),
// ),
// child: Center(
// child: Text('اكثر'),
// ),
// ),
// Expanded(
// child: SizedBox(),
// ),
// Text(
// intl.DateFormat.yMMMd().format(
// DateTime.parse(article.newsPublishedAt),
// ),
// style: TextStyle(
// color: Color(0xFF6f696d),
// fontSize: 16.0,
// fontWeight: FontWeight.bold,
// ),
// ),
// Icon(
// Icons.access_time,
// color: KWhiteColor,
// )
// ],
// ),
// ),
// Expanded(
// child: Container(
// width: width,
// decoration: BoxDecoration(
// color: Colors.red,
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(40.0),
// topRight: Radius.circular(40.0),
// ),
// ),
// child: Text(
// article.source.name,
// style: TextStyle(
// color: KWhiteColor,
// fontSize: 16.0,
// fontWeight: FontWeight.bold,
// ),
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// ],
// ),
// ),
// ],
// ),

// appBar: AppBar(
//   automaticallyImplyLeading: false,
//   actions: [
//     IconButton(
//       icon: Icon(
//         Icons.arrow_forward,
//         size: 26.0,
//         color: KWhiteColor,
//       ),
//       onPressed: () {
//         Navigator.pop(context);
//       },
//     ),
//   ],
//   flexibleSpace: Container(
//     decoration: BoxDecoration(
//       gradient: LinearGradient(
//         colors: [Colors.redAccent, KMainColor],
//       ),
//     ),
//   ),
//   centerTitle: true,
//   title: Text(
//     '${articleIndex + 1}/${numberArticles + 1}',
//     style: TextStyle(
//       color: KWhiteColor,
//       fontSize: 20.0,
//     ),
//   ),
// ),

// body: Column(
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     Container(
//       height: height * 0.3,
//       width: width,
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: article.newsUrlToImage != null
//               ? NetworkImage(article.newsUrlToImage)
//               : ExactAssetImage('assets/images/photos/emptyPhoto.png'),
//           fit: BoxFit.fill,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black26,
//             offset: Offset(0, 3),
//             blurRadius: 2.5,
//           ),
//         ],
//       ),
//     ),
//     Padding(
//       padding: const EdgeInsets.all(15.0),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text(
//                 article.source.name,
//                 style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(
//                 width: 20.0,
//               ),
//               Text(
//                 intl.DateFormat.yMMMd().format(
//                   DateTime.parse(article.newsPublishedAt),
//                 ),
//                 style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 10),
//           Text(
//             '${article.newsTitle}.',
//             style: TextStyle(
//               color: KBlackColor,
//               fontSize: 18.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     ),
//   ],
// ),
