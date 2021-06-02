import 'package:flutter/material.dart';
import 'package:track_n_go/home/searchscreen.dart';


class SignupScreen extends StatefulWidget {
  static const routeName = '/signup';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('Sign In Account'),
        elevation: 0,
        backgroundColor: Colors.deepPurple[900],
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
            width: double.infinity,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),

                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Image.asset('assets/logo.png', height: 200,),
                      SizedBox(height: 20,),
                      Text('Email',style: TextStyle(color: Colors.yellowAccent),),
                      SizedBox(height: 5,),

                      TextField(
                        style: TextStyle(fontSize: 18,color: Colors.black54),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'demo@gmail.com',
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
                      SizedBox(height: 20,),

                      Text('Confirm Password',style: TextStyle(color: Colors.yellowAccent),),
                      SizedBox(height: 5,),



                      TextField(
                        obscureText: true,
                        style: TextStyle(fontSize: 18,color: Colors.black54),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Confirm Password',
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


                      FlatButton(
                        child: Text('SignUp',
                          style: TextStyle(fontSize: 20),

                        ),
                        shape: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple[900], width: 2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.all(15),
                        color: Colors.yellowAccent,
                        textColor: Colors.black,
                        onPressed: () {
                          Navigator.of(context).pushNamed(SearchScreen.routeName);
                        },
                      )
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
