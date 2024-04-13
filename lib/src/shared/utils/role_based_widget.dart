import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../network/entites/permission_role.dart';

class RoleBasedWidget extends StatelessWidget {
  const RoleBasedWidget({
    super.key,
    required this.allowedRoles,
    required this.child,
  });

  final List<PermissionRole> allowedRoles;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Consumer<PermissionRole>(
      builder: (context, role, child) {
        return allowedRoles.contains(role)
            ? child as Widget
            : const SizedBox.shrink();
      },
      child: child,
    );
  }
}
