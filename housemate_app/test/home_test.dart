import 'package:flutter_test/flutter_test.dart';
import 'package:housemate_app/main.dart';

void main() {
  testWidgets('Test calendar navigation', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    final calendarButton = find.text('Calendar');
    expect(calendarButton, findsOneWidget);
    await tester.tap(calendarButton);
    await tester.pump();
    expect(find.text('Calendar'), findsOneWidget);
  });
  testWidgets('Test shopping list navigation', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    final shoppingListButton = find.text('Shopping List');
    expect(shoppingListButton, findsOneWidget);
    await tester.tap(shoppingListButton);
    await tester.pump();
    expect(find.text('Shopping List'), findsOneWidget);
  });
  testWidgets('Test group chat navigation', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    final groupChatButton = find.text('Group Chat');
    expect(groupChatButton, findsOneWidget);
    await tester.tap(groupChatButton);
    await tester.pump();
    expect(find.text('Group Chat'), findsOneWidget);
  });
  testWidgets('Test drawer navigation', (WidgetTester tester) async {
  
  });
}