import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

// 1) 어떤 provider를 사용할지 고민할 필요 없도록
// Provider, FutureProvider, StreamProvider(x)
// StateNotifierProvider

final _testProvider = Provider<String>((ref) => 'Hello Code Generation');

@riverpod
String gState(GStateRef ref) {
  // 함수 형태로 작성하기 때문에 직관적, 코드 제너레이션을 통해 추가 기능 제공받을 수 있음
  return 'Hello Code Generation';
}

@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async {
  await Future.delayed(Duration(seconds: 3));

  return 10;
}

// annotation을 가지고 code generation을 해주면 autodispose 키워드 자동으로 걸림
@Riverpod(
  // true값 설정시 autodispose 안걸린 provider 생성
  keepAlive: true,
)
Future<int> gStateFuture2(GStateFuture2Ref ref) async {
  await Future.delayed(Duration(seconds: 3));

  return 10;
}

// 2) Parameter > Family 파라미터를 일반 함수처럼 사용할 수 있도록
class Parameter {
  final int number1;
  final int number2;

  Parameter({
    required this.number1,
    required this.number2,
  });
}

final _testFamilyProvider = Provider.family<int, Parameter>(
  (ref, parameter) => parameter.number1 * parameter.number2,
);

// annotation은 위 코드를 아래와 같이 만들어 줄 수 있음
// 일반함수처럼 파라미터 안에 값을 전달만 해주면 family를 사용하던 위 코드처럼 riverpod을 사용할 수 있음
@riverpod
int gStateMultiply(
  GStateMultiplyRef ref, {
  required int number1,
  required int number2,
}) {
  return number1 * number2;
}

@riverpod
class GStateNotifier extends _$GStateNotifier{
  // StateNotifier를 Provider로 만들 때 그 코드들을 riverpod에서 자동으로 생성
  @override
  int build(){
    return 0; // StateNotifier 클래스의 기본 상태값 = 0
  }

  increment(){
    state ++;
  }

  decrement(){
    state--;
  }
}