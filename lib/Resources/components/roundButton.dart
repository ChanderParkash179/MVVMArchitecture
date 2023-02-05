import 'package:flutter/material.dart';
import 'package:mvvm/Resources/colors/colors.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundedButton(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPress,
        child: Container(
          height: 40,
          width: 200,
          decoration: BoxDecoration(
            color: AppColors().buttonColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
              child: loading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      title.toUpperCase(),
                      style: TextStyle(
                        color: AppColors().whiteColor,
                        fontSize: 16,
                        letterSpacing: 1,
                      ),
                    )),
        ));
  }
}
