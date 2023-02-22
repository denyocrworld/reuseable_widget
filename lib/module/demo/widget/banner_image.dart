// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BannerImage extends StatelessWidget {
  final String url;
  final String title;
  final String subtitle;
  final String info;
  const BannerImage({
    Key? key,
    required this.url,
    required this.title,
    required this.subtitle,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      width: MediaQuery.of(context).size.width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            url,
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            16.0,
          ),
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          const Positioned(
            top: 10,
            right: 10,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  info,
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
