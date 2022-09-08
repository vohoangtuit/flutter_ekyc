import 'package:flutter/material.dart';
import 'package:flutter_ekyc/utils/constant.dart';
import 'package:flutter_ekyc/widgets/general_widget.dart';

class BottomSheetController {

  selectImage(BuildContext context, ValueChanged<SelectPicture> from) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        ),
        context: context,
        builder: (context) {
          return SizedBox(
            height: 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textBold('Chọn ảnh'),
                spaceHeight(10),
                const Divider(
                  height: 1,
                  color: Colors.black12,
                ),
                InkWell(
                  onTap: (){
                    from(SelectPicture.camera);
                    Navigator.pop(context);
                  },
                    child: SizedBox(
                      width: double.infinity,
                  height: 40,
                  child: Center(child: textCenter('Camera')),
                )),
                const Divider(
                  height: 1,
                  color: Colors.black12,
                ),
                InkWell(
                    onTap: (){
                      from(SelectPicture.gallery);
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      width: double.infinity,
                  height: 40,
                  child: Center(child: textCenter('Thư viện ảnh')),
                )),
              ],
            ),
          );
        });
  }
}
