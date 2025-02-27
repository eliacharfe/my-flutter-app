import 'package:eliachar_feig/models/user.dart';
import 'package:eliachar_feig/packages/default_packages.dart';
import 'package:eliachar_feig/packages/ui_components_packages.dart';

class AccountForm extends StatefulWidget {
  const AccountForm({super.key});

  @override
  AccountFormState createState() => AccountFormState();
}

class AccountFormState extends State<AccountForm> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late AccountType selectedAccountType;

  @override
  void initState() {
    super.initState();
    final user = context.read<UserProvider>().user;
    firstNameController = TextEditingController(text: user.firstName);
    lastNameController = TextEditingController(text: user.lastName);
    emailController = TextEditingController(text: user.email);
    phoneController = TextEditingController(text: user.phone);
    addressController = TextEditingController(text: user.address);
    selectedAccountType = user.accountType;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;

    return Scaffold(
      backgroundColor: context.scaffoldColor,
      appBar: WidgetStyling.buildTopAppBar(
        title: "${"account".translate(context)} ${"form".translate(context)}",
        showLogoIcon: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                WidgetStyling.buildPageTitle("${"account".translate(context)} ${"form".translate(context)}"),
                const SizedBox(height: 16),
                TextFormField(
                  controller: firstNameController,
                  decoration: InputDecoration(labelText: "First Name"),
                  validator: (value) => value!.isEmpty ? "Enter First Name" : null,
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: lastNameController,
                  decoration: InputDecoration(labelText: "Last Name"),
                  validator: (value) => value!.isEmpty ? "Enter Last Name" : null,
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: "Email"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => value!.isEmpty || !value.contains("@") ? "Enter valid Email" : null,
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: "Phone"),
                  keyboardType: TextInputType.phone,
                  validator: (value) => value!.isEmpty ? "Enter Phone" : null,
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(labelText: "Address"),
                  validator: (value) => value!.isEmpty ? "Enter Address" : null,
                ),
                SizedBox(height: 15),
                DropdownButtonFormField<AccountType>(
                  value: selectedAccountType,
                  dropdownColor: context.theme.dropdownMenuTheme.menuStyle?.backgroundColor?.resolve({}),
                  decoration: InputDecoration(
                    labelText: "Account Type",
                  ),
                  items: AccountType.values.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Row(
                        children: [
                          Text(type.displayName),
                          if (type == selectedAccountType)
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Icon(Icons.check, color: isDarkMode ? Colors.white : Colors.black),
                            ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedAccountType = newValue!;
                    });
                  },
                ),
                SizedBox(height: 20),
                WideRectButton(
                  text: "Save".translate(context),
                  textColor: isDarkMode ? Colors.black : Colors.white,
                  borderColor: isDarkMode ? Colors.white : Colors.black,
                  bgColor: isDarkMode ? Colors.white : Colors.black,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      context.read<UserProvider>().updateUser(
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            address: addressController.text,
                            accountType: selectedAccountType,
                          );
                      Navigator.pop(context);
                      WidgetStyling.showSnackBar(context: context, text: "Saved Successfully");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
