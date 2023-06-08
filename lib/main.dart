import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart' as gauges;
import 'package:syncfusion_flutter_charts/charts.dart';


//import 'package:firebase_database/ui/firebase_animated_list.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure that Flutter is initialized
await Firebase.initializeApp(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color.fromARGB(255, 44, 116, 98); // ARGB values for the primary color

    final MaterialColor customPrimarySwatch = MaterialColor(
      primaryColor.value,
      <int, Color>{
        50: primaryColor.withOpacity(0.1),
        100: primaryColor.withOpacity(0.2),
        200: primaryColor.withOpacity(0.3),
        300: primaryColor.withOpacity(0.4),
        400: primaryColor.withOpacity(0.5),
        500: primaryColor.withOpacity(0.6),
        600: primaryColor.withOpacity(0.7),
        700: primaryColor.withOpacity(0.8),
        800: primaryColor.withOpacity(0.9),
        900: primaryColor.withOpacity(1.0),
      },
    );

    return MaterialApp(
      title: 'Smart Garden',
      theme: ThemeData(
        primarySwatch: customPrimarySwatch,
      ),
      home: const HomePage(title: 'Le Jardin intelligent'),
      routes: {
        '/temperature': (context) => const  TemperaturePage(),
        '/luminosity': (context) => const LuminosityPage(),
        '/moisture': (context) => const MoisturePage(),
        '/humidity': (context) => const HumidityPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 44, 116, 98),
              const Color.fromRGBO(40, 51, 27, 1)!
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 32),
            const SizedBox(height: 16),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/pngtree-vector-soil-plant-icon-png-image_1638737-transformed.png', // Replace with your image path
                        width: 200,
                        height:200,
                             // Optional: You can apply color to the image
                        ),
                      
                        // const SizedBox(height: 16),
                      //const Text(
                        //'Le jardin intelligent',
                        //style: TextStyle(
                         // color: Colors.white,
                         // fontSize: 42,
                         // fontWeight: FontWeight.bold,
          
                        //),
                      //),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/temperature'),
                        child: Container(
                          width: 400,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 185, 197, 194).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(26),
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.thermostat, color: Colors.white),
                              SizedBox(width: 5),
                              Text(
                                'Temperature',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/luminosity'),
                        child: Container(
                          width: 400,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 185, 197, 194).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(26),
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.wb_sunny, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                'Luminosity',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/moisture'),
                        child: Container(
                          width: 400,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 185, 197, 194).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(26),
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.water,color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                'Moisture',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/humidity'),
                        child: Container(
                          width: 400,
                          decoration: BoxDecoration(
                            color:  const Color.fromARGB(255, 185, 197, 194).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(26),
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.opacity, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                'Humidity',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                   
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TemperaturePageState createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
 final  DatabaseReference _databaseReference = FirebaseDatabase.instance.ref().child('data');


  double temperature = 0.0;
   List<DataPoint> chartData = [];

  @override
  void initState() {
    super.initState();
    _databaseReference.onChildAdded.listen((event) {
      Map<String, dynamic> snapshotValue =
          Map<String, dynamic>.from(event.snapshot.value as Map);
      String temperature = snapshotValue['temperature'].toString();
      String timestamp = snapshotValue['timestamp'].toString();
      final DateTime dateTime = DateTime.parse(timestamp);
      final dataPoint = DataPoint(dateTime, double.parse(temperature));
      setState(() {
        chartData.add(dataPoint);
      });
    });
  }

  @override
  void dispose() {
    _databaseReference.onChildAdded.drain();
    super.dispose();
  }
    
 @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Temperature'),
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0), // Adjust the spacing here
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 8.0), // Adjust the spacing here
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Temperature Value',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color:Color.fromARGB(255, 44, 116, 98)
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: gauges.SfRadialGauge(
                          axes: <gauges.RadialAxis>[
                   gauges. RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    showLabels: false,
                    showTicks: false,
                    axisLineStyle:  const gauges.AxisLineStyle(
                      thickness: 0.2,
                      cornerStyle: gauges.CornerStyle.bothCurve,
                      color: Color.fromARGB(255, 214, 241, 234),
                      thicknessUnit: gauges.GaugeSizeUnit.factor,
                    ),
                    pointers: <gauges.GaugePointer>[
                      gauges.RangePointer(
                         value: chartData.isNotEmpty
                                ? chartData.last.temperature
                                : 0,
                        width: 0.2,
                        color: const Color.fromARGB(255, 44, 116, 98),
                        pointerOffset: 0.1,
                        sizeUnit: gauges.GaugeSizeUnit.factor,
                      ),
                    ],
                    annotations: <gauges.GaugeAnnotation>[
                      gauges.GaugeAnnotation(
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                               '${chartData.isNotEmpty ? chartData.last.temperature : 0}°C',
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:Color.fromARGB(255, 44, 116, 98) ),
                            ),
                          ],
                        ),
                        angle: 90,
                        positionFactor: 0.5,
                      ),
                    ],
                  
              ),
            
          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 16.0), // Adjust the spacing here
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Temperature Chart',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color:Color.fromARGB(255, 44, 116, 98)
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(8),
                       child: SfCartesianChart(
                         zoomPanBehavior: ZoomPanBehavior(
                            enablePinching: true, // Enable pinch zooming
                            enableDoubleTapZooming: true,
                            enableSelectionZooming: true,
                            selectionRectBorderColor:const Color.fromARGB(255, 44, 116, 98),
                            selectionRectBorderWidth: 1,
                            selectionRectColor: const Color.fromARGB(255, 214, 241, 234) // Enable double-tap zooming
                         ),  
                          primaryXAxis: DateTimeAxis(),
                          series: <LineSeries<DataPoint, DateTime>>[
                             LineSeries<DataPoint, DateTime>(
                              dataSource: chartData,
                              xValueMapper: (data, _) => data.timestamp,
                              yValueMapper: (data, _) => data.temperature,
                              color:const Color.fromARGB(255, 44, 116, 98)
                            ),
                          ],
                        ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

}

class DataPoint {
  final DateTime timestamp;
  final double temperature;

  DataPoint(this.timestamp, this.temperature);
}
class LuminosityPage extends StatefulWidget {
  const LuminosityPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LuminosityPageState createState() => _LuminosityPageState();
}
class _LuminosityPageState extends State<LuminosityPage>{
final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref().child('data');
  double lightSensor = 0.0;
  List<DataPoint3> chartData = [];

   @override
  void initState() {
    super.initState();
    _databaseReference.onChildAdded.listen((event) {
      Map<String, dynamic> snapshotValue =
          Map<String, dynamic>.from(event.snapshot.value as Map);
      String lightSensor = snapshotValue['lightSensor'].toString();
      String timestamp = snapshotValue['timestamp'].toString();
      final DateTime dateTime = DateTime.parse(timestamp);
      final dataPoint = DataPoint3(dateTime, double.parse(lightSensor));
      setState(() {
        chartData.add(dataPoint);
      });
    });
  }
   @override
  void dispose() {
    _databaseReference.onChildAdded.drain();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Luminosity'),
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0), // Adjust the spacing here
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 8.0), // Adjust the spacing here
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Luminosity Value',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color:Color.fromARGB(255, 44, 116, 98)
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: gauges.SfRadialGauge(
                          axes: <gauges.RadialAxis>[
                   gauges. RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    showLabels: false,
                    showTicks: false,
                     startAngle: 0, // Set the start angle to 0 degrees
                    endAngle: 360, 
                    axisLineStyle:  const gauges.AxisLineStyle(
                      thickness: 0.1,
                      cornerStyle: gauges.CornerStyle.bothCurve,
                      color: Color.fromARGB(255, 214, 241, 234),
                      thicknessUnit: gauges.GaugeSizeUnit.factor,
                    ),
                    pointers: <gauges.GaugePointer>[
                      gauges.RangePointer(
                         value: chartData.isNotEmpty
                                ? double.parse(chartData.last.lightSensor.toStringAsFixed(2))
                                : 0.0,
                        width: 0.1,
                        color: const Color.fromARGB(255, 44, 116, 98),
                        pointerOffset: 0.1,
                        sizeUnit: gauges.GaugeSizeUnit.factor,
                      ),
                    ],
                    annotations: <gauges.GaugeAnnotation>[
                      gauges.GaugeAnnotation(
                        widget: Center(
                           child: Text(
                              '${chartData.isNotEmpty ? double.parse(chartData.last.lightSensor.toStringAsFixed(2)): 0.0}%',
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:Color.fromARGB(255, 44, 116, 98) ),
                            ),
                          
                        ),
                        //angle: 90,
                        positionFactor: 0.1,
                      ),
                    ],
                  
              ),
            
          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 16.0), // Adjust the spacing here
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Luminosity Chart',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color:Color.fromARGB(255, 44, 116, 98)
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(8),
                       child: SfCartesianChart(
                        zoomPanBehavior: ZoomPanBehavior(
                            enablePinching: true, // Enable pinch zooming
                            enableDoubleTapZooming: true,
                            enableSelectionZooming: true,
                            selectionRectBorderColor:const Color.fromARGB(255, 44, 116, 98),
                            selectionRectBorderWidth: 1,
                            selectionRectColor: const Color.fromARGB(255, 214, 241, 234) // Enable double-tap zooming
                         ),    
                          primaryXAxis: DateTimeAxis(),
                          series: <LineSeries<DataPoint3, DateTime>>[
                             LineSeries<DataPoint3, DateTime>(
                              dataSource: chartData,
                              xValueMapper: (data, _) => data.timestamp,
                              yValueMapper: (data, _) => data.lightSensor,
                              color:const Color.fromARGB(255, 44, 116, 98)
                            ),
                          ],
                        ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}
class DataPoint3 {
  final DateTime timestamp;
  final double lightSensor;

  DataPoint3(this.timestamp, this.lightSensor);
}

class MoisturePage extends StatefulWidget {
  const MoisturePage({Key? key}) : super(key: key);

  @override
   // ignore: library_private_types_in_public_api
 _MoisturePageState createState() => _MoisturePageState();
}
class _MoisturePageState extends State<MoisturePage> {
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref().child('data');
  double moisture = 0.0;
  List<DataPoint2> chartData = [];

   @override
  void initState() {
    super.initState();
    _databaseReference.onChildAdded.listen((event) {
      Map<String, dynamic> snapshotValue =
          Map<String, dynamic>.from(event.snapshot.value as Map);
      String moisture = snapshotValue['soilMoisture'].toString();
      String timestamp = snapshotValue['timestamp'].toString();
      final DateTime dateTime = DateTime.parse(timestamp);
      final dataPoint = DataPoint2(dateTime, double.parse(moisture));
      setState(() {
        chartData.add(dataPoint);
      });
    });
  }
   @override
  void dispose() {
    _databaseReference.onChildAdded.drain();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Moisture'),
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0), // Adjust the spacing here
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 8.0), // Adjust the spacing here
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Soil Moisture Value',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color:Color.fromARGB(255, 44, 116, 98)
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: gauges.SfRadialGauge(
                          axes: <gauges.RadialAxis>[
                   gauges. RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    showLabels: false,
                    showTicks: false,
                     startAngle: 0, // Set the start angle to 0 degrees
                    endAngle: 360, 
                    axisLineStyle:  const gauges.AxisLineStyle(
                      thickness: 0.1,
                      cornerStyle: gauges.CornerStyle.bothCurve,
                      color: Color.fromARGB(255, 214, 241, 234),
                      thicknessUnit: gauges.GaugeSizeUnit.factor,
                    ),
                    pointers: <gauges.GaugePointer>[
                      gauges.RangePointer(
                         value: chartData.isNotEmpty
                                ? double.parse(chartData.last.moisture.toStringAsFixed(2))
                                : 0.0,
                        width: 0.1,
                        color: const Color.fromARGB(255, 44, 116, 98),
                        pointerOffset: 0.1,
                        sizeUnit: gauges.GaugeSizeUnit.factor,
                      ),
                    ],
                    annotations: <gauges.GaugeAnnotation>[
                      gauges.GaugeAnnotation(
                        widget: Center(
                           child: Text(
                              '${chartData.isNotEmpty ? double.parse(chartData.last.moisture.toStringAsFixed(2)): 0.0}%',
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:Color.fromARGB(255, 44, 116, 98) ),
                            ),
                          
                        ),
                        //angle: 90,
                        positionFactor: 0.1,
                      ),
                    ],
                  
              ),
            
          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 16.0), // Adjust the spacing here
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Soil Moisture Chart',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color:Color.fromARGB(255, 44, 116, 98)
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(8),
                       child: SfCartesianChart(
                        zoomPanBehavior: ZoomPanBehavior(
                            enablePinching: true, // Enable pinch zooming
                            enableDoubleTapZooming: true,
                            enableSelectionZooming: true,
                            selectionRectBorderColor:const Color.fromARGB(255, 44, 116, 98),
                            selectionRectBorderWidth: 1,
                            selectionRectColor: const Color.fromARGB(255, 214, 241, 234) // Enable double-tap zooming
                         ),    
                          primaryXAxis: DateTimeAxis(),
                          series: <LineSeries<DataPoint2, DateTime>>[
                             LineSeries<DataPoint2, DateTime>(
                              dataSource: chartData,
                              xValueMapper: (data, _) => data.timestamp,
                              yValueMapper: (data, _) => data.moisture,
                              color:const Color.fromARGB(255, 44, 116, 98)
                            ),
                          ],
                        ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


 
}

class DataPoint2 {
  final DateTime timestamp;
  final double moisture;

  DataPoint2(this.timestamp, this.moisture);
}


class HumidityPage extends StatefulWidget {
  const HumidityPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
 _HumidityPageState createState() => _HumidityPageState();
}
class _HumidityPageState extends State<HumidityPage> {
  final  DatabaseReference _databaseReference = FirebaseDatabase.instance.ref().child('data');


  double humidity = 0.0;
  List<DataPoint4> chartData = [];

  @override
  void initState() {
    super.initState();
    _databaseReference.onChildAdded.listen((event) {
      Map<String, dynamic> snapshotValue =
          Map<String, dynamic>.from(event.snapshot.value as Map);
      String humidity= snapshotValue['humidity'].toString();
      String timestamp = snapshotValue['timestamp'].toString();
      final DateTime dateTime = DateTime.parse(timestamp);
      final dataPoint = DataPoint4(dateTime, double.parse(humidity));
      setState(() {
        chartData.add(dataPoint);
      });
    });
  }

  @override
  void dispose() {
    _databaseReference.onChildAdded.drain();
    super.dispose();
  }
    
 @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Humidity'),
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0), // Adjust the spacing here
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 8.0), // Adjust the spacing here
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Humidity Value',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color:Color.fromARGB(255, 44, 116, 98)
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: gauges.SfRadialGauge(
                          axes: <gauges.RadialAxis>[
                   gauges. RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    showLabels: false,
                    showTicks: false,
                    axisLineStyle:  const gauges.AxisLineStyle(
                      thickness: 0.2,
                      cornerStyle: gauges.CornerStyle.bothCurve,
                      color: Color.fromARGB(255, 214, 241, 234),
                      thicknessUnit: gauges.GaugeSizeUnit.factor,
                    ),
                    pointers: <gauges.GaugePointer>[
                      gauges.RangePointer(
                         value: chartData.isNotEmpty
                                ? chartData.last.humidity
                                : 0,
                        width: 0.2,
                        color: const Color.fromARGB(255, 44, 116, 98),
                        pointerOffset: 0.1,
                        sizeUnit: gauges.GaugeSizeUnit.factor,
                      ),
                    ],
                    annotations: <gauges.GaugeAnnotation>[
                      gauges.GaugeAnnotation(
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                               '${chartData.isNotEmpty ? chartData.last.humidity : 0}',
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:Color.fromARGB(255, 44, 116, 98) ),
                            ),
                          ],
                        ),
                        angle: 90,
                        positionFactor: 0.5,
                      ),
                    ],
                  
              ),
            
          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 16.0), // Adjust the spacing here
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Humidity Chart',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color:Color.fromARGB(255, 44, 116, 98)
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(8),
                       child: SfCartesianChart(
                         zoomPanBehavior: ZoomPanBehavior(
                            enablePinching: true, // Enable pinch zooming
                            enableDoubleTapZooming: true,
                            enableSelectionZooming: true,
                            selectionRectBorderColor:const Color.fromARGB(255, 44, 116, 98),
                            selectionRectBorderWidth: 1,
                            selectionRectColor: const Color.fromARGB(255, 214, 241, 234) // Enable double-tap zooming
                         ),  
                          primaryXAxis: DateTimeAxis(),
                          series: <LineSeries<DataPoint4, DateTime>>[
                             LineSeries<DataPoint4, DateTime>(
                              dataSource: chartData,
                              xValueMapper: (data, _) => data.timestamp,
                              yValueMapper: (data, _) => data.humidity,
                              color:const Color.fromARGB(255, 44, 116, 98)
                            ),
                          ],
                        ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

}
class DataPoint4 {
  final DateTime timestamp;
  final double humidity;

  DataPoint4(this.timestamp, this.humidity);
}




