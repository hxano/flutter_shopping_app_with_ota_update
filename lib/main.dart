import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_app_with_ota_updates/repository/cloud_config.dart';
import 'package:flutter_shopping_app_with_ota_updates/view/main_navigator.dart';
import 'package:flutter_shopping_app_with_ota_updates/view/screens/item_details/item_details_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'view/screens/search/detailed_search_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const ProviderScope(child: MyApp()));
}

final abTestProvider = Provider<bool>((ref) {
  return CloudConfig().getAbTest();
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lora',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purpleAccent,
            foregroundColor: Colors.white,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[200],
        ),
      ),
      home: const MainNavigator(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/detailed_search':
            final text = settings.arguments as String;
            return PageTransition(
              child: DetailedSearchScreen(text: text),
              type: PageTransitionType.rightToLeft,
            );
            case '/item_details':
              final id = settings.arguments as String;
              return PageTransition(
                child: ItemDetailsScreen(id: id),
                type: PageTransitionType.rightToLeft,
              );
          default:
            return null;
        }
      },
    );
  }
}
