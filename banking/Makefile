
### Useful commands
format:
	find . -not -path './.git/*' -not -path '*/.dart_tool/*' -name "*.dart" ! -name "*.g.dart" ! -name "*_test.dart" ! -name '*.swagger.*' ! -name '*.config.dart' ! -name '*.chopper.dart' ! -name '*.freezed.dart' | tr '\n' ' ' | xargs fvm flutter format --line-length=120
fix:
	fvm dart fix --apply
clean:
	fvm flutter clean
get:
	fvm flutter pub get
generate:
	fvm flutter packages pub run build_runner build --delete-conflicting-outputs
golden:
	fvm flutter test --update-goldens
test:
	fvm flutter test
upgrade:
	fvm flutter pub upgrade
localize:
	fvm flutter gen-l10n
setup:
	make get && make generate
splash:
	fvm flutter pub run flutter_native_splash:create
icon:
	fvm flutter pub run flutter_launcher_icons:main
