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
// import 'package:bus_2/routelist.dart';

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
        panelBuilder: (controller) => PanelWidget(
          controller: controller,
        ),
      ),
    );
  }

  Widget getMap() {
    String htmlId = "map";
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final myLatlng = new LatLng(1.3483, 103.6831);

      final mapOptions = new MapOptions()
        ..center = new LatLng(1.3445, 103.6830)
        ..zoom = 15;

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';

      final map = new GMap(elem, mapOptions);

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

      final red_e_polyline = Polyline(PolylineOptions()
        ..path = [
          // LatLng(1.347724, 103.686542),
          // LatLng(1.348148, 103.6865732),
          // LatLng(1.348488, 103.686501),
          // LatLng(1.348628, 103.686375),
          // LatLng(1.348751, 103.686217),
          // LatLng(1.348837, 103.685956),
          // LatLng(1.348925, 103.685605),
          // LatLng(1.349169, 103.685297),
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

      // Marker(MarkerOptions()
      //   ..position = myLatlng
      //   ..map = map
      //   ..title = 'Hello World!');

      red_e_polyline.map = map;

      return elem;
    });

    return HtmlElementView(viewType: htmlId);
  }
}
