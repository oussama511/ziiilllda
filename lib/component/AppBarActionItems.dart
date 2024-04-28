import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:operator_forvia/style/colors.dart';

class AppBarActionItems extends StatelessWidget {
  const AppBarActionItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'images/calendar.svg',
            width: 20.0,
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'images/ring.svg',
            width: 20.0,
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 17,
              child: ClipOval(
                child: Image.network(
                  "https://cdn.shopify.com/s/files/1/0045/5104/9304/t/27/assets/AC_ECOM_SITE_2020_REFRESH_1_INDEX_M2_THUMBS-V2-1.jpg?v=8913815134086573859",
                  fit: BoxFit.cover,
                  width: 34,
                  height: 34,
                ),
              ),
            ),
            Icon(
              Icons.arrow_drop_down_outlined,
              color: AppColors.black,
            ),
          ],
        )
      ],
    );
  }
}
