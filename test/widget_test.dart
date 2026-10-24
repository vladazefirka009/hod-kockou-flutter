import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hod_kockou/main.dart';

void main() {
  testWidgets('Assets sa načítajú a tlačidlo zobrazí hod v rozsahu 1–6', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 640);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    for (var value = 1; value <= 6; value++) {
      final bytes = await rootBundle.load('assets/images/dice-$value.png');
      expect(bytes.lengthInBytes, greaterThan(0));
    }

    await tester.pumpWidget(const DiceApp());
    await tester.pumpAndSettle();
    expect(find.text('Skús svoje šťastie'), findsOneWidget);

    for (var roll = 0; roll < 60; roll++) {
      await tester.tap(find.text('Hodiť kockou'));
      await tester.pumpAndSettle();
      final result = find.textContaining('Padlo číslo');
      expect(result, findsOneWidget);
      final text = tester.widget<Text>(result).data!;
      expect(text, matches(RegExp(r'^Padlo číslo [1-6]$')));
      final value = int.parse(text.split(' ').last);
      final image = tester.widget<Image>(find.byType(Image));
      expect(
        (image.image as AssetImage).assetName,
        'assets/images/dice-$value.png',
      );
      expect(tester.takeException(), isNull);
    }
  });
}
