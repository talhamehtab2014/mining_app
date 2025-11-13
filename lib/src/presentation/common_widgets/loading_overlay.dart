import 'package:flutter/material.dart';
import 'package:mining_application/src/core/resource/r.dart';

class LoadingOverlay extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final Color? bgColor;

  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: bgColor ?? Colors.white54,
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(R.palette.primary),
            ),
          ),
      ],
    );
  }
}
