import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football/core/cubit/screen_index_cubit.dart';
import 'package:football/core/dependency_injection/service_locator.dart';
import 'package:football/core/widgets/screen_controller.dart';

import 'package:football/core/widgets/splash_screen.dart';
import 'package:football/features/matches/presentation/cubit/matches_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/features/settings_and_more/presentation/screens/settings.dart';
import 'core/utils/app_info.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge); 
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor:  Color(0xFF262626),  
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarColor: Color(0xFF262626)
  ));
  await AppInfo.init();
  setup();
  runApp(const FootballApp());
}

class FootballApp extends StatelessWidget {
  const FootballApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider( 
      providers: [
        BlocProvider<MatchesCubit>(
          create: (context) => MatchesCubit(getIt()),
        ),
        BlocProvider<ScreenIndexCubit>(
          create: (context) => ScreenIndexCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          // '/': (context) => const SplashScreen(), 
          '/settings': (context) => const SettingsScreen(),
          // '/home': (context) => ScreenController(),
        },
        initialRoute: '/settings', 
        theme: ThemeData(
          fontFamily: "GTWalsheim",
          textTheme: const TextTheme(

          ),
          
        ),
      ),
    );
  }
}













// import 'package:flutter/material.dart';
 
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
//   TabController? _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
    
//     _tabController?.addListener(() {
//       if (_tabController?.indexIsChanging == false) {
//         print("User swiped to tab ${_tabController?.index}");
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _tabController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Tab Swipe Example"),
//         bottom: TabBar(
//           controller: _tabController,
//           tabs: [
//             Tab(icon: Icon(Icons.directions_car)),
//             Tab(icon: Icon(Icons.directions_transit)),
//             Tab(icon: Icon(Icons.directions_bike)),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           Center(child: Text("Car Tab")),
//           Center(child: Text("Transit Tab")),
//           Center(child: Text("Bike Tab")),
//         ],
//       ),
//     );
//   }
// }
