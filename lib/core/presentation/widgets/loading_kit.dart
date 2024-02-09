import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingKit extends StatelessWidget {
  const LoadingKit({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.halfTriangleDot(
      size: 50,
      color: Colors.white,
    );
  }
}
