import 'package:flutter/foundation.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:pokemonapi/presentation/screens/pokemon_index_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(appBarTheme: const AppBarTheme()),
      home: const PokemonIndexScreen(),
      builder: (context, child) {
        final content = child ?? const SizedBox.shrink();

        if (!kDebugMode) return content;

        return DeviceFrame(
          device: Devices.ios.iPhone16ProMax,
          isFrameVisible: true,
          orientation: Orientation.portrait,
          screen: content,
        );
      },
    );
  }
}
