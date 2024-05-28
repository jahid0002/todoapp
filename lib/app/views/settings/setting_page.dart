import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/app/global_widgets/global_appbar.dart';
import 'package:todoapp/app/global_widgets/global_settings_tile.dart';

import '../../bloc/settings_bloc/bloc/settings_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    context.read<SettingsBloc>().add(GetTheme());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: const GlobalAppbar(
        title: 'Settings',
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
                bool isDark =
                    state is SettingsGetDataState ? state.isDark : true;

                return GlobalSettingsTile(
                  icon: Icons.dark_mode,
                  title: 'Dark Theme',
                  traling: Switch(
                    value: isDark,
                    onChanged: (value) {
                      print(isDark);
                      context
                          .read<SettingsBloc>()
                          .add(UpdateTheme(isDark: isDark ? false : true));
                      context.read<SettingsBloc>().add(GetTheme());
                    },
                    activeColor: Theme.of(context).hintColor,
                    activeTrackColor: Theme.of(context).cardColor,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
