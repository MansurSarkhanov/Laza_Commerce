import 'package:flutter/cupertino.dart';

class RememberMe extends StatelessWidget {
  const RememberMe({
    super.key,
  });

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
          child: FittedBox(fit: BoxFit.fill, child: CupertinoSwitch(value: false, onChanged: (value) {})),
        )
      ],
    );
  }
}
