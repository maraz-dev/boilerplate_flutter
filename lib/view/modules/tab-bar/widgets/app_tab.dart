import 'package:boilerplate_flutter/view/modules/tab-bar/vm/tab_controller.dart';
import 'package:boilerplate_flutter/view/theme/app_colors.dart';
import 'package:boilerplate_flutter/view/theme/app_theme.dart';
import 'package:boilerplate_flutter/view/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppTabBar extends ConsumerStatefulWidget {
  const AppTabBar({super.key});

  @override
  ConsumerState<AppTabBar> createState() => _AppTabarState();
}

class _AppTabarState extends ConsumerState<AppTabBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.transparent.withValues(alpha: 0.4),
                spreadRadius: 1,
                blurRadius: 60,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: double.infinity,
              height: 65.h,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const TabItem(title: 'Home', image: '', index: 0),
                  const TabItem(title: 'Explore', image: '', index: 1),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width - (30 * 2)) * .15,
                  ),
                  const TabItem(title: 'Highlights', image: '', index: 2),
                  const TabItem(title: 'Profile', image: '', index: 3),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TabItem extends ConsumerStatefulWidget {
  final String title;
  final String image;
  final int index;
  const TabItem({
    super.key,
    required this.title,
    required this.image,
    required this.index,
  });

  @override
  ConsumerState<TabItem> createState() => _TabItemState();
}

class _TabItemState extends ConsumerState<TabItem> {
  @override
  Widget build(BuildContext context) {
    var isActive = widget.index == ref.watch(navBarController);
    return CupertinoButton(
      minSize: 2,
      onPressed: () => ref.read(navBarController.notifier).index = widget.index,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            widget.image,
            width: 21,
            height: 21,
            colorFilter: ColorFilter.mode(
              isActive ? AppColors.kPrimaryColor : AppColors.kHintColor,
              BlendMode.srcIn,
            ),
          ),
          3.0.height,
          Text(
            widget.title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: isActive ? AppColors.kPrimaryColor : AppColors.kHintColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamily.sora,
                ),
          )
        ],
      ),
    );
  }
}
