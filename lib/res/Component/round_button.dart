import 'package:flutter/material.dart';
import 'package:nvvm/res/Component/appColor.dart';

class RoundBtn extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onpress;
  const RoundBtn(
      {Key? key,
      required this.title,
      this.loading = false,
      required this.onpress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            color: AppColor.BtnColor, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: loading
                ? CircularProgressIndicator()
                : Text(
                    title,
                    style: TextStyle(color: AppColor.WhiteColor),
                  )),
      ),
    );
  }
}
