import 'package:e_commerce_bloc/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modals/api_modal.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CustomerInfoPage",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<HomeController, Map>(builder: (context, state) {
          return Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text("Enter Your Name"),
              TextFormField(
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                    hintText: "Enter Name",
                    labelText: "Name",
                    border: OutlineInputBorder()),
                onSaved: (val) {
                  MyVariable.name = val;
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter Your Name";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Enter Your Mail"),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: "Enter Mail",
                    labelText: "Mail",
                    border: OutlineInputBorder()),
                onSaved: (val) {
                  MyVariable.email = val;
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter email";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Enter Your Phone Number"),
              TextFormField(
                maxLength: 10,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    hintText: "Enter Phone Number",
                    labelText: "Phone",
                    prefixText: "+91",
                    border: OutlineInputBorder()),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter Phone Number";
                  } else if (val!.length < 10) {
                    return "Invalid Number";
                  } else {
                    return null;
                  }
                },
                onSaved: (val) {
                  MyVariable.mobileNo = int.parse(val!);
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          );
        }),
      ),
    );
  }
}
