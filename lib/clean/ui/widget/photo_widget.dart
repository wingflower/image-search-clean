import 'package:flutter/material.dart';

class PhotoWidget extends StatelessWidget {
  const PhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://www.bntnews.co.kr/data/bnt/image/201108/54f595d17593797296c6bdbec72039b9.jpg'),
        ),
      ),
    );
  }
}
