import 'package:flutter/material.dart';

class CommunityBox extends StatelessWidget {
  const CommunityBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Help your Community",
          style: Theme.of(context).textTheme.labelLarge,
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            CommunityBanner(
              imageUrl:
                  "https://cdn0.iconfinder.com/data/icons/advertising-39/512/advertising_television_ads-4096.png",
                  title: "Support Charity"
            ),
            CommunityBanner(
              imageUrl:
                  "https://5.imimg.com/data5/TG/QJ/MY-977471/custom-packaging-box-500x500.jpg",
                  title: "Sell Boxes"
            ),
          ],
        )
      ],
    );
  }
}

class CommunityBanner extends StatelessWidget {
  final String imageUrl;
  final String title;
  const CommunityBanner({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: (MediaQuery.sizeOf(context).width / 2) - 19.5,
        ),
        Positioned(
          top: 10,
          child: Card(
            child: Container(
                width: (MediaQuery.sizeOf(context).width / 2.2) - 10,
                height: 50,
                margin: EdgeInsets.only(right: 10),
                child: Row(
                  children: [
                    Spacer(),
                    Text(
                      title,
                    ),
                  ],
                )),
          ),
        ),
        Positioned(
          child: CircleAvatar(
            radius: MediaQuery.sizeOf(context).width * 0.1,
            backgroundImage: NetworkImage(imageUrl),
          ),
        )
      ],
    );
  }
}
