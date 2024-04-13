import 'package:flutter/material.dart';

class WithLoadingButton extends StatelessWidget {
  const WithLoadingButton({
    super.key,
    required this.isLoading,
    required this.child,
  });

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const SizedBox.square(
            dimension: 20.0,
            child: CircularProgressIndicator.adaptive(
              backgroundColor: Colors.white,
              strokeWidth: 1.0,
            ),
          )
        : child;
  }
}
