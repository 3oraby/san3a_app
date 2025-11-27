import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a_app/core/cubits/app_theme_cubit/app_theme_cubit.dart';
import 'package:san3a_app/core/enums/app_theme_mode.dart';
import 'package:san3a_app/core/helpers/get_app_semantic_colors.dart';

class TestThemeScreen extends StatelessWidget {
  const TestThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final semanticColors = getAppSemanticColors(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Dynamic Text Theme Test")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final cubit = context.read<AppThemeCubit>();
          if (cubit.currentTheme == AppThemeMode.light) {
            cubit.changeTheme(AppThemeMode.dark);
          } else {
            cubit.changeTheme(AppThemeMode.light);
          }
        },
        child: const Icon(Icons.brightness_6),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "This screen demonstrates automatic text color switching.",
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dynamic Custom Color (Alert Red)",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: semanticColors.alertColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "The title above is bright red in Light Mode and dark red in Dark Mode, automatically.",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const Divider(),
          _buildTextStyleItem(
            context,
            "Display Large",
            Theme.of(context).textTheme.displayLarge,
          ),
          _buildTextStyleItem(
            context,
            "Display Medium",
            Theme.of(context).textTheme.displayMedium,
          ),
          _buildTextStyleItem(
            context,
            "Display Small",
            Theme.of(context).textTheme.displaySmall,
          ),
          const Divider(),
          _buildTextStyleItem(
            context,
            "Headline Large",
            Theme.of(context).textTheme.headlineLarge,
          ),
          _buildTextStyleItem(
            context,
            "Headline Medium",
            Theme.of(context).textTheme.headlineMedium,
          ),
          _buildTextStyleItem(
            context,
            "Headline Small",
            Theme.of(context).textTheme.headlineSmall,
          ),
          const Divider(),
          _buildTextStyleItem(
            context,
            "Title Large",
            Theme.of(context).textTheme.titleLarge,
          ),
          _buildTextStyleItem(
            context,
            "Title Medium",
            Theme.of(context).textTheme.titleMedium,
          ),
          _buildTextStyleItem(
            context,
            "Title Small",
            Theme.of(context).textTheme.titleSmall,
          ),
          const Divider(),
          _buildTextStyleItem(
            context,
            "Body Large",
            Theme.of(context).textTheme.bodyLarge,
          ),
          _buildTextStyleItem(
            context,
            "Body Medium",
            Theme.of(context).textTheme.bodyMedium,
          ),
          _buildTextStyleItem(
            context,
            "Body Small",
            Theme.of(context).textTheme.bodySmall,
          ),
          const Divider(),
          _buildTextStyleItem(
            context,
            "Label Large",
            Theme.of(context).textTheme.labelLarge,
          ),
          _buildTextStyleItem(
            context,
            "Label Medium",
            Theme.of(context).textTheme.labelMedium,
          ),
          _buildTextStyleItem(
            context,
            "Label Small",
            Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }

  Widget _buildTextStyleItem(
    BuildContext context,
    String name,
    TextStyle? style,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: Theme.of(
              context,
            ).textTheme.labelSmall?.copyWith(color: Colors.grey),
          ),
          Text("The quick brown fox jumps over the lazy dog", style: style),
        ],
      ),
    );
  }
}
