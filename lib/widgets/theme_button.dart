import 'package:flutter/material.dart';
import 'package:music_app/state_management/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeButtonWidget extends StatelessWidget {
  const ThemeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
      value : themeProvider.isDarkMode, 
      onChanged: (bool value) { 
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.temaDegis(value);
        print(value);
       },
    );
  }
}