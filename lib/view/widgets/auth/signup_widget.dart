import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/view/screens/auth/login_screen.dart';
import 'package:flutter/services.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _BDController = TextEditingController();
  String _selectedCountryCode = '+962';
  String _selectedCountryFlag = '🇯🇴';
  String _selectedCountryName = 'Jordan';
  bool _obscurePassword = true;

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _BDController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  void _pickCountry() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        setState(() {
          _selectedCountryCode = '+${country.phoneCode}';
          _selectedCountryFlag = country.flagEmoji;
          _selectedCountryName = country.name;
        });
      },
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email (e.g. example@domain.com)';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }

    String digitsOnly = value.replaceAll(RegExp(r'[^0-9]'), '');

    switch (_selectedCountryCode) {
      case '+20':
        if (digitsOnly.length != 10) {
          return 'Egyptian number must be 10 digits';
        }
        if (!digitsOnly.startsWith('1')) {
          return 'Egyptian number must start with 1';
        }
        break;
      case '+962':
        if (digitsOnly.length != 9) {
          return 'Jordanian number must be 9 digits';
        }
        if (!digitsOnly.startsWith('7')) {
          return 'Jordanian number must start with 7';
        }
        break;
      case '+966':
        if (digitsOnly.length != 9) {
          return 'Saudi number must be 9 digits';
        }
        if (!digitsOnly.startsWith('5')) {
          return 'Saudi number must start with 5';
        }
        break;
      case '+971':
        if (digitsOnly.length != 9) {
          return 'UAE number must be 9 digits';
        }
        if (!digitsOnly.startsWith('5')) {
          return 'UAE number must start with 5';
        }
        break;
      default:
        if (digitsOnly.length < 6 || digitsOnly.length > 15) {
          return 'Phone number must be 6-15 digits';
        }
    }

    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain lowercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain number';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain special character';
    }
    return null;
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Your Name is required';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  String? _validateBD(String? value) {
    if (value == null || value.isEmpty) {
      return 'Birth Date is required';
    }
    try {
      final date = DateFormat('dd/MM/yyyy').parse(value);
      if (date.isAfter(DateTime.now())) {
        return 'Birth date cannot be in the future';
      }
      if (date.isBefore(DateTime.now().subtract(const Duration(days: 365 * 100))) ){
      return 'Please enter a valid birth date';
      }
      } catch (e) {
        return 'Invalid date format (DD/MM/YYYY)';
      }
      return null;
    }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                SizedBox(height: 5.h),
                Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                ),
                SizedBox(width: 5.w),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              'Full Name',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5.h),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Enter Your Full Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              validator: _validateName,
            ),
            SizedBox(height: 15.h),
            Text(
              'Email',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5.h),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'example@domain.com',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: _validateEmail,
            ),
            SizedBox(height: 15.h),

            Text(
              'Birth Date',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5.h),
            TextFormField(
              controller: _BDController,
              decoration: InputDecoration(
                hintText: 'DD/MM/YYYY',
                suffixIcon: Icon(Icons.calendar_today, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              readOnly: true,
              onTap: () => _selectDate(context),
              validator: _validateBD,
            ),
            SizedBox(height: 15.h),
            Text(
              'Phone Number',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                GestureDetector(
                  onTap: _pickCountry,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(_selectedCountryFlag, style: TextStyle(fontSize: 20.sp)),
                        SizedBox(width: 8.w),
                        Text(_selectedCountryCode),
                        Text(_selectedCountryName)
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      hintText: 'Enter phone number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(15),
                    ],
                    validator: _validatePhone,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            // Password Field
            Text(
              'Set Password',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5.h),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Enter a strong password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              obscureText: _obscurePassword,
              validator: _validatePassword,
            ),
            SizedBox(height: 25.h),
            // Register Button
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String fullPhone = _selectedCountryCode + _phoneController.text;
                    print('Registered with: $fullPhone');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 18.sp, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}