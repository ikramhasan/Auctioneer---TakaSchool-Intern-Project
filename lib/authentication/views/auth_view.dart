import 'package:auctioneer/app/constants/app_colors.dart';
import 'package:auctioneer/authentication/components/k_social_button.dart';
import 'package:auctioneer/authentication/data/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightOrange,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animations/money_plant.json',
              frameRate: FrameRate.max,
              height: 350,
              width: 350,
            ),
            bodyTitleText(context),
            Text(
              'Get the best price for your products',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const Spacer(),
            KSocialLoginButton(
              leading: const FaIcon(
                FontAwesomeIcons.google,
                color: darkBlue,
              ),
              onTap: () {
                context.read<AuthCubit>().loginWithGoogle();
              },
              text: 'Login with Google',
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Text bodyTitleText(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'Auctioneer',
        children: [
          TextSpan(
            text: ' by TakaSchool',
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontSize: 18,
                ),
          ),
        ],
      ),
      style: Theme.of(context).textTheme.headline5!.copyWith(
            fontWeight: FontWeight.bold,
            color: darkBlue,
          ),
    );
  }
}
