import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:untitled/Componentes/Pantallas/Forma-Entrega/entregadomicilio.dart';
import 'package:untitled/Componentes/Pantallas/forma-entrega/entregatienda.dart';
import 'package:untitled/Componentes/constantes.dart';

class VistaEntrega extends StatefulWidget {
  VistaEntrega({Key key}) : super(key: key);

  @override
  _VistaEntregaState createState() => _VistaEntregaState();
}

class _VistaEntregaState extends State<VistaEntrega> {
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  String dropdownValue = 'Metrocentro';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Forma de Entrega"),
        ),
        body: SingleChildScrollView(
            child: Container(
                //color: kColorPrimario,
                child: Column(children: <Widget>[
          SizedBox(
            height: 1015,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Seleccione la mas conveniente",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                        onPressed: () => {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return EntregaDomicilio();
                          }))
                        },
                        color: Colors.orange,
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.delivery_dining_rounded,
                              size: 50,
                            ),
                            Text(
                              "Entrega a\nDomicilio",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      /*-----------------------------*/
                      FlatButton(
                        onPressed: () => {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return EntregaTienda();
                          }))
                        },
                        color: Colors.orange,
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          // Replace with a Row for horizontal icon + text
                          children: <Widget>[
                            Icon(
                              Icons.store,
                              size: 50,
                            ),
                            Text(
                              "Entrega en\nTienda",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]))));
  }

  _getCurrentLocation() async {
    //Solicitamos permisos al usuario
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      //Incocamos la el método para solicitar permisos
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        //Si los permisos se denegaron únicamente esta vez
        print('Los permisos de ubicación fueron denegados');
      } else if (permission == LocationPermission.deniedForever) {
        //Si los permisos fueron denegados permanentemente
        print(
            'Los permisos de ubicación fueron denegados permanentemente, no se puden solicitar permisos.');
      } else {}
    }
  }
}
