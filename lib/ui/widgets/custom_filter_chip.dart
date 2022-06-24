import 'package:events_poster/ui/constants.dart';
import 'package:flutter/material.dart';

class CustomFilterChip extends StatelessWidget {
  const CustomFilterChip(
      {Key? key, required this.text, required this.isActive, required this.onTap})
      : super(key: key);
  final String text;
  final bool isActive;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 46.0,
        decoration: BoxDecoration(
          color: isActive ? kActiveChipColor : kWhiteColor,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 14.0,
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        )),
      ),
    );
  }
}
