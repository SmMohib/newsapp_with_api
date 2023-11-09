import 'package:flutter/material.dart';
import 'package:newsapp_with_api/consts/themedata.dart';
import 'package:newsapp_with_api/provider/themeprovider.dart';
import 'package:newsapp_with_api/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeChangeProvider = ThemeProvider();

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  //Fetch the current theme
  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePreferences.getTheme();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
        
          return themeChangeProvider;
        }),
      
      ],
      child:
          //Notify about theme changes
          Consumer<ThemeProvider>(builder: (context, themeChangeProvider, ch) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'News App - Flutter&API Course',
          theme: Styles.themeData(themeChangeProvider.getDarkTheme, context),
           home: const HomeScreen(),
          routes: const {
            // NewsDetailsScreen.routeName: (ctx) => const NewsDetailsScreen(),
          },
        );
      }),
    );
  }
}
