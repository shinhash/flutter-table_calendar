import 'package:calendar_scheduler/const/color.dart';
import 'package:flutter/material.dart';

class CustumTextField extends StatelessWidget {
  final String label;
  final bool expend;
  final FormFieldSetter<String> onSaveTextFormField;
  final FormFieldValidator<String> validatorTextFormField;

  const CustumTextField({
    required this.label,
    required this.onSaveTextFormField,
    required this.validatorTextFormField,
    this.expend = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${label}',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        if(!expend) renderTextFormField(),
        if(expend) Expanded(child: renderTextFormField()),
      ],
    );
  }

  renderTextFormField(){
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey[300],
      ),
      onSaved: onSaveTextFormField,
      validator: validatorTextFormField,
      minLines: expend ? null : 1,
      maxLines: expend ? null : 1,
      expands: expend,
      cursorColor: Colors.grey,
    );
  }
}
