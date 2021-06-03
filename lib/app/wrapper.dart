import 'package:auctioneer/app/home_view.dart';
import 'package:auctioneer/authentication/data/cubit/auth_cubit.dart';
import 'package:auctioneer/authentication/views/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is Authenticated) {
          return const HomeView();
        }

        return const AuthView();
      },
    );
  }
}
