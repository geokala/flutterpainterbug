This demonstrates what appears to be a bug in flutter's painter.

When run, click on 'Show transparency with a hole'.
What should result is a dark overlay with a single circular lighter 'hole'.

Tested, working as expected:
Desktop: Lubuntu 22.04 using `flutter run lib/main.dart -d linux`

Tested, failing:
Web: Using `flutter run lib/main.dart -d web-server`
  Browsers: Firefox 127.0.1 (64-bit) on Lubuntu 20.04.
            Chromium version 125.0.6422.112 snap (64-bit) on Lubuntu.

The initial problem (which prompted this POC) does not appear to affect mobile.
It does appear to affect release builds for web.
