# Base structure for projects

This is App with Auth Function like Login. All API using [reqres.in](https://reqres.in/).
<br>This app also implementing **Flutter Clean Architecture.**

## Getting Started

- Clone this project
- Run `flutter pub get`
- Run `flutter gen-l10n` to generate localization files
- Run `flutter pub run build_runner build --delete-conflicting-outputs` to generate freezes files
- Run `flutter run --flavor dev -t lib/main_dev.dart` for **develop** or
- Run `flutter run --flavor test -t lib/main_qa.dart` for **testing** or
- Run `flutter run --flavor prd -t lib/main_prd.dart` for **production**
- Run Test `flutter test`
- To generate mock class `flutter pub run build_runner build`

## Feature ✅

- [x] BLoC State Management
- [x] **Clean Architecture**
    - [x] Unit Test
    - [x] Widget Test
    - [x] BLoC test
- [x] Theme Configuration : `System, Light, Dark`
- [x] Multi Language : `Spanish`
- [x] Login Example
- [ ] Register Example
- [ ] Pagination Example
- [ ] Autofill Username and Password

## TODO 📝

- [ ] Integration Test
- [ ] Implement multi flavor
- [x] Implement [Go Router](https://pub.dev/packages/go_router)

## Architecture Proposal by [Resocoder](https://github.com/ResoCoder/flutter-tdd-clean-architecture-course)

