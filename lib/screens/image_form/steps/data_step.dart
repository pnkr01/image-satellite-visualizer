import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_satellite_visualizer/screens/image_form/maps.dart';

class DataStep extends StatefulWidget {
  const DataStep({Key? key}) : super(key: key);

  @override
  _DataStepState createState() => _DataStepState();
}

class _DataStepState extends State<DataStep> {
  TextEditingController _firstLatitude = TextEditingController();
  TextEditingController _firstLongitude = TextEditingController();
  TextEditingController _secondLatitude = TextEditingController();
  TextEditingController _secondLongitude = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: screenSize.height * 0.5,
            width: screenSize.width * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Location',
                  style: TextStyle(fontSize: screenSize.height * 0.05),
                ),
                Text(
                  'Select the location that you want to query',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: screenSize.height * 0.025,
                  ),
                ),
                Text(
                  'First pair of coordinates',
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: _firstLongitude,
                          decoration: new InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            hintText: 'Longitude',
                            labelText: 'Longitude',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: _firstLatitude,
                          decoration: new InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            hintText: 'Latitude',
                            labelText: 'Latitude',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Second pair of coordinates',
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: _secondLongitude,
                          decoration: new InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            hintText: 'Longitude',
                            labelText: 'Longitude',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: _secondLatitude,
                          decoration: new InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            hintText: 'Latitude',
                            labelText: 'Latitude',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: OutlinedButton(
                    child: Text('GET LOCATIONS'),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Maps(callback: this.setLocation)),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: screenSize.height * 0.5,
            width: screenSize.width * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Date',
                  style: TextStyle(fontSize: screenSize.height * 0.05),
                ),
                Text(
                  'Select the date that you want to query',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: screenSize.height * 0.025,
                  ),
                ),
                TextField(
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    hintText: 'Day',
                    labelText: 'Day',
                  ),
                ),
                TextField(
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    hintText: 'Month',
                    labelText: 'Month',
                  ),
                ),
                TextField(
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    hintText: 'Year',
                    labelText: 'Year',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void setLocation(Map<MarkerId, Marker> markers) {
    setState(() {
      _firstLatitude.text =
          markers.values.elementAt(0).position.latitude.toString();
      _firstLongitude.text =
          markers.values.elementAt(0).position.longitude.toString();
      _secondLatitude.text =
          markers.values.elementAt(1).position.latitude.toString();
      _secondLongitude.text =
          markers.values.elementAt(1).position.longitude.toString();
    });
  }
}
