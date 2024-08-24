import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football/core/cubit/screen_index_cubit.dart';
import 'package:football/core/dependency_injection/service_locator.dart';
import 'package:football/core/widgets/screen-controller.dart';

import 'package:football/core/widgets/splash_screen.dart';
import 'package:football/features/home/presentation/cubit/matches_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge); 
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor:  Color(0xFF262626),  
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarColor: Color(0xFF262626)
  ));
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
          '/': (context) => const SplashScreen(),
          '/home': (context) => ScreenController()
        },
        initialRoute: '/', 
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
//       title: 'SliverAppBar with TabBar Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         body: NestedScrollView(
//           headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//             return [
//               SliverAppBar(
//                 expandedHeight: 100.0,
//                 floating: true,
//                 pinned: true,
//                 toolbarHeight: 0,
//                 flexibleSpace: LayoutBuilder(
//                   builder: (BuildContext context, BoxConstraints constraints) {
//                     return FlexibleSpaceBar(
//                       background: Stack(
//                         fit: StackFit.expand,
//                         children: [
//                           Positioned(
//                             top: 0,
//                             left: 0,
//                             right: 0,
//                             child: SafeArea(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   IconButton(
//                                     icon: Icon(Icons.menu, color: Colors.black),
//                                     onPressed: () {
//                                       // Action for leading icon
//                                     },
//                                   ),
//                                   Row(
//                                     children: [
//                                       IconButton(
//                                         icon: Icon(Icons.search,
//                                             color: Colors.black),
//                                         onPressed: () {
//                                           // Action for search icon
//                                         },
//                                       ),
//                                       IconButton(
//                                         icon: Icon(Icons.more_vert,
//                                             color: Colors.black),
//                                         onPressed: () {
//                                           // Action for more options
//                                         },
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       collapseMode: CollapseMode.parallax,
//                     );
//                   },
//                 ),
//                 bottom: TabBar(
//                   tabs: [
//                     Tab(icon: Icon(Icons.home), text: 'Home'),
//                     Tab(icon: Icon(Icons.star), text: 'Favorites'),
//                     Tab(icon: Icon(Icons.person), text: 'Profile'),
//                   ],
//                 ),
//               ),
//             ];
//           },
//           body: TabBarView(
//             children: [
//               Center(child: Text('Home Tab Content')),
//               ListView.builder(
//                 itemCount: 60,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     height: 50,
//                     margin: EdgeInsets.symmetric(vertical: 5),
//                     padding: EdgeInsets.all(10),
//                     color: Colors.blueAccent,
//                     child: Text("Item $index", style: TextStyle(color: Colors.white)),
//                   );
//                 },
//               ),
//               Center(child: Text('Profile Tab Content')),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
