import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../style/text_style.dart';
import '../colors/color.dart';

class CustomRadioButton extends StatelessWidget {
  final List<RadioOption> options;
  final Function(int value, String title) onChanged;
  final int groupValue;
  bool? isShow = false;
  CustomRadioButton({super.key, required this.options, required this.onChanged, required this.groupValue, this.isShow});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...options.map((option) =>
        // Obx(() =>
        RadioListTile(
          activeColor: AppColors.primary500,
          title: Text(option.title??'', style: AppTextStyles.kSmall8SemiBoldTextStyle),
          // subtitle: Visibility(
          //   visible: isShow??true,
          //     child: Text(option.subtitle??'')),
          value: option.value,
          groupValue: groupValue,
          secondary: Icon(option.icon),
          onChanged: (value) {
            onChanged(value??0, option.title??'');
          },
        )).toList(),
      ],
    );
  }
}

class RadioOption {
  final int? value;
  final String? title;
  final String? subtitle;
  // final int? groupValue;
  final IconData? icon;

  RadioOption({
    this.value,
    this.title,
    this.subtitle,
    // this.groupValue
    this.icon,
  });
}

//todo how to use
// CustomRadioButton(
// options: [
// RadioOption(value: 1, title: 'All Notification', icon: Icons.notifications_none,),
// RadioOption(value: 2,title: 'Attendance', icon: Icons.calendar_month),
// RadioOption(value: 3,title: 'Leave Request', icon: Icons.leave_bags_at_home_sharp),
// RadioOption(value: 4,title: 'Notes', icon: Icons.note_alt_sharp),
// RadioOption(value: 5,title: 'Announcement', icon: Icons.send_and_archive_outlined),
// RadioOption(value: 6,title: 'Payment', icon: Icons.currency_rupee),
// RadioOption(value: 7,title: 'Live Track', icon: Icons.location_on_outlined),
// RadioOption(value: 8,title: 'System notification', icon: Icons.analytics_outlined),
// RadioOption(value: 9,title: 'Message', icon: Icons.messenger_outline),
// ],
// groupValue: radioController.selectedValue2.value,
// onChanged: (value, title){
// radioController.setRadiobuttonForNotification(value, title);
// debugPrint("value: $value title : $title",);
// Get.back();
// },)

//todo how to use in get x controller
// RxInt selectedValue2 = 1.obs;
// var selectedTitle2 = 'All Notification'.obs;
//
// void setRadiobuttonForNotification(int value2, String title2){
//   selectedValue2.value = value2;
//   selectedTitle2.value = title2;
// }
