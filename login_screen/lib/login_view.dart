import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 32, 32),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          const SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Login ",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 30.0),
          TextFormField(
            cursorColor: const Color.fromARGB(255, 31, 32, 32),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'email',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            cursorColor: const Color.fromARGB(255, 31, 32, 32),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'password',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                "Forgot your password ?",
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          DefaultButton(function: () {}, text: "Login"),
          const SizedBox(
            height: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "Or login with social account",
                style: TextStyle(fontSize: 18, height: .5),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 80,
                width: 100,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(
                        "login_screen/assets/images/google logo.png"),
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 80,
                width: 100,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(
                        "login_screen/assets/images/google logo.png"),
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  final double height;
  final double width;
  // final Color background;
  final VoidCallback function;
  final String text;
  final bool isUpperCase;
  final double radius;
  final Color textColor;

  const DefaultButton({
    Key? key,
    this.height = 50,
    this.width = double.infinity,
    // this.background = Colors.blue,
    required this.function,
    required this.text,
    this.isUpperCase = true,
    this.radius = 30.0,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: Colors.red[800]),
        child: MaterialButton(
          onPressed: function,
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
// ignore_for_file: file_names

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final Function? onSubmit;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final FormFieldValidator<String>? onValidate;
  final VoidCallback? suffixPressed;
  final String label;
  // ignore: prefer_typing_uninitialized_variables
  final lines;

  final String hint;
  // final IconData prefix;
  final bool isPassword;
  final IconData? suffix;

  const DefaultFormField({
    Key? key,
    required this.controller,
    required this.type,
    this.onSubmit,
    this.onChanged,
    this.onTap,
    required this.onValidate,
    this.suffixPressed,
    required this.label,
    required this.lines,
    required this.hint,
    this.isPassword = false,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: lines,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onChanged: onChanged,
      onTap: onTap,
      validator: onValidate,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,

        // prefixIcon: Icon(
        //   // prefix,
        // ),
        suffixIcon: IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
