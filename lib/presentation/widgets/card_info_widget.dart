import 'package:flutter/material.dart';
import 'package:onmi_pro_app/data/models/photo_model.dart';

class CardInfoWidget extends StatelessWidget {
  final PhotoModel photo;
  final int index;

  const CardInfoWidget({
    super.key,
    required this.photo,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  photo.thumbnailUrl ?? '',
                ),
              ),
            ),
          ),
          ListTile(
            leading: Text(
              (index + 1).toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            title: Text(photo.title ?? 'No title'),
          )
        ],
      ),
    );
    ;
  }
}
