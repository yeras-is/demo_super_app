import 'dart:math';

import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({Key? key}) : super(key: key);

  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('🛞 Bank'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const Divider(),
          ListTile(
            onTap: () => Modular.to.pushNamed('./details'),
            leading: SizedBox(
              height: 45,
              width: 60,
              child: Card(
                child: Image.network(
                  'https://picsum.photos/id/${Random().nextInt(50)}/400/300',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            title: Text(
              '🛞 Gold',
              style: theme.textTheme.bodyMedium,
            ),
            subtitle: Text(
              '*0000',
              style: theme.textTheme.bodySmall,
            ),
            trailing: Text(
              '100 500,53 ₸',
              style: theme.textTheme.bodyMedium,
            ),
          ),
          const Divider(),
          ListTile(
            leading: SizedBox(
              height: 45,
              width: 60,
              child: Card(
                child: Image.network(
                  'https://picsum.photos/id/${Random().nextInt(50)}/400/300',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            title: Text(
              'Депозит USDT',
              style: theme.textTheme.bodyMedium,
            ),
            subtitle: Text(
              'до 31.12.9999',
              style: theme.textTheme.bodySmall,
            ),
            trailing: Text(
              'NNNN \$',
              style: theme.textTheme.bodyMedium,
            ),
          ),
          const Divider(),
          ListTile(
            leading: SizedBox(
              height: 45,
              width: 60,
              child: Card(
                child: Image.network(
                  'https://picsum.photos/id/${Random().nextInt(50)}/400/300',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            title: Text(
              '🛞 Bonus',
              style: theme.textTheme.bodyMedium,
            ),
            trailing: Text(
              '5000 Ƀ',
              style: theme.textTheme.bodyMedium,
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
