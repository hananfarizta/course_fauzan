import 'package:course_fauzan/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int bayar = 0;
  int input = 0;
  final currencyFormatter = NumberFormat('#,##0.00', 'ID');

  void jumlahBayar() {
    setState(() {
      bayar = input * 150000;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: Container(
        margin: EdgeInsets.all(edge),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InkWell(
                onTap: jumlahBayar,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Hitung',
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Checkout',
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        bottom: false,
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 30,
                  left: edge,
                  right: edge,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: ShapeDecoration(
                          color: Colors.black.withOpacity(0.23999999463558197),
                          shape: const OvalBorder(),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: whiteColor,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: edge,
                  left: edge,
                  right: edge,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jumlah Beli',
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: greyColor)),
                      child: Center(
                        child: TextFormField(
                          style: blackTextStyle,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            int? parsedValue = int.tryParse(value);
                            if (parsedValue != null) {
                              setState(() {
                                input = parsedValue;
                              });
                            }
                          },
                          decoration: InputDecoration.collapsed(
                            hintText: 'Masukkan Jumlah Beli',
                            hintStyle: greyTextStyle.copyWith(fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: edge,
                  left: edge,
                  right: edge,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jumlah Beli: $input',
                      style: whiteTextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: edge,
                    ),
                    Text(
                      'Total Pembayaran: Rp ${currencyFormatter.format(bayar)}',
                      style: whiteTextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
