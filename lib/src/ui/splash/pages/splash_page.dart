import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mob4pay_tech_challenge/src/config/dependencies.dart';
import 'package:mob4pay_tech_challenge/src/config/router.dart';
import 'package:mob4pay_tech_challenge/src/ui/services/toast_service.dart';
import 'package:mob4pay_tech_challenge/src/ui/splash/viewmodels/splash_viewmodel.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final SplashViewmodel _viewmodel;
  late final AppRouter _router;

  @override
  void initState() {
    super.initState();

    _viewmodel = getIt<SplashViewmodel>();
    _router = getIt<AppRouter>();

    _viewmodel.addListener(() {
      if (!_viewmodel.isLoading) {
        _router.replace(const CustomersRoute());

        return;
      }
    });

    _viewmodel.initApp();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _viewmodel,
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: Column(
          children: [
            Expanded(child: Image.asset('assets/logo.png')),
            const _LoadingText(),
          ],
        ),
      ),
    );
  }
}

class _LoadingText extends StatefulWidget {
  const _LoadingText();

  @override
  State<_LoadingText> createState() => _LoadingTextState();
}

class _LoadingTextState extends State<_LoadingText> {
  late final ToastService _toastService;

  @override
  void initState() {
    super.initState();

    _toastService = getIt<ToastService>();
  }

  @override
  Widget build(BuildContext context) {
    final splashViewmodel = context.read<SplashViewmodel>();

    return ListenableBuilder(
      listenable: splashViewmodel,
      builder: (context, _) {
        if (splashViewmodel.hasError) {
          _toastService.showErrorToast(
            message: 'Houve um erro ao sincronizar os clientes',
          );
        }

        return Visibility(
          visible: splashViewmodel.isLoading,
          child: const Text(
            'Carregando informações...',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w500,
              height: 6 / 4,
              letterSpacing: .15,
            ),
          ),
        );
      },
    );
  }
}
