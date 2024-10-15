import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 24,
        top: 40,
        left: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AssetsData.logo,
            width: 110,
          ),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.KSearchView);
            },
            icon: Icon(
              Icons.search,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
