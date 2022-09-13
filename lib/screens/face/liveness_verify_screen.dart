import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ekyc/models/lveness_verify_model.dart';
import 'package:flutter_ekyc/screens/vtv_ekyc_screen.dart';
import 'package:flutter_ekyc/widgets/general_widget.dart';

class LivenessVerifyScreen extends StatefulWidget {
  const LivenessVerifyScreen({Key? key}) : super(key: key);

  @override
  State<LivenessVerifyScreen> createState() => _LivenessVerifyScreenState();
}

class _LivenessVerifyScreenState extends VTVEKycScreen<LivenessVerifyScreen> {
  File? portraitLeft;
  File? portraitMid;
  File? portraitRight;
  String errorMessage = '';
  LivenessVerifyModel? data;
  int? matchingMidLeft=-1;
  int? matchingMidRight=-1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(context, 'Ảnh 3 góc độ'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _viewCard()
          ],
        ),
      ),
    );
  }
  Widget _viewCard() {
    return Column(
      children: [
        viewCardDefault('Ảnh chính diện', portraitMid, () {
          openOption(false, (file) {
            setState(() {
              portraitMid = file;
            });
          });
        }),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                viewCardDefault('Ảnh quay trái', portraitLeft, () {
                  openOption(true, (file) {
                    setState(() {
                      portraitLeft = file;
                    });
                  });
                }),
                textError(matchingMidLeft!=-1?'Matching: $matchingMidLeft %':'')
              ],
            ),

            Column(
              children: [
                viewCardDefault('Ảnh quay phải', portraitRight, () {
                  openOption(false, (file) {
                    setState(() {
                      portraitRight = file;
                    });
                  });
                }),
                textError(matchingMidRight!=-1?'Matching: $matchingMidRight %':'')
              ],
            ),
          ],
        ),
        spaceHeight(40),
        textError(errorMessage),
        spaceHeight(20),
        portraitLeft == null ? Container() : portraitMid == null ? Container() :portraitRight==null?Container(): viewButtonWidth('kiểm tra', () {
          _verify();
        })
      ],
    );
  }
  _verify()async{
    if(portraitLeft!=null&&portraitMid!=null&&portraitRight!=null){
      setState(() {
        errorMessage ='';
        data =null;
      });
      await eKycBloc.verifyLiveness(portraitLeft!, portraitMid!,portraitRight!).then((value){
        setState(() {
          data =value;
          if(data!=null){
            if(data!.matching_mid_left!.isNotEmpty&&data!.matching_mid_right!.isNotEmpty){
              setState(() {
                double left =double.parse(data!.matching_mid_left!);
                double right =double.parse(data!.matching_mid_right!);
                matchingMidLeft =left.round();
                matchingMidRight =right.round();
              });
            }
          }
          errorMessage =data!.invalidMessage!;
        });
      });
    }
  }
}
