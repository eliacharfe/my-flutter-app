import 'package:eliachar_feig/models/user.dart';
import 'package:eliachar_feig/packages/ui_components_packages.dart';
import 'package:eliachar_feig/screens/settings/widgets/account_form.dart';
import '../../../packages/default_packages.dart';

class AccountSettingsPage extends StatefulWidget {
  const AccountSettingsPage({super.key});

  @override
  AccountSettingsPageState createState() => AccountSettingsPageState();
}

class AccountSettingsPageState extends State<AccountSettingsPage> {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;

    return Scaffold(
      backgroundColor: context.scaffoldColor,
      appBar: WidgetStyling.buildTopAppBar(
        title: "account".translate(context),
        showLogoIcon: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(RouteWrapper(
                page: AccountForm(),
              ));
            },
            icon: const Icon(Icons.edit_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetStyling.buildPageTitle("account".translate(context)),
            const SizedBox(height: 16),
            _buildReadOnlyField(context, label: "First Name", value: user.firstName),
            SizedBox(height: 15),
            _buildReadOnlyField(context, label: "Last Name", value: user.lastName),
            SizedBox(height: 15),
            _buildReadOnlyField(context, label: "Email", value: user.email),
            SizedBox(height: 15),
            _buildReadOnlyField(context, label: "Phone", value: user.phone),
            SizedBox(height: 15),
            _buildReadOnlyField(context, label: "Address", value: user.address),
            SizedBox(height: 15),
            _buildReadOnlyField(context, label: "Account Type", value: user.accountType.displayName),
          ],
        ),
      ),
    );
  }

  Widget _buildReadOnlyField(BuildContext context, {required String label, required String value}) {
    return TextField(
      readOnly: true,
      controller: TextEditingController(text: value),
      decoration: InputDecoration(
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
      ),
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
