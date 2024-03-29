import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:r_study/layout/default_layout.dart';
import 'package:r_study/riverpod/select_provider.dart';

// 특정 속성이 변경됐을 때만 빌드를 재실행

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    // final state = ref.watch(selectProvider);
    final state = ref.watch(
        selectProvider.select((value) => value.isSpicy)); // watch는 빌드 재실행 시킴
    // isSpicy 값 변경에만 관심 있을 경우 isSpicy만 select, 해당 state는 boolean값이 됨.
    ref.listen(
      selectProvider
          .select((value) => value.hasBought), // hasBought가 변경 됐을 경우에만 listen
      (previous, next) {
        print('next: $next');
      },
    );

    return DefaultLayout(
        title: 'SelectProviderScreen',
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('isSpicy : ${state.toString()}'),
              // Text(
              //   'name : ${state.name}',
              // ),
              // Text(
              //   'hasBought : ${state.hasBought.toString()}',
              // ),
              // Text(
              //   'isSpicy : ${state.isSpicy.toString()}',
              // ),
              ElevatedButton(
                onPressed: () {
                  ref.read(selectProvider.notifier).toggleHasBought();
                },
                child: Text('hasBought Toggle'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(selectProvider.notifier).toggleIsSpicy();
                },
                child: Text('isSpicy Toggle'),
              ),
            ],
          ),
        ));
  }
}
