import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardButton extends StatelessWidget {
  const DashboardButton({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Get.theme.colorScheme.secondary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        ),
        child: Text(
          "Tüm Okunanları Göster",
          style: Get.theme.textTheme.button?.copyWith(
            color: Get.theme.colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
