// lib/features/subscription/domain/entities/subscription_plan.dart

enum SubscriptionTier { pro, max }

enum PlanDuration { monthly, threeMonths, sixMonths, yearly }

class SubscriptionPlan {
  final String id;
  final String titleEn;
  final String titleFa;
  final SubscriptionTier tier;
  final PlanDuration duration;
  final double basePriceUSD; // قیمت پایه ماهیانه

  SubscriptionPlan({
    required this.id,
    required this.titleEn,
    required this.titleFa,
    required this.tier,
    required this.duration,
    required this.basePriceUSD,
  });

  // محاسبه قیمت نهایی با احتساب تخفیف‌های درخواستی شما
  double get finalPrice {
    double totalMonths = 1;
    double discount = 0.0;

    switch (duration) {
      case PlanDuration.monthly:
        totalMonths = 1;
        break;
      case PlanDuration.threeMonths:
        totalMonths = 3;
        discount = 0.10; // ۱۰ درصد تخفیف
        break;
      case PlanDuration.sixMonths:
        totalMonths = 6;
        break;
      case PlanDuration.yearly:
        totalMonths = 12;
        discount = 0.60; // ۶۰ درصد تخفیف (ویژه)
        break;
    }

    double rawPrice = basePriceUSD * totalMonths;
    return rawPrice * (1 - discount);
  }
}
