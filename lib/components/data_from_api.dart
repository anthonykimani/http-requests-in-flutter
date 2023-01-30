import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class DataFromAPI extends StatefulWidget {
  const DataFromAPI({Key? key}) : super(key: key);

  @override
  State<DataFromAPI> createState() => _DataFromAPIState();
}

class _DataFromAPIState extends State<DataFromAPI> {
  var _postJson = [];

  void fetchProperties() async {
    final response = await get(Uri.parse('https://arasaka.onrender.com/properties'));
    final jsonData = jsonDecode(response.body) as List;

    setState(() {
      _postJson = jsonData;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProperties();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _postJson.length,
        itemBuilder: (context, index){
          final property  = _postJson[index];
          return Text("${property['property_name']}",style:GoogleFonts.poppins( textStyle: TextStyle( fontSize: 24, fontWeight: FontWeight.bold),),);
    });
  }
}
