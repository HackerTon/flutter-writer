import 'package:flutter/material.dart';
import 'package:writer/main.dart';
import 'package:writer/api/commonapi.dart';
import 'package:dio/dio.dart';
import 'package:writer/model/cat_api.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String img =
      "https://docs.flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png";
  final information = [
    {
      'datetime': 'Sunday Dec 19, 2021',
      'records': <String>['Rheanna Level 0 Bettle assembling']
    },
    {
      'datetime': 'Monday Dec 19, 2021',
      'records': <String>['Rheanna Level 0 Bettle assembling']
    },
    {
      'datetime': 'Monday Dec 19, 2021',
      'records': <String>['Rheanna Level 0 Bettle assembling']
    },
    {
      'datetime': 'Monday Dec 19, 2021',
      'records': <String>['Rheanna Level 0 Bettle assembling']
    },
    {
      'datetime': 'Monday Dec 19, 2021',
      'records': <String>['Rheanna Level 0 Bettle assembling']
    },
    {
      'datetime': 'Monday Dec 19, 2021',
      'records': <String>['Rheanna Level 0 Bettle assembling']
    },
    {
      'datetime': 'Monday Dec 19, 2021',
      'records': <String>['Rheanna Level 0 Bettle assembling']
    },
  ];
  Cat? catFact;

  @override
  void initState() {
    super.initState();
    _callapi();
  }

  void _callapi() {
    final dio = Dio();
    // dio.options.headers['Demo-Header'] = 'demo header';
    final client = RestClient(dio);

    // set state
    client.getCatFact().then((value) {
      setState(() {
        catFact = value;
      });
    });
  }

  void _goReportPage(context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return ReportPage(
          img: img,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(AppLocalizations.of(context)?.helloWorld ?? 'hello')),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: information.length,
              itemBuilder: (context, index) {
                final datetime = information[index]['datetime'];
                final records = information[index]['records'] as List<String>;

                return CustomBox(datetime.toString(), records);
              }),
          Container(
            alignment: Alignment.center,
            child: Text(catFact?.fact ?? 'nothing'),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _goReportPage(context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CustomBox extends StatelessWidget {
  final String datetime;
  final List<String> records;
  final TextStyle _textBold =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 23);
  final String img =
      "https://docs.flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png";

  const CustomBox(this.datetime, this.records, {Key? key}) : super(key: key);

  void _goReportPage(context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return ReportPage(
          img: img,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _goReportPage(context),
      child: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Text(
              datetime,
              style: _textBold,
            ),
          ),
          ...records
              .asMap()
              .entries
              .map((entry) => Text("${entry.key + 1}. ${entry.value}"))
        ]),
      ),
    );
  }
}
