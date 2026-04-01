import 'package:go_router/go_router.dart';
import '../../presentation/auth/auth_screen.dart';
import '../../presentation/clubber/clubber_shell.dart';
import '../../presentation/curator/curator_shell.dart';
import '../../presentation/curator/public_curator_screen.dart';
import '../../presentation/space/space_shell.dart';
import '../../presentation/home/role_selection_screen.dart';
import '../../domain/models/auth_models.dart';

final appRouter = GoRouter(
  initialLocation: '/auth',
  routes: [
    GoRoute(
      path: '/auth',
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: '/roles',
      builder: (context, state) => const RoleSelectionScreen(),
    ),
    GoRoute(
      path: '/clubber',
      builder: (context, state) => const ClubberShell(),
    ),
    GoRoute(
      path: '/curator',
      builder: (context, state) => const CuratorShell(),
    ),
    GoRoute(
      path: '/space',
      builder: (context, state) => const SpaceShell(),
    ),
    GoRoute(
      path: '/public-curator',
      builder: (context, state) {
        final profile = state.extra as CuratorProfile;
        return PublicCuratorScreen(profile: profile);
      },
    ),
  ],
);
