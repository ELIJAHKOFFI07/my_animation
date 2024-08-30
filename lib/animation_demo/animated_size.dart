import 'package:flutter/material.dart';
class AnimatedSizeDemo extends StatefulWidget {
  const AnimatedSizeDemo({super.key});

  @override
  State<AnimatedSizeDemo> createState() => _AnimatedSizeDemoState();
}

class _AnimatedSizeDemoState extends State<AnimatedSizeDemo>with SingleTickerProviderStateMixin {
  bool isBig=true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: (){setState(() {

          isBig=!isBig;
        });
        },
        child: AnimatedSize(
          curve: Curves.bounceOut,

          duration: const Duration(seconds: 1),

          child: Container(
            height: (isBig)?300:150,
            width: (isBig)?300:150,
            color: Colors.lightBlueAccent,
          ),
        ),
      ),
    );
  }
}
