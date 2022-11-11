import 'package:dimora_duomo/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String inputText;
  final IconData? icon;
  final VoidCallback onClick;
  final Color color;
  final Color iconColor;

  const CustomButton({
    Key? key,
    required this.inputText,
    this.icon,
    required this.onClick,
    required this.color,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
        onPressed: () {
          return onClick();
        },
        //Style
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0))),
        child:
            // ListTile(
            //   title: Text(
            //     inputText,
            //     style: const TextStyle(color: kButtonTextColor, fontSize: 18),
            //   ),
            //   trailing: Icon(
            //     icon,
            //     color: iconColor,
            //   ),
            // ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          //Text
          Text(
            inputText,
            style: const TextStyle(color: kButtonTextColor, fontSize: 18),
          ),

          //Icon
          Icon(
            icon,
            color: iconColor,
          ),
        ]),
      ),
    );
  }
}
