import 'package:alandalos_project/Core/utils/helper.dart';
import 'package:alandalos_project/Features/review_tab/presentaion/widgets/review_List_widgets.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/constants.dart';

class ReviewsTabBody extends StatelessWidget {
  const ReviewsTabBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: context.screenWidth * 0.02),
              child: const Icon(Icons.arrow_back, color: kPrimaryColorBlack),
            ),
          ),
          actions: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: context.screenWidth * 0.02),
              child: GestureDetector(
                onTap: () {
                  // BlocProvider.of<BottomNavCubit>(context)
                  //     .updateBottomNavIndex(kNotificationsScreen);
                },
                child: Image.asset(
                  AssetsData.bellIcon,
                ),
              ),
            ),
          ],
          backgroundColor: kPrimaryColorWhite,
          title: Text(
            "تحفيز ",
            style: TextStyle(fontSize: context.screenWidth * 0.04),
          )),
      backgroundColor: kPrimaryColorWhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.screenHeight * 0.02,
              vertical: context.screenWidth * 0.02),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 5,
                  left: 5,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right:  5,
                          left:  5 ),
                      child: SizedBox(
                        height: context.screenHeight,
                        child: const ReviewListWidgets(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
