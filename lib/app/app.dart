import 'package:auctioneer/app/wrapper.dart';
import 'package:auctioneer/authentication/data/cubit/auth_cubit.dart';
import 'package:auctioneer/authentication/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:auctioneer/l10n/l10n.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final AuthRepository authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(authRepository: authRepository),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          accentColor: const Color(0xFFF9F871),
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
          canvasColor: Colors.white,
          brightness: Brightness.light,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: const Wrapper(),
      ),
    );
  }
}
