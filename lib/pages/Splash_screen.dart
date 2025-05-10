// import 'dart:async';
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:notes_app/pages/notes_pages.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(const Duration(seconds: 3), () {
//       Navigator.of(context).pushReplacement(
//         PageRouteBuilder(
//           transitionDuration: const Duration(milliseconds: 800),
//           pageBuilder:
//               (context, animation, secondaryAnimation) => const NotesPages(),
//           transitionsBuilder: (context, animation, secondaryAnimation, child) {
//             return FadeTransition(
//               opacity: animation,
//               child: ScaleTransition(
//                 scale: Tween<double>(begin: 0.95, end: 1.0).animate(
//                   CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
//                 ),
//                 child: child,
//               ),
//             );
//           },
//         ),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Image.asset(
//               'assets/icons/splash_icon.webp',
//               width: 110,
//               height: 110,
//               color: Theme.of(context).colorScheme.inversePrimary,
//             ),
//             const SizedBox(height: 20),
//             DefaultTextStyle(
//               style: TextStyle(
//                 fontSize: 40,
//                 fontFamily: GoogleFonts.dmSerifDisplay().fontFamily,

//                 color: Theme.of(context).colorScheme.inversePrimary,
//               ),
//               child: AnimatedTextKit(
//                 animatedTexts: [
//                   TypewriterAnimatedText(
//                     'Notes',
//                     speed: Duration(milliseconds: 250),
//                   ),
//                 ],
//                 totalRepeatCount: 1,
//                 pause: const Duration(milliseconds: 500),
//                 displayFullTextOnTap: false,
//                 stopPauseOnTap: true,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/pages/on_barding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:notes_app/pages/notes_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startSplashFlow();
  }

  Future<void> startSplashFlow() async {
    await Future.delayed(const Duration(seconds: 3));

    final prefs = await SharedPreferences.getInstance();
    final onboardingShown = prefs.getBool('onboarding_shown') ?? false;

    if (onboardingShown) {
      Navigator.of(
        context,
      ).pushReplacement(_buildPageTransition(const NotesPages()));
    } else {
      Navigator.of(
        context,
      ).pushReplacement(_buildPageTransition(const OnBardingPage()));
    }
  }

  PageRouteBuilder _buildPageTransition(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 800),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.95, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
            ),
            child: child,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/icons/splash_icon.webp',
              width: 110,
              height: 110,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 20),
            DefaultTextStyle(
              style: TextStyle(
                fontSize: 40,
                fontFamily: GoogleFonts.dmSerifDisplay().fontFamily,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Notes',
                    speed: const Duration(milliseconds: 250),
                  ),
                ],
                totalRepeatCount: 1,
                pause: const Duration(milliseconds: 500),
                displayFullTextOnTap: false,
                stopPauseOnTap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
