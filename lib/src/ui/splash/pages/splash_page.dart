import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mob4pay_tech_challenge/src/config/dependencies.dart';
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

  @override
  void initState() {
    super.initState();

    _viewmodel = getIt<SplashViewmodel>();

    _viewmodel.addListener(() {
      if (_viewmodel.isLoaded) {
        // TODO: MOVER PARA A TELA DE CLIENTES
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

class _LoadingText extends StatelessWidget {
  const _LoadingText();

  @override
  Widget build(BuildContext context) {
    final splashViewmodel = context.read<SplashViewmodel>();

    return ListenableBuilder(
      listenable: splashViewmodel,
      builder: (context, _) {
        if (splashViewmodel.hasError) {
          _showErrorToast('Houve um erro ao sincronizar os clients');
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
            ),
          ),
        );
      },
    );
  }

  void _showErrorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
