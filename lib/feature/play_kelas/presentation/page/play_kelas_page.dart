import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/feature/play_kelas/presentation/widget/play_kelas_component.dart';

class PlayKelasPage extends StatelessWidget {
  const PlayKelasPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return PlayKelasComponent(
      id: id,
    );
  }
}
