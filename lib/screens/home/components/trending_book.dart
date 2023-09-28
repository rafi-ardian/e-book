import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/screens/home/pages/book_details.dart';
import 'package:e_book_app/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrendingBook extends StatelessWidget {
  const TrendingBook({
    super.key,
    required this.info,
  });

  final BookList info;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, BookDetail.nameRoute, arguments: {
              'imageUrl': info.imageUrl,
              'writers': info.writers,
              'title': info.title,
            });
          },
          child: Hero(
            tag: info.imageUrl,
            child: Container(
              margin: EdgeInsets.only(right: 20, top: 12),
              width: 110,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(info.imageUrl),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          info.writers,
          style: mediumText12.copyWith(color: greyColor),
        ),
        Text(
          info.title,
          style: semiBoldText14.copyWith(color: blackColor),
        ),
      ],
    );
  }
}
