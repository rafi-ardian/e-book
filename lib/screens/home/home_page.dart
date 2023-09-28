import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/themes.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'components/recent_book.dart';
import 'components/trending_book.dart';

class HomePage extends StatefulWidget {
  static const nameRoute = '/homePage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _categories = [
    'All Books',
    'Comic',
    'Novel',
    'Manga',
    'Fairy Tales'
  ];

  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/profile_pic.png'),
                ),
              ),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello kei',
                  style: semiBoldText16,
                ),
                Text(
                  'Good Morning',
                  style: regularText14,
                )
              ],
            ),
            Spacer(),
            Image(
              image: AssetImage('assets/icons/icon-menu.png'),
              width: 18,
            ),
          ],
        ),
      );
    }

    Widget searchField() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'search here',
            hintStyle: mediumText12.copyWith(color: greyColor),
            fillColor: greyColorSearchField,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.all(18),
            isCollapsed: true,
            suffixIcon: InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    color: greenColor,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Icon(
                  Icons.search_rounded,
                  color: whiteColor,
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget recentBook() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            RecentBook(
              image: 'assets/images/recent_book_1.png',
              title: 'The Magic',
            ),
            SizedBox(width: 20),
            RecentBook(
                image: 'assets/images/recent_book_2.png', title: 'The Martian'),
          ],
        ),
      );
    }

    Widget categories(int index) {
      return InkWell(
        onTap: () {
          setState(() {
            isSelected = index;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          margin: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            color: isSelected == index ? greenColor : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            _categories[index],
            style: semiBoldText16.copyWith(
                color: isSelected == index ? whiteColor : greyColor),
          ),
        ),
      );
    }

    Widget listCategories() {
      return SingleChildScrollView(
        padding: EdgeInsets.only(left: 30),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _categories
              .asMap()
              .entries
              .map((MapEntry map) => categories(map.key))
              .toList(),
        ),
      );
    }

    Widget trendingBook() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: bookLists
              .asMap()
              .entries
              .map(
                (MapEntry map) => TrendingBook(
                  info: bookLists[map.key],
                ),
              )
              .toList(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                SizedBox(height: 30),
                searchField(),
                // SizedBox(height: 30),
                // test(),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text('recent book',
                      style: semiBoldText16.copyWith(color: blackColor)),
                ),
                recentBook(),
                // test(),
              ],
            ),
          ),
          listCategories(),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text('Trending Now',
                style: semiBoldText16.copyWith(color: blackColor)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: trendingBook(),
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}
