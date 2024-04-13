// import 'package:get_it/get_it.dart';

import 'package:template_flutter_with_cubit_by_very_good/src/data/entites/permission_role.dart';

abstract class Guard {
  Future<bool> resolve(String policy);
}

class RoleGuard extends Guard {
  RoleGuard({required this.policies});

  final Map<String, List<PermissionRole>> policies;

  @override
  Future<bool> resolve(String policy) async {
    final allowedRoles = policies[policy] ?? const [];
    // here need to get the user role from the app model
    // final userRole = GetIt.I<AppModel>().authz.userRole;

    // for testing purpose, we will use the user role as User
    final userRole = PermissionRole.user;

    return allowedRoles.contains(userRole);
  }
}
