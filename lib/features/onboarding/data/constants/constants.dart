import 'package:swappid/features/onboarding/data/models/onboard.items.model.dart';

class OnboardingConstants {
  static List<OnboardItemsModel> get onboardingItems => const [
        OnboardItemsModel(
          title: 'Welcome to Swappid',
          description: 'BUY CRYPTO WITH CASH EFFORTLESSLY',
          image: 'assets/images/onboarding/onboarding.png',
        ),
        // OnboardItemsModel(
        //   title: 'Send & Receive Without Borders',
        //   description:
        //       'Transfer cash or crypto across countries instantly, with low fees and no limits.',
        //   image: 'assets/images/onboarding/onboarding.png',
        // ),
        // OnboardItemsModel(
        //   title: 'On-Ramp & Off-Ramp Made Easy',
        //   description:
        //       'Convert between fiat and crypto effortlessly. Cash in or out, anytime, anywhere.',
        //   image: 'assets/images/onboarding/onboarding.png',
        // ),
        // OnboardItemsModel(
        //   title: 'Secure, Simple, Seamless',
        //   description:
        //       'Enjoy bank-grade security and a sleek, user-friendly experience built for global living.',
        //   image: 'assets/images/onboarding/onboarding.png',
        // ),
      ];
}
