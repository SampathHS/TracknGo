import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:track_n_go/home/bottom_bar.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.yellowAccent,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints)
          {
            return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.purple,Colors.deepPurple[900]],

                  )
              ),
                padding: const EdgeInsets.symmetric(horizontal: 30,),
            //color: Colors.blue[200],
            width: double.infinity,
         // color: Colors.purple[900],
          child: SingleChildScrollView(
          child: ConstrainedBox(
          constraints: BoxConstraints(
          minHeight: viewportConstraints.maxHeight,
            ),


          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset('assets/logo.png', height: 200),
            SizedBox(height: 20,),

            Text('Email',style: TextStyle(color: Colors.yellowAccent),),
            SizedBox(height: 5,),

            TextField(
              style: TextStyle(fontSize: 18,color: Colors.black54),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText:'demo@gmail.com',
                  prefixIcon: Icon(Icons.email),
                  contentPadding: const EdgeInsets.all(15),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  )

              ),
            ),
            SizedBox(height: 20,),

            Text('Password',style: TextStyle(color: Colors.yellowAccent),),
            SizedBox(height: 5,),

            TextField(
              obscureText: _isObscure,
              style: TextStyle(fontSize: 18,color: Colors.black54),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ?
                        Icons.visibility : Icons.visibility_off
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure=!_isObscure;
                      });
                    },
                  ),
                  contentPadding: const EdgeInsets.all(15),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  )

              ),
            ),
            SizedBox(height: 30,),
            // ignore: deprecated_member_use
            FlatButton(
              child: Text('Login',
                style: TextStyle(fontSize: 20),
              ),
              shape: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(15),
              color: Colors.yellowAccent,
              textColor: Colors.black,
              onPressed: () {
                Navigator.of(context).pushNamed(bottomBar.routeName);
              },
            ),


          ]
      ),

      ),
            ),
            );
          },
    ),
    );

  }
}
