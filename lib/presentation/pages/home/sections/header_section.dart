import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/buttons/nimbus_button.dart';
import 'package:nimbus/presentation/widgets/buttons/social_button.dart';
import 'package:nimbus/presentation/widgets/circular_container.dart';
import 'package:nimbus/presentation/widgets/content_area.dart';
import 'package:nimbus/presentation/widgets/nimbus_card.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/utils/functions.dart';
import 'package:nimbus/values/values.dart';

//TODO:: Add background name
//TODO:: Add correct font family and sizes.
//TODO:: Finish button design
//TODO:: Add animation to rotating dots_globe_grey and dots_globe_yellow
//TODO:: Add background ash blobs
//TODO:: Add Cards data, write methid to build cards, work cards styling

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    double contentAreaWidth = screenWidth;
    double contentAreaHeight = screenHeight * 0.8;
    TextStyle? bodyTextStyle = textTheme.bodyText1?.copyWith();
    TextStyle? socialTitleStyle = textTheme.subtitle1?.copyWith();
    return ContentArea(
      width: contentAreaWidth,
      height: contentAreaHeight,
      child: Stack(
        children: [
          Positioned(
            right: -(contentAreaWidth * 0.1),
            child: Image.asset(
              ImagePath.DEV_HEADER,
              width: contentAreaWidth * 0.55,
              height: contentAreaHeight,
            ),
          ),
          Positioned(
            left: -(contentAreaWidth * 0.3),
            child: Row(
              children: [
                Image.asset(
                  ImagePath.BLOB_BLACK,
                  height: contentAreaHeight,
                ),
                SpaceW30(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(
                      StringConst.INTRO,
                      style: textTheme.headline2?.copyWith(
                        fontSize: Sizes.TEXT_SIZE_56,
                      ),
                    ),
                    SelectableText(
                      StringConst.POSITION,
                      style: textTheme.headline2?.copyWith(
                        fontSize: Sizes.TEXT_SIZE_56,
                        color: AppColors.primaryColor,
                        height: 1.2,
                      ),
                    ),
                    SpaceH16(),
                    SelectableText(
                      StringConst.ABOUT_ME_1,
                      style: bodyTextStyle,
                    ),
                    SpaceH4(),
                    SelectableText(
                      StringConst.ABOUT_ME_2,
                      style: bodyTextStyle,
                    ),
                    SpaceH16(),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SelectableText(
                              "${StringConst.EMAIL}:",
                              style: socialTitleStyle,
                            ),
                            SpaceH4(),
                            SelectableText(
                              "${StringConst.DEV_EMAIL_2}",
                              style: bodyTextStyle,
                            ),
                          ],
                        ),
                        SpaceW40(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SelectableText(
                              "${StringConst.BEHANCE}:",
                              style: socialTitleStyle,
                            ),
                            SpaceH4(),
                            SelectableText(
                              "${StringConst.BEHANCE_ID}",
                              style: bodyTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SpaceH40(),
                    Row(
                      children: [
                        NimbusButton(
                          buttonTitle: StringConst.DOWNLOAD_CV,
                          buttonColor: AppColors.primaryColor,
                          onPressed: () => openUrlLink(StringConst.EMAIL_URL),
                        ),
                        SpaceW20(),
                        NimbusButton(
                          buttonTitle: StringConst.CONTACT_ME,
                          onPressed: () => openUrlLink(StringConst.EMAIL_URL),
                        ),
                      ],
                    ),
                    SpaceH30(),
                    Wrap(
                      children: _buildSocialIcons(Data.socialData),
                    )
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Spacer(),
              Row(
                children: [
                  Spacer(),
                  NimBusCard(
                    width: 300,
                    height: 80,
                    leading: CircularContainer(),
                    title: Text("UI/UX Designer"),
                    subtitle: Text("creativer websites for you"),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                    ),
                  ),
                  SpaceW40(),
                  NimBusCard(
                    width: 300,
                    height: 80,
                    leading: CircularContainer(),
                    title: Text("UI/UX Designer"),
                    subtitle: Text("creativer websites for you"),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                    ),
                  ),
                  SpaceW40(),
                  NimBusCard(
                    width: 300,
                    height: 80,
                    leading: CircularContainer(),
                    title: Text("UI/UX Designer"),
                    subtitle: Text("creativer websites for you"),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSocialIcons(List<SocialButtonData> socialItems) {
    List<Widget> items = [];
    for (int index = 0; index < socialItems.length; index++) {
      items.add(
        InkWell(
          onTap: () => openUrlLink(socialItems[index].url),
          child: Icon(
            socialItems[index].iconData,
            color: AppColors.black,
            size: Sizes.ICON_SIZE_18,
          ),
        ),
      );
      items.add(SpaceW20());
    }
    return items;
  }
}