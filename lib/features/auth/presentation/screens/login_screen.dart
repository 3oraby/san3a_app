import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:san3a_app/core/helpers/get_app_semantic_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final semanticColors = getAppSemanticColors(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              Text(
                "Welcome Back",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(height: 8.h),
              Text(
                "Sign in to continue",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 50.h),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Email Address",
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              SizedBox(height: 16.h),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: Icon(Icons.visibility_off_outlined),
                ),
              ),
              SizedBox(height: 16.h),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to Sign Up
                    },
                    child: Text(
                      "Sign Up",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: Text(
                  "Or sign in with",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: semanticColors.labelColor,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              // Placeholder for social login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton(
                    context,
                    Icons.g_mobiledata,
                  ), // Google placeholder
                  SizedBox(width: 16.w),
                  _buildSocialButton(context, Icons.apple), // Apple placeholder
                ],
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(BuildContext context, IconData icon) {
    return Container(
      width: 50.w,
      height: 50.w,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(icon, size: 24.sp),
    );
  }
}
