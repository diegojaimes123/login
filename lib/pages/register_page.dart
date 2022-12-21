import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  final  VoidCallback showLoginPage;

  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //text controlers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _userProfileController = TextEditingController();

  Future logIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }
  
  Future signIn() async {
    if (passwordConfirmed()) {
      //create user 
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      
      //USER CONTROLER  
      addUserDetails(
        _firstNameController.text.trim(),
        _lastNameController.text.trim(),
        _userProfileController.text.trim(),
        _emailController.text.trim(),
      );
    }
  }
  bool passwordConfirmed() {
    if (_passwordController.text.trim() == _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }
  
  Future addUserDetails(
      String firstName,
      String lastName,
      String userProfile,
      String email,
      ) async {
    await FirebaseFirestore.instance.collection('cuentas').add({
      'first name' : firstName,
      'last name' : lastName,
      'user profile' : userProfile,
      'email' : email,
    });
  }
  @override

  void Dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _userProfileController.dispose();
    super.dispose();
  }


  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:  Column(
              children: [
                const Icon(
                  Icons.adb,
                  size: 100,
                ),
                Text('¡Hola Aprendiz!',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 50,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(''
                    'Registre sus datos a continuación ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20,),

                //first name TextField.
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child:   TextField(
                      controller: _firstNameController,
                      obscureText: false,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius:  BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.white)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'First name',
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                    )
                ),
                const SizedBox(height: 10,),
                //password TextField.
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child:   TextField(
                    controller: _lastNameController,
                    obscureText: false,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius:  BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.white)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Last name',
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  )
                ),
                const SizedBox(height: 10),
                //TextField de confirm password
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child:   TextField(
                      controller: _userProfileController,
                      obscureText: false,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius:  BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.white)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'User profile',
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                    )
                ),
                const SizedBox(height: 10),
                //TextField de confirm password
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child:   TextField(
                      controller: _emailController,
                      obscureText: false,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius:  BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.white)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Email',
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                    )
                ),


                const SizedBox(height: 10),
                //TextField de confirm password
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child:   TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius:  BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.white)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Password',
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                    )
                ),

                const SizedBox(height: 10),
                //TextField de confirm password
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child:   TextField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius:  BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.white)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Confirm password',
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                    )
                ),
                const SizedBox(height: 20.0),
                //boton inicio
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: GestureDetector(
                    onTap: signIn, //metodo que gestiona el inico de secion
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Registrese ahora',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:    <Widget>[
                    const Text(
                      '¡Soy miembro!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: const Text(
                        '  Iniciar Sesión',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

