import 'package:flutter/material.dart';

class LoginFoamDesign extends StatefulWidget {
  const LoginFoamDesign({super.key});

  @override
  State<LoginFoamDesign> createState() => _LoginFoamDesignState();
}


class _LoginFoamDesignState extends State<LoginFoamDesign> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController user = TextEditingController();
    TextEditingController email = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Design',style: TextStyle(fontSize: 20,color: Colors.white)),
        backgroundColor: Colors.black54,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: user,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  print(value);
                  return 'Please enter some text';
                
                }
                return null;
              },
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Enter Email',
                labelText: 'Email *',
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: email,
              decoration: const InputDecoration(
                icon: Icon(Icons.lock),
                hintText: 'Enter Password',
                labelText: 'Password *',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  print(value);
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),),
    );
  }
}
