import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

// 1) 어떤 provider를 사용할지 고민할 필요 없도록
// Provider, FutureProvider, StreamProvider(x)
// StateNotifierProvider

final _testProvider = Provider<String>((ref) => 'Hello Code Generation');

@riverpod
String gState(GStateRef ref) { // 함수 형태로 작성하기 때문에 직관적, 코드 제너레이션을 통해 추가 기능 제공받을 수 있음
  return 'Hello Code Generation';
}

// 2) Parameter > Family 파라미터를 일반 함수처럼 사용할 수 있도록
