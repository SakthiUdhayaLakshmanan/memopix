import 'package:flutter/material.dart';
import 'second.dart'; // Make sure this file exists and is implemented
import 'login.dart'; // Add the import for the login page

class SignupModel {
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  FocusNode? textFieldFocusNode1;
  FocusNode? textFieldFocusNode2;
  FocusNode? textFieldFocusNode3;
  bool passwordVisibility1 = false;
  bool passwordVisibility2 = false;

  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    textFieldFocusNode1?.dispose();
    textFieldFocusNode2?.dispose();
    textFieldFocusNode3?.dispose();
  }

  String? Function(String?)? get textController1Validator => (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    return null; // Valid input
  };

  String? Function(String?)? get textController2Validator => (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null; // Valid input
  };

  String? Function(String?)? get textController3Validator => (value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    return null; // Valid input
  };
}

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  late SignupModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = SignupModel();
    _model.textController1 = TextEditingController();
    _model.textFieldFocusNode1 = FocusNode();
    _model.textController2 = TextEditingController();
    _model.textFieldFocusNode2 = FocusNode();
    _model.textController3 = TextEditingController();
    _model.textFieldFocusNode3 = FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFF1F4F8),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Material(
                    color: Colors.transparent,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1642480485642-63b9018eadc2?w=500&h=500',
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'memopix',
                    style: TextStyle(
                      fontFamily: 'Inter Tight',
                      color: const Color(0xFF14181B),
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Sign up to begin your journey',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: const Color(0xFF677681),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Material(
                    color: Colors.transparent,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              controller: _model.textController1,
                              focusNode: _model.textFieldFocusNode1,
                              decoration: InputDecoration(
                                hintText: 'Email Address',
                                hintStyle: TextStyle(
                                  fontFamily: 'Inter',
                                  color: const Color(0xFF677681),
                                  fontSize: 14,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFE0E3E7),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xFF14181B),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: _model.textController1Validator,
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _model.textController2,
                              focusNode: _model.textFieldFocusNode2,
                              obscureText: !_model.passwordVisibility1,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  fontFamily: 'Inter',
                                  color: const Color(0xFF677681),
                                  fontSize: 14,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFE0E3E7),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _model.passwordVisibility1 = !_model.passwordVisibility1;
                                    });
                                  },
                                  child: Icon(
                                    _model.passwordVisibility1
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: const Color(0xFF677681),
                                  ),
                                ),
                              ),
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xFF14181B),
                              ),
                              validator: _model.textController2Validator,
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _model.textController3,
                              focusNode: _model.textFieldFocusNode3,
                              obscureText: !_model.passwordVisibility2,
                              decoration: InputDecoration(
                                hintText: 'Confirm Password',
                                hintStyle: TextStyle(
                                  fontFamily: 'Inter',
                                  color: const Color(0xFF677681),
                                  fontSize: 14,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFFE0E3E7),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _model.passwordVisibility2 = !_model.passwordVisibility2;
                                    });
                                  },
                                  child: Icon(
                                    _model.passwordVisibility2
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: const Color(0xFF677681),
                                  ),
                                ),
                              ),
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xFF14181B),
                              ),
                              validator: _model.textController3Validator,
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SecondWidget()),
                                );
                                print('Signup Button pressed ...');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFF83B46), // Use 'backgroundColor' instead of 'primary'
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 15),
                              ),
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Color(0xFF677681),
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginWidget()),
                              );
                              print('Log In tapped ...');
                            },
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xFFF83B46),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
