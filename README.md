# Hod kockou

Git repozitár: https://github.com/vladazefirka009/hod-kockou-flutter

## Spustenie

Použitá verzia: Flutter 3.47.6 / Dart 3.13.5. Potrebný je Flutter SDK a pre Android aj Android SDK a JDK.

```sh
flutter pub get
flutter run
```

Pre spustenie v prehliadači použite `flutter run -d chrome`.

## Implementácia zadania

- `lib/main.dart`: `DicePage` je `StatefulWidget`; trieda `_DicePageState` uchováva aktuálnu hodnotu.
- `_rollDice()` v `setState()` priradí `_random.nextInt(6) + 1`. Výsledok je celé číslo od 1 do 6 vrátane. Rovnaké číslo môže padnúť aj po sebe.
- `Image.asset('assets/images/dice-$_diceValue.png')` zobrazuje lokálny obrázok podľa hodnoty.
- `pubspec.yaml` registruje priečinok `assets/images/` so všetkými šiestimi pôvodnými obrázkami z dodaného archívu `dice-images.zip`.
- Rozhranie je vycentrované, má rozostupy, veľké tlačidlo a pri malej výške obrazovky umožňuje posúvanie.
- Pred prvým hodom sa zobrazuje strana 1 a text „Skús svoje šťastie“. Po kliknutí sa zobrazuje text „Padlo číslo N“.
- Aplikácia nepoužíva žiadne sieťové obrázky ani externé služby.

## Štruktúra

```text
lib/main.dart
assets/images/dice-1.png až dice-6.png
pubspec.yaml
test/widget_test.dart
android/
ios/
web/
screenshots/
```

## Overenie

```sh
flutter analyze
flutter test
flutter build apk --debug
```


