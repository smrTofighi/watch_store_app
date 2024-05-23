import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store_app/components/theme.dart';
import 'package:watch_store_app/features/auth/cubit/auth_cubit.dart';
import 'package:watch_store_app/features/auth/cubit/timer_cubit.dart';
import 'package:watch_store_app/features/auth/screens/send_code_screen.dart';
import 'package:watch_store_app/features/main/main_screen.dart';
import 'package:watch_store_app/route/routes.dart';
import 'package:watch_store_app/utils/shared_preferences_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesManager().init();
  runApp(
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(
          create: (context) => TimerCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Watch Store',
        theme: lightTheme(),
        routes: routes,
        home: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthLoggedInState) {
              return const MainScreen();
            } else if (state is AuthLoggedOutState) {
              return SendCodeScreen();
            } else {
              return SendCodeScreen();
            }
          },
        ),
      ),
    );
  }
}
