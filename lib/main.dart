import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:san3a_app/core/cubits/app_theme_cubit/app_theme_cubit.dart';
import 'package:san3a_app/core/cubits/app_theme_cubit/app_theme_state.dart';
import 'package:san3a_app/core/cubits/internet/internet_connection_cubit.dart';
import 'package:san3a_app/core/helpers/app_storage_helper.dart';
import 'package:san3a_app/core/helpers/on_generate_routes.dart';
import 'package:san3a_app/core/services/custom_bloc_observer.dart';
import 'package:san3a_app/core/services/get_it_service.dart';
import 'package:san3a_app/core/utils/app_themes.dart';
import 'package:san3a_app/core/widgets/developer_overlay.dart';
import 'package:san3a_app/features/auth/presentation/screens/initial_auth_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await EasyLocalization.ensureInitialized();
  await AppStorageHelper.init();
  Bloc.observer = CustomBlocObserver();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: DevicePreview(enabled: true, builder: (context) => San3aApp()),
    ),
  );
}

class San3aApp extends StatefulWidget {
  const San3aApp({super.key});

  @override
  State<San3aApp> createState() => _San3aAppState();
}

class _San3aAppState extends State<San3aApp> {
  late AppThemeCubit appThemeCubit;

  @override
  void initState() {
    super.initState();
    appThemeCubit = AppThemeCubit();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => appThemeCubit),
        BlocProvider(
          create: (context) =>
              InternetConnectionCubit(connectivity: getIt<Connectivity>()),
        ),
      ],
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            enableScaleWH: () => false,
            enableScaleText: () => false,
            builder: (context, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: appThemeCubit.getTheme(),
                navigatorKey: navigatorKey,
                locale: context.locale,
                supportedLocales: context.supportedLocales,
                localizationsDelegates: context.localizationDelegates,
                onGenerateRoute: (settings) =>
                    onGenerateRoutes(settings, context),
                home: const InitialAuthScreen(),
                builder: (context, child) {
                  return DeveloperOverlay(child: child!);
                },
              );
            },
          );
        },
      ),
    );
  }
}
