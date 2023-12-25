import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/auth/users.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/wishlist/business/entity/course_wislist.dart';
import 'package:flutter_fe_rpl/feature/wishlist/presentation/provider/wishlist_provider.dart';
import 'package:flutter_fe_rpl/feature/wishlist/presentation/widget/courze_card_wishlist.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WishlistComponent extends StatefulWidget {
  const WishlistComponent({super.key, required this.idUser});
  final String? idUser;

  @override
  State<WishlistComponent> createState() => _WishlistComponentState();
}

Widget Atas(Widget widget) {
  return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: null,
        title: Text(
          "Wishlist",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              color: AppColor.textPrimary,
              fontSize: 16),
        ),
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        shape: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
      body: widget);
}

class _WishlistComponentState extends State<WishlistComponent> {
  void initState() {
    super.initState();
    Provider.of<WishlistProvider>(context, listen: false)
        .getWishlist(idUser: widget.idUser!);
    Provider.of<AuthUserProvider>(context, listen: false).getUser();
  }

  @override
  Widget build(BuildContext context) {
    String? idUser = Provider.of<AuthUserProvider>(context).uid;
    List<CourseWishlist>? wishlistId =
        Provider.of<WishlistProvider>(context).wishlistId;
    print(wishlistId);
    Failure? failure = Provider.of<WishlistProvider>(context).failure;
    if (wishlistId != null) {
      return Atas(
        ListView.builder(
            itemCount: wishlistId.length,
            itemBuilder: (context, index) {
              return CourzeCardWishlist(
                  idUser: idUser,
                  id: wishlistId[index].id!,
                  imageUrl: wishlistId[index].imageUrl,
                  courseName: wishlistId[index].name,
                  mentorName: wishlistId[index].mentor,
                  rating: wishlistId[index].rating,
                  price: wishlistId[index].price);
            }),
      );
    }
    if (failure != null) {
      return Atas(
        Center(
          child: Text(failure.errorMessage),
        ),
      );
    }
    return Atas(
      const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
