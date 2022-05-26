import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile/app/routers/app_pages.dart';
import 'package:mobile/app/utils/api.dart';
import 'package:mobile/app/utils/application.dart';
import 'package:mobile/app/utils/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';

import 'app/utils/toast.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance!.resamplingEnabled = true;
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  Application.api = API();
  Application.toast = Toastify();
  Application.sharePreference = await SpUtil.getInstance();
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          localizationsDelegates: const [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            FormBuilderLocalizations.delegate,
          ],
          locale: Locale('vi', 'VN'),
          debugShowCheckedModeBanner: false,
          title: "Application",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          color: Color(0xFFF58A30),
          theme: ThemeData(
            primaryColorDark: Color(0xFFF58A30),
            primaryColorLight: Color(0xFFF58A30),
          ),
        );
      },
    ),
  );
  // runApp(ModularApp(module: AppModule(), child: AppWidget()));
}

// final GoogleSignIn _googleSignIn = GoogleSignIn(
//     scopes: [
//       'email'
//     ]
// );
//
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//
//   GoogleSignInAccount? _currentUser;
//
//   @override
//   void initState() {
//     _googleSignIn.onCurrentUserChanged.listen((account) {
//       setState(() {
//         _currentUser = account;
//       });
//     });
//     _googleSignIn.signInSilently();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter Google Sign in'),
//       ),
//       body: Container(
//         alignment: Alignment.center,
//         child: _buildWidget(),
//       ),
//     );
//   }
//
//   Widget _buildWidget(){
//     GoogleSignInAccount? user = _currentUser;
//     if(user != null){
//       return Padding(
//         padding: const EdgeInsets.fromLTRB(2, 12, 2, 12),
//         child: Column(
//           children: [
//             ListTile(
//               leading: GoogleUserCircleAvatar(identity: user),
//               title:  Text(user.displayName ?? '', style: TextStyle(fontSize: 22),),
//               subtitle: Text(user.email, style: TextStyle(fontSize: 22)),
//             ),
//             const SizedBox(height: 20,),
//             const Text(
//               'Signed in successfully',
//               style: TextStyle(fontSize: 20),
//             ),
//             const SizedBox(height: 10,),
//             ElevatedButton(
//                 onPressed: signOut,
//                 child: const Text('Sign out')
//             )
//           ],
//         ),
//       );
//     }else{
//       return Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           children: [
//             const SizedBox(height: 20,),
//             const Text(
//               'You are not signed in',
//               style: TextStyle(fontSize: 30),
//             ),
//             const SizedBox(height: 10,),
//             ElevatedButton(
//                 onPressed: signIn,
//                 child: const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text('Sign in', style: TextStyle(fontSize: 30)),
//                 )
//             ),
//           ],
//         ),
//       );
//     }
//
//   }
//
//   void signOut(){
//     _googleSignIn.disconnect();
//   }
//
//   Future<void> signIn() async {
//     try{
//       GoogleSignInAccount? res = await _googleSignIn.signIn();
//       print("============================");
//       print(res);
//     }catch (e){
//       print('Error signing in $e');
//     }
//   }
//
// }
