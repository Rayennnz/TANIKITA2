import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/menu_item.dart';
import '../utils/app_colors.dart';
import '../utils/svg_icons.dart';
import 'article_screen.dart';
import 'laporan_screen.dart';
import 'detail_screen_laporan_tanam.dart';
import 'detail_screen_laporan_kontrol.dart';
import 'detail_screen_laporan_panen.dart';
import 'weather_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.gradientStart,
              AppColors.gradientEnd,
            ],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isSmallScreen = constraints.maxWidth <= 640;

              return Column(
                children: [
                  // Logo section
                  Expanded(
                    flex: 4,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Background pattern
                        Positioned(
                          top: -79,
                          child: Image.asset(
                            'assets/1.png',
                            width: 497,
                            height: 497,
                          ),
                        ),

                        // App name
                        Positioned(
                          top: 230,
                          child: Text(
                            'TaniKita',
                            style: GoogleFonts.montserrat(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Menu grid
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isSmallScreen ? 20 : 53,
                      ),
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: isSmallScreen ? 20 : 30,
                        mainAxisSpacing: isSmallScreen ? 20 : 30,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          // Market
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/market');
                            },
                            child: MenuItem(
                              svgIcon: SvgIcons.marketIcon,
                              label: 'Market',
                              backgroundColor: AppColors.menuItem1BgColor,
                            ),
                          ),

                          // Report
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context,
                                  '/laporan'); // Ganti dengan route yang sesuai
                            },
                            child: MenuItem(
                              svgIcon: SvgIcons.reportIcon,
                              label: 'laporan',
                              backgroundColor: AppColors.menuItem2BgColor,
                            ),
                          ),

                          // Article
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context,
                                  '/article'); // Sama dengan route yang lain
                            },
                            child: MenuItem(
                              svgIcon: SvgIcons.articleIcon,
                              label: 'Artikel',
                              backgroundColor: AppColors.menuItem3BgColor,
                            ),
                          ),

                          // Weather
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context,
                                  '/weather'); // route harus '/weather'
                            },
                            child: MenuItem(
                              svgIcon: SvgIcons.weatherIcon,
                              label: 'cuaca',
                              backgroundColor: AppColors.menuItem4BgColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
