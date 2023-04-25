import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:projet_progm/src/categories/GuesCountry/GuesCountry.dart';
import 'package:projet_progm/src/categories/GuesCountry/country_model.dart';
import 'package:projet_progm/src/categories/categories_screen.dart';
import 'package:projet_progm/src/categories/GuesCountry/LevelOne/LevelOneGuesCountry.dart';
import 'package:projet_progm/src/home_screen/home_screen.dart';

void main() {
  // usign logger package to logg all information
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    debugPrint(
        '${record.level.name} : ${record.time} : ${record.loggerName} : ${record.message}');
  });

  //Local Storage Setting for data about the user
  //Local storage for playerProgress
  runApp(const MyApp());
}

Logger _log = Logger('main.dart');

//The route configuration
final GoRouter _router = GoRouter(routes: <RouteBase>[
  GoRoute(
      path: "/",
      builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
  ),
      
   GoRoute(
            path: "/categories",
            builder:  (BuildContext context, GoRouterState state) => const CategoriesScreen(),
          
          ),
     GoRoute(
            path: "/guesCountry",
            builder:  (BuildContext context, GoRouterState state) =>  GuesCountry(),
          
          ),
    GoRoute(
             name :"levelOneGuesCountry",
            path: "/levelOneGuesCountry",
            builder:  (BuildContext context, GoRouterState state) =>  LevelOneGuesCountry(countries :  state.extra as List<Country>)
            ),
          
  
  
]);
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Mysterius',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple.shade900),
      ),
    );
  }
}
