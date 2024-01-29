import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputText extends StatefulWidget {
  final String label;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool isVisible;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool readOnly;
  final bool isCalendar;
  final String? initialValue;

  const InputText({
    super.key,
    required this.label,
    this.suffixIcon,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.isVisible = false,
    this.validator,
    this.onChanged,
    this.readOnly = false,
    this.isCalendar = false,
    this.initialValue,
  });

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color.fromRGBO(49, 101, 52, 1);
    widget.initialValue != null
        ? widget.controller.text == widget.initialValue
        : null;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
          controller: widget.controller,
          initialValue: widget.initialValue,
          obscureText: widget.isPassword ? !isVisible : isVisible,
          keyboardType: widget.keyboardType,
          onChanged: widget.onChanged,
          readOnly: widget.readOnly,
          textCapitalization: TextCapitalization.characters,
          decoration: InputDecoration(
            label: Text(widget.label),
            labelStyle: const TextStyle(color: primaryColor),
            suffixIconColor: primaryColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    icon: Icon(
                        isVisible ? Icons.visibility_off : Icons.visibility))
                : widget.isCalendar
                    ? IconButton(
                        onPressed: () async {
                          final values = await showCalendarDatePicker2Dialog(
                            context: context,
                            config: CalendarDatePicker2WithActionButtonsConfig(
                              firstDate: DateTime(2020, 1, 1),
                              lastDate: DateTime.now(),
                              currentDate: DateTime.now(),
                              dayTextStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                              calendarType: CalendarDatePicker2Type.single,
                              selectedDayHighlightColor: Colors.purple[800],
                              closeDialogOnCancelTapped: true,
                              firstDayOfWeek: 1,
                              weekdayLabelTextStyle: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                              controlsTextStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              centerAlignModePicker: true,
                              customModePickerIcon: const SizedBox(),
                              selectableDayPredicate: (date) {
                                return (date.weekday != DateTime.sunday);
                              },
                              selectedDayTextStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                            dialogSize: const Size(325, 400),
                            borderRadius: BorderRadius.circular(15),
                            dialogBackgroundColor: Colors.white,
                          );
                          if (values != null && values.isNotEmpty) {
                            setState(() {
                              widget.controller.text =
                                  DateFormat('yyyy-MM-dd')
                                      .format(values[0]!);
                            });
                          }
                        },
                        icon: const Icon(Icons.calendar_month))
                    : widget.suffixIcon,
            errorStyle: const TextStyle(color: primaryColor, fontSize: 13),
          )),
    );
  }
}
