import 'dart:io';

import 'package:flutter/material.dart';


AppBar baseAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
  );
}

BoxDecoration bgButton() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(18),
    border: Border.all(color: Colors.white, width: 0.5),
    color: Colors.blue,
  );
}

BoxDecoration bgInfo() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(18),
    border: Border.all(color: Colors.white, width: 0.5),
    color: Colors.grey[300],
  );
}

Widget viewCustomButton(String title, VoidCallback onTap){
  return Container(
    decoration: bgButton(),
    margin: const EdgeInsets.only(left: 50,right: 50,top: 10,bottom: 10),
    child: InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 42,
        child: Center(child: Text(title,style:  const TextStyle(color: Colors.white,fontSize:15),textAlign: TextAlign.center),),
      ),
    ),
  );
}
Widget viewButtonWidth(String title, VoidCallback onTap){
  return Container(
    decoration: bgButton(),
    margin: const EdgeInsets.only(left: 50,right: 50,top: 10,bottom: 10),
    child: InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 40,
        width: 150,
        child: Center(child: Text(title,style:  const TextStyle(color: Colors.white,fontSize:17),),),
      ),
    ),
  );
}

Text text(String title){
  return Text(title,style: const TextStyle(color: Colors.black87,fontSize: 13),) ;
}
Text textAlignRight(String title) {
  return Text(title,style: const TextStyle(color: Colors.black87,fontSize: 13),textAlign: TextAlign.right,) ;
}
Text textGray(String title){
  return Text(title,style: const TextStyle(color: Color(0xFF757575),fontSize: 13),) ;
}
Text textError(String title){
  return Text(title,style: const TextStyle(color: Colors.redAccent,fontSize: 13),) ;
}
Text textBold(String title){
  return Text(title,style: const TextStyle(color: Colors.black87,fontSize: 13,fontWeight: FontWeight.bold),) ;
}
Text textCenter(String title){
  return Text(title,style: const TextStyle(color: Colors.black87,fontSize: 13,),textAlign: TextAlign.center,) ;
}
Text textBoldCenter(String title){
  return Text(title,style: const TextStyle(color: Colors.black87,fontSize: 13,fontWeight: FontWeight.bold),textAlign: TextAlign.center,) ;
}

SizedBox spaceHeight(double space) {
  return SizedBox(
    height: space,
  );
}

SizedBox spaceWidth(double space) {
  return SizedBox(
    width: space,
  );
}
Widget customRow(String title,String value){
  return Container(
    padding: const EdgeInsets.only(top: 5,bottom: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textGray(title),
        Expanded(child: textAlignRight(value))

      ],
    ),
  );
}
Widget viewCardDefault(String title,File? file,VoidCallback onTap){
  return Column(
    children: [
      spaceHeight(20),
      text(title),
      spaceHeight(2),
      SizedBox(
        height: 120,
        width: 150,
        child: InkWell(
            onTap: onTap,
            child: file==null?Image.asset('assets/images/image.png',color: Colors.black45,fit: BoxFit.contain,):Image.file(file)
        ),
      )
    ],
  );
}