import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import '../../constants.dart';
import 'custom_newsImage.dart';

Widget customNewsItem(double height, double width, bool isPortrait,
    {String newspaperName,
    String newsDate,
    String newsTitle,
    String newsImage}) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: SizedBox(
      height: isPortrait ? height * 0.4 : height * 0.7,
      width: width,
      child: Card(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width * 0.4,
                    child: Text(
                      newspaperName != null ? newspaperName : 'No author',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: KMainColor,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    newsDate != null
                        ? intl.DateFormat.yMMMd().format(
                            DateTime.parse(newsDate),
                          )
                        : 'No Date',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  newsTitle != null ? newsTitle : 'No title',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    color: KBlackColor,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: height * 0.3,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    // image: DecorationImage(
                    //   image: newsImage != null
                    //       ? NetworkImage(newsImage)
                    //       : ExactAssetImage(
                    //           'assets/images/photos/emptyPhoto.png'),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: customNewsImage(imageUrl: newsImage),
                  ),
                ),
                // child: ClipRRect(
                //   borderRadius: BorderRadius.circular(5.0),
                //   child: customNewsImage(imageUrl: newsImage),
                // ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
