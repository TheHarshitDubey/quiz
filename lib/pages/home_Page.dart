import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/provider_pages/providerr.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Liscence Eligibility Checker' ,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
           image: NetworkImage('https://images.unsplash.com/photo-1603993097397-89d87aab1f85?auto=format&fit=crop&w=800&q=80'),

            fit: BoxFit.cover,
            ),
            
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child:ChangeNotifierProvider<PageConnect>(
                create: (context)=>PageConnect(),
                child: Consumer<PageConnect>(
                  builder: (context, provider, child) {
                  return Column(
                    children: [
                      Text(provider.message.toString(),style: TextStyle(
                        color: (provider.isEligible==true)? Colors.green :Colors.red,
                      ),),
                      TextField(
                keyboardType: TextInputType.numberWithOptions(),
                decoration:InputDecoration(
                  hintText: 'Enter your Age',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(25)
                  ),
                  focusedBorder: OutlineInputBorder( borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                      style: BorderStyle.solid,
                  ),
                    borderRadius: BorderRadius.circular(25)
                  ),
                ), 
                onChanged: (value) {
                  provider.ageCheck(int.parse(value));
                },
              ),
                    ],
                  );
                  
                  
                },
                )
              
            ),
            ),
          ],
        ),
      ),
    );
  }
}