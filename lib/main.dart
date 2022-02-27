import 'package:bus_2/tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart' hide Icon;
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:bus_2/routelist.dart';
import 'package:dio/dio.dart';

Future<String> getBusInfo() async {
  var response =
      await Dio().get('https://powerful-cove-99519.herokuapp.com/businfo');
  return response.toString();
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'NTU BUS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _textFromFile = "";

  _MyHomePageState() {
    getBusInfo().then((val) => setState(() {
          _textFromFile = val;
        }));
  }

  @override
  Widget build(BuildContext context) {
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.15;
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: SlidingUpPanel(
            minHeight: panelHeightClosed,
            body: Container(
              child: getMap(),
            ),
            panelBuilder: (controller) => PanelWidget(controller: controller)));

    // SingleChildScrollView(
    //         padding: EdgeInsets.all(8.0), child: Text(_textFromFile))),

    // body: Column(children: [
    //   Container(child: getMap()),
    //   SingleChildScrollView(
    //       padding: EdgeInsets.all(8.0), child: Text(_textFromFile))
    // ]),
    // panelBuilder: (controller) => PanelWidget(
    //   controller: controller,
    //     ),
    //   ),
  }

  Widget getMap() {
    String htmlId = "map";
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final myLatlng = new LatLng(1.3483, 103.6831);

      final mapOptions = new MapOptions()
        ..center = new LatLng(1.3474, 103.6830)
        ..zoom = 15;

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "80%"
        ..style.border = 'none';

      final map = new GMap(elem, mapOptions);

      //get bus route
      //red bus
      final redpolyline = Polyline(PolylineOptions()
        ..path = [
          LatLng(1.347724, 103.686542),
          LatLng(1.348148, 103.6865732),
          LatLng(1.348488, 103.686501),
          LatLng(1.348628, 103.686375),
          LatLng(1.348751, 103.686217),
          LatLng(1.348837, 103.685956),
          LatLng(1.348925, 103.685605),
          LatLng(1.349169, 103.685297),
          LatLng(1.349319, 103.685162),
          LatLng(1.349582, 103.685023),
          LatLng(1.349944, 103.685409),
          LatLng(1.350253, 103.685616),
          LatLng(1.350446, 103.685729),
          LatLng(1.350711, 103.685777),
          LatLng(1.351519, 103.685782),
          LatLng(1.352013, 103.685797),
          LatLng(1.352422, 103.685911),
          LatLng(1.353789, 103.686630),
          LatLng(1.354253, 103.686934),
          LatLng(1.354812, 103.687399),
          LatLng(1.355261, 103.687963),
          LatLng(1.355486, 103.687838),
          LatLng(1.355600, 103.687623),
          LatLng(1.355730, 103.687389),
          LatLng(1.355915, 103.687029),
          LatLng(1.355995, 103.686640),
          LatLng(1.355975, 103.686186),
          LatLng(1.355925, 103.685881),
          LatLng(1.355541, 103.685113),
          LatLng(1.354598, 103.683685),
          LatLng(1.354084, 103.682947),
          LatLng(1.353176, 103.681739),
          LatLng(1.353081, 103.681619),
          LatLng(1.352751, 103.681230),
          LatLng(1.351045, 103.679683),
          LatLng(1.351035, 103.679693),
          LatLng(1.350836, 103.680017),
          LatLng(1.350606, 103.680357),
          LatLng(1.350451, 103.680561),
          LatLng(1.349977, 103.680947),
          LatLng(1.349564, 103.681253),
          LatLng(1.349301, 103.681516),
          LatLng(1.349081, 103.681741),
          LatLng(1.348866, 103.681928),
          LatLng(1.348533, 103.681401),
          LatLng(1.347579, 103.679727),
          LatLng(1.347246, 103.679094),
          LatLng(1.347117, 103.678361),
          LatLng(1.346451, 103.678414),
          LatLng(1.345153, 103.678423),
          LatLng(1.345035, 103.678450),
          LatLng(1.344350, 103.678724),
          LatLng(1.343874, 103.678901),
          LatLng(1.343698, 103.678963),
          LatLng(1.342316, 103.679133),
          LatLng(1.342007, 103.679153),
          LatLng(1.341368, 103.679108),
          LatLng(1.340855, 103.679103),
          LatLng(1.340899, 103.679088),
          LatLng(1.340659, 103.679195),
          LatLng(1.340018, 103.679886),
          LatLng(1.339948, 103.680002),
          LatLng(1.339890, 103.681082),
          LatLng(1.339931, 103.681479),
          LatLng(1.340076, 103.682116),
          LatLng(1.340353, 103.682703),
          LatLng(1.340829, 103.683372),
          LatLng(1.341407, 103.684076),
          LatLng(1.343465, 103.686581),
          LatLng(1.343754, 103.686967),
          LatLng(1.344007, 103.687400),
          LatLng(1.344254, 103.687689),
          LatLng(1.344706, 103.688213),
          LatLng(1.345007, 103.688255),
          LatLng(1.345575, 103.687871),
          LatLng(1.346211, 103.687401),
          LatLng(1.346744, 103.686743),
          LatLng(1.346987, 103.686563),
          LatLng(1.347276, 103.686521),
          LatLng(1.347724, 103.686542),
        ]
        ..geodesic = true
        ..strokeColor = "#BB0A1E"
        ..strokeOpacity = 1.0
        ..strokeWeight = 4);

      //blue bus
      final bluepolyline = Polyline(PolylineOptions()
        ..path = [
          LatLng(1.347724, 103.686542),
          LatLng(1.348148, 103.6865732),
          LatLng(1.348488, 103.686501),
          LatLng(1.348628, 103.686375),
          LatLng(1.348751, 103.686217),
          LatLng(1.348837, 103.685956),
          LatLng(1.348925, 103.685605),
          LatLng(1.349169, 103.685297),
          LatLng(1.349319, 103.685162),
          LatLng(1.349582, 103.685023),
          LatLng(1.349944, 103.685409),
          LatLng(1.350253, 103.685616),
          LatLng(1.350446, 103.685729),
          LatLng(1.350711, 103.685777),
          LatLng(1.351519, 103.685782),
          LatLng(1.352013, 103.685797),
          LatLng(1.352422, 103.685911),
          LatLng(1.353789, 103.686630),
          LatLng(1.354253, 103.686934),
          LatLng(1.354812, 103.687399),
          LatLng(1.355261, 103.687963),
          LatLng(1.355486, 103.687838),
          LatLng(1.355600, 103.687623),
          LatLng(1.355730, 103.687389),
          LatLng(1.355915, 103.687029),
          LatLng(1.355995, 103.686640),
          LatLng(1.355975, 103.686186),
          LatLng(1.355925, 103.685881),
          LatLng(1.355541, 103.685113),
          LatLng(1.354598, 103.683685),
          LatLng(1.354084, 103.682947),
          LatLng(1.353176, 103.681739),
          LatLng(1.353081, 103.681619),
          LatLng(1.352751, 103.681230),
          LatLng(1.351045, 103.679683),
          LatLng(1.351035, 103.679693),
          LatLng(1.350836, 103.680017),
          LatLng(1.350606, 103.680357),
          LatLng(1.350451, 103.680561),
          LatLng(1.349977, 103.680947),
          LatLng(1.349564, 103.681253),
          LatLng(1.349301, 103.681516),
          LatLng(1.349081, 103.681741),
          LatLng(1.348866, 103.681928),
          LatLng(1.348533, 103.681401),
          LatLng(1.347579, 103.679727),
          LatLng(1.347246, 103.679094),
          LatLng(1.347117, 103.678361),
          LatLng(1.346451, 103.678414),
          LatLng(1.345153, 103.678423),
          LatLng(1.345035, 103.678450),
          LatLng(1.344350, 103.678724),
          LatLng(1.343874, 103.678901),
          LatLng(1.343698, 103.678963),
          LatLng(1.342316, 103.679133),
          LatLng(1.342007, 103.679153),
          LatLng(1.341368, 103.679108),
          LatLng(1.341316, 103.679922),
          LatLng(1.341402, 103.680159),
          LatLng(1.342115, 103.680851),
          LatLng(1.342123, 103.680881),
          LatLng(1.341699, 103.681356),
          LatLng(1.341447, 103.681683),
          LatLng(1.341368, 103.681836),
          LatLng(1.341207, 103.681794),
          LatLng(1.341124, 103.681799),
          LatLng(1.341044, 103.681826),
          LatLng(1.340924, 103.681890),
          LatLng(1.340848, 103.681946),
          LatLng(1.340730, 103.682124),
          LatLng(1.340573, 103.682476),
          LatLng(1.340517, 103.682577),
          LatLng(1.340445, 103.682659),
          LatLng(1.340362, 103.682722),
          LatLng(1.340829, 103.683372),
          LatLng(1.341407, 103.684076),
          LatLng(1.343465, 103.686581),
          LatLng(1.343754, 103.686967),
          LatLng(1.344007, 103.687400),
          LatLng(1.344254, 103.687689),
          LatLng(1.344706, 103.688213),
          LatLng(1.345007, 103.688255),
          LatLng(1.345575, 103.687871),
          LatLng(1.346211, 103.687401),
          LatLng(1.346744, 103.686743),
          LatLng(1.346987, 103.686563),
          LatLng(1.347276, 103.686521),
          LatLng(1.347724, 103.686542),
        ]
        ..geodesic = true
        ..strokeColor = "#0041C2"
        ..strokeOpacity = 1.0
        ..strokeWeight = 4);

      //red express
      final red_e_polyline = Polyline(PolylineOptions()
        ..path = [
          LatLng(1.349582, 103.685023),
          LatLng(1.349944, 103.685409),
          LatLng(1.350253, 103.685616),
          LatLng(1.350446, 103.685729),
          LatLng(1.350711, 103.685777),
          LatLng(1.351519, 103.685782),
          LatLng(1.352013, 103.685797),
          LatLng(1.352422, 103.685911),
          LatLng(1.353789, 103.686630),
          LatLng(1.354253, 103.686934),
          LatLng(1.354812, 103.687399),
          LatLng(1.355261, 103.687963),
          LatLng(1.355486, 103.687838),
          LatLng(1.355600, 103.687623),
          LatLng(1.355730, 103.687389),
          LatLng(1.355915, 103.687029),
          LatLng(1.355995, 103.686640),
          LatLng(1.355975, 103.686186),
          LatLng(1.355925, 103.685881),
          LatLng(1.355541, 103.685113),
          LatLng(1.354598, 103.683685),
          LatLng(1.354084, 103.682947),
          LatLng(1.353176, 103.681739),
          LatLng(1.353081, 103.681619),
          LatLng(1.352751, 103.681230),
          LatLng(1.351045, 103.679683),
          LatLng(1.351035, 103.679693),
          LatLng(1.350836, 103.680017),
          LatLng(1.350606, 103.680357),
          LatLng(1.350451, 103.680561),
          LatLng(1.349977, 103.680947),
          LatLng(1.349564, 103.681253),
          LatLng(1.349301, 103.681516),
          LatLng(1.349081, 103.681741),
          LatLng(1.348866, 103.681928),
          LatLng(1.348533, 103.681401),
          LatLng(1.348002, 103.680457),
          LatLng(1.348533, 103.681401),
          LatLng(1.348866, 103.681928),
          LatLng(1.349751, 103.683476),
          LatLng(1.350011, 103.684055),
          LatLng(1.350028, 103.684248),
          LatLng(1.349969, 103.684509),
          LatLng(1.349582, 103.685023),
        ]
        ..geodesic = true
        ..strokeColor = "#BB0A1E"
        ..strokeOpacity = 1.0
        ..strokeWeight = 4);

      //blue express
      final blue_e_polyline = Polyline(PolylineOptions()
        ..path = [
          LatLng(1.348000, 103.680500),
          LatLng(1.348595, 103.681507),
          LatLng(1.348849, 103.681921),
          LatLng(1.349722, 103.683478),
          LatLng(1.349964, 103.683859),
          LatLng(1.350020, 103.684173),
          LatLng(1.349976, 103.684461),
          LatLng(1.349584, 103.685018),
          LatLng(1.349976, 103.685427),
          LatLng(1.350439, 103.685725),
          LatLng(1.351179, 103.685764),
          LatLng(1.351880, 103.685780),
          LatLng(1.352222, 103.685841),
          LatLng(1.352454, 103.685935),
          LatLng(1.353829, 103.686664),
          //
          LatLng(1.354314, 103.686945),
          LatLng(1.353829, 103.686664),
          LatLng(1.352454, 103.685935),
          LatLng(1.352222, 103.685841),
          LatLng(1.351880, 103.685780),
          LatLng(1.351179, 103.685764),
          LatLng(1.350439, 103.685725),
          LatLng(1.349976, 103.685427),
          LatLng(1.349584, 103.685018),
          //
          LatLng(1.349287, 103.685200),
          LatLng(1.348995, 103.685476),
          LatLng(1.348840, 103.685984),
          LatLng(1.348724, 103.686260),
          LatLng(1.348608, 103.686404),
          LatLng(1.348487, 103.686498),
          LatLng(1.348117, 103.686570),
          LatLng(1.347316, 103.686531),
          LatLng(1.346958, 103.686581),
          LatLng(1.346814, 103.686680),
          LatLng(1.346410, 103.687148),
          LatLng(1.346233, 103.687390),
          LatLng(1.345026, 103.688262),
          LatLng(1.344690, 103.688204),
          LatLng(1.344315, 103.687725),
          LatLng(1.344011, 103.687376),
          LatLng(1.343461, 103.686580),
          LatLng(1.341597, 103.684328)
        ]
        ..geodesic = true
        ..strokeColor = "#0041C2"
        ..strokeOpacity = 1.0
        ..strokeWeight = 4);

      void redbus() {
        redpolyline.map = map;

        final BusStopIcon =
            Icon(Icons.square_rounded, color: Colors.black, size: 30.0);

        final Set<Marker> redmarkers = new Set();

        redmarkers.add(Marker(MarkerOptions()
          ..position = LatLng(1.349064853547057, 103.6853984081654)
          ..map = map
          ..title = 'Hall 2,  Canteen 2'));

        redmarkers.add(Marker(MarkerOptions()
          ..position = LatLng(1.3477616609435055, 103.68651420713161)
          ..map = map
          ..title = 'Hall 2, Opp Hall 6'));

        redmarkers.add(Marker(MarkerOptions()
          ..position = LatLng(1.3456501981368578, 103.6877476934832)
          ..map = map
          ..title = 'Hall 1'));

        redmarkers.add(Marker(MarkerOptions()
          ..position = LatLng(1.3441746909393444, 103.68754227086998)
          ..map = map
          ..title = 'Hall 4 & 5'));

        redmarkers.add(Marker(MarkerOptions()
          ..position = LatLng(1.3416547922987085, 103.6842841234978)
          ..map = map
          ..title = 'Yunnan Garden'));

        redmarkers.add(Marker(MarkerOptions()
          ..position = LatLng(1.3402781778936885, 103.6817645969678)
          ..map = map
          ..title = 'Opp. SPMS'));

        redmarkers.add(Marker(MarkerOptions()
          ..position = LatLng(1.342101580353032, 103.67926608129234)
          ..map = map
          ..title = 'WKWSCI, EEE'));

        redmarkers.add(Marker(MarkerOptions()
          ..position = LatLng(1.3423375499787011, 103.67925088644385)
          ..map = map
          ..title = 'SBS, Opp. LKCSOM'));

        redmarkers.add(Marker(MarkerOptions()
          ..position = LatLng(1.3481778767403785, 103.68030203715091)
          ..map = map
          ..title = 'Lee Wee Nam Lib'));

        redmarkers.add(Marker(MarkerOptions()
          ..position = LatLng(1.3520178455918637, 103.68060357011329)
          ..map = map
          ..title = 'Hall 12 & 13'));

        redmarkers.add(Marker(MarkerOptions()
          ..position = LatLng(1.3552062386582817, 103.68452729337072)
          ..map = map
          ..title = 'Hall 7 & Saraca'));

        redmarkers.add(Marker(MarkerOptions()
          ..position = LatLng(1.3559756503677778, 103.68613237094836)
          ..map = map
          ..title = 'Grad Hall 1 & 2 '));

        redmarkers.add(Marker(MarkerOptions()
          ..position = LatLng(1.3543457121335314, 103.68687161806753)
          ..map = map
          ..title = 'Hall 10 & 11'));

        redmarkers.add(Marker(MarkerOptions()
          ..position = LatLng(1.3515182028743289, 103.68568147028408)
          ..map = map
          ..title = 'Hall 8'));
      }

      void bluebus() {
        bluepolyline.map = map;

        final BusStopIcon =
            Icon(Icons.square_rounded, color: Colors.black, size: 30.0);

        final Set<Marker> bluemarkers = new Set();

        bluemarkers.add(Marker(MarkerOptions()
          ..position = LatLng(1.3471628118101884, 103.68661508230949)
          ..map = map
          ..title = 'Hall 6'
          ..icon = BusStopIcon));

        bluemarkers.add(Marker(MarkerOptions()
          ..position = LatLng(1.3436876712347094, 103.68688998639655)
          ..map = map
          ..title = 'Opp. Hall 4 & 5'
          ..icon = BusStopIcon));

        bluemarkers.add(Marker(MarkerOptions()
          ..position = LatLng(1.3418354965848212, 103.68468060227495)
          ..map = map
          ..title = 'Opp. Yunnan Garden '));

        bluemarkers.add(Marker(MarkerOptions()
          ..position = LatLng(1.3418351392261318, 103.6810031176938)
          ..map = map
          ..title = 'Opp. SPMS'));

        bluemarkers.add(Marker(MarkerOptions()
          ..position = LatLng(1.341860542085121, 103.67903968419424)
          ..map = map
          ..title = 'Opp. WKKWSCI'));

        bluemarkers.add(Marker(MarkerOptions()
          ..position = LatLng(1.3459768309492703, 103.67836459026944)
          ..map = map
          ..title = 'Opp. CEE'));

        bluemarkers.add(Marker(MarkerOptions()
          ..position = LatLng(1.3482857200855363, 103.68027616083977)
          ..map = map
          ..title = 'NIE, Opp. LWN Lib.'));

        bluemarkers.add(Marker(MarkerOptions()
          ..position = LatLng(1.3506557900186384, 103.68027336430929)
          ..map = map
          ..title = 'Opp. Hall 3 & 12'));

        bluemarkers.add(Marker(MarkerOptions()
          ..position = LatLng(1.3532450354538075, 103.6817511460188)
          ..map = map
          ..title = 'Opp. Hall 14 & 15'));

        bluemarkers.add(Marker(MarkerOptions()
          ..position = LatLng(1.3551571510383482, 103.68445271573061)
          ..map = map
          ..title = 'Opp. Hall 7 & Saraca'));

        bluemarkers.add(Marker(MarkerOptions()
          ..position = LatLng(1.3546164292552554, 103.6872404655602)
          ..map = map
          ..title = 'North Hill Halls'));

        bluemarkers.add(Marker(MarkerOptions()
          ..position = LatLng(1.351252443041732, 103.68579245703778)
          ..map = map
          ..title = 'Nanyang Heights'));
      }

      redbus();
      //bluebus();
      return elem;
    });
    return HtmlElementView(viewType: htmlId);
  }
}

class PanelWidget extends StatelessWidget {
  final ScrollController controller;

  const PanelWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(height: 12),
          BusButtons(),
          buildAboutText(),
          SizedBox(height: 100),
        ],
      );

  Widget BusButtons() => Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FloatingActionButton.extended(
              onPressed: () {},
              label: Text('Red'),
              backgroundColor: Colors.red,
            ),
            SizedBox(width: 10),
            FloatingActionButton.extended(
              onPressed: () {},
              label: Text('Blue'),
              backgroundColor: Colors.blue,
            ),
            SizedBox(width: 10),
            FloatingActionButton.extended(
              onPressed: () {},
              label: Text('Green'),
              backgroundColor: Colors.green,
            ),
            SizedBox(width: 10),
            FloatingActionButton.extended(
              onPressed: () {},
              label: Text('Brown'),
              backgroundColor: Colors.brown,
            ),
          ],
        ),
      );
  Widget buildAboutText() => Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Bus Type',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12),
          ],
        ),
      );
}
