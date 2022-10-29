import 'package:flutter/material.dart';
import 'package:library_management/pages/admin/admin_signup.dart';
import 'package:library_management/pages/user/book_info_page.dart';
import 'package:library_management/pages/user/user_home_page.dart';
import 'package:library_management/pages/user/user_signup.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String routeName = '/loginpage';

  @override
  Widget build(BuildContext context) {
    bool check=true;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Stack(
        children:<Widget> [
          Container(
            decoration:const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/img4.png'),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter
                )
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(23),
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Container(
                        color:const Color(0xfff5f5f5),
                        child: TextFormField(
                          style:const TextStyle(
                              color: Colors.black,
                              fontFamily: 'SFUIDisplay'
                          ),
                          decoration:const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Username',
                              prefixIcon: Icon(Icons.person_outline,),
                              labelStyle: TextStyle(
                                  fontSize: 15
                              )
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color:const Color(0xfff5f5f5),
                      child: TextFormField(
                        obscureText: true,
                        style:const TextStyle(
                            color: Colors.black,
                            fontFamily: 'SFUIDisplay'
                        ),
                        decoration:const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock_outline),
                            labelStyle: TextStyle(
                                fontSize: 15
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                          onPressed: (){
                            Navigator.pushNamed(context, UserHomePage.routeName);
                          },
                          child: Text('SIGN IN',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'SFUIDisplay',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          color: Color(0xffff2d55),
                          elevation: 0,
                          minWidth: 400,
                          height: 50,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary : Colors.blue,

                              textStyle: const TextStyle(
                                  color: Colors.white, fontSize: 16, fontStyle: FontStyle.normal),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                            ),
                            onPressed: (){

                            },
                            child: const Text('Forget Your password'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary : Colors.blue,

                              textStyle: const TextStyle(
                                  color: Colors.white, fontSize: 16, fontStyle: FontStyle.normal),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                            ),
                            onPressed: (){
                              Navigator.pushNamed(context, UserSignup.routeName);
                            },
                            child: const Text('Create new account'),
                          ),
                        ),
                      ],
                    ),
                  ],

                ),
              )

          ),

        ],
      ),
    );
  }
}
