import 'package:a05_riverpod_annotations/config/config.dart';
import 'package:a05_riverpod_annotations/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final appRouter = ref.watch(appRouterProvider);
    final isDarkmode = ref.watch(darkModeProvider);
    return MaterialApp.router(
      title: 'Riverpod Providers',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme(isDarkmode: isDarkmode).getTheme(),
    );
  }
}
