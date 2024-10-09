import 'package:flutter/material.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 100,
    height: 100,
  );
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
  TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: isPasswordType,
      enableSuggestions: !isPasswordType,
      autocorrect: !isPasswordType,
      cursorColor: Colors.white,
      style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.9)),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: const Color.fromARGB(179, 0, 0, 0),
        ),
        labelText: text,
        labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,

        fillColor: Colors.white,
        
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        )
      ),
      keyboardType: isPasswordType ? TextInputType.visiblePassword : TextInputType.emailAddress,
    );
  }

Container signInSignUpButton(BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
    child: ElevatedButton(
      onPressed: () { 
        onTap(); 
      },
      style: ButtonStyle(backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return Color.fromARGB(255, 1, 93, 66);
        }
        return Color.fromARGB(255, 1, 93, 66);
      }),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
      ), 
      child: Text(
        isLogin ? 'LOG IN' : 'SIGN UP', 
        style: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold, fontSize: 16
        )
      ),
    ),
  );
}