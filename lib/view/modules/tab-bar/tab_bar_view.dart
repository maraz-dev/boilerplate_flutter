import 'package:boilerplate_flutter/view/modules/tab-bar/vm/tab_controller.dart';
import 'package:boilerplate_flutter/view/modules/tab-bar/widgets/app_tab.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TabBarSection extends ConsumerStatefulWidget {
  const TabBarSection({super.key});

  @override
  ConsumerState<TabBarSection> createState() => _TabarViewState();
}

class _TabarViewState extends ConsumerState<TabBarSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: ref.watch(navBarController),
            children: const [],
          ),
          const Align(
            alignment: Alignment(0, 0.97),
            child: SafeArea(
              child: AppTabBar(),
            ),
          ),
        ],
      ),
    );
  }
}
