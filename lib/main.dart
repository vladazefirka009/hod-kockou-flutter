import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const DiceApp());
}

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hod kockou',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFAD2874)),
        scaffoldBackgroundColor: const Color(0xFFFFF7FB),
        useMaterial3: true,
      ),
      home: const DicePage(),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  final Random _random = Random();
  int _diceValue = 1;
  bool _hasRolled = false;

  void _rollDice() {
    setState(() {
      _diceValue = _random.nextInt(6) + 1;
      _hasRolled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 360),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Hod kockou',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colors.onSurface,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Jeden klik. Šesť možností.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 32),
                  Image.asset(
                    'assets/images/dice-$_diceValue.png',
                    width: 240,
                    height: 240,
                    fit: BoxFit.contain,
                    semanticLabel: 'Kocka: $_diceValue',
                    gaplessPlayback: true,
                  ),
                  const SizedBox(height: 24),
                  Semantics(
                    liveRegion: true,
                    child: Text(
                      _hasRolled
                          ? 'Padlo číslo $_diceValue'
                          : 'Skús svoje šťastie',
                      style: Theme.of(context).textTheme.titleLarge
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: FilledButton.icon(
                      onPressed: _rollDice,
                      icon: const Icon(Icons.casino_outlined),
                      label: const Text(
                        'Hodiť kockou',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Každý hod je náhodný. Číslo sa môže zopakovať.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: colors.onSurfaceVariant),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
