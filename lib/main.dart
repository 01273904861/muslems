import 'package:flutter/material.dart';
import 'package:muslems_app/views/azkar_view.dart';
import 'package:muslems_app/views/hadith_view.dart';
import 'package:muslems_app/views/home_page.dart';
import 'package:muslems_app/views/quran_view.dart';
import 'package:muslems_app/views/splash_screen.dart';

void main() async {
  mainAsync();
  // runApp(MyApp());
}

Future<void> mainAsync() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Dio dio = Dio();

  // List<Dkr> adkar = await AdkarServices().fetchBeforFinishPray();
  // for (var element in adkar) {
  //   print(element.title);
  // }

  runApp(const MuslemsApp());
}

class MuslemsApp extends StatelessWidget {
  const MuslemsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   // Define the default font family.
      //   fontFamily: 'ScheherazadeNew',
      //   // Define the default `TextTheme`. Use this to specify the default
      //   // text style for headlines, titles, bodies of text, etc.
      //   textTheme: const TextTheme(
      //     headlineSmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
      //     headlineMedium:
      //         TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      //     headlineLarge: TextStyle(fontSize: 72, fontFamily: 'ScheherazadeNew'),
      //   ),
      // ),
      debugShowCheckedModeBanner: false,
      routes: {
        HadithView.id: (context) => const HadithView(),
        AzkarView.id: (context) => const AzkarView(),
        QuranView.id: (context) => const QuranView(),
      },
      home: const SplashScreen(),
    );
  }
}

/*    Exception has occurred.
               FlutterError (Navigator operation requested with a
             context that does not include a Navigator.
             The context used to push or pop routes from the Navigator must 
              be that of a widget that is a descendant of a 
              Navigator widget.)
 */





/*
Widget build(BuildContext context) {
    return FutureBuilder<List<Dkr>>(
      future: futureAdkar,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final adkar = snapshot.data!;
          return ListView.builder(
            itemCount: adkar.length,
            itemBuilder: (context, index) {
              final dkr = adkar[index];
              return ListTile(
                title: Text(dkr.title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(dkr.reference, style: TextStyle(fontSize: 18)),
                    Text('التكرار: ${dkr.count}'),
                    Text('المصدر: ${dkr.reference}'),
                    if (dkr.description.isNotEmpty) Text(dkr.description),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
 */