import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ekyc/models/data_card_model.dart';
import 'package:flutter_ekyc/screens/base_screen.dart';
import 'package:flutter_ekyc/utils/constant.dart';
import 'package:flutter_ekyc/utils/validators.dart';
import 'package:flutter_ekyc/widgets/general_widget.dart';

import '../../models/card_back_model.dart';
import '../../models/card_front_model.dart';

class ReadInfoCMNDScreen extends StatefulWidget {
  const ReadInfoCMNDScreen({Key? key}) : super(key: key);

  @override
  State<ReadInfoCMNDScreen> createState() => _ReadInfoCMNDScreenState();
}

class _ReadInfoCMNDScreenState extends BaseScreen<ReadInfoCMNDScreen> {
  File? imageFront;
  File? imageBack;
  String errorMessage = '';
  List<DataCardModel> data = <DataCardModel>[];
  CardFrontModel? infoCardFront;
  CardBackModel? infoCardBack;
  bool valid =false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(context, 'Xem thông tin CMND'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _viewCard(),
            spaceHeight(20),
            _viewInfo()
          ],
        ),
      ),
    );
  }

  Widget _viewCard() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            viewCardDefault('Mặt Trước', imageFront, () {
              openOption(true, (file) {
                setState(() {
                  imageFront = file;
                });
              });
            }),
            viewCardDefault('Mặt Sau', imageBack, () {
              openOption(false, (file) {
                setState(() {
                  imageBack = file;
                });
              });
            }),
          ],
        ),
        spaceHeight(5),
        textError(errorMessage),
        spaceHeight(20),
        imageFront == null
            ? Container()
            : imageBack == null
                ? Container()
                : viewButtonWidth('upload', () {
                    _verifyID();
                  })
      ],
    );
  }

  Widget _viewInfo(){
    return !valid?Container():Container(
      decoration: bgInfo(),
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
      child: Column(
        children: [
          textBoldCenter('Mặt truớc'),
          spaceHeight(5),
          const Divider(height: 1,),
          infoCardFront!=null?Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                customRow('ID: ',infoCardFront!.id!),
                customRow('Họ tên: ',infoCardFront!.name!),
                customRow('Ngày sinh: ',infoCardFront!.dob!),
                customRow('Nguyên quán: ',infoCardFront!.hometown!),
                customRow('Thuờng trú: ',infoCardFront!.address!),

              ],

            ),
          ):Container(),
          const Divider(height: 1,),
          spaceHeight(5),
          textBoldCenter('Mặt sau'),
          spaceHeight(5),
          const Divider(height: 1,),
          spaceHeight(5),
          infoCardBack!=null?Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                customRow('Dân tộc: ',infoCardBack!.ethnicity!),
                customRow('Tôn giáo: ',infoCardBack!.religious!),
                customRow('Dấu vết và dị hình: ',infoCardBack!.identification_sign!),
                customRow('Ngày cấp: ',infoCardBack!.issue_date!),
                customRow('Nơi cấp: ',infoCardBack!.issued_at!),

              ],

            ),
          ):Container(),
        ],
      ),
    );
  }

  _verifyID() async {
    if (imageFront != null && imageBack != null) {
      setState(() {
        valid =false;
        errorMessage ='';
        data.clear();
        infoCardFront =null;
        infoCardBack =null;
      });
      await eKycBloc.verifyCards(imageFront!, imageBack!, (error) {
        if (Utils.isNotEmpty(error) ?? true) {
          setState(() {
            errorMessage = error;
          });
        } else {

          setState(() {
            errorMessage = '';
          });
        }
      }).then((value) {
        if (value.isNotEmpty) {
          setState(() {
            data = value;
          });
        }
      });
      //
      if (data.isNotEmpty) {
        for (var card in data) {
          if(card.type!.compareTo(Constants.cardFront)==0){
            if(card.infoCardFront!=null){
              setState(() {
                infoCardFront =card.infoCardFront!;
              });
            }
          }else if(card.type!.compareTo(Constants.cardBack)==0){
            if(card.infoCardBack!=null){
              setState(() {
                infoCardBack =card.infoCardBack!;
              });
            }
          }
        }
      }
      log('infoCardBack: ${infoCardBack.toString()}');
      log('-------------------------------------------------------');
      log('infoCardFront: ${infoCardFront.toString()}');
      if(infoCardFront!=null&&infoCardBack!= null){
        setState(() {
          valid =true;
          errorMessage='';
        });
      }else if(infoCardFront==null && infoCardBack==null){
        setState(() {
          valid =false;
          errorMessage='CMND không phù hợp';
        });
      }else if(infoCardFront==null&& infoCardBack!=null){
        setState(() {
          valid =false;
          errorMessage='CMND mặt trứơc không phù hợp';
        });
      }
      else if(infoCardFront!=null&& infoCardBack==null){
        setState(() {
          valid =false;
          errorMessage='CMND mặt sau không phù hợp';
        });
      }

    }
  }
}
