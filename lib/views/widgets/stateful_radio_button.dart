import 'package:dimora_duomo/constants.dart';
import 'package:flutter/material.dart';

class StatefulRadioButton extends StatefulWidget {
  final void Function(String) onAnswer;
  const StatefulRadioButton({super.key, required this.onAnswer});

  @override
  State<StatefulRadioButton> createState() => _StatefulRadioButtonState();
}

class _StatefulRadioButtonState extends State<StatefulRadioButton> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customRadio('In my Room', 1),
        const SizedBox(height: 10),
        customRadio('At the Bar', 2)
      ],
    );
  }

  Widget customRadio(String text, int index) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            backgroundColor: (selected == index) ? kButtonSecondaryColor : null,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            side: const BorderSide(width: 2.0, color: kButtonSecondaryColor)),
        onPressed: () {
          widget.onAnswer(text);
          setState(() {
            selected = index;
          });
        },
        child: Row(
          children: [
            const Spacer(),
            Text(text,
                style: TextStyle(
                    color:
                        (selected == index) ? kBackgroundColor : kTertiaryColor,
                    fontSize: 24.0,
                    fontWeight: (selected == index)
                        ? FontWeight.bold
                        : FontWeight.w200)),
            const Spacer(),
            Icon(
              selected == index ? Icons.check_circle_outline : null,
              color: kTertiaryColor,
            )
          ],
        ),
      ),
    );
  }
}
