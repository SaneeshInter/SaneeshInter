import 'package:flutter/material.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils.dart';
class DeleteButton extends StatefulWidget {
  final Function onPressed;
  final String label;
  const DeleteButton({Key? key, required this.onPressed, required this.label}) : super(key: key);

  @override
  _DeleteButtonState createState() => _DeleteButtonState();
}

class _DeleteButtonState extends State<DeleteButton> {
  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed();
        setState(() {
          tapped = true;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context, dividedBy: 24),
            vertical: screenHeight(context, dividedBy: 90)),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  tapped == false ? Colors.grey.shade300 : Colors.grey.shade300,
                  tapped == false ? Colors.grey.shade300 : Colors.grey.shade300,
                ]),
            color: Constants.colors[0],
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          widget.label,
          style: TextStyle(
              fontSize: 13,
              color: tapped == false ? Colors.black : Colors.black,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
