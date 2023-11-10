import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp_with_api/common/utils/colors.dart';
import 'package:newsapp_with_api/consts/vars.dart';
import 'package:newsapp_with_api/provider/themeprovider.dart';
import 'package:newsapp_with_api/services/utils.dart';
import 'package:newsapp_with_api/widgets/article_widget.dart';
import 'package:newsapp_with_api/widgets/drawer.dart';
import 'package:newsapp_with_api/widgets/loding-widget.dart';
import 'package:newsapp_with_api/widgets/tab.dart';
import 'package:newsapp_with_api/widgets/textWidget.dart';
import 'package:newsapp_with_api/widgets/vertical_spacing.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //var news
  var newsType = NewsType.allNews;
  int currentPageIndex = 0;
  String sortBy = SortByEnum.publishedAt.name;

  @override
  Widget build(BuildContext context) {
//theme
    final Color color = Utils(context).getColor;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: color),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          'News app',
          style: GoogleFonts.lobster(
              textStyle:
                  TextStyle(color: color, fontSize: 20, letterSpacing: 0.6)),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   PageTransition(
              //       type: PageTransitionType.rightToLeft,
              //       child: const SearchScreen(),
              //       inheritTheme: true,
              //       ctx: context),
              // );
            },
            icon: const Icon(
              IconlyLight.search,
            ),
          )
        ],
      ),
      drawer: const DrawerWidget(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                TabsWidget(
                    text: 'All News',
                    color: NewsType == NewsType.allNews
                        ? Theme.of(context).cardColor
                        : Colors.transparent,
                    function: () {
                      if (newsType == NewsType.allNews) {
                        return;
                      }
                      setState(() {
                        newsType = NewsType.allNews;
                      });
                    },
                    fontSize: newsType == NewsType.allNews ? 20 : 14),
                TabsWidget(
                    text: 'Populer News',
                    color: NewsType == NewsType.topTrending
                        ? Theme.of(context).cardColor
                        : Colors.transparent,
                    function: () {
                      if (newsType == NewsType.topTrending) {
                        return;
                      }
                      setState(() {
                        newsType = NewsType.topTrending;
                      });
                    },
                    fontSize: newsType == NewsType.topTrending ? 20 : 14),
              ],
            ),
            const VerticalSpacing(20),
            SizedBox(
              height: kBottomNavigationBarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  pageButton(
                      text: 'Prev',
                      function: () {
                        if (currentPageIndex == 0) {
                          return;
                        }
                        setState(() {
                          currentPageIndex -= 1;
                        });
                      }),
                  Flexible(
                      flex: 2,
                      child: ListView.builder(
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              color: currentPageIndex == index
                                  ? Colors.blue
                                  : Theme.of(context).cardColor,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    currentPageIndex = index;
                                  });
                                },
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('${index + 1}'),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      )),
                  pageButton(
                      text: 'Next',
                      function: () {
                        if (currentPageIndex == 5) {
                          return;
                        }
                        setState(() {
                          currentPageIndex += 1;
                        });
                      }),
                ],
              ),
            ),

            const VerticalSpacing(10),
            newsType == NewsType.topTrending
                ? Container()
                : Align(
                    alignment: Alignment.topRight,
                    child: Material(
                      color: Theme.of(context).cardColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: DropdownButton(
                            value: sortBy,
                            items: dropDownItems,
                            onChanged: (String? value) {
                              setState(() {
                                sortBy = value!;
                              });
                            }),
                      ),
                    ),
                  ),

            SizedBox(
              height: 500,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return LodingWidget();
                },
              ),
            )
            //  ArticlesWidget(),
            //Switch
            // SwitchListTile(
            //     title: Text(
            //       themeProvider.getDarkTheme ? 'Dark' : 'Light',
            //       style: const TextStyle(fontSize: 20),
            //     ),
            //     secondary: Icon(
            //       themeProvider.getDarkTheme ? Icons.dark_mode : Icons.light_mode,
            //       color: Theme.of(context).colorScheme.secondary,
            //     ),
            //     value: themeProvider.getDarkTheme,
            //     onChanged: (bool value) {
            //       setState(() {
            //         themeProvider.setDarkTheme = value;
            //       });
            //     }),
          ],
        ),
      ),
    );
  }

  //dropdown Button
  List<DropdownMenuItem<String>> get dropDownItems {
    List<DropdownMenuItem<String>> menuItem = [
      DropdownMenuItem(
        value: SortByEnum.relevancy.name,
        child: Text(SortByEnum.relevancy.name),
      ),
      DropdownMenuItem(
        value: SortByEnum.publishedAt.name,
        child: Text(SortByEnum.publishedAt.name),
      ),
      DropdownMenuItem(
        value: SortByEnum.popularity.name,
        child: Text(SortByEnum.popularity.name),
      ),
    ];
    return menuItem;
  }

  //nextButton

  Widget pageButton({required String text, required Function function}) {
    return ElevatedButton(
      onPressed: () {
        function();
      },
      // ignore: sort_child_properties_last
      child: TextWidget(text: text, color: Colors.white, textSize: 18),
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        padding: const EdgeInsets.all(6),
      ),
    );
  }
}
