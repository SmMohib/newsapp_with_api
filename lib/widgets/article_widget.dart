import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:newsapp_with_api/consts/vars.dart';
import 'package:newsapp_with_api/services/utils.dart';
import 'package:newsapp_with_api/widgets/vertical_spacing.dart';
import 'package:provider/provider.dart';

class ArticlesWidget extends StatelessWidget {
  const ArticlesWidget({Key? key, this.isBookmark = false}) : super(key: key);
  // final String imageUrl, title, url, dateToShow, readingTime;
  final bool isBookmark;
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    // dynamic newsModelProvider = isBookmark
    //     ? Provider.of<BookmarksModel>(context)
    //     : Provider.of<NewsModel>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        child: GestureDetector(
          onTap: () {
            // Navigate to the in app details screen
            //  Navigator.pushNamed(context, NewsDetailsScreen.routeName,
            //     arguments: newsModelProvider.publishedAt);
          },
          child: Stack(
            children: [
              Container(
                height: 60,
                width: 60,
                color: Theme.of(context).colorScheme.secondary,
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  height: 60,
                  width: 60,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Container(
                color: Theme.of(context).cardColor,
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Hero(
                        tag: true,
                        //  tag: newsModelProvider.publishedAt,
                        child: FancyShimmerImage(
                          height: size.height * 0.12,
                          width: size.height * 0.12,
                          boxFit: BoxFit.fill,
                          errorWidget:
                              Image.asset('assets/images/empty_image.png'),
                          // imageUrl: newsModelProvider.urlToImage,
                          imageUrl:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJydSW6uY3jLWjyzUZHT9ZOLRFg_AIaAh4Ew&usqp=CAU',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'dffffffffffffff', // newsModelProvider.title,
                            textAlign: TextAlign.justify,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: smallTextStyle,
                          ),
                          const VerticalSpacing(5),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'Reading Time',
                              //  '🕒 ${newsModelProvider.readingTimeText}',
                              style: smallTextStyle,
                            ),
                          ),
                          FittedBox(
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   PageTransition(
                                    //       type: PageTransitionType.rightToLeft,
                                    //       child: NewsDetailsWebView(
                                    //           url: newsModelProvider.url),
                                    //       inheritTheme: true,
                                    //       ctx: context),
                                    // );
                                  },
                                  icon: const Icon(
                                    Icons.link,
                                    color: Colors.blue,
                                  ),
                                ), 
                                Text(
                                  '3/6/2003',
                                  //  newsModelProvider.dateToShow,
                                  maxLines: 1,
                                  style: smallTextStyle,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
