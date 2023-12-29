import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/auth/users.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';
import 'package:flutter_fe_rpl/core/errors/failure.dart';
import 'package:flutter_fe_rpl/feature/transaksi/business/entity/course_detail_transacttion.dart';
import 'package:flutter_fe_rpl/feature/transaksi/business/entity/transaction_entity.dart';
import 'package:flutter_fe_rpl/feature/transaksi/presentation/provider/transaksi_provider.dart';
import 'package:flutter_fe_rpl/feature/transaksi/presentation/widget/card_course_transaksi.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TransaksiComponent extends StatefulWidget {
  const TransaksiComponent({Key? key, required this.idUser}) : super(key: key);
  final String idUser;

  @override
  State<TransaksiComponent> createState() => _TransaksiComponentState();
}

class _TransaksiComponentState extends State<TransaksiComponent> {
  List<CourseDetailTransaction>? myTransactionHistory;

  @override
  void initState() {
    super.initState();
    if (widget.idUser != null) {
      Provider.of<TransactionProvider>(context, listen: false)
          .getTransaction(idUser: widget.idUser!);
    }
    Provider.of<AuthUserProvider>(context, listen: false).getUser();
  }

  @override
  Widget build(BuildContext context) {
    String? idUser = Provider.of<AuthUserProvider>(context).uid;
    List<CourseDetailTransaction>? transactionId =
        Provider.of<TransactionProvider>(context).transactionList ?? [];

    print(transactionId);
    Failure? failure = Provider.of<TransactionProvider>(context).failure;

    if (transactionId != null) {
      return header(context, transactionId, idUser);
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(), // Menampilkan indikator loading
        ),
      );
    }
  }

  Scaffold header(BuildContext context,
      List<CourseDetailTransaction> transactions, String? idUser) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        shape: const Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Riwayat Transaksi',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            return CourseCardTransaksi(
              idUser: idUser,
              imageUrl: transactions[index].imageUrl,
              name: transactions[index].name,
              price: transactions[index].price,
            );
          },
        ),
      ),
    );
  }
}
