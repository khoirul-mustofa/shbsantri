import 'package:flutter/material.dart';
import 'package:shbsantri/infrastructure/theme/colors/colors_app.dart';

class NewsCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String excerpt;
  final String category;

  const NewsCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.excerpt,
    required this.category,
  });

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                transform: _isHovered
                    ? Matrix4.identity().scaled(1.03)
                    : Matrix4.identity(),
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Chip(
                  backgroundColor: Colors.teal[600],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  label: Text(
                    widget.category,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            // Wrap(
            //   children: List.generate(widget.category.length, (index) {
            //     return Chip(
            //       backgroundColor: Colors.teal[600],
            //       padding:
            //           const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            //       label: Text(
            //         widget.category[index],
            //         style: const TextStyle(color: Colors.white),
            //       ),
            //     );
            //   }),
            // ),
            AnimatedPadding(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.symmetric(
                horizontal: _isHovered ? 5 : 20,
                vertical: 10,
              ),
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: TextStyle(
                  fontSize: _isHovered ? 20 : 18,
                  fontWeight: FontWeight.bold,
                  color: _isHovered ? lightPrimaryColor : lightPrimaryFontColor,
                ),
                child: Text(
                  widget.title,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Text(
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                widget.excerpt,
                style: const TextStyle(
                  color: lightPrimaryFontColor,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
