import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppAlertDialog extends StatelessWidget {

  const AppAlertDialog({
    super.key,
    required this.title,
    required this.onTap
  });
  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirmation'),
      content: Text(title),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(
            'assets/svgicon/file-slash.svg',
            width: 25,
            height: 25,
            colorFilter: const ColorFilter.mode(
                Colors.blueAccent,
                BlendMode.srcIn,
            ),
          ),
        ),
        TextButton(
          onPressed: onTap,
          child: SvgPicture.asset(
            'assets/svgicon/delete.svg',
            width: 25,
            height: 25,
            colorFilter: const ColorFilter.mode(
              Colors.blueAccent,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}