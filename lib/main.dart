//region imports
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import 'hairSalon/screens/BHSplashScreen.dart';
import 'main/store/AppStore.dart';
import 'main/utils/AppConstant.dart';
import 'main/utils/AppTheme.dart';
//endregion

/// This variable is used to get dynamic colors when theme mode is changed
AppStore appStore = AppStore();

int currentIndex = 0;

void main() async {
  //region Entry Point
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  appStore.toggleDarkMode(value: getBoolAsync(isDarkModeOnPref));

  runApp(MyApp());
  //endregion
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '$mainAppName${!isMobile ? ' ${platformName()}' : ''}',
        home: BHSplashScreen(),
        theme: !appStore.isDarkModeOn
            ? AppThemeData.lightTheme
            : AppThemeData.darkTheme,
        scrollBehavior: SBehavior(),
      ),
    );
  }
}
