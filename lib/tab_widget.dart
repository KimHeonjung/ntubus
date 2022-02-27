import 'dart:html';
import 'package:flutter/material.dart';
import 'package:bus_2/main.dart';

// class PanelWidget extends StatelessWidget {
//   final ScrollController controller;

//   const PanelWidget({
//     Key? key,
//     required this.controller,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) => ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           SizedBox(height: 12),
//           BusButtons(),
//           buildAboutText(),
//           SizedBox(height: 100),
//         ],
//       );

//   Widget BusButtons() => Container(
//         padding: EdgeInsets.symmetric(horizontal: 10),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             FloatingActionButton.extended(
//               onPressed: () {},
//               label: Text('Red'),
//               backgroundColor: Colors.red,
//             ),
//             SizedBox(width: 10),
//             FloatingActionButton.extended(
//               onPressed: () {},
//               label: Text('Blue'),
//               backgroundColor: Colors.blue,
//             ),
//             SizedBox(width: 10),
//             FloatingActionButton.extended(
//               onPressed: () {},
//               label: Text('Green'),
//               backgroundColor: Colors.green,
//             ),
//             SizedBox(width: 10),
//             FloatingActionButton.extended(
//               onPressed: () {},
//               label: Text('Brown'),
//               backgroundColor: Colors.brown,
//             ),
//           ],
//         ),
//       );
//   Widget buildAboutText() => Container(
//         padding: EdgeInsets.symmetric(horizontal: 24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               'Bus Type',
//               style: TextStyle(fontWeight: FontWeight.w600),
//             ),
//             SizedBox(height: 12),
//           ],
//         ),
//       );
// }
