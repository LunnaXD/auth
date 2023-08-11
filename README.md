# Base structure for projects

This is App with Auth Function like Login. All API using [reqres.in](https://reqres.in/).
`
"email": "eve.holt@reqres.in",
"password": "cityslicka"`
<br>This app also implementing **Flutter Clean Architecture.**

## Getting Started

- Clone this project
- Run `fvm flutter pub get`
- Run `fvm flutter gen-l10n` to generate localization files
- Run `fvm flutter pub run build_runner build --delete-conflicting-outputs` to generate freezes files
- Run `fvm flutter run --flavor stg -t lib/main.dart --dart-define-from-file .env.stg.json` for **staging** or
- Run `fvm flutter run --flavor prd -t lib/main.dart --dart-define-from-file .env.prd.json` for **production**
- Run Test `fvm flutter test`
- To generate mock class `fvm flutter pub run build_runner build`

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

