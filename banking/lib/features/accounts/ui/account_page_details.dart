import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountPageDetails extends StatefulWidget {
  const AccountPageDetails({Key? key}) : super(key: key);

  @override
  State<AccountPageDetails> createState() => _AccountPageDetailsState();
}

class _AccountPageDetailsState extends State<AccountPageDetails> with RestorationMixin {
  RestorableInt currentSegment = RestorableInt(0);

  @override
  String get restorationId => 'cupertino_segmented_control';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(currentSegment, 'current_segment');
  }

  void onValueChanged(int? newValue) {
    setState(() {
      currentSegment.value = newValue!;
    });
  }

  final Map<int, List<dynamic>> _map = {
    0: [
      {
        0: Icons.qr_code_2_outlined,
        1: '🛞 QR',
        2: 'Бонусы',
      },
      {
        0: Icons.double_arrow_sharp,
        1: 'Перевести',
      },
      {
        0: Icons.payment,
        1: 'Пополнить',
      },
      {
        0: Icons.monetization_on,
        1: 'Снять',
      },
      {
        0: Icons.work_outlined,
        1: 'Оплата в интернете',
        2: 'Ограничения и лимиты',
      }
    ],
    1: [
      {
        0: Icons.auto_graph_outlined,
        1: 'Аналитика',
        2: 'ваши траты по категориям',
      },
      {
        0: Icons.card_travel,
        1: 'Реквизиты',
      },
      {
        0: Icons.info_outline,
        1: 'Условия',
      },
      {
        0: Icons.production_quantity_limits,
        1: 'Лимиты',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    const segmentedControlMaxWidth = 400.0;
    final children = <int, Widget>{
      0: const Text('Действия'),
      1: const Text('Инфо'),
      2: const Text('Выписка'),
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bank'),
      ),
      body: ListView(
        children: [
          Container(
            height: 150,
            color: theme.colorScheme.primaryContainer,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '🛞 Gold *2132',
                  style: textTheme.headline6,
                ),
                Text(
                  'Доступно',
                  style: textTheme.bodyLarge,
                ),
                const SizedBox(height: 5),
                Text(
                  '100 500.54 ₸',
                  style: textTheme.headlineSmall,
                ),
              ],
            ),
          ),
          SizedBox(
            width: segmentedControlMaxWidth,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoSlidingSegmentedControl<int>(
                onValueChanged: onValueChanged,
                children: children,
                groupValue: currentSegment.value,
              ),
            ),
          ),
          currentSegment.value == 2
              ? const SizedBox()
              : Column(
                  children: [
                    const Divider(),
                    ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final e = _map[currentSegment.value]![index];
                        return ListTile(
                          leading: Icon(e[0]),
                          title: Text(e[1]),
                          subtitle: e[2] == null
                              ? null
                              : Text(
                                  e[2],
                                  style: textTheme.caption,
                                ),
                          trailing: const Icon(CupertinoIcons.chevron_right),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: _map[currentSegment.value]!.length,
                    ),
                    const Divider(),
                  ],
                ),
        ],
      ),
    );
  }
}
