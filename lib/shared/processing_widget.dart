import 'package:flutter/material.dart';
import 'package:grocery_app/configs/colors.dart';

class ProcessingWidget extends StatelessWidget {
  const ProcessingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.primaryColorDark.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.primaryColorDark,
                ),
              ),
            ),
            SizedBox(width: 8),
            Text(
              "Processing...",
              style: TextStyle(
                color: AppColors.primaryColorDark,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
  }
}
