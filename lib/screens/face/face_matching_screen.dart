import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ekyc/models/face_matching_model.dart';
import 'package:flutter_ekyc/screens/vtv_ekyc_screen.dart';
import 'package:flutter_ekyc/utils/app_string.dart';
import 'package:flutter_ekyc/widgets/general_widget.dart';

class FaceMatchingScreen extends StatefulWidget {
  const FaceMatchingScreen({Key? key}) : super(key: key);

  @override
  State<FaceMatchingScreen> createState() => _FaceMatchingScreenState();
}

class _FaceMatchingScreenState extends VTVEKycScreen<FaceMatchingScreen> {
  File? img1;
  File? img2;
  String errorMessage = '';
  FaceMatchingModel? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(context, AppString.compareFaceWithCMNDCCCD),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _viewContent()
          ],
        ),
      ),
    );
  }
  Widget _viewContent(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            viewCardDefault('Ảnh CMND/CCCD', img1, () {
              openOption(true, (file) {
                setState(() {
                  img1 = file;
                });
              });
            }),
            viewCardDefault('Ảnh chân dung', img2, () {
              openOption(false, (file) {
                setState(() {
                  img2 = file;
                });
              });
            }),
          ],
        ),
        spaceHeight(5),
        textError(errorMessage),
        spaceHeight(20),
        img1 == null
            ? Container()
            : img2 == null
            ? Container()
            : viewButtonWidth('Kiểm tra', () {
          _verify();
        })
      ],
    );
  }
  _verify()async{
    if(img1!=null&&img2!=null){
      setState(() {
        errorMessage ='';
         data =null;
      });
      await eKycBloc.faceMatching(img1!, img2!).then((value){
        setState(() {
          data =value;
          errorMessage =data!.invalidMessage!;
        });
      });
    }

  }
}
