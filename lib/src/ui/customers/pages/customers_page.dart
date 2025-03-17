import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mob4pay_tech_challenge/src/config/dependencies.dart';
import 'package:mob4pay_tech_challenge/src/config/router.dart';
import 'package:mob4pay_tech_challenge/src/ui/customers/viewmodels/customers_viewmodel.dart';
import 'package:mob4pay_tech_challenge/src/ui/services/toast_service.dart';
import 'package:provider/provider.dart';

@RoutePage()
class CustomersPage extends StatefulWidget {
  const CustomersPage({super.key});

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  late final CustomersViewmodel _viewmodel;
  late final ToastService _toastService;

  @override
  void initState() {
    super.initState();

    _toastService = getIt<ToastService>();
    _viewmodel = getIt<CustomersViewmodel>();

    _viewmodel.getCustomers();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ChangeNotifierProvider(
      create: (context) => _viewmodel,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: colorScheme.primary,
          title: Text(
            'Clientes',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              height: 6 / 5,
              letterSpacing: .15,
              color: colorScheme.onPrimary,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListenableBuilder(
            listenable: _viewmodel,
            builder: (context, _) {
              if (_viewmodel.isLoading) {
                return const _CustomersLoading();
              }

              if (_viewmodel.errorMessage.isNotEmpty) {
                _toastService.showErrorToast(
                  message: _viewmodel.errorMessage,
                );
              }

              final customers = _viewmodel.customers;

              if (customers.isEmpty) {
                return const _EmptyCustomersMessage();
              }

              return const _CustomersList();
            },
          ),
        ),
      ),
    );
  }
}

class _CustomersLoading extends StatelessWidget {
  const _CustomersLoading();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class _EmptyCustomersMessage extends StatelessWidget {
  const _EmptyCustomersMessage();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 120),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/empty_customers.png', height: 256, width: 256),
            const Text(
              'Não foi encontrado nenhum cliente salvo, recarregue a página para sincronizar.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                height: 6 / 4,
                letterSpacing: .15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomersList extends StatefulWidget {
  const _CustomersList();

  @override
  State<_CustomersList> createState() => _CustomersListState();
}

class _CustomersListState extends State<_CustomersList> {
  late final AppRouter router;

  @override
  void initState() {
    super.initState();

    router = getIt<AppRouter>();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final customersViewmodel = context.read<CustomersViewmodel>();
    final customers = customersViewmodel.customers;

    return RefreshIndicator(
      onRefresh: customersViewmodel.syncCustomers,
      child: ListView.builder(
        itemCount: customers.length,
        itemBuilder: (context, index) {
          final customer = customers[index];

          return Card(
            key: Key('CustomerCard${customer.id}'),
            elevation: 3,
            child: ListTile(
              onTap: () =>
                  router.push(CustomerDetailsRoute(customer: customer)),
              leading: CircleAvatar(
                backgroundColor: colorScheme.tertiaryContainer,
                child: Text(
                  customer.id.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    height: 6 / 4,
                    letterSpacing: .15,
                    color: colorScheme.onTertiaryContainer,
                  ),
                ),
              ),
              title: Text(
                customer.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  height: 24 / 14,
                  letterSpacing: .15,
                ),
              ),
              subtitle: Text(
                'Estado: ${customer.state}',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  height: 4 / 3,
                  letterSpacing: .4,
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
            ),
          );
        },
      ),
    );
  }
}
