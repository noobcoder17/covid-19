import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

//screen
import './screens/root_page.dart';
import './screens/details_screen.dart';
import './screens/view_all_screen.dart';
import './screens/link_details_screen.dart';

//providers
import './providers/home_provider.dart';


void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xff008e7b),
    statusBarIconBrightness: Brightness.light
  ));
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (BuildContext ctx)=>HomeProvider(),
        )
      ],
      child:MaterialApp(
        //showPerformanceOverlay: true,
        debugShowCheckedModeBanner: false,
        title: 'Corona Virus',
        theme: ThemeData(
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android : CupertinoPageTransitionsBuilder()
            }
          )
        ),
        home: RootPage(),
        routes: {
          DetailsScreen.routeName : (BuildContext ct)=>DetailsScreen(),
          ViewAll.routeName :(BuildContext ct)=>ViewAll(),
          LinkDetailsScreen.routeName : (BuildContext ct)=>LinkDetailsScreen()
        },
      ),
    );
  }
}