import 'package:flutter_test/flutter_test.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/app/app.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/feature/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
