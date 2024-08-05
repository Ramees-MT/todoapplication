import 'package:flutter/material.dart';
import 'package:todoapplication/util/constants.dart';

class Customisedapp extends StatelessWidget {
   Customisedapp({super.key});

  // Example data for images and text
  final List<String> images = [
    'asset/images/instagram (1).png',
    'asset/images/Facebook.png',
    'asset/images/twitter.png',
    'asset/images/telegram.png',
    'asset/images/gmail.png',
  ];

  final List<String> titles = [
    'Instagram',
    'Facebook',
    'Twitter',
    'Telegram',
    'Gmail',
  ];

  final List<String> descriptions = [
    'You spent 4h on Instagram today',
    'You spent 3h on Facebook today',
    'You spent 2h on Twitter today',
    'You spent 1h on Telegram today',
    'You spent 0.5h on Gmail today',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5, // Number of containers you want to display
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xff363636),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(
                    images[index % images.length], // Access image based on index
                    fit: BoxFit.contain,
                    height: 40,
                  ),
                  const SizedBox(
                    width: 8,
                  ), // Add spacing between image and text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          titles[index % titles.length], // Access title based on index
                          style: TextStyle(color: ktextdColor, fontSize: 13),
                          overflow: TextOverflow.ellipsis, // Handle overflow
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          descriptions[index % descriptions.length], // Access description based on index
                          style: TextStyle(color: ktextdColor, fontSize: 10),
                          overflow: TextOverflow.ellipsis, // Handle overflow
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.error_outline,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
