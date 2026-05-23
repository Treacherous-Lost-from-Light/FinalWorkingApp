import 'package:flutter/material.dart';


class Login extends StatelessWidget {

  const Login ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF564A70),
      body: Padding(padding: EdgeInsets.all(20),
        child: Center (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // eto yung image
              ClipOval(
                child: Image.asset(
                  'lib/assets/images/kween_leng_leng_heart_.jpg',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
// username to
              SizedBox (
                width: 400,
                child: TextField(

                  decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: TextStyle(color: Colors.black),
                    floatingLabelBehavior: FloatingLabelBehavior.never,

                    // eto yung sa border and yung filler color ng text box
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // eto yung sa password
              SizedBox (
                width: 400,
                child: TextField(

                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.black),
                    floatingLabelBehavior: FloatingLabelBehavior.never,

                    // eto yung sa border and yung filler color ng text box
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),

                  ),
                ),
              ),
              SizedBox(height: 30),

              SizedBox(
                width: 175,
                height: 50,
                child: ElevatedButton(onPressed: () {
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xFF564A70),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  child: Text(
                    "Login",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}