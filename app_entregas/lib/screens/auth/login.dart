import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  
  Login(this.menuOnClick, {super.key});
  
  final _formKey = GlobalKey<FormState>();
  
  final void Function() menuOnClick;
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar( title: const SizedBox(height: 200,),),
      bottomNavigationBar: BottomAppBar(
        child: TextButton(
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Não tem conta? ', style: TextStyle(fontSize: 14)),
              Text(' Crie uma aqui! ', style: TextStyle(fontSize: 14, color: Colors.purple)),
            ],
          ),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset( 'assets/img/login.webp', ),
                SizedBox(
                  width: MediaQuery.of(context).size.width/2,
                  child: const Text("login", style: TextStyle(color: Colors.black54)),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width/2,
                  child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Login inválido';
                    }
                    return null;
                  },
                ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width/2,
                  child: const Text("senha", style: TextStyle(color: Colors.black54)),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width/2,
                  child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'senha inválida';
                    }
                    return null;
                  },
                ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                      style: TextButton.styleFrom(
                        alignment: Alignment.centerRight,
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Login"),
                          Icon(Icons.arrow_forward)
                        ],
                      ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        menuOnClick();
                      }

                    } 
                  )
                    ]
                  )
                )
              ]
            )
          )
        )
      )
    );
  }




}