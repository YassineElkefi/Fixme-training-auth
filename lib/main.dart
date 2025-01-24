import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_tut/firebase_options.dart';
import 'package:flutter_auth_tut/models/app_user.dart';
import 'package:flutter_auth_tut/providers/auth_provider.dart';
import 'package:flutter_auth_tut/screens/profile/profile.dart';
import 'package:flutter_auth_tut/screens/welcome/welcome.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Consumer(
        builder: (context, ref, child) {
          final AsyncValue<AppUser?> user = ref.watch(authProvider);

          return user.when(data: (value){
            if(value == null){
              return const WelcomeScreen();
            }else{
              return ProfileScreen(user: value);
            }
          },
          error: (error, _)=> const Text('Error Loading Auth Status ...'),
          loading: () => const Text('Loading ...'),
          );
        },
      ),
    );
  }
}