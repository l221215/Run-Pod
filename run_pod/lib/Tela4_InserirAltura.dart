import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Tela5_MostraValores.dart';

class Tela4 extends StatefulWidget {
  final device;
  const Tela4({Key key, this.device}) : super(key: key);
  @override
  _Tela4State createState() => _Tela4State(device);
}

class _Tela4State extends State<Tela4> {
  final device;
  _Tela4State(this.device);
  final formKey = GlobalKey<FormState>();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      // Define cor de fundo
        backgroundColor: Colors.lightGreenAccent[100],
        appBar: AppBar(
          backgroundColor: Colors.lightGreenAccent,
          title: Text("Parâmetros para se definir",textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0)),
        ),
        body: AlturaForm(this.device),
    );
  }
}

// Create a Form widget.
class AlturaForm extends StatefulWidget {
  final device;
  AlturaForm(this.device);
  @override
  AlturaFormState createState() {
    return AlturaFormState(this.device);
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class AlturaFormState extends State<AlturaForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _altura = GlobalKey<FormState>();
  final device;
  AlturaFormState(this.device);

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _altura,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.send, color: Colors.black),
              hintText: 'Altura em cm:',
              hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Por favor escreva uma altura';
              }
              return null;
            },
            keyboardType: TextInputType.number,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: FloatingActionButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_altura.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Tela5(device:device , altura:_altura)));
                }
              },
              child: Icon(Icons.arrow_forward, color: Colors.black), //icone da flecha
              backgroundColor: Colors.lightGreenAccent,)
            ),
        ],
      ),
    );
  }
}