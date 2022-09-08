import 'package:flutter/material.dart';
import 'package:flutter_ekyc/screens/base_screen.dart';
import 'package:flutter_ekyc/screens/cccd/read_info_cccd.dart';
import 'package:flutter_ekyc/screens/cmnd/read_info_cmnd.dart';
import 'package:flutter_ekyc/widgets/general_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseScreen<HomeScreen> {
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
          viewCustomButton('Đọc thông tin CMND',(){
            addScreen(const ReadInfoCMNDScreen());
          }),
          viewCustomButton('Đọc thông tin CCCD',(){
            addScreen(const ReadInfoCCCDScreen());
          })
        ],

      ),),
    );
  }



}
