import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../../../common/values/app_colors.dart';

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        // margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: Colors.grey.withOpacity(.3),
        textStyle: TextStyle(color: AppColors.black),
        selectedTextStyle: const TextStyle(color: Colors.white),
        hoverTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            //   border: Border.all(color: canvasColor),
            color: AppColors.white),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [AppColors.grey33, Colors.grey],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: white,
        ),
      ),
      footerDivider: divider,
      // headerBuilder: (context, extended) {
      //   return SizedBox(
      //     height: 100,
      //     child: Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Image.asset('assets/images/avatar.png'),
      //     ),
      //   );
      // }

      items: [
        // Today Section
        SidebarXItem(
          icon: Icons.inbox,
          label: 'Inbox Overview',
          onTap: () {
            debugPrint('Inbox Overview');
          },
        ),
        SidebarXItem(
          icon: Icons.summarize,
          label: 'Meeting Summaries',
          onTap: () {
            debugPrint('Meeting Summaries');
          },
        ),
        SidebarXItem(
          icon: Icons.task,
          label: 'Task Tracker',
          onTap: () {
            debugPrint('Task Tracker');
          },
        ),
        SidebarXItem(
          icon: Icons.chat,
          label: 'Slack Highlights',
          onTap: () {
            debugPrint('Slack Highlights');
          },
        ),
        SidebarXItem(
          icon: Icons.update,
          label: 'Project Updates',
          onTap: () {
            debugPrint('Project Updates');
          },
        ),
        SidebarXItem(
          icon: Icons.calendar_today,
          label: 'Calendar Check',
          onTap: () {
            debugPrint('Calendar Check');
          },
        ),
        SidebarXItem(
          icon: Icons.check_circle,
          label: 'Action Items',
          onTap: () {
            debugPrint('Action Items');
          },
        ),

        // Last Week Section
        SidebarXItem(
          icon: Icons.inbox,
          label: 'Inbox Overview',
          onTap: () {
            debugPrint('Inbox Overview - Last Week');
          },
        ),
        SidebarXItem(
          icon: Icons.summarize,
          label: 'Meeting Summaries',
          onTap: () {
            debugPrint('Meeting Summaries - Last Week');
          },
        ),
        SidebarXItem(
          icon: Icons.task,
          label: 'Task Tracker',
          onTap: () {
            debugPrint('Task Tracker - Last Week');
          },
        ),
        SidebarXItem(
          icon: Icons.chat,
          label: 'Slack Highlights',
          onTap: () {
            debugPrint('Slack Highlights - Last Week');
          },
        ),
        SidebarXItem(
          icon: Icons.update,
          label: 'Project Updates',
          onTap: () {
            debugPrint('Project Updates - Last Week');
          },
        ),
        SidebarXItem(
          icon: Icons.calendar_today,
          label: 'Calendar Check',
          onTap: () {
            debugPrint('Calendar Check - Last Week');
          },
        ),
        SidebarXItem(
          icon: Icons.check_circle,
          label: 'Action Items',
          onTap: () {
            debugPrint('Action Items - Last Week');
          },
        ),
      ],
    );
  }

  void _showDisabledAlert(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Item disabled for selecting',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class ScreensExample extends StatelessWidget {
  const ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemBuilder: (context, index) => Container(
                height: 100,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).canvasColor,
                  boxShadow: const [BoxShadow()],
                ),
              ),
            );
          default:
            return Text(
              pageTitle,
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Search';
    case 2:
      return 'People';
    case 3:
      return 'Favorites';
    case 4:
      return 'Custom iconWidget';
    case 5:
      return 'Profile';
    case 6:
      return 'Settings';
    default:
      return 'Not found page';
  }
}

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
