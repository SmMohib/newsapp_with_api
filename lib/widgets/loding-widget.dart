import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:newsapp_with_api/consts/vars.dart';
import 'package:newsapp_with_api/services/utils.dart';
import 'package:newsapp_with_api/widgets/vertical_spacing.dart';
import 'package:provider/provider.dart';

class LodingWidget extends StatefulWidget {
  const LodingWidget({Key? key, this.isBookmark = false}) : super(key: key);
  // final String imageUrl, title, url, dateToShow, readingTime;
  final bool isBookmark;

  @override
  State<LodingWidget> createState() => _LodingWidgetState();
}

class _LodingWidgetState extends State<LodingWidget> {
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
                      child: Shimmer.fromColors(
                        baseColor: Colors.black12,
                        highlightColor:
                            const Color.fromARGB(255, 210, 220, 228),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              //image
                              child: Container(
                                height: size.height * 0.12,
                                width: size.height * 0.12,
                                color: Colors.amber,
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
                                  //text
                                  Container(
                                    height: size.height * 0.06,
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width: double.infinity,
                                  ),
                                  const VerticalSpacing(5),
                                  //text
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      height: size.height * 0.02,
                                      width: double.infinity,
                                    ),
                                  ),
                                  const VerticalSpacing(5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ClipOval(
                                        child: Container(
                                          height: 25,
                                          width: 25,
                                          color: Colors.amber,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 9,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        height: size.height * 0.02,
                                        width: size.height * 0.20,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }}

