import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/prod/signup/sign_up_bloc.dart';
import '../repo/SignUpRepository.dart';


class SignupPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: BlocProvider(
        create: (context) => SignupBloc(
          signupRepository: SignupRepository(),
        ),
        child: SignupForm(
          usernameController: _usernameController,
          passwordController: _passwordController,
          firstNameController: _firstNameController,
          lastNameController: _lastNameController,
        ),
      ),
    );
  }
}

class SignupForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;

  SignupForm({
    required this.usernameController,
    required this.passwordController,
    required this.firstNameController,
    required this.lastNameController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signup Successful')));
          Navigator.of(context).pushReplacementNamed('/login');
        } else if (state is SignupFailure) {
          print(Text(state.error));
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signup Failed: ${state.error}')));
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            SizedBox(height: 20),
            BlocBuilder<SignupBloc, SignupState>(
              builder: (context, state) {
                if (state is SignupLoading) {
                  return CircularProgressIndicator();
                }
                return ElevatedButton(
                  onPressed: () {
                    context.read<SignupBloc>().add(SignupRequested(
                      username: usernameController.text,
                      password: passwordController.text,
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                    ));
                  },
                  child: Text('Sign Up'),
                );
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
