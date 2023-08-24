

import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:on_boarding_screen_demo/widgets/onboarding_screen_widget.dart';

import 'home_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {

  int _currentIndex = 0;
  void _goToNextScreen() {
    if (_currentIndex < onboardingScreens.length - 1) {
      _controller.nextPage();
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const HomePage()));
    }
  }
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CarouselSlider(
              carouselController: _controller,
              items: onboardingScreens,
              options: CarouselOptions(
                scrollDirection: Axis.vertical,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                height: double.infinity,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                enableInfiniteScroll: false,
              ),
            ),
            Positioned(
              right: 10,
              child: DotsIndicator(
                axis: Axis.vertical,
                dotsCount: onboardingScreens.length,
                position: _currentIndex,
                decorator: DotsDecorator(
                  size: const Size.square(8.0),
                  activeSize: const Size(8.0, 16.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 20,
                bottom: 20,
                child: InkWell(
                  onTap: _goToNextScreen,
                  child: Container(

                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.cyan.withOpacity(0.4),
                    ),
                    child: Text(_currentIndex<onboardingScreens.length-1?"Next":"Get Started",style: const TextStyle(fontWeight: FontWeight.bold),),
                  ),
                )),
            const SizedBox(height: 20),
          ],
        ),
      ),
      // Add navigation buttons or skip button if needed
    );
  }
}

final List<OnboardingScreenWidget> onboardingScreens = [
  const OnboardingScreenWidget(
    imageUrl: 'https://img.icons8.com/color/100/trekking.png',
    title: 'Welcome to App',
    description: 'Explore the amazing features of our app.',
  ),
  const OnboardingScreenWidget(
    imageUrl: 'https://img.icons8.com/3d-fluency/100/strawberry.png',
    title: 'Easy to Use',
    description: 'Our app is designed with user-friendliness in mind.',
  ),const OnboardingScreenWidget(
    imageUrl: 'https://img.icons8.com/3d-fluency/100/strawberry.png',
    title: 'Easy to Use',
    description: 'Our app is designed with user-friendliness in mind.',
  ),
  // Add more screens...
];


