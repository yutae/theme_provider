import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_theme/app_theme.dart';

import 'theme_controller.dart';

class ThemeProvider extends StatelessWidget {
  final Widget app;
  final List<AppTheme> themes;

  ThemeProvider({
    Key key,
    @required this.themes,
    @required this.app,
  }) : super(key: key) {
    assert(this.themes != null, "Theme list must not be null.");
    assert(this.themes.length >= 2, "Theme list must have at least 2 themes.");
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeController>(
      builder: (_) => ThemeController(themes: themes),
      child: Builder(
        builder: (context) => Theme(
              data: ThemeController.of(context).theme.data,
              child: app,
            ),
      ),
    );
  }
}