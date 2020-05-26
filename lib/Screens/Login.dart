import 'package:flutter/material.dart';
import 'Dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email= new TextEditingController();
  final pass= new TextEditingController();
  String emaill;
  String passw;
  var torf;
  getSharedValue() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uname= prefs.getString('email');
    var password= prefs.getString(('password'));
    print("*********************************************");
    print(uname );
    print(password);
    var unamep= prefs.containsKey('email');
    var passworp= prefs.containsKey('password');
    print("___________________________________");
    print(unamep );
    print(passworp);
    if( unamep && passworp){
      setState(() {
        torf= true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('asset/images/background.png'), fit: BoxFit.fill)
            ),
            child: Column(
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height/4),
                  Text('LOGIN', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black)),
                  SizedBox(height: MediaQuery.of(context).size.height/4),
                  Container(
                    width: MediaQuery.of(context).size.width-100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xFFFFFFFF)
                    ),
                    child: TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide()
                          ),
                          prefixIcon: Icon(Icons.person),
                          hintText: " E-mail",
                          hintStyle: TextStyle(
                              color: Colors.grey, fontSize: 14.0)
                      ),
                      onChanged: (val)=> setState(()=>emaill=val),
                      //validator: (val) => val.isEmpty? 'Enter your name' : null,
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: MediaQuery.of(context).size.width-100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xFFFFFFFF)
                    ),
                    child: TextFormField(
                      controller: pass,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide()
                          ),
                          prefixIcon: Icon(Icons.person),
                          hintText: "Password",
                          hintStyle: TextStyle(
                              color: Colors.grey, fontSize: 14.0)
                      ),
                      //validator: (val) => val.isEmpty? 'Enter your name' : null,
                      onChanged: (val)=> setState(()=>passw=val),
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color(0xFFFFFFFF)
                      ),
                      width: MediaQuery.of(context).size.width-250,
                      height: 50,
                      child:
                      RaisedButton(
                          child: Text('Login'),
                          onPressed: (){
                            getSharedValue();
                            if(torf){
                              print("hahhahahahahahahhahahahahahahhahahahhahah");
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Dashboard()));
                            }
                            else{
                              print("errooooooorrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
                            }

                          }
                      )
                  )
                ]
            ),
          ),
        ),
      ),
    );
  }
}