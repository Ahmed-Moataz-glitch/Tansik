import 'package:flutter_test/flutter_test.dart';
import 'package:mostaqbaly/main.dart';

void main() {
  testWidgets('App title and home page render smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('مستقبلي'), findsWidgets);
    expect(find.text('بيانات أرشيفية للحدود الدنيا للكليات والمعاهد'), findsOneWidget);
  });
}
