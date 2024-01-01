import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/feature/wishlist/presentation/widget/wishlist_component.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key, required this.idUser});
  final String idUser;

  @override
  Widget build(BuildContext context) {
    return WishlistComponent(idUser: idUser);
  }
}
