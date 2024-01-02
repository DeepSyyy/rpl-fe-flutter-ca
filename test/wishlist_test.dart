import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/feature/wishlist/business/entity/course_wislist.dart';
import 'package:flutter_fe_rpl/feature/wishlist/presentation/provider/wishlist_provider.dart';
import 'package:flutter_fe_rpl/feature/wishlist/presentation/widget/wishlist_component.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('WishlistComponent displays loading indicator',
      (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: WishlistComponent(idUser: "testUser"),
    ));

    // Verify that CircularProgressIndicator is displayed.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('WishlistComponent displays error message',
      (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: WishlistComponent(idUser: "testUser"),
    ));

    // Assuming your failure message is "Error Message"
    expect(find.text("Error Message"), findsOneWidget);
  });

  testWidgets('WishlistComponent displays wishlist items',
      (WidgetTester tester) async {
    // Mock data for the wishlist
    List<CourseWishlist> mockWishlist = [
      CourseWishlist(
          id: "1",
          imageUrl: "url1",
          name: "Course 1",
          mentor: "Mentor 1",
          rating: "4.5",
          price: "19.99",
          description: '',
          category: '',
          level: '',
          videoUrl: '',
          createAt: '',
          updateAt: ''),
      CourseWishlist(
          id: "2",
          imageUrl: "url2",
          name: "Course 2",
          mentor: "Mentor 2",
          rating: "3.8",
          price: "29.99",
          description: '',
          category: '',
          level: '',
          videoUrl: '',
          createAt: '',
          updateAt: ''),
    ];

    // Build our widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: WishlistComponent(idUser: "testUser"),
    ));

    // Inject mock data into the Provider
    WishlistProvider mockWishlistProvider = WishlistProvider();
    mockWishlistProvider.wishlistId = mockWishlist;
    mockWishlistProvider.failure = null;

    // Rebuild widget to reflect the changes
    await tester.pump();

    // Verify that the wishlist items are displayed
    expect(find.text("Course 1"), findsOneWidget);
    expect(find.text("Course 2"), findsOneWidget);
  });
}
