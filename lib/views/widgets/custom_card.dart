import 'package:dimora_duomo/constants.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String inputText;
  final IconData icon;
  final VoidCallback onClick;
  final bool orderSubmitted;
  final Color color;

  const CustomCard({
    super.key,
    required this.inputText,
    required this.icon,
    required this.onClick,
    required this.orderSubmitted,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: InkWell(
        onTap: () => onClick(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(30.0)),
            child: Container(
              height: 100,
              width: 250,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Text(
                inputText,
                style: const TextStyle(
                    color: kBackgroundColor,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(30.0)),
            child: Container(
              height: 100,
              alignment: Alignment.center,
              // padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListTile(
                subtitle: orderSubmitted
                    ? const Text(
                        'Order submitted.',
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                            color: kTertiaryColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w300),
                      )
                    : null,
                trailing: Icon(
                  icon,
                  size: 64,
                  color: kBackgroundColor,
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     const Text(
              //       'Order submitted.',
              //       textAlign: TextAlign.center,
              //       style: TextStyle(
              //           color: kTertiaryColor,
              //           fontSize: 24,
              //           fontWeight: FontWeight.w300),
              //     ),
              //     Icon(
              //       icon,
              //       size: 64,
              //       color: kBackgroundColor,
              //     )
              //   ],
              // ),
            ),
          ),
        ]),
      ),
    );
  }
}
