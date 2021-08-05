import 'package:first_priority_app/controllers/account.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PolicyBuilder extends StatelessWidget {
  final Policy policy;
  final Widget Function(BuildContext context, bool valid) builder;

  const PolicyBuilder({
    Key key,
    @required this.policy,
    @required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return builder(context, Policy.validate(this.policy));
  }
}

class Policy {
  final List<String> roles;

  const Policy({this.roles});

  static const Policy manageMeetings = Policy(roles: [
    "Leader",
    "Parent",
    "Sponsor",
    "Mentor",
    "Coach",
    "Staff",
    "Admin",
  ]);

  static const Policy switchClub = Policy(roles: [
    "Mentor",
    "Coach",
  ]);

  static validate(Policy policy) {
    final accountController = Get.find<AccountController>();

    final isValid = accountController.user.value.hasRole(policy.roles);

    return isValid;
  }
}
