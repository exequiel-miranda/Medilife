import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled/Componentes/Pantallas/principal.dart';
import 'package:untitled/screens/home/home.dart';

import '../../constantes.dart';

class EntregaTienda extends StatefulWidget {
  EntregaTienda({Key key}) : super(key: key);

  @override
  _EntregaTiendaState createState() => _EntregaTiendaState();
}

class _EntregaTiendaState extends State<EntregaTienda> {
  List<Marker> markers = [];
  Map<MarkerId, Marker> _makers = Map();
  final formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  var _borrar = TextEditingController();

  @override
  void initState() {
    super.initState();
    intilize();
  }

  intilize() {
    Marker primero = Marker(
      markerId: MarkerId('Metrocentro San Salvador'),
      position: LatLng(13.7057145, -89.2108858),
      infoWindow: InfoWindow(
          title: 'Metrocentro San Salvador', snippet: '3ra Etapa, Local 250.'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    );
    Marker segundo = Marker(
      markerId: MarkerId('La Gran Via'),
      position: LatLng(13.6770346, -89.254406),
      infoWindow:
          InfoWindow(title: 'La Gran Via', snippet: 'Via Peatonal, Local 5.'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    );
    Marker tercero = Marker(
      markerId: MarkerId('Plaza Mundo Soyapango'),
      position: LatLng(13.6985405, -89.1503796),
      infoWindow: InfoWindow(
        title: 'Plaza Mundo Soyapango',
        snippet: '5ta Etapa, local 100.',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    );
    Marker cuarto = Marker(
      markerId: MarkerId('Metrocentro Lourdes'),
      position: LatLng(13.7285004, -89.359209),
      infoWindow: InfoWindow(
        title: 'Metrocentro Lourdes',
        snippet: 'Local 54, enfrente de Super Selectos',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    );
    Marker quinto = Marker(
      markerId: MarkerId('Galerias'),
      position: LatLng(13.7023204, -89.2298584),
      infoWindow: InfoWindow(
        title: 'Galerias',
        snippet: 'Nivel 3, local 32',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );

    markers.add(primero);
    markers.add(segundo);
    markers.add(tercero);
    markers.add(cuarto);
    markers.add(quinto);
    setState(() {});
  }

  final _initialCameraPosition =
      const CameraPosition(target: LatLng(13.6977132, -89.1853837), zoom: 10);
  String dropdownValue = 'Metrocentro SS';
  TimeOfDay time = const TimeOfDay(hour: 12, minute: 00);
  TextEditingController timeCtl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Entrega en Tienda"),
        ),
        backgroundColor: kColorPrimario,
        body: Container(
            child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                    verticalDirection: VerticalDirection.down,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            map(context),
                            SizedBox(
                              height: 25,
                            ),
                            Container(
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: DropdownButton<String>(
                                value: dropdownValue,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                underline: Container(
                                  height: 2,
                                  color: Colors.pink,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                  });
                                },
                                items: <String>[
                                  'Metrocentro SS',
                                  'La Gran Via',
                                  'Plaza Mundo Soyapango',
                                  'Metrocentro Lourdes',
                                  'Galerias'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 70),
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                controller: timeCtl,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.alarm,
                                      color: Colors.grey,
                                    ),
                                    labelStyle: TextStyle(fontSize: 15),
                                    labelText: "Ingrese Hora de Entrega"),
                                style: TextStyle(fontSize: 25),
                                onTap: () async {
                                  TimeOfDay time = TimeOfDay.now();
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());

                                  TimeOfDay picked = await showTimePicker(
                                      context: context, initialTime: time);
                                  if (picked != null && picked != time) {
                                    timeCtl.text = picked
                                        .format(context); // add this line.
                                    setState(() {
                                      time = picked;
                                    });
                                  }
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Hora requerida';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 70),
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                controller: _borrar,
                                maxLines: 2,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.explicit,
                                      color: Colors.grey,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: _borrar.clear,
                                      icon: Icon(Icons.clear),
                                    ),
                                    labelStyle: TextStyle(fontSize: 15),
                                    labelText:
                                        "Indicaciones Especiales para la Entrega"),
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            MaterialButton(
                                color: Colors.lightGreen,
                                child: Text('Procesar Compra',
                                    style: TextStyle(color: Colors.white)),
                                minWidth: 200.0,
                                height: 40.0,
                                onPressed: () {
                                  if (validarGuardar() != false) {
                                    showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) => AlertDialog(
                                              title:
                                                  const Text('Compra exitosa'),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: const <Widget>[
                                                    Text(
                                                      'Su compra ha sido procesada con exito',
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('Cerrar'),
                                                  onPressed: () {
                                                    Navigator.push(context,
                                                        MaterialPageRoute(
                                                            builder: (context) {
                                                      return HomeScreen();
                                                    }));
                                                  },
                                                ),
                                              ],
                                            ));
                                  } else {
                                    setState(() => _autoValidate = true);
                                  }
                                }),
                          ],
                        ),
                      )
                    ]))));
  }

  @override
  Widget map(BuildContext context) {
    return Column(
      verticalDirection: VerticalDirection.up,
      children: [
        SizedBox(
          height: 500,
          width: 500,
          child: GoogleMap(
            initialCameraPosition: _initialCameraPosition,
            zoomControlsEnabled: true,
            mapType: MapType.normal,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            compassEnabled: false,
            markers: markers.map((e) => e).toSet(),
          ),
        )
      ],
    );
  }

  bool validarGuardar() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
