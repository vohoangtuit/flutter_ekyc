import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormatDateTime{
 static DateTime selectedDate = DateTime.now();
  static DateFormat datetimeFormatDDMMYY(){
    return DateFormat("dd/MM/yyyy");
  }
 static DateFormat datetimeFormatDDMMYYYY(){
   return DateFormat("dd-MM-yyyy");
 }
 static DateFormat datetimeFormatDD_MM_YYYY_HH_MM(){
   return DateFormat("dd/MM/yyyy - HH:mm");
 }
  static DateFormat datetimeFormatYYYYMMDD(){
    return DateFormat("yyyyMMdd");
  }
  static DateFormat datetimeFormatYYYY_MM_DD(){
    return DateFormat("yyyy-MM-dd");
  }
 static DateFormat datetimeFormatMM_YYYY(){
   return DateFormat("MM-yyyy");
 }

  static String strYYYY_MM_DD(){
    return datetimeFormatYYYY_MM_DD().format(selectedDate);
  }
 static String strDD_MM_YYYY_(){
   return datetimeFormatDDMMYY().format(selectedDate);
 }
 static String strMM_YYYY(){
   return datetimeFormatMM_YYYY().format(selectedDate);
 }
 static String getYYYY_MM_DDNextMonthFromCurrent(String dateStart,int month_next){
 //  var date = new DateTime.now();
   DateTime dateTime = DateTime.parse(dateStart);
   var next =DateTime(dateTime.year, dateTime.month+month_next,dateTime.day);
   var format =datetimeFormatYYYY_MM_DD().format(next);
   return format;
 }
 static String getDD_MM_YYYY_nextMonthFromCurrent(String dateStart,int month_next){
   //  var date = new DateTime.now();
   DateTime dateTime = DateTime.parse(dateStart);
   var next =DateTime(dateTime.year, dateTime.month+month_next,dateTime.day);
   var format =datetimeFormatDDMMYY().format(next);
   return format;
 }
 static String strYYYYMMDD(){
   return DateFormat("yyyyMMdd").format(selectedDate);
 }
 static String strDDMMYYYY(){
   return DateFormat("dd/MM/yyyy").format(selectedDate);
 }
 static String strDD_MM_YYYY(){
   return DateFormat("dd-MM-yyyy").format(selectedDate);
 }
 static String strDDMMYYYYFromTimesTamp(String timestamp){

   var millis = timestamp as int;
   var dt = DateTime.fromMillisecondsSinceEpoch(millis);
   return datetimeFormatDDMMYYYY().format(dt);
 }

 static String getCurrentDay(){
    var now = new DateTime.now();
    var today = datetimeFormatDDMMYY();
    return today.format(now);
  }
 static String getCurrentDay_DD_MM_YYYY(){
   var now = new DateTime.now();
   var today = datetimeFormatDDMMYYYY();
   return today.format(now);
 }
 static String getStringNextMonthFromCurrent(int month_next){
    var date = new DateTime.now();
    var next =DateTime(date.year, date.month+month_next,date.day);
    var format =datetimeFormatDDMMYY().format(next);
    return format;
 }
 static String stringDay_DD_MM_YYYY_FromDateime(DateTime dateTime){
   var today = datetimeFormatDDMMYYYY();
   return today.format(dateTime);
 }
 static String getCurrentDay_DD_MM_YYYY_HH_MM(){
   var now = new DateTime.now();
   var today = datetimeFormatDD_MM_YYYY_HH_MM();
   return today.format(now);
 }
 static String getNextDay_DD_MM_YYYY(int day){
   final date = selectedDate.add(Duration(days: day));
   var today = datetimeFormatDDMMYYYY();
   return today.format(date);
 }
  static DateTime getYYYY_MM_DD_Now(){// todo ,
    var date = new DateTime.now();
    var now =DateTime(date.year, date.month,date.day);
    return now;
  }
  static DateTime getYYYY_MM_Future(int month_next){// todo l???y s??? th??ng k??? ti???p
    var date = new DateTime.now();
    var now =DateTime(date.year, date.month+month_next,date.day);
    return now;
  }
 static DateTime getMM_YYYY_Future(int month_next){// todo l???y s??? th??ng k??? ti???p
   var date = new DateTime.now();
   var now =DateTime(date.year, date.month+month_next);
   //var now =DateTime(date.month+month_next, date.year);
   return now;
 }
 static DateTime getDD_MM_YYYY_Future(int day_next){// todo l???y s??? ng??y k??? ti???p
   var date = new DateTime.now();
   var now =DateTime(date.year,date.month,date.day+day_next);

   var now1 =DateTime.now().add(Duration(days: day_next));// todo c??ch 2
   return now;
 }

 static String stringDD_MM_YYYY_HH_mm(String datetime){
   try{
     var parsedDate = DateTime.parse(datetime);
     var dateFormatted = DateFormat("dd/MM/yyyy - HH:mm").format(parsedDate);
     return dateFormatted;
   }on Exception catch (_){
     return '';
   }
  }
 static String strYYYY_MM_DD_HH_MM_SS(String datetime){// todo d??ng cho count down
    try{
      DateFormat inputFormat = DateFormat('dd/MM/yyyy HH:mm:ss');
      DateTime dateFormatted = inputFormat.parse(datetime);
      String date = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateFormatted);
      return date;
    }on Exception catch (_){
      return '';
    }
 }
 static String strYYYY_MM_DD_HH_MM(String datetime){// todo d??ng cho count down
   try{
     DateFormat inputFormat = DateFormat('dd/MM/yyyy HH:mm');
     DateTime dateFormatted = inputFormat.parse(datetime);
     String date = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateFormatted);
     return date;
   }on Exception catch (_){
     return '';
   }
 }
 static String stringDD_MM_YYYY_(String datetime){
   DateFormat inputFormat = DateFormat('dd/MM/yyyy HH:mm:ss');
   DateTime dateFormatted = inputFormat.parse(datetime);
   String date = datetimeFormatDDMMYY().format(dateFormatted);
   return date;
 }
 static String stringDD_MM_YYYY_FromFormat(String datetime){
   DateFormat inputFormat = DateFormat('dd-MM-yyyy HH:mm:ss');
   DateTime dateFormatted = inputFormat.parse(datetime);
   String date = datetimeFormatDDMMYY().format(dateFormatted);
   return date;
 }
 static String stringDD_MM_YYYY(String datetime){
    try{
      var parsedDate = DateTime.parse(datetime);
      var dateFormatted = DateFormat("dd/MM/yyyy").format(parsedDate);
      return dateFormatted;
    }on Exception catch (_){
    return '';
   }
 }
 static String getStringDDMMYYYY(String datetime){
   try{
     var parsedDate = DateTime.parse(datetime);
     var dateFormatted = datetimeFormatDDMMYYYY().format(parsedDate);
     return dateFormatted;
   }on Exception catch (_){
     return '';
   }
 }
 static String stringHH_MM(String datetime){
   try{
     var parsedDate = DateTime.parse(datetime);
     var dateFormatted = DateFormat("HH:mm").format(parsedDate);
     return dateFormatted;
   }on Exception catch (_){
     return '';
   }
 }
 static String stringDD(String datetime){
   try{
     var parsedDate = DateTime.parse(datetime);
     var dateFormatted = DateFormat("dd").format(parsedDate);
     return dateFormatted;
   }on Exception catch (_){
     return '';
   }
 }
 static String stringDD_(String datetime){
   var inputFormat = DateFormat('dd/MM/yyyy HH:mm:ss');
   try{
     var parsedDate = inputFormat.parse(datetime);
     var dateFormatted = DateFormat("dd").format(parsedDate);
     return dateFormatted;
   }on Exception catch (_){
     return '';
   }
 }
 static String stringMMYY(String datetime){
   try{
     var parsedDate = DateTime.parse(datetime);
     var dateFormatted = DateFormat("MM-yyyy").format(parsedDate);
     return dateFormatted;
   }on Exception catch (_){
     return '';
   }
 }
 static String stringMMYY_(String datetime){
   var inputFormat = DateFormat('dd/MM/yyyy HH:mm:ss');
   try{
     var parsedDate = inputFormat.parse(datetime);
     var dateFormatted = DateFormat("MM-yyyy").format(parsedDate);
     return dateFormatted;
   }on Exception catch (_){
     return '';
   }
 }
  static int longtime(String datetime){
    var parsedDate = DateTime.parse(datetime);
    var dateFormatted = DateFormat("dd/MM/yyyy HH:mm:ss").format(parsedDate);
    var date = parsedDate.microsecondsSinceEpoch;
   return date;
  }
 static String getDD_MM_YYYY_fromLong(String datetime){
    try{
      var parsedDate = DateTime.parse(datetime);
      var dateFormatted =datetimeFormatDDMMYYYY().format(parsedDate);
      return dateFormatted;
    }on Exception catch (_){
      return '';
    }

 }
  static bool checkTimeRemainPayTour(String deadline){
    final DateTime now = DateTime.now();
    int current =  now.microsecondsSinceEpoch;
    int remain = longtime(deadline);
    return current-remain<0?true:false;
  }

static String getDateFromDateTimeRange(DateTime dateTime,DateFormat dateFormat){
    if(dateTime==null)
      return '';
    return dateFormat.format(dateTime);
    // datetimeFormatDDMMYY
}
 static int countDaysFromDateTimeRange(DateTimeRange dateTime){
   if(dateTime==null)
     return 0;
   DateTime day1 =dateTime.start;
   DateTime day2 =dateTime.end;
   return day2.difference(day1).inDays;
 }
}