# Flutter Authentication with Firebase Project

A Flutter app that integrates Firebase for backend services like authentication, storage, and real-time database. This repository includes the code and setup instructions to get started with the project.

## Features
- Firebase Authentication
- State management with Riverpod

## Prerequisites

Before running this project, ensure that you have the following installed:
- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)
- Firebase project (see instructions below for setting up)

## Getting Started

### 1. Clone the Repository
Clone this repository to your local machine:
```bash
git clone git@github.com:YassineElkefi/Fixme-training.git
git checkout auth
```

### 2. Install Dependencies
Install the required Flutter dependencies:
```bash
flutter pub get
```

### 3. Firebase Setup
#### 3.1 Set up Firebase Project

To configure Firebase for your app, follow these steps:

Go to the Firebase Console.
Create a new project or select an existing project.
###
Add Firebase to your Flutter app:<br/>
For Android: Download google-services.json and place it in the android/app/ directory.
For iOS: Download GoogleService-Info.plist and place it in the ios/Runner/ directory.
#### 3.2 Configure Firebase for Your Project

To generate the firebase_options.dart file, you'll need to use the FlutterFire CLI.

Install the FlutterFire CLI:
```bash
dart pub global activate flutterfire_cli
```
Authenticate with Firebase:
```bash
flutterfire login
```
Configure Firebase for your Flutter app:
```bash
flutterfire configure
```
This command will automatically generate the lib/firebase_options.dart file containing the necessary configuration for your Firebase project.

### 4. Run the app
```bash
flutter run
```