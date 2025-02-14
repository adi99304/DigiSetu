// // import 'package:flutter/material.dart';
// // import 'package:url_launcher/url_launcher.dart';
// // import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
// //
// // class SubsidySimulation extends StatefulWidget {
// //   const SubsidySimulation({super.key});
// //
// //   @override
// //   State<SubsidySimulation> createState() => _SubsidySimulationState();
// // }
// //
// // class _SubsidySimulationState extends State<SubsidySimulation> {
// //   late TutorialCoachMark tutorialCoachMark;
// //   final GlobalKey _imageKey = GlobalKey();
// //   final GlobalKey _registerButtonKey = GlobalKey();
// //   final GlobalKey _nextButtonKey = GlobalKey();
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     Future.delayed(Duration(seconds: 1), showTutorial);
// //   }
// //
// //   void showTutorial() {
// //     tutorialCoachMark = TutorialCoachMark(
// //       targets: _buildTutorialTargets(),
// //       colorShadow: Colors.black87,
// //       textStyleSkip: TextStyle(color: Colors.white, fontSize: 18),
// //       onFinish: () {
// //         debugPrint("Tutorial finished");
// //       },
// //     )..show(context: context);
// //   }
// //
// //   List<TargetFocus> _buildTutorialTargets() {
// //     return [
// //       TargetFocus(
// //         identify: "Image",
// //         keyTarget: _imageKey,
// //         contents: [
// //           TargetContent(
// //             align: ContentAlign.bottom,
// //             child: Text(
// //               "This image provides important information about subsidies. Make sure to read it carefully.",
// //               style: TextStyle(color: Colors.white, fontSize: 16),
// //             ),
// //           ),
// //         ],
// //       ),
// //       TargetFocus(
// //         identify: "Register Button",
// //         keyTarget: _registerButtonKey,
// //         contents: [
// //           TargetContent(
// //             align: ContentAlign.top,
// //             child: Text(
// //               "Click here to register or log in to access subsidy details.",
// //               style: TextStyle(color: Colors.white, fontSize: 16),
// //             ),
// //           ),
// //         ],
// //       ),
// //       TargetFocus(
// //         identify: "Next Simulation",
// //         keyTarget: _nextButtonKey,
// //         contents: [
// //           TargetContent(
// //             align: ContentAlign.top,
// //             child: Text(
// //               "Click here to go to the next subsidy simulation step.",
// //               style: TextStyle(color: Colors.white, fontSize: 16),
// //             ),
// //           ),
// //         ],
// //       ),
// //     ];
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Subsidy Simulation 1')),
// //       body: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Expanded(
// //             child: Center(
// //               child: Image.asset('assets/img.png', key: _imageKey, fit: BoxFit.cover),
// //             ),
// //           ),
// //           const SizedBox(height: 20),
// //           Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Column(
// //               children: [
// //                 ElevatedButton(
// //                   key: _registerButtonKey,
// //                   onPressed: _launchURL,
// //                   child: const Text('Go to Registration/Login'),
// //                 ),
// //                 const SizedBox(height: 20),
// //                 ElevatedButton(
// //                   key: _nextButtonKey,
// //                   onPressed: () {
// //                     Navigator.pushNamed(context, '/subsidy2');
// //                   },
// //                   child: const Text('Go to Subsidy Simulation 2'),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   void _launchURL() async {
// //     const url = 'https://mahadbt.maharashtra.gov.in/Farmer/RegistrationLogin/RegistrationLogin';
// //     if (await canLaunch(url)) {
// //       await launch(url);
// //     } else {
// //       throw 'Could not launch $url';
// //     }
// //   }
// // }
// //
// // void main() {
// //   runApp(MaterialApp(
// //     home: SubsidySimulation(),
// //   ));
// // }
//
//
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
//
// class SubsidySimulation extends StatefulWidget {
//   const SubsidySimulation({super.key});
//
//   @override
//   State<SubsidySimulation> createState() => _SubsidySimulationState();
// }
//
// class _SubsidySimulationState extends State<SubsidySimulation> {
//   late TutorialCoachMark tutorialCoachMark;
//   final GlobalKey _imageKey = GlobalKey();
//   final GlobalKey _registerButtonKey = GlobalKey();
//   final GlobalKey _nextButtonKey = GlobalKey();
//
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(seconds: 1), showTutorial);
//   }
//
//   void showTutorial() {
//     tutorialCoachMark = TutorialCoachMark(
//       targets: _buildTutorialTargets(),
//       colorShadow: Colors.black87,
//       textStyleSkip: TextStyle(color: Colors.white, fontSize: 18),
//       onFinish: () {
//         debugPrint("Tutorial finished");
//       },
//     )..show(context: context);
//   }
//
//   List<TargetFocus> _buildTutorialTargets() {
//     return [
//       TargetFocus(
//         identify: "Image",
//         keyTarget: _imageKey,
//         contents: [
//           TargetContent(
//             align: ContentAlign.bottom,
//             child: Text(
//               "This image provides important information about subsidies. Make sure to read it carefully.",
//               style: TextStyle(color: Colors.white, fontSize: 16),
//             ),
//           ),
//         ],
//       ),
//       TargetFocus(
//         identify: "Register Button",
//         keyTarget: _registerButtonKey,
//         contents: [
//           TargetContent(
//             align: ContentAlign.top,
//             child: Text(
//               "Click here to register or log in to access subsidy details.",
//               style: TextStyle(color: Colors.white, fontSize: 16),
//             ),
//           ),
//         ],
//       ),
//       TargetFocus(
//         identify: "Next Simulation",
//         keyTarget: _nextButtonKey,
//         contents: [
//           TargetContent(
//             align: ContentAlign.top,
//             child: Text(
//               "Click here to go to the next subsidy simulation step.",
//               style: TextStyle(color: Colors.white, fontSize: 16),
//             ),
//           ),
//         ],
//       ),
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Subsidy Simulation 1'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.blue),
//           onPressed: () {
//             Navigator.pushReplacementNamed(context, '/home');
//           },
//         ),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Center(
//               child: Image.asset('assets/img.png', key: _imageKey, fit: BoxFit.cover),
//             ),
//           ),
//           const SizedBox(height: 20),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 ElevatedButton(
//                   key: _registerButtonKey,
//                   onPressed: _launchURL,
//                   child: const Text('Go to Registration/Login'),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   key: _nextButtonKey,
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/subsidy2');
//                   },
//                   child: const Text('Go to Subsidy Simulation 2'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _launchURL() async {
//     const url = 'https://mahadbt.maharashtra.gov.in/Farmer/RegistrationLogin/RegistrationLogin';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: SubsidySimulation(),
//   ));
// }



import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class SubsidySimulation extends StatefulWidget {
  const SubsidySimulation({super.key});

  @override
  State<SubsidySimulation> createState() => _SubsidySimulationState();
}

class _SubsidySimulationState extends State<SubsidySimulation> {
  late TutorialCoachMark tutorialCoachMark;
  final GlobalKey _imageKey = GlobalKey();
  final GlobalKey _registerButtonKey = GlobalKey();
  final GlobalKey _nextButtonKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), showTutorial);
  }

  void showTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      targets: _buildTutorialTargets(),
      colorShadow: Colors.black.withOpacity(0.7), // Darker overlay for better visibility
      textStyleSkip: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      paddingFocus: 10, // Extra padding for focus elements
      opacityShadow: 0.8, // Makes everything except the target less visible
      onFinish: () {
        debugPrint("Tutorial finished");
      },
    )..show(context: context);
  }

  List<TargetFocus> _buildTutorialTargets() {
    return [
      TargetFocus(
        identify: "Image",
        keyTarget: _imageKey,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: Column(
              children: const [
                Icon(Icons.info_outline, color: Colors.white, size: 32),
                SizedBox(height: 10),
                Text(
                  "📜 This image contains important subsidy details. Please review it carefully.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
      TargetFocus(
        identify: "Register Button",
        keyTarget: _registerButtonKey,
        shape: ShapeLightFocus.RRect,
        radius: 10,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: Column(
              children: const [
                Icon(Icons.touch_app, color: Colors.yellow, size: 36),
                SizedBox(height: 10),
                Text(
                  "🔑 Click here to Register/Login to apply for subsidies.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
      TargetFocus(
        identify: "Next Simulation",
        keyTarget: _nextButtonKey,
        shape: ShapeLightFocus.RRect,
        radius: 10,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: Column(
              children: const [
                Icon(Icons.arrow_forward, color: Colors.greenAccent, size: 36),
                SizedBox(height: 10),
                Text(
                  "➡️ Click here to proceed to the next subsidy simulation step.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subsidy Simulation 1'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Image.asset('assets/img.png', key: _imageKey, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ElevatedButton(
                  key: _registerButtonKey,
                  onPressed: _launchURL,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Go to Registration/Login', style: TextStyle(fontSize: 16)),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  key: _nextButtonKey,
                  onPressed: () {
                    Navigator.pushNamed(context, '/subsidy2');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Go to Subsidy Simulation 2', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL() async {
    const url = 'https://mahadbt.maharashtra.gov.in/Farmer/RegistrationLogin/RegistrationLogin';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: SubsidySimulation(),
  ));
}
