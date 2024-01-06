import 'package:flutter/material.dart';
import 'package:watch_store_app/gen/assets.gen.dart';
import 'package:watch_store_app/res/colors.dart';
import 'package:watch_store_app/res/strings.dart';
import 'package:watch_store_app/screens/main/bascket_screen.dart';
import 'package:watch_store_app/screens/main/home_screen.dart';
import 'package:watch_store_app/screens/main/profile_screen.dart';
import 'package:watch_store_app/widgets/btm_nav_item_widget.dart';

class BtmNavScreenIndex {
  BtmNavScreenIndex._();
  static const int home = 0;
  static const int bascket = 1;
  static const int profile = 2;
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = BtmNavScreenIndex.home;
  final GlobalKey<NavigatorState> _keyHome = GlobalKey();
  final GlobalKey<NavigatorState> _keyBascket = GlobalKey();
  final GlobalKey<NavigatorState> _keyProfile = GlobalKey();

  late final Map map = {
    BtmNavScreenIndex.home: _keyHome,
    BtmNavScreenIndex.bascket: _keyBascket,
    BtmNavScreenIndex.profile: _keyProfile,
  };

  Future<bool> _onWillPop() async {
    if (map[selectedIndex]!.currentState!.canPop()) {
      map[selectedIndex]!.currentState!.pop();
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Positioned(
                  child: IndexedStack(
                index: selectedIndex,
                children: [
                  Navigator(
                    key: _keyHome,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  ),
                  Navigator(
                    key: _keyBascket,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) => const BascketScreen(),
                    ),
                  ),
                  Navigator(
                    key: _keyProfile,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  ),
                ],
              )),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: LightAppColor.bottomNavBG,
                  height: size.height * 0.10,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BtmNavItem(
                          text: AppString.userProfile,
                          iconSvgPath: Assets.svg.user,
                          isActive: selectedIndex == BtmNavScreenIndex.profile,
                          onTap: () {
                            btmNavOnPressed(BtmNavScreenIndex.profile);
                          },
                        ),
                        BtmNavItem(
                          text: AppString.basket,
                          iconSvgPath: Assets.svg.basket,
                          isActive: selectedIndex == BtmNavScreenIndex.bascket,
                          onTap: () {
                            btmNavOnPressed(BtmNavScreenIndex.bascket);
                          },
                        ),
                        BtmNavItem(
                          text: AppString.home,
                          iconSvgPath: Assets.svg.home,
                          isActive: selectedIndex == BtmNavScreenIndex.home,
                          onTap: () {
                            btmNavOnPressed(BtmNavScreenIndex.home);
                          },
                        ),
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  btmNavOnPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
