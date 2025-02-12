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
    Future.delayed(Duration(seconds: 1), showTutorial);
  }

  void showTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      targets: _buildTutorialTargets(),
      colorShadow: Colors.black87,
      textStyleSkip: TextStyle(color: Colors.white, fontSize: 18),
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
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: Text(
              "This image provides important information about subsidies. Make sure to read it carefully.",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
      TargetFocus(
        identify: "Register Button",
        keyTarget: _registerButtonKey,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: Text(
              "Click here to register or log in to access subsidy details.",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
      TargetFocus(
        identify: "Next Simulation",
        keyTarget: _nextButtonKey,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: Text(
              "Click here to go to the next subsidy simulation step.",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Subsidy Simulation 1')),
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
                  child: const Text('Go to Registration/Login'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  key: _nextButtonKey,
                  onPressed: () {
                    Navigator.pushNamed(context, '/subsidy2');
                  },
                  child: const Text('Go to Subsidy Simulation 2'),
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