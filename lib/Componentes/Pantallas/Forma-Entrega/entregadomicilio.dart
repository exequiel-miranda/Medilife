import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:untitled/Componentes/Pantallas/principal.dart';
import 'package:untitled/Componentes/constantes.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled/Componentes/Controllers/mapcontroller.dart';
import 'package:untitled/screens/home/home.dart';

class EntregaDomicilio extends StatefulWidget {
  EntregaDomicilio({Key key}) : super(key: key);

  @override
  _EntregaDomicilioState createState() => _EntregaDomicilioState();
}

class _EntregaDomicilioState extends State<EntregaDomicilio> {
  //Firebase

  final formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  var _borrar = TextEditingController();
  var _borrar2 = TextEditingController();
  final _initialCameraPosition =
      const CameraPosition(target: LatLng(13.6977132, -89.1853837), zoom: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Entrega a Domicilio"),
        ),
        backgroundColor: kColorPrimario,
        body: Container(
            child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Column(
            verticalDirection: VerticalDirection.down,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              map(context),
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
                  controller: _borrar2,
                  validator: (value) {
                    return value.isEmpty ? "Dirección requerida" : null;
                  },
                  onSaved: (value) {
                    //campo=value;
                  },
                  decoration: InputDecoration(
                      errorStyle: TextStyle(
                        fontSize: 15,
                        wordSpacing: 5.0,
                      ),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.house,
                        color: Colors.grey,
                      ),
                      suffixIcon: IconButton(
                        onPressed: _borrar2.clear,
                        icon: Icon(Icons.clear),
                      ),
                      labelStyle: TextStyle(fontSize: 15),
                      labelText: "Ingrese Direccion de Entrega"),
                  style: TextStyle(fontSize: 25),
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
                  controller: _borrar,
                  validator: (value1) {
                    return value1.isEmpty ? "Referencia requerida" : null;
                  },
                  onSaved: (value1) {
                    //campo=value;
                  },
                  decoration: InputDecoration(
                      errorStyle: TextStyle(
                        fontSize: 15,
                        wordSpacing: 5.0,
                      ),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.directions,
                        color: Colors.grey,
                      ),
                      labelStyle: TextStyle(fontSize: 15),
                      labelText: "Referencia Detallada"),
                  style: TextStyle(fontSize: 25),
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
                  maxLines: 2,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.explicit,
                        color: Colors.grey,
                      ),
                      labelStyle: TextStyle(fontSize: 15),
                      labelText: "Indicaciones Especiales para la Entrega"),
                  style: TextStyle(fontSize: 25),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              /* Text(
                "Por el momento los pagos se realizaran en Efectivo",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),*/
              SizedBox(
                height: 15,
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
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => AlertDialog(
                                title: const Text('Compra exitosa'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: const <Widget>[
                                      Text(
                                        'Su compra ha sido procesada con exito',
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('Cerrar'),
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
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
        )));
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
