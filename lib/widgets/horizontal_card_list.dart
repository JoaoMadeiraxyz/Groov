import 'package:flutter/material.dart';

class HorizontalCardList extends StatelessWidget {
  final List<Map<String, String>> items;
  final double cardWidth;
  final double cardHeight;
  final void Function(int index)? onTap;

  const HorizontalCardList({
    super.key,
    required this.items,
    this.cardWidth = 150,
    this.cardHeight = 150,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardHeight + 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        itemCount: items.length,
        itemBuilder: (context, i) {
          final item = items[i];
          return GestureDetector(
            onTap: onTap != null ? () => onTap!(i) : null,
            child: Container(
              width: cardWidth,
              margin: const EdgeInsets.only(right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          item['imageUrl']!,
                          width: cardWidth,
                          height: cardHeight,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            width: cardWidth,
                            height: cardHeight,
                            color: Colors.grey[800],
                            child: const Icon(Icons.music_note, color: Colors.white, size: 48),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0, left: 0, right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.transparent, Colors.black.withValues(alpha: 0.8)],
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item['title']!,
                            style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  if (item['subtitle'] != null)
                    Text(
                      item['subtitle']!,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}