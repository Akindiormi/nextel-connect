import 'package:flutter/material.dart';
import '../../services/progress_service.dart';
import '../../widgets/common/screen_scaffold.dart';

/// Shared page wrapper for every business tool. Records tool usage (awarding
/// +5 XP the first time a given tool is opened) and provides the glass app bar.
class ToolPage extends StatefulWidget {
  final String toolId;
  final String title;
  final Widget body;
  const ToolPage({
    super.key,
    required this.toolId,
    required this.title,
    required this.body,
  });

  @override
  State<ToolPage> createState() => _ToolPageState();
}

class _ToolPageState extends State<ToolPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ProgressService.instance.useTool(widget.toolId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: GlassAppBar(
        leading: const GlassBackButton(),
        title: widget.title,
      ),
      body: SafeArea(top: false, child: widget.body),
    );
  }
}
