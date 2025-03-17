import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mob4pay_tech_challenge/src/config/dependencies.dart';
import 'package:mob4pay_tech_challenge/src/config/router.dart';
import 'package:mob4pay_tech_challenge/src/domain/customers/models/customer.dart';

@RoutePage()
class CustomerDetailsPage extends StatefulWidget {
  final Customer customer;

  const CustomerDetailsPage({required this.customer, super.key});

  @override
  State<CustomerDetailsPage> createState() => _CustomerDetailsPageState();
}

class _CustomerDetailsPageState extends State<CustomerDetailsPage> {
  late final AppRouter router;

  @override
  void initState() {
    super.initState();

    router = getIt<AppRouter>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Informações do Cliente',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            height: 6 / 5,
            letterSpacing: .15,
          ),
        ),
        leading: IconButton(
          onPressed: router.back,
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CustomerDetail(label: 'Nome', detail: widget.customer.name),
            _CustomerDetail(
              label: 'Idade',
              detail: widget.customer.age.toString(),
            ),
            _CustomerDetail(label: 'E-mail', detail: widget.customer.email),
            _CustomerDetail(label: 'Endereço', detail: widget.customer.address),
            _CustomerDetail(label: 'Cidade', detail: widget.customer.city),
            _CustomerDetail(label: 'Estado', detail: widget.customer.state),
          ],
        ),
      ),
    );
  }
}

class _CustomerDetail extends StatelessWidget {
  final String label;
  final String detail;

  const _CustomerDetail({required this.label, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            height: 22 / 12,
            letterSpacing: .1,
            color: Color(0xff464646),
          ),
        ),
        Text(
          detail,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            height: 22 / 12,
            letterSpacing: .1,
            color: Color(0xff1A1A1A),
          ),
        ),
      ],
    );
  }
}
