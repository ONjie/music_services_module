import 'package:go_router/go_router.dart';
import 'package:music_services_module/view/simple_new_screen.dart';
import '../../view/music_service_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'Music Service Screen',
      path: '/',
      builder: (context, state) => MusicServiceScreen(),
    ),
    GoRoute(
      name: 'Simple New Screen',
      path: '/simple_new_screen/:title',
      builder: (context, state) {
        final title = state.pathParameters['title'];
        return SimpleNewScreen(title: title!);
      },
    ),
  ],
);
