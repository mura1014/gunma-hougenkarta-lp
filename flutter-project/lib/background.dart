import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background-1.png'), // 背景画像のパスを指定
          fit: BoxFit.cover, // 画像を画面全体にフィットさせる
        ),
      ),
      child: child, // 背景の上に表示するウィジェット
    );
  }
}