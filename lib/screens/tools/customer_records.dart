import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../theme/app_theme.dart';
import '../../widgets/buttons/app_buttons.dart';
import '../../widgets/common/app_cards.dart';
import '../../widgets/common/app_input.dart';
import '../../widgets/common/empty_states.dart';
import 'tool_page.dart';

class _Customer {
  final String name;
  final String phone;
  final String plan;
  final String date;
  _Customer(this.name, this.phone, this.plan, this.date);

  Map<String, dynamic> toMap() =>
      {'name': name, 'phone': phone, 'plan': plan, 'date': date};
  factory _Customer.fromMap(Map<String, dynamic> m) =>
      _Customer(m['name'], m['phone'], m['plan'], m['date']);
}

class CustomerRecords extends StatefulWidget {
  const CustomerRecords({super.key});

  @override
  State<CustomerRecords> createState() => _CustomerRecordsState();
}

class _CustomerRecordsState extends State<CustomerRecords> {
  static const _key = 'customer_records';
  List<_Customer> _customers = [];
  SharedPreferences? _prefs;
  String _query = '';
  final _searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    _prefs = await SharedPreferences.getInstance();
    final raw = _prefs!.getString(_key);
    if (raw != null) {
      _customers = (jsonDecode(raw) as List)
          .map((e) => _Customer.fromMap(e as Map<String, dynamic>))
          .toList();
    }
    setState(() {});
  }

  Future<void> _save() async {
    await _prefs?.setString(
        _key, jsonEncode(_customers.map((c) => c.toMap()).toList()));
  }

  List<_Customer> get _filtered => _customers
      .where((c) =>
          _query.isEmpty ||
          c.name.toLowerCase().contains(_query.toLowerCase()) ||
          c.phone.contains(_query))
      .toList();

  void _addCustomer() {
    final name = TextEditingController();
    final phone = TextEditingController();
    final plan = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          decoration: BoxDecoration(
            color: AppPalette.of(context).isDark
                ? const Color(0xFF10231A)
                : Colors.white,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(28)),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Add Customer', style: AppText.heading(context, size: 20)),
              const SizedBox(height: 20),
              GlassTextField(
                  label: 'Name', hint: 'Customer name', controller: name),
              const SizedBox(height: 14),
              GlassTextField(
                  label: 'Phone',
                  hint: 'Phone number',
                  controller: phone,
                  keyboardType: TextInputType.phone),
              const SizedBox(height: 14),
              GlassTextField(
                  label: 'Usual Plan',
                  hint: 'e.g. MTN 10GB monthly',
                  controller: plan),
              const SizedBox(height: 20),
              PrimaryButton(
                label: 'Save Customer',
                icon: Icons.check_rounded,
                onPressed: () {
                  if (name.text.trim().isEmpty) return;
                  final now = DateTime.now();
                  setState(() {
                    _customers.insert(
                      0,
                      _Customer(
                        name.text.trim(),
                        phone.text.trim(),
                        plan.text.trim(),
                        '${now.day}/${now.month}/${now.year}',
                      ),
                    );
                  });
                  _save();
                  HapticFeedback.lightImpact();
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  void _delete(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppPalette.of(context).isDark
            ? const Color(0xFF12241A)
            : Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Text('Delete customer?',
            style: AppText.heading(context, size: 18)),
        content: Text('This will remove ${_filtered[index].name} permanently.',
            style: AppText.body(context, size: 14)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final target = _filtered[index];
              setState(() => _customers.remove(target));
              _save();
              Navigator.pop(context);
            },
            child: const Text('Delete',
                style: TextStyle(color: Color(0xFFEF4444))),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ToolPage(
      toolId: 'customers',
      title: 'Customer Records',
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
            child: GlassTextField(
              label: '',
              hint: 'Search customers...',
              controller: _searchCtrl,
              icon: Icons.search_rounded,
              onChanged: (v) => setState(() => _query = v),
            ),
          ),
          Expanded(
            child: _filtered.isEmpty
                ? EmptyState(
                    icon: Icons.contacts_rounded,
                    title: _query.isEmpty
                        ? 'No customers yet'
                        : 'No matches found',
                    message: _query.isEmpty
                        ? 'Add your customers to remember their usual plans and '
                            'serve them faster.'
                        : 'Try a different name or number.',
                  )
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
                    itemCount: _filtered.length,
                    itemBuilder: (context, i) {
                      final c = _filtered[i];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: GlassCard(
                          padding: const EdgeInsets.all(14),
                          radius: 16,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 22,
                                backgroundColor: AppColors.accentEmerald
                                    .withValues(alpha: 0.15),
                                child: Text(
                                  c.name.isEmpty
                                      ? '?'
                                      : c.name[0].toUpperCase(),
                                  style: AppText.heading(context,
                                      size: 16,
                                      color: AppColors.accentEmerald),
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(c.name,
                                        style: AppText.heading(context,
                                            size: 15)),
                                    const SizedBox(height: 2),
                                    Text(
                                        '${c.phone}${c.plan.isNotEmpty ? ' • ${c.plan}' : ''}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            AppText.label(context, size: 12)),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () => _delete(i),
                                child: Icon(Icons.delete_outline_rounded,
                                    color:
                                        AppPalette.of(context).textSecondary),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: PrimaryButton(
              label: 'Add Customer',
              icon: Icons.person_add_alt_1_rounded,
              onPressed: _addCustomer,
            ),
          ),
        ],
      ),
    );
  }
}
