import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shbsantri/domain/core/models/news_model.dart';
import 'package:shbsantri/infrastructure/theme/colors/colors_app.dart';

class NewsCard extends StatefulWidget {
  final DataNews dataNews;
  const NewsCard({
    super.key,
    required this.dataNews,
  });

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  bool _isHovered = false;
  var dateTime;

  @override
  void initState() {
    super.initState();
    setState(() {
      dateTime = DateTime.parse(widget.dataNews.createdAt ?? '');
    });
  }

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
                  widget.dataNews.image ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.teal[600],
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Text(
                    widget.dataNews.category?.name ?? '',
                    style:
                        GoogleFonts.poppins(fontSize: 10, color: Colors.white),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: SizedBox(
                    width: 35,
                    height: 35,
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage(widget.dataNews.user?.avatar ?? ''),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text(widget.dataNews.user?.name ?? ''),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(GetTimeAgo.parse(dateTime, locale: 'in')),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                widget.dataNews.title ?? '',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Text(
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                widget.dataNews.content ?? '',
                style: const TextStyle(
                  color: lightPrimaryFontColor,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
