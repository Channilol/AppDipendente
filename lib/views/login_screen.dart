import 'package:app_dipendente_merendels/components/general_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<Offset>(begin: Offset(0, 0.2), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 150,
                                height: 150,
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: CupertinoColors.white,
                                  borderRadius: BorderRadius.circular(24),
                                  boxShadow: [
                                    BoxShadow(
                                      color: CupertinoColors.black.withOpacity(
                                        0.1,
                                      ),
                                      blurRadius: 10,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  'assets/images/logo_merendels.png',
                                  fit: BoxFit.contain,
                                ),
                              ),

                              SizedBox(height: 32),

                              Text(
                                'Benvenuto',
                                style: TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                  color: CupertinoColors.label,
                                  letterSpacing: -0.41,
                                ),
                              ),

                              SizedBox(height: 8),

                              Text(
                                'Accedi al tuo account Merendels',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: CupertinoColors.secondaryLabel,
                                  letterSpacing: -0.41,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),

                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: CupertinoColors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: CupertinoColors.black.withOpacity(
                                      0.05,
                                    ),
                                    blurRadius: 10,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  CupertinoTextField(
                                    controller: _emailController,
                                    placeholder: 'Email',
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    style: TextStyle(
                                      fontSize: 17,
                                      letterSpacing: -0.41,
                                    ),
                                    placeholderStyle: TextStyle(
                                      color: CupertinoColors.placeholderText,
                                      fontSize: 17,
                                      letterSpacing: -0.41,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: CupertinoColors.separator,
                                          width: 0.5,
                                        ),
                                      ),
                                    ),
                                    padding: EdgeInsets.all(16),
                                  ),
                                  CupertinoTextField(
                                    controller: _passwordController,
                                    placeholder: 'Password',
                                    obscureText: true,
                                    textInputAction: TextInputAction.done,
                                    style: TextStyle(
                                      fontSize: 17,
                                      letterSpacing: -0.41,
                                    ),
                                    placeholderStyle: TextStyle(
                                      color: CupertinoColors.placeholderText,
                                      fontSize: 17,
                                      letterSpacing: -0.41,
                                    ),
                                    decoration: BoxDecoration(),
                                    padding: EdgeInsets.all(16),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 20),

                            GeneralButton(
                              function: () {},
                              label: 'Accedi',
                              width: double.infinity,
                              color: CupertinoColors.systemBlue,
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GeneralButton(
                              function: () {},
                              icon: CupertinoIcons.question_circle,
                              label: 'Serve aiuto?',
                              width: double.infinity,
                              color: CupertinoColors.systemBlue,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
