import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:r_study/layout/default_layout.dart';
import 'package:r_study/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    // 어떤 state가 변경되든지 build가 계속 다시 불리는 문제 확인 - 전체 위젯을 build
    // 변경된 state만 다시 build되게 하고 싶은 경우

    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(gStateMultiplyProvider(
      number1: 10,
      number2: 20,
    ));

    return DefaultLayout(
      title: 'CodeGenerationScreen',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('State1: $state1'),
          state2.when(
            data: (data) {
              return Text(
                'State2(autodispose) : $data',
                textAlign: TextAlign.center,
              );
            },
            error: (err, stack) => Text(
              err.toString(),
            ),
            loading: () => Center(child: CircularProgressIndicator()),
          ),
          state3.when(
            data: (data) {
              return Text(
                'State3(keepAlive:true) : $data',
                textAlign: TextAlign.center,
              );
            },
            error: (err, stack) => Text(
              err.toString(),
            ),
            loading: () => Center(child: CircularProgressIndicator()),
          ),
          Text('State4: $state4'),
          Consumer(
            // Consumer로 watch 감싸는 순간, watch 실행시 상위 빌드가 재실행되지 않고 Consumer 내의 builder 함수가 재실행
            builder: (context, ref, child) {
              print('Consumer build');
              final state5 = ref.watch(gStateNotifierProvider);
              return Row(
                children: [
                  Text('State5 : $state5'),
                  child!,
                ],
              );
            },
            child: Text(' Hello'),
            // Consumer Widget의 child 파라미터에 입력된 위젯이 child 파라미터에 그대로 제공됨.
            // Hello라는 텍스트의 경우 Consumer 위젯 내에 있지만 매번 같이 빌드될 필요가 없기 때문에 한번만 빌드되도록 child 파라미터로 전달
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).increment();
                },
                child: Text('Increment'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).decrement();
                },
                child: Text('Decrement'),
              ),
            ],
          ),
          // invalidate 유효하지 않게 하다, state를 유효하지 않게 해 초기 상태로 되돌리는 역할
          ElevatedButton(
            onPressed: () {
              ref.invalidate(gStateNotifierProvider);
              // 버튼 클릭시 initial state로 돌아감
            },
            child: Text('Invalidate'),
          ),
        ],
      ),
    );
  }
}