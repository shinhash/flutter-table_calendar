import 'package:calendar_scheduler/model/schedule.dart';
import 'package:flutter/material.dart';
import '../const/color.dart';
import 'custum_text_field.dart';

class ScheduleBottomSheet extends StatefulWidget {
  final DateTime selectedDay;

  const ScheduleBottomSheet({
    required this.selectedDay,
    super.key,
  });

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();

  int? startTime;
  int? endTime;
  String? content;
  String selectedColor = categoryColors.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 600,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _Time(
                  onStartTimeSave: onStartTimeSave,
                  onEndTimeSave: onEndTimeSave,
                  onStartTimeValidate: onStartTimeValidate,
                  onEndTimeValidater: onEndTimeValidater,
                ),
                _Content(
                  onContentSave: onContentSave,
                  onContentValidater: onContentValidater,
                ),
                SizedBox(height: 8.0),
                _Categories(
                  selectedColor: selectedColor,
                  onTabCategory: onTabCategory,
                ),
                SizedBox(height: 8.0),
                _SaveButton(
                  onPressSaveBtn: onPresseSaveBtn,
                ),
                SizedBox(height: 8.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTabCategory(String color) {
    setState(() {
      selectedColor = color;
    });
  }

  onStartTimeSave(String? value) {
    if (value != null) {
      startTime = int.parse(value.toString());
    }
  }

  onEndTimeSave(String? value) {
    if (value != null) {
      endTime = int.parse(value.toString());
    }
  }

  onContentSave(String? value) {
    if (value != null) {
      content = value.toString();
    }
  }

  String? onStartTimeValidate(String? value) {
    if (value == null) return '값을 입력해주세요.';
    if (int.tryParse(value) == null) return '숫자를 입력해주세요.';

    final time = int.parse(value.toString());
    if (time < 0 || time > 24) return '0 ~ 24 사이의 숫자를 입력해주세요.';
    return null;
  }

  String? onEndTimeValidater(String? value) {
    if (value == null) return '값을 입력해주세요.';
    if (int.tryParse(value) == null) return '숫자를 입력해주세요.';

    final time = int.parse(value.toString());
    if (time < 0 || time > 24) return '0 ~ 24 사이의 숫자를 입력해주세요.';
    return null;
  }

  String? onContentValidater(String? value) {
    if (value == null) return '값을 입력해주세요.';
    if (value.length < 5) return '5자이상 입력해주세요.';
    return null;
  }

  onPresseSaveBtn() {
    final isValided = formKey.currentState!.validate();
    if (!isValided) return;

    print('=========== SAVE ===========');
    print(startTime);
    print(endTime);
    print(content);
    print(selectedColor);
    formKey.currentState!.save();
    print('=============================');

    final scheduleInfo = Schedule(
      scheduleId: 999,
      startTime: startTime!,
      endTime: endTime!,
      content: content!,
      category: selectedColor,
      date: widget.selectedDay,
      createTime: DateTime.now().toUtc(),
    );

    Navigator.of(context).pop(scheduleInfo);
  }
}

class _Time extends StatelessWidget {
  final FormFieldSetter<String> onStartTimeSave;
  final FormFieldSetter<String> onEndTimeSave;
  final FormFieldValidator<String> onStartTimeValidate;
  final FormFieldValidator<String> onEndTimeValidater;

  const _Time({
    required this.onStartTimeSave,
    required this.onEndTimeSave,
    required this.onStartTimeValidate,
    required this.onEndTimeValidater,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustumTextField(
            label: '시작 시간',
            onSaveTextFormField: onStartTimeSave,
            validatorTextFormField: onStartTimeValidate,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        Expanded(
          child: CustumTextField(
            label: '마감 시간',
            onSaveTextFormField: onEndTimeSave,
            validatorTextFormField: onEndTimeValidater,
          ),
        ),
      ],
    );
  }
}

class _Content extends StatelessWidget {
  final FormFieldSetter<String> onContentSave;
  final FormFieldValidator<String> onContentValidater;

  const _Content({
    required this.onContentSave,
    required this.onContentValidater,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustumTextField(
        label: '내용',
        expend: true,
        onSaveTextFormField: onContentSave,
        validatorTextFormField: onContentValidater,
      ),
    );
  }
}

typedef OnColorSelected = void Function(String color);

class _Categories extends StatelessWidget {
  final String selectedColor;
  final OnColorSelected onTabCategory;

  const _Categories({
    required this.selectedColor,
    required this.onTabCategory,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        children: categoryColors
            .map(
              (e) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                  onTap: () {
                    onTabCategory(e);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(
                        int.parse(
                          'FF${e}',
                          radix: 16,
                        ),
                      ),
                      border: e == selectedColor
                          ? Border.all(color: Colors.black, width: 4.0)
                          : null,
                      shape: BoxShape.circle,
                    ),
                    width: 32.0,
                    height: 32.0,
                  ),
                ),
              ),
            )
            .toList());
  }
}

class _SaveButton extends StatelessWidget {
  final VoidCallback onPressSaveBtn;

  const _SaveButton({
    required this.onPressSaveBtn,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressSaveBtn,
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
            ),
            child: Text('저장'),
          ),
        ),
      ],
    );
  }
}
