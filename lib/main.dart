import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:r_study/riverpod/provider_observer.dart';
import 'package:r_study/screen/home_screen.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [
        Logger(),
      ], // provider observer를 통해 provider 모니터링 가능
      child: MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}
