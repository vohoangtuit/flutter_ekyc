import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ekyc/bloc/ekyc_bloc.dart';
import 'package:flutter_ekyc/general/genneral_screen.dart';
import 'package:flutter_ekyc/utils/constant.dart';
import 'package:flutter_ekyc/widgets/bottom_sheet.dart';
import 'package:image_picker/image_picker.dart';

abstract class VTVEKycScreen  <T extends StatefulWidget> extends GeneralScreen<T> {
  late EKycBloc eKycBloc;
  @override
  void initAll() {
    _initBloc();
    super.initAll();
  }
  void _initBloc() {
    eKycBloc =EKycBloc(screen: this);
  }
  openOption(bool front,ValueChanged<File> file){
    BottomSheetController().selectImage(context, (from) {
      getImage(front,from,(file_){
        file(file_);
      });
    });
  }
  getImage(bool front,SelectPicture from,ValueChanged<File> file)async{
    final ImagePicker picker = ImagePicker();
    XFile? image;
    if(from==SelectPicture.camera){
      image = await picker.pickImage(source: ImageSource.camera);
    }else{
      image = await picker.pickImage(source: ImageSource.gallery);
    }
    if(image!=null){
      file( File(image.path));
    }
  }
}

