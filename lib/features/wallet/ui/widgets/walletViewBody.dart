// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:managerestaurent/core/theming/styles.dart';

class Walletviewbody extends StatelessWidget {
  const Walletviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 2,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Center(child: Text('Wallet',style: Styles.titleinloginpage,)),
              )),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xfff2f2f2)
                ),
                child: Row(children: [
                  Image.asset('assets/images/wallet.png',height: 60,width: 60,fit: BoxFit.cover,),
                   SizedBox(width: 40,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Your Wallet',style: Styles.discoverText,),
                  Text('\$ 100',style: Styles.titleinloginpage,)
                ],
              )
                ],),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text('Add to Money',style: Styles.titleinloginpage,),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffE9E9E2)),
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Text('\$ 100', style: Styles.titleinloginpage,)),
                     Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffE9E9E2)),
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Text('\$ 400', style: Styles.titleinloginpage,)),
                     Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffE9E9E2)),
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Text('\$ 5000', style: Styles.titleinloginpage,)),
                     Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffE9E9E2)),
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Text('\$ 200', style: Styles.titleinloginpage,)),
                ],
              ),
              SizedBox(height: 40,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.symmetric(vertical: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xff00B0B0),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Center(child: Text('Add Money',style: Styles.titleinforget,)))
          ],
        ),
      ),
    );
  }
}