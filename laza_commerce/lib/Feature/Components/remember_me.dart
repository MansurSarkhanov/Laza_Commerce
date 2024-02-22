import 'package:flutter/cupertino.dart';
import 'package:laza_commerce/Product/Constants/app_colors.dart';

class RememberMe extends StatelessWidget {
  const RememberMe({super.key, required this.isRemember, required this.onChanged});
  final bool isRemember;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Remember me",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 30,
          width: 45,
          child: FittedBox(
              fit: BoxFit.fill,
              child: CupertinoSwitch(activeColor: AppColors.primaryColor, value: isRemember, onChanged: onChanged)),
        )
      ],
    );
  }
}
