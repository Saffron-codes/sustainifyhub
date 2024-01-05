import 'package:flutter/material.dart';
import 'package:sustainify_hub/widgets/page_heading.dart';

class ScrapesView extends StatelessWidget {
  const ScrapesView({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        "title": "Plastics",
        "image":
            "https://www.forbesindia.com/media/images/2018/Jun/img_107085_plastics_sm.jpg"
      },
      {
        "title": "Cardboard",
        "image":
            "https://www.rubicon.com/wp-content/uploads/2021/07/shutterstock_1074202973-scaled.jpg"
      },
      {
        "title": "E-Waste",
        "image":
            "https://images.tech.co/wp-content/uploads/2020/07/08081008/techco-e-waste-1.jpeg"
      },
      {
        "title": "Metal Waste",
        "image":
            "https://www.paldrop.com/wp-content/uploads/2018/05/scrap-metal-recycling.jpeg"
      },
      {
        "title": "Glass Waste",
        "image":
            "https://i0.wp.com/www.circularonline.co.uk/wp-content/uploads/2019/08/British-Glass-Issues-Open-Letter.png"
      }
    ];
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(20),
          physics: BouncingScrollPhysics(),
          children: [
            PageHeader("Recycle Waste"),
            ...items.map(
              (item) => _WasteCard(
                title: item['title']!,
                imageUrl: item['image']!,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _WasteCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  const _WasteCard({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(
                      imageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(title),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.chevron_right))
            ],
          ),
        ),
      ),
    );
  }
}
