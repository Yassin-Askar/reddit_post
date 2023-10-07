import 'package:flutter/material.dart';
import 'package:reddit_post/constants/images.dart';

class PostAppBarWidget extends StatelessWidget {
  const PostAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: IconButton(
                      padding: const EdgeInsets.only(left: 18),
                      alignment: Alignment.centerLeft,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 40,
                      ))),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      child: Image.asset(
                    imageCats,
                    alignment: Alignment.centerRight,
                  )),
                  const Expanded(
                    child: Text(
                      "r/cats",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
              Expanded(
                  child: IconButton(
                      padding: const EdgeInsets.only(right: 18),
                      alignment: Alignment.centerRight,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_horiz_outlined,
                        color: Colors.white,
                        size: 30,
                      ))),
            ],
          ),
        ),
      ],
    );
  }
}
