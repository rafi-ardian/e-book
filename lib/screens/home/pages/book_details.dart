import 'package:e_book_app/themes.dart';
import 'package:flutter/material.dart';

class BookDetail extends StatelessWidget {
  static const nameRoute = '/bookDetails';
  const BookDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final Map data = ModalRoute.of(context)?.settings.arguments as Map;
    Widget header() {
      return Padding(
        padding: const EdgeInsets.all(30),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios_rounded),
              ),
              Text('Book Detail',
                  style: semiBoldText14.copyWith(color: blackColor)),
              Icon(Icons.share_outlined),
            ],
          ),
        ),
      );
    }

    Widget bookImage() {
      return Hero(
        tag: data['imageUrl'],
        child: Container(
          child: Column(
            children: [
              Container(
                width: 175,
                height: 267,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(19),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(data['imageUrl']),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget rating() {
      return Container(
        width: double.infinity,
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: ratingColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Rating',
                  style: mediumText10.copyWith(color: greyColor),
                ),
                Text(
                  '4.8',
                  style: semiBoldText12.copyWith(color: blackColor),
                ),
              ],
            ),
            VerticalDivider(thickness: 1, color: blackColor),
            Column(
              children: [
                Text(
                  'Number of Pages',
                  style: mediumText10.copyWith(color: greyColor),
                ),
                Text(
                  '180',
                  style: semiBoldText12.copyWith(color: blackColor),
                ),
              ],
            ),
            VerticalDivider(thickness: 1, color: blackColor),
            Column(
              children: [
                Text(
                  'Language',
                  style: mediumText10.copyWith(color: greyColor),
                ),
                Text(
                  'ENG',
                  style: semiBoldText12.copyWith(color: blackColor),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget buttonReadNow() {
      return Container(
        width: double.infinity,
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: greenColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(
            'Read Now',
            style: semiBoldText20.copyWith(color: whiteColor),
          ),
        ),
      );
    }

    Widget description() {
      return Container(
        width: 500,
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(39),
            topRight: Radius.circular(39),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['title'],
                        style: semiBoldText20.copyWith(color: blackColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        data['writers'],
                        style: mediumText14.copyWith(color: greyColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  'Free Access',
                  style: mediumText14.copyWith(color: greenColor),
                )
              ],
            ),
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'description',
                  style: semiBoldText14.copyWith(color: blackColor),
                ),
                SizedBox(height: 6),
                Text(
                  'Enchantment, as defined by bestselling business guru Guy Kawasaki, is not about manipulating people. It transforms situations and relationships. ',
                  style: regularText12.copyWith(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 20),
            rating(),
            SizedBox(height: 30),
            buttonReadNow(),
            SizedBox(height: 30)
          ],
        ),
      );
    }

    Widget saveButton() {
      return Positioned(
        top: 400,
        right: 30,
        child: Container(
          width: 50,
          height: 50,
          padding: EdgeInsets.symmetric(vertical: 17),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: greenColor,
          ),
          child: Image.asset('assets/icons/icon-save-nav.png'),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  header(),
                  SizedBox(height: 20),
                  bookImage(),
                  SizedBox(height: 50),
                  description(),
                ],
              ),
              saveButton(),
            ],
          ),
        ],
      ),
    );
  }
}
