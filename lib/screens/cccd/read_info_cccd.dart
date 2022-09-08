import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ekyc/models/chip_back_model.dart';
import 'package:flutter_ekyc/models/chip_front_model.dart';
import 'package:flutter_ekyc/models/data_chip_model.dart';
import 'package:flutter_ekyc/screens/base_screen.dart';
import 'package:flutter_ekyc/utils/constant.dart';
import 'package:flutter_ekyc/utils/validators.dart';
import 'package:flutter_ekyc/widgets/general_widget.dart';

class ReadInfoCCCDScreen extends StatefulWidget {
  const ReadInfoCCCDScreen({Key? key}) : super(key: key);

  @override
  State<ReadInfoCCCDScreen> createState() => _ReadInfoCCCDScreenState();
}

class _ReadInfoCCCDScreenState extends BaseScreen<ReadInfoCCCDScreen> {
  File? imageFront;
  File? imageBack;
  String errorMessage = '';
  List<DataChipMode> data = <DataChipMode>[];
  ChipFrontModel? infoChipFront;
  ChipBackModel? infoChipBack;

  bool valid =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(context, 'Xem thông tin CCCD'),
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
          infoChipFront!=null?Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                customRow('ID: ',infoChipFront!.id!),
                customRow('Họ tên: ',infoChipFront!.name!),
                customRow('Ngày sinh: ',infoChipFront!.dob!),
                customRow('Giới tính: ',infoChipFront!.gender!),
                customRow('Ngày hết hạn: ',infoChipFront!.due_date!),
                customRow('Nguyên quán: ',infoChipFront!.hometown!),
                customRow('Thuờng trú: ',infoChipFront!.address!),
                customRow('Quốc tịch: ',infoChipFront!.nationality!),

              ],

            ),
          ):Container(),
          const Divider(height: 1,),
          spaceHeight(5),
          textBoldCenter('Mặt sau'),
          spaceHeight(5),
          const Divider(height: 1,),
          spaceHeight(5),
          infoChipBack!=null?Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                customRow('Đạc điểm nhận dạng: ',infoChipBack!.identification_sign!),
                customRow('Ngày cấp: ',infoChipBack!.issue_date!),
                customRow('Nơi cấp: ',infoChipBack!.issued_at!),
                customRow('Ngày hết hạn: ',infoChipBack!.due_date!),
                customRow('Quốc gia: ',infoChipBack!.country!),
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
        infoChipFront =null;
        infoChipBack =null;
      });
      await eKycBloc.verifyChip(imageFront!, imageBack!, (error) {
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
          if(card.type!.compareTo(Constants.chipFront)==0){
            if(card.infoChipFront!=null){
              setState(() {
                infoChipFront =card.infoChipFront!;
              });
            }
          }else if(card.type!.compareTo(Constants.chipBack)==0){
            if(card.infoChipBack!=null){
              setState(() {
                infoChipBack =card.infoChipBack!;
              });
            }
          }
        }
      }
      log('infoChipFront: ${infoChipFront.toString()}');
      log('-------------------------------------------------------');
      log('infoChipBack: ${infoChipBack.toString()}');
      if(infoChipFront!=null&&infoChipBack!= null){
        setState(() {
          valid =true;
          errorMessage='';
        });
      }else if(infoChipFront==null && infoChipBack==null){
        setState(() {
          valid =false;
          errorMessage='CCCD không phù hợp';
        });
      }else if(infoChipFront==null&& infoChipBack!=null){
        setState(() {
          valid =false;
          errorMessage='CCCD mặt trứơc không phù hợp';
        });
      }
      else if(infoChipFront!=null&& infoChipBack==null){
        setState(() {
          valid =false;
          errorMessage='CCCD mặt sau không phù hợp';
        });
      }

    }
  }
}
