import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../themes.dart';

class RecentBook extends StatelessWidget {
  const RecentBook({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(color: borderRecentBook),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 90,
          ),
          SizedBox(width: 18),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: semiBoldText14.copyWith(color: blackColor),
              ),
              CircularPercentIndicator(
                circularStrokeCap: CircularStrokeCap.round,
                reverse: true,
                radius: 50,
                percent: 0.5,
                progressColor: greenColor,
                lineWidth: 7,
                animation: true,
              ),
              Text('50% Complete',
                  style: mediumText12.copyWith(color: greyColor))
            ],
          )
        ],
      ),
    );
  }
}
