import 'package:flutter/material.dart';
import 'package:travel_app_paralax_effect_flutter/constants.dart';
import 'package:travel_app_paralax_effect_flutter/models/destination.dart';

class TopDestinationItem extends StatelessWidget {
  final Destination details;

  const TopDestinationItem({super.key, required this.details});

  Widget image() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Image.asset(
        details.image,
        width: 90,
        height: 90,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget text() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          details.city,
          style: const TextStyle(
              color: kSecondaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        Text(details.country,
            style: TextStyle(
              color: kSecondaryColor.withOpacity(0.6),
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      padding: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: kPrimaryColor,
          boxShadow: [
            const BoxShadow(
              offset: Offset(-2, -2),
              color: Colors.white70,
            ),
            BoxShadow(
                offset: const Offset(2, 2),
                color: kSecondaryColor.withOpacity(0.2))
          ]),
      child: Row(children: [image(), const SizedBox(width: 16), text()]),
    );
  }
}
