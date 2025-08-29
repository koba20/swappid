part of 'app.dart';

Route<dynamic>? onGenerate(RouteSettings settings) {
  switch (settings.name) {
    // Splash and Onboarding
    case Splash.route:
      return KRoute(child: const Splash());
    case OnboardMain.route:
      return KRoute(child: const OnboardMain());
    case Welcome.route:
      return KRoute(child: const Welcome());
    case SignUpPage.route:
      return KRoute(child: const SignUpPage());
    case VerifyEmailPage.route:
      return KRoute(child: const VerifyEmailPage());
    case LoginPage.route:
      return KRoute(child: const LoginPage());
    case EmailVerifiedSuccessPage.route:
      return KRoute(child: const EmailVerifiedSuccessPage());
    case VerifyIdentityPage.route:
      return KRoute(child: const VerifyIdentityPage());
    case VerifyNumberPage.route:
      return KRoute(child: const VerifyNumberPage());
    case NumberVerifiedSuccessPage.route:
      return KRoute(child: const NumberVerifiedSuccessPage());
    case BankVerificationPage.route:
      return KRoute(child: const BankVerificationPage());
    case ProcessingPage.route:
      return KRoute(child: const ProcessingPage());
    case PreparingDashboardPage.route:
      return KRoute(child: const PreparingDashboardPage());
    case KYCSelectionPage.route:
      return KRoute(child: const KYCSelectionPage());
    case BVNVerificationPage.route:
      return KRoute(child: const BVNVerificationPage());
    case Dashboard.route:
      return KRoute(child: const Dashboard());
    case MainNavigation.route:
      return KRoute(child: const MainNavigation());
    case TransactionsPage.route:
      return KRoute(child: const TransactionsPage());
    case TransactionDetailsPage.route:
      return KRoute(child: const TransactionDetailsPage());
    case DemoPage.route:
      return KRoute(child: const DemoPage());
    case AmountInputScreen.route:
      return KRoute(child: const AmountInputScreen());
    case WalletAddressScreen.route:
      return KRoute(child: const WalletAddressScreen());
    case PaymentMethodScreen.route:
      return KRoute(child: const PaymentMethodScreen());
    case BankTransferScreen.route:
      return KRoute(child: const BankTransferScreen());
    case Welcome.route:
      return KRoute(child: const Welcome());
    case SignUpPage.route:
      return KRoute(child: const SignUpPage());
    case VerifyEmailPage.route:
      return KRoute(child: const VerifyEmailPage());
    case VerifyIdentityPage.route:
      return KRoute(child: const VerifyIdentityPage());
    case VerifyNumberPage.route:
      return KRoute(child: const VerifyNumberPage());
    case KYCSelectionPage.route:
      return KRoute(child: const KYCSelectionPage());
    case BVNVerificationPage.route:
      return KRoute(child: const BVNVerificationPage());
    case PreparingDashboardPage.route:
      return KRoute(child: const PreparingDashboardPage());
    default:
      return null;
  }
}
