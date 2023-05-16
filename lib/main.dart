import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:projet_progm/src/categories/Quizzz/generalQuestion/randomQuiz.dart';
import 'package:projet_progm/src/categories/Quizzz/guesCountry/GuesCountry.dart';
import 'package:projet_progm/src/categories/Quizzz/guesCountry/LevelOne/LevelOneGuesCountry.dart';
import 'package:projet_progm/src/categories/Quizzz/guesCountry/LevelTwo/guestCapital.dart';
import 'package:projet_progm/src/categories/Quizzz/guesCountry/country_model.dart';
import 'package:projet_progm/src/categories/Quizzz/guesCountry/endGame.dart';
import 'package:projet_progm/src/categories/Quizzz/guesMusic/GuesMusic.dart';
import 'package:projet_progm/src/categories/Quizzz/quizz_screen.dart';
import 'package:projet_progm/src/categories/categories_screen.dart';
import 'package:projet_progm/src/categories/movements/bubbleGame/BubbleGame.dart';
import 'package:projet_progm/src/categories/movements/collectFruits/CollectFruits.dart';
import 'package:projet_progm/src/categories/movements/movement_screen.dart';
import 'package:projet_progm/src/categories/movements/pacManGame/PacMan.dart';
import 'package:projet_progm/src/categories/sensors/ballMov.dart/SuperBall.dart';
import 'package:projet_progm/src/categories/sensors/sensors_screen.dart';

import 'package:projet_progm/src/home_screen/home_screen.dart';
import 'package:projet_progm/src/home_screen/startGame.dart';
import 'package:projet_progm/src/multiPlayer/wifiptop.dart';
import 'package:projet_progm/src/multiPlayer/wifiptop_screen.dart';

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
          // builder: (BuildContext context, GoRouterState state) => const HomeWifiPtoP(),
   builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
  //  builder: (BuildContext context, GoRouterState state) => GuesMusic(),
//builder: (BuildContext context, GoRouterState state) => const SuperBall(),

  ),
  GoRoute(
    path: "/categories",
    builder: (BuildContext context, GoRouterState state) =>
        const CategoriesScreen(),
  ), GoRoute(
    path: "/challenge",
    builder: (BuildContext context, GoRouterState state) =>
        const StartChallenge(),
  
  
  
  ),
 GoRoute(
    path: "/wifiptop",
      builder: (BuildContext context, GoRouterState state) => const HomeWifiPtoP(),
  ),
    GoRoute(
    name : "quiz",
    path: "/quiz",
    builder: (BuildContext context, GoRouterState state) => const QuizScreen(),
  ),
  GoRoute(
    path: "/guesCountry",
    builder: (BuildContext context, GoRouterState state) => GuesCountry(),
  ),
    GoRoute(
    path: "/guesMusic",
    builder: (BuildContext context, GoRouterState state) => GuesMusic(),
  ),
    GoRoute(
    path: "/randomQuiz",
    builder: (BuildContext context, GoRouterState state) => const RandomQuiz(),
  ),
  GoRoute(
      name: "levelOneGuesCountry",
      path: "/levelOneGuesCountry",
      builder: (BuildContext context, GoRouterState state) =>
          LevelOneGuesCountry(countries: state.extra as List<Country>)),


          GoRoute(
      name: "leveltwo",
      path: "/guesCapital",
      builder: (BuildContext context, GoRouterState state) =>
          GuesCapital(countries: state.extra as List<Country>)),
  GoRoute(
      name: "endGame",
      path: "/endGame",
      builder: (BuildContext context, GoRouterState state) =>
          endGame(score: state.queryParams["score"]!)),

  GoRoute(path: "/movement",
    builder: (BuildContext context, GoRouterState state) => const MovementScreen()
  ),
   GoRoute(path: "/pacMan",
    builder: (BuildContext context, GoRouterState state) => const PacManScreen()
  ),
    GoRoute(path: "/collect",
    builder: (BuildContext context, GoRouterState state) => const CollectFruits()
  ),

   GoRoute(path: "/bubble",
    builder: (BuildContext context, GoRouterState state) => const BubbleScreen()
  ),
  GoRoute(
    path: "/sensor",
    builder:(BuildContext context, GoRouterState state)  => const SensorsScreen()
  ),
    GoRoute(
    path: "/moveBall",
    builder:(BuildContext context, GoRouterState state)  => const SuperBall()
  )
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      title: 'Mysterius',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple.shade900),
      ),
    );
  }
}
