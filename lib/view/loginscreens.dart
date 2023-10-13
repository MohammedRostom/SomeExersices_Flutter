import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_applicatioaserwerwr/controller/Auth_controler.dart';
import 'package:flutter_applicatioaserwerwr/view/widget/CustomFormFild.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constans.dart';
import 'homescreen.dart';
import 'widget/custombtn.dart';

class Loginscreens extends StatelessWidget {
  Loginscreens({super.key});

  GlobalKey<FormState> keyform = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (opj_controler) => Scaffold(
        body: Center(
          child: ModalProgressHUD(
            inAsyncCall: opj_controler.isLoading,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Form(
                key: keyform,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomFormFild(
                      onSaved: (Value) {
                        opj_controler.username = Value;
                      },
                      hintText: "username",
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomFormFild(
                      onSaved: (Value) {
                        opj_controler.password = Value;
                      },
                      hintText: "Password",
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Custembuutton(
                      YText: 'Login',
                      SizeText: 15,
                      ColorBtn: KprimaryColors,
                      onPressed: () async {
                        keyform.currentState?.save();

                        var ingg = await opj_controler.login();

                        //                      if (!opj_controler.isloading && !opj_controler.isError) {
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Custembuutton(
                      YText: 'Google',
                      SizeText: 15,
                      ColorBtn: KprimaryColors,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
