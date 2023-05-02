// import 'package:college/API/queries.dart';
// import 'package:college/components/widgets.dart';
// import 'package:flutter/material.dart';

// final List<String> _year = [
//   'السنة الاولى',
//   'السنة الثانية',
//   'السنة الثالثة',
//   'السنة الرابعة',
//   'الماجستير',
//   'الدكتوراة'
// ];
// final List<String> _role = [
//   'عضو - قراءة و تعديل',
//   'رئيس - جميع الصلاحيات',
// ];
// final List<String> _years = ['2023-2022', '2022-2021', '2021-2020'];

// class SelectLevels extends StatefulWidget {
//   final String selYear;
//   final bool? edit;
//   const SelectLevels({Key? key, required this.selYear, this.edit})
//       : super(key: key);

//   @override
//   State<SelectLevels> createState() => _SelectLevelsState();
// }

// class _SelectLevelsState extends State<SelectLevels> {
//   late String selYear;
//   @override
//   void initState() {
//     super.initState();
//     selYear = widget.selYear;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField(
//       decoration: InputDecoration(
//         fillColor: Theme.of(context).colorScheme.surface,
//         filled: true,
//         labelStyle: const TextStyle(),
//         enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(
//                 color: Theme.of(context).colorScheme.outline, width: 1.0)),
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(
//                 color: Theme.of(context).colorScheme.secondary, width: 1.0)),
//         errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(
//                 color: Theme.of(context).colorScheme.error, width: 1.0)),
//         focusedErrorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(
//                 color: Theme.of(context).colorScheme.error, width: 1.0)),
//       ),
//       isExpanded: true,
//       hint: const Text('المرحلة الدراسية'),
//       value: selYear,
//       onChanged: (newValue) {
//         setState(() {
//           selYear = newValue.toString();
//         });
//       },
//       items: _year.map((year) {
//         return DropdownMenuItem(
//           enabled: widget.edit ?? true,
//           value: year,
//           child: Text(year),
//         );
//       }).toList(),
//     );
//   }
// }

// class SelectYears extends StatefulWidget {
//   final String selYear;

//   const SelectYears({Key? key, required this.selYear}) : super(key: key);

//   @override
//   State<SelectYears> createState() => _SelectYearsState();
// }

// class _SelectYearsState extends State<SelectYears> {
//   late String selYear;
//   @override
//   void initState() {
//     super.initState();
//     selYear = widget.selYear;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField(
//       decoration: InputDecoration(
//         fillColor: Theme.of(context).colorScheme.surface,
//         filled: true,
//         labelStyle: const TextStyle(),
//         enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(
//                 color: Theme.of(context).colorScheme.outline, width: 1.0)),
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(
//                 color: Theme.of(context).colorScheme.secondary, width: 1.0)),
//         errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(
//                 color: Theme.of(context).colorScheme.error, width: 1.0)),
//         focusedErrorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(
//                 color: Theme.of(context).colorScheme.error, width: 1.0)),
//       ),
//       isExpanded: true,
//       hint: const Text('السنة الدراسية'),
//       value: selYear,
//       onChanged: (newValue) {
//         setState(() {
//           selYear = newValue.toString();
//         });
//       },
//       items: _years.map((years) {
//         return DropdownMenuItem(
//           value: years,
//           child: Text(years),
//         );
//       }).toList(),
//     );
//   }
// }

// class SelectRole extends StatefulWidget {
//   const SelectRole(
//       {super.key, required this.selRole, required this.onRoleChanged});
//   final String selRole;
//   final ValueChanged<String> onRoleChanged;
//   @override
//   State<SelectRole> createState() => _SelectRoleState();
// }

// class _SelectRoleState extends State<SelectRole> {
//   late String selRole;
//   @override
//   void initState() {
//     super.initState();
//     selRole = widget.selRole;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField(
//       decoration: InputDecoration(
//         fillColor: Theme.of(context).colorScheme.surface,
//         filled: true,
//         labelStyle: const TextStyle(),
//         enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(
//                 color: Theme.of(context).colorScheme.outline, width: 1.0)),
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(
//                 color: Theme.of(context).colorScheme.secondary, width: 1.0)),
//         errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(
//                 color: Theme.of(context).colorScheme.error, width: 1.0)),
//         focusedErrorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(
//                 color: Theme.of(context).colorScheme.error, width: 1.0)),
//       ),
//       isExpanded: true,
//       hint: const Text('الصلاحيات'),
//       value: selRole,
//       onChanged: (newValue) {
//         setState(() {
//           debugPrint(newValue);
//           selRole = newValue.toString();
//           widget.onRoleChanged(selRole);
//         });
//       },
//       items: _role.map((role) {
//         return DropdownMenuItem(
//           value: role,
//           child: Text(role),
//         );
//       }).toList(),
//     );
//   }
// }
