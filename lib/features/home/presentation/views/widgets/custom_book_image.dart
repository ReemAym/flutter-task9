import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageURL});

  final String imageURL;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 6,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
            aspectRatio: 1.8 / 3,
            child: CachedNetworkImage(
              imageUrl: imageURL,
              fit: BoxFit.fill,
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: Colors.redAccent,
              ),
            )

            //  Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(16),
            //     image: DecorationImage(
            //       image: NetworkImage(imageURL),
            //       fit: BoxFit.fill,
            //     ),
            //   ),
            // ),
            ),
      ),
    );
  }
}
