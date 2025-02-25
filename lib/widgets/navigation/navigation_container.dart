import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:eliachar_feig/packages/ui_components_packages.dart';
import 'package:eliachar_feig/screens/activities/activities.dart';
import 'package:eliachar_feig/screens/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliachar_feig/screens/about_me.dart';
import 'package:eliachar_feig/screens/contact_me.dart';
import 'package:eliachar_feig/screens/home/home.dart';
import 'package:eliachar_feig/screens/no_connection.dart';
import 'package:eliachar_feig/ui_components/bottom_nav_icon.dart';
import 'package:eliachar_feig/widgets/navigation/bloc/navigation_bloc.dart';
import 'package:eliachar_feig/widgets/navigation/bloc/navigation_event.dart';
import 'package:eliachar_feig/widgets/navigation/bloc/navigation_state.dart';

class NavigationContainer extends StatelessWidget {
  const NavigationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationBloc>(
      create: (context) => NavigationBloc(connectivity: Connectivity()),
      child: _NavigationContainerContent(),
    );
  }
}

class _NavigationContainerContent extends StatelessWidget {
  final MyWebViewController myWebViewController = MyWebViewController();
  static List<Widget> pages = <Widget>[];

  _NavigationContainerContent();

  get divider => VerticalDivider(
        color: Colors.grey.shade300,
        endIndent: 2,
        indent: 10,
      );

  @override
  Widget build(BuildContext context) {
    pages = [
      Home().withNavigator(),
      AboutMe().withNavigator(),
      Activities().withNavigator(),
      ContactMe().withNavigator(),
      SettingsPage().withNavigator(),
    ];

    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        if (state is NoConnectionState) {
          return NoConnection();
        }

        final selectedIndex = getSelectedIndex(state);

        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Center(
              child: pages.elementAt(selectedIndex),
            ),
          ),
          bottomNavigationBar: buildNavBar(context, selectedIndex),
        );
      },
    );
  }

  int getSelectedIndex(NavigationState state) {
    if (state is AboutState) return 1;
    if (state is ActivityState) return 2;
    if (state is ContactState) return 3;
    if (state is SettingsState) return 4;
    return 0;
  }

  Container buildNavBar(BuildContext context, int selectedIndex) {
    final items = [
      NavItem(icon: Icons.home_filled, label: "home_tab".translate(context), index: 0, event: HomeButtonPressedEvent()),
      NavItem(
          icon: Icons.info_outlined, label: "about_tab".translate(context), index: 1, event: AboutButtonPressedEvent()),
      NavItem(
          icon: Icons.event, label: "tasks_tab".translate(context), index: 2, event: ActivitiesButtonPressedEvent()),
      NavItem(
          icon: Icons.phone_outlined,
          label: "contact_tab".translate(context),
          index: 3,
          event: ContactButtonPressedEvent()),
      NavItem(
          icon: Icons.settings,
          label: "settings_tab".translate(context),
          index: 4,
          event: SettingsButtonPressedEvent()),
    ];

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black,
            width: 0.3,
          ),
        ),
      ),
      child: BottomAppBar(
        color: Colors.black,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items.expand<Widget>((item) {
              final isSelected = selectedIndex == item.index;
              return [
                Expanded(
                  child: GestureDetector(
                    onTap: () => context.read<NavigationBloc>().add(item.event),
                    child: Container(
                      color: Colors.transparent,
                      child: BottomNavIcon(
                        iconData: item.icon,
                        isSelected: isSelected,
                        label: item.label,
                        callback: () => context.read<NavigationBloc>().add(item.event),
                      ),
                    ),
                  ),
                ),
                if (item.index != items.length - 1) divider,
              ];
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class NavItem {
  final IconData icon;
  final String label;
  final int index;
  final NavigationEvent event;

  NavItem({required this.icon, required this.label, required this.index, required this.event});
}

class MyWebViewController {
  void Function() onRefreshWebView = () {};
}
