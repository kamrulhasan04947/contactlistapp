import 'package:contactlistapp/screens/widget/appaleartdialog.dart';
import 'package:contactlistapp/screens/widget/appbutton.dart';
import 'package:contactlistapp/screens/widget/apptextfield.dart';
import 'package:contactlistapp/screens/widget/apptolbar.dart';
import 'package:flutter/material.dart';
import '../models/contactinfomodel.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  List<ContactInfoModel> contacts = [];


  @override void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppToolBar(title: 'Contact List',) ,
      body:  OrientationBuilder(builder: (BuildContext context, Orientation orientation){
        return Padding(
          padding: const EdgeInsets.all(10) ,
          child: (orientation == Orientation.portrait) ? _buildPotraitView(): _buildLandscapeView(),
        );
      }),
      resizeToAvoidBottomInset: true,
    );
  }

   Widget _buildPotraitView() {
    return Column(
      children: [
        SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AppTextField(
                    hint: 'Name',
                    // label: 'Name',
                    controller: _nameController,
                    inputType: TextInputType.text,
                  ),
                  AppTextField(
                    hint: 'Contact',
                    // label: 'Contact',
                    controller: _contactController,
                    inputType: TextInputType.text,
                  ),
                  AppButton(
                    title: 'Add',
                    onTap: (){
                      if(_formKey.currentState!.validate()){
                        _addContact();
                      }
                    },
                  )
                ],
              )
          ),
        ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            flex: 3,
            child: ListView.separated(
              itemBuilder: (context, index){
                return _buildListTile(context, index);
              },
              separatorBuilder: (_, __) => const Divider(
                color: Color.fromRGBO(222, 222, 222, 1),
                thickness: 2,
              ),
              itemCount: contacts.length,
            ),
          )
      ],
    );
  }

  Widget _buildLandscapeView(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    AppTextField(
                      hint: 'Name',
                      // label: 'Name',
                      controller: _nameController,
                      inputType: TextInputType.text,
                    ),
                    AppTextField(
                      hint: 'Contact',
                      // label: 'Contact',
                      controller: _contactController,
                      inputType: TextInputType.text,
                    ),
                    AppButton(
                      title: 'Add',
                      onTap: (){
                        if(_formKey.currentState!.validate()){
                          _addContact();
                        }
                      },
                    )
                  ],
                )
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 3,
          child: ListView.separated(
            itemBuilder: (context, index){
              return _buildListTile(context, index);
            },
            separatorBuilder: (_, __) => const Divider(
              color: Color.fromRGBO(222, 222, 222, 1),
              thickness: 2,
            ),
            itemCount: contacts.length,
          ),
        )
      ],
    );
  }

  void _addContact(){
    setState(() {});
    ContactInfoModel loadedContacts= ContactInfoModel(
      contactName: _nameController.text,
      contactNumber: _contactController.text,
    );
    contacts.add(loadedContacts);
    setState(() {});
  }


  Widget _buildListTile(BuildContext context, index) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    // var brightness = Theme.of(context).brightness;
    return GestureDetector(
      onLongPress: (){
        _showConfirmDeleteWithDialog(index);
      },
      child: ListTile(
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(
            Icons.person,
            size: 40,
            color: Color.fromRGBO(150, 85, 71, 1),
          ),
        ),
        title: Text(
          contacts[index].contactName,
          style: const TextStyle(
            color: Color.fromRGBO(225, 121, 121, 1),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          contacts[index].contactNumber,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          )
        ),
        trailing:IconButton(
          onPressed: (){},
          icon: const Icon(
            Icons.call,
            size: 30,
            color: Color.fromRGBO(92, 150, 213, 1),
          ),
        ),
      ),
    );
  }


  void _showConfirmDeleteWithDialog(index){
    showDialog(
      context: context,
      builder: (context){
        return AppAlertDialog(
          title: "Are you sure for delete!",
          onTap: (){
            setState(() {
               contacts.removeAt(index);
            });
            Navigator.pop(context, true);
          },
        );
      },
    );
  }

  @override
  void dispose(){
    _nameController.dispose();
    _contactController.dispose();
    super.dispose();
  }
}
