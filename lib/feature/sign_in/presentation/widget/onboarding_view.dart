import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_asset.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:flutter_fe_rpl/core/const/constant.dart';
import 'package:flutter_fe_rpl/core/utils/button_customs.dart';
import 'package:flutter_fe_rpl/feature/sign_in/presentation/widget/onboard_content.dart';
import 'package:flutter_fe_rpl/feature/sign_in/presentation/widget/sign_in_component.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int currentPage = 0;
  final PageController _pageController = PageController();
  List<Map<String, String>> splashData = [
    {
      "title": "Selamat Datang di Courze",
      "text": "Courze adalah wadah pembelajaran untuk improve skill kamu",
      "image": AppAsset.onboarding1
    },
    {
      "title": "Tentukan Perjalanan Baru",
      "text":
          "Mulailah perjalanan belajar kamu dan nikmati setiap langkah perjalanan kamu",
      "image": AppAsset.onboarding2
    },
    {
      "title": "Siapkan Karir Kamu",
      "text": "Siapkan diri Anda untuk tantangan intelektual yang mendebarkan.",
      "image": AppAsset.onboarding3
    },
  ];

  void nextPage() {
    if (currentPage < splashData.length - 1) {
      currentPage++;
      _pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: OnboardContent(
                          title: splashData[index]["title"],
                          image: splashData[index]["image"],
                          text: splashData[index]['text'],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                splashData.length,
                (index) => AnimatedContainer(
                  duration: durationAnimation,
                  margin: const EdgeInsets.only(right: 5),
                  height: 6,
                  width: currentPage == index ? 20 : 6,
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? AppColor.primary
                        : AppColor.textSecondary,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ButtonCustom(
                  label: currentPage == splashData.length - 1
                      ? "Mulai Sekarang"
                      : "Lanjutkan",
                  onTap: () {
                    if (currentPage < splashData.length - 1) {
                      // Navigate to the next page when not on the last page.
                      _pageController.animateToPage(
                        currentPage + 1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    } else {
                      // Navigate to another page or perform an action when on the last page.
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => SignInView(),
                        ),
                      );
                    }
                  },
                  isExpand: true,
                )),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
