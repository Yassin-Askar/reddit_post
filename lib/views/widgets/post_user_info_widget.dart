import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/icons.dart';

class PostUserInfo extends StatelessWidget {
  const PostUserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 18),
              height: 10,
              child: Row(
                children: [
                  SvgPicture.asset(
                    iconProfilePic,
                    width: 30,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "catLover",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                width: 200,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 40.0),
                child: const Text(
                  "cute cats <3",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20),
                )),
          )
        ],
      ),
    );
  }
}
