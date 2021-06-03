import 'package:auctioneer/app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class KSocialLoginButton extends StatelessWidget {
  const KSocialLoginButton({
    Key? key,
    required this.text,
    required this.leading,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final Widget leading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(6),
      onTap: onTap,
      child: Ink(
        height: 64,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: darkOrange,
          border: Border.all(
            color: darkBlue,
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              Positioned(
                left: 20,
                top: 20,
                child: leading,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: darkBlue,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
