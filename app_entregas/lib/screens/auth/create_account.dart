import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget {
  
  CreateAccount(this.menuOnClick, this.loginOnClick, {super.key});
  
  final _formKey = GlobalKey<FormState>();
  
  final void Function() menuOnClick;
  final void Function() loginOnClick;
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: TextButton(
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Já tem uma conta? ', style: TextStyle(fontSize: 14)),
              Text(' Faça Login! ', style: TextStyle(fontSize: 14, color: Colors.purple)),
            ],
          ),
          onPressed: () {loginOnClick();},
        ),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height*0.7,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.7,
                      height: 200,
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          'Cadastro '
                        ),
                      )
                    )
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width/2,
                  child: const Text("nome", style: TextStyle(color: Colors.black54)),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width/2,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nome inválido';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width/2,
                  child: const Text("email", style: TextStyle(color: Colors.black54)),
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
                  width: MediaQuery.of(context).size.width*0.75,
                  height: 140,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                      style: TextButton.styleFrom(
                        alignment: Alignment.bottomRight,
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Criar Conta"),
                          Icon(Icons.add)
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