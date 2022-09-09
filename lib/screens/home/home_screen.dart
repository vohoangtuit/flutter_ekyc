import 'package:flutter/material.dart';
import 'package:flutter_ekyc/screens/vtv_ekyc_screen.dart';
import 'package:flutter_ekyc/screens/cccd/read_info_cccd_screen.dart';
import 'package:flutter_ekyc/screens/cmnd/read_info_cmnd_screen.dart';
import 'package:flutter_ekyc/utils/app_string.dart';
import 'package:flutter_ekyc/widgets/general_widget.dart';

import '../face/face_matching_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends VTVEKycScreen<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(context, 'Vietravel Ekyc'),
      body: _viewContent(),

    );
  }
  Widget _viewContent(){
    return Center(
      child: SingleChildScrollView(child: Column(
        children: [
          viewCustomButton('${AppString.readInfo} ${AppString.cmnd}',(){
            addScreen(const ReadInfoCMNDScreen());
          }),
          viewCustomButton('${AppString.readInfo} ${AppString.cccd}',(){
            addScreen(const ReadInfoCCCDScreen());
          }),
          viewCustomButton(AppString.compareFaceWithCMNDCCCD,(){
            addScreen(const FaceMatchingScreen());
          })
        ],

      ),),
    );
  }



}
