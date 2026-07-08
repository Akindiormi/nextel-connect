import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/buttons/app_buttons.dart';
import '../../widgets/common/app_cards.dart';
import '../../widgets/common/screen_scaffold.dart';
import '../../widgets/common/section_header.dart';
import '../community/community_screen.dart';

class ExpertTip {
  final String category;
  final String title;
  final String body;
  final Color color;
  const ExpertTip(this.category, this.title, this.body, this.color);
}

const List<ExpertTip> _tips = [
  ExpertTip('Airtime', 'Never chase the biggest discount blindly',
      'A platform offering an extra half percent discount is worthless if it '
          'fails transactions during your busiest hours. Your customers judge '
          'you by reliability, not by the rate you buy at. Choose the platform '
          'that delivers instantly and supports you when something goes wrong, '
          'even if its discount is slightly smaller. The trust you keep is worth '
          'far more than the fraction you save.',
      AppColors.accentEmerald),
  ExpertTip('Data', 'Lead with data, follow with airtime',
      'Data margins can be several times airtime margins for roughly the same '
          'effort and customer base. Once your airtime service is reliable, '
          'actively introduce data to every customer. Learn the best-value '
          'bundles on each network so you can advise honestly. Customers who buy '
          'data from you repeat on a predictable monthly cycle, giving you more '
          'stable, higher-margin revenue than airtime alone ever will.',
      AppColors.secondaryGreen),
  ExpertTip('Marketing', 'Your WhatsApp status is a daily shopfront',
      'You already have the most powerful free marketing channel in your pocket. '
          'Post your available plans, prices and a simple call to action every '
          'single day. Consistency matters more than cleverness — showing up daily '
          'keeps you top of mind so that whenever anyone in your contacts needs '
          'airtime or data, you are the first person they think of.',
      AppColors.gold),
  ExpertTip('Finance', 'Keep three separate money buckets',
      'Float, profit and personal money must never blur into one pool. Your '
          'float is working capital to be protected and replenished; profit is '
          'what you earn on top; personal money is a deliberate amount you pay '
          'yourself. New sellers fail when they spend their float believing it is '
          'profit. Keep a dedicated business account and reconcile daily so you '
          'always know your true position.',
      AppColors.primaryDark),
  ExpertTip('Customer Service', 'Win loyalty in the moment things go wrong',
      'How you handle a failed or delayed transaction defines your reputation '
          'more than a hundred smooth sales. When a customer is anxious about '
          'their money, stay calm, investigate immediately, communicate clearly '
          'and make it right. A problem handled well often builds deeper loyalty '
          'than flawless service, because it proves you can be trusted when it '
          'truly matters.',
      AppColors.accentEmerald),
  ExpertTip('Data', 'Match the bundle to real usage, not the biggest sale',
      'When you honestly recommend the plan that fits how a customer actually '
          'uses their phone, you stop being a vendor and become an adviser. '
          'Advisers keep customers for years. The small sale you lose by not '
          'upselling is repaid many times over by the loyalty and referrals that '
          'honesty earns you.',
      AppColors.secondaryGreen),
];

class FaqItem {
  final String question;
  final String answer;
  const FaqItem(this.question, this.answer);
}

const List<FaqItem> _faqs = [
  FaqItem(
    'How do I start an airtime business?',
    'Starting an airtime business is genuinely accessible. Begin by choosing a '
        'short, memorable business name and opening a dedicated bank account so '
        'your business money never mixes with personal spending. Next, select a '
        'reliable Virtual Top-Up (VTU) platform — judge it on reliability and '
        'support quality, not just the discount rate — register your business, '
        'and fund a starting wallet you can comfortably afford. Practise test '
        'transactions on all four networks until dispensing value is fast and '
        'automatic. Draft a clear price list, keeping airtime at face value since '
        'you profit from the buying discount, not a markup. Then make your first '
        'sales to people who already trust you, record every transaction, and '
        'deliver fast, friendly service. Registering with the CAC as you grow '
        'builds credibility and unlocks better supplier terms. The key is to '
        'start small, stay disciplined about records and credit, and reinvest '
        'your margins steadily.',
  ),
  FaqItem(
    'How much capital do I need?',
    'There is no fixed entry price, which is part of what makes this business so '
        'accessible. You can begin with as little as a few thousand naira loaded '
        'onto a VTU platform and grow from there, or start with more if you have '
        'it and move serious volume immediately. What matters is matching your '
        'starting float to the volume you realistically expect to dispense, plus '
        'a small buffer for busy days. Beyond the float itself, budget modestly '
        'for business registration, data for running your operation, and simple '
        'branding. Avoid borrowing heavily to inflate your float before you have '
        'proven there is demand for your service. The smartest approach is to '
        'start with what you can afford to risk, prove the model works, then '
        'reinvest a consistent share of your profit to grow your float and add '
        'higher-margin services like data over time. Consistency compounds small '
        'capital into a substantial business.',
  ),
  FaqItem(
    'How do I find suppliers?',
    'Your suppliers are the VTU platforms, super-dealers and SME data sources '
        'you buy from, and they are the backbone of your ability to serve '
        'customers. Research reputable platforms by asking other resellers about '
        'their real experience with reliability, delivery speed and support. '
        'Compare candidates on discount rates across each network, uptime, the '
        'responsiveness of their support when a transaction hangs, and their '
        'funding options. The wise principle is to find suppliers before you '
        'urgently need them: cultivate at least one reliable primary supplier and '
        'a funded backup so that if your main platform goes down during peak '
        'hours, you can still serve customers. Build these relationships the way '
        'you build customer loyalty — by paying promptly, communicating clearly, '
        'and growing your volume with those who serve you well, since higher '
        'volume often unlocks better discount tiers and terms over time.',
  ),
  FaqItem(
    'What are the risks?',
    'Telecom reselling is a relatively low-risk business because your stock is '
        'electronic value that never spoils or goes out of fashion, but real '
        'risks remain and knowing them lets you manage them. The most common is '
        'uncontrolled credit: giving airtime or data to friends and customers who '
        'delay or refuse to pay quietly drains your thin capital, so sell on cash '
        'or confirmed transfer, especially early on. Operational risks include '
        'sending value to the wrong number — always confirm before dispensing — '
        'and platform downtime, which a reliable primary supplier and a backup '
        'help mitigate. Thin margins mean poor record-keeping can hide losses, so '
        'reconcile daily. As you scale, watch for fraud from customers, '
        'sub-dealers or staff, and protect yourself with verification, credit '
        'limits and clean records. None of these risks are unmanageable; discipline '
        'and good habits keep them small and your business healthy.',
  ),
  FaqItem(
    'How do I get customers?',
    'Your first customers come from people who already trust you: family, '
        'friends, classmates, colleagues and neighbours. Let everyone in your '
        'circle know what you do and make buying from you effortless, then deliver '
        'flawlessly so they become your first advocates. Your most powerful free '
        'channel is your WhatsApp status — post your plans, prices and a simple '
        'call to action consistently so you stay top of mind. Ask satisfied '
        'customers directly for referrals, since a recommendation from someone '
        'they trust is worth more than any advert and costs nothing but the good '
        'service that earned it. Show up helpfully in local and online communities '
        'where your customers gather, without spamming. Above all, win on '
        'reliability and honest advice: when you never fail a transaction and '
        'recommend what genuinely suits each customer, you turn one-time buyers '
        'into loyal regulars whose repeat business and referrals grow your base '
        'steadily over time.',
  ),
];

class KnowledgeSession {
  final String topic;
  final String description;
  final String day;
  const KnowledgeSession(this.topic, this.description, this.day);
}

const List<KnowledgeSession> _sessions = [
  KnowledgeSession('Choosing the Right VTU Platform',
      'What to look for and common mistakes to avoid.', 'This week'),
  KnowledgeSession('Data Reselling Deep Dive',
      'SME data, sourcing and pricing for profit.', 'Next week'),
  KnowledgeSession('WhatsApp Marketing Clinic',
      'Turn your status and broadcasts into sales.', 'In 2 weeks'),
];

class MentorshipScreen extends StatelessWidget {
  const MentorshipScreen({super.key});

  void _openTip(BuildContext context, ExpertTip tip) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: AppPalette.of(context).isDark
              ? const Color(0xFF10231A)
              : Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppPalette.of(context)
                      .textSecondary
                      .withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            GlassPill(
              color: tip.color.withValues(alpha: 0.15),
              child: Text(tip.category,
                  style: AppText.label(context, size: 12, color: tip.color)),
            ),
            const SizedBox(height: 14),
            Text(tip.title, style: AppText.heading(context, size: 20)),
            const SizedBox(height: 12),
            Text(tip.body, style: AppText.body(context, size: 15)),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: GlassAppBar(
        leading: const GlassBackButton(),
        title: 'Mentorship',
      ),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
          children: [
            Text('Learn from the Best',
                style: AppText.display(context, size: 26)),
            const SizedBox(height: 4),
            Text('Expert tips, answers and knowledge sessions',
                style: AppText.body(context, size: 14)),
            const SizedBox(height: 24),

            SectionHeader(title: 'Expert Tips Library'),
            SizedBox(
              height: 170,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _tips.length,
                separatorBuilder: (_, __) => const SizedBox(width: 14),
                itemBuilder: (context, i) {
                  final tip = _tips[i];
                  return SizedBox(
                    width: 250,
                    child: GlassCard(
                      onTap: () => _openTip(context, tip),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GlassPill(
                            color: tip.color.withValues(alpha: 0.15),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            child: Text(tip.category,
                                style: AppText.label(context,
                                    size: 11, color: tip.color)),
                          ),
                          const SizedBox(height: 12),
                          Text(tip.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppText.heading(context, size: 16)),
                          const SizedBox(height: 8),
                          Expanded(
                            child: Text(tip.body,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: AppText.body(context, size: 13)),
                          ),
                          Text('Read more',
                              style: AppText.label(context,
                                  size: 12, color: AppColors.accentEmerald)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            SectionHeader(title: 'Frequently Asked Questions'),
            ..._faqs.map((f) => _FaqTile(item: f)),
            const SizedBox(height: 24),

            SectionHeader(title: 'Upcoming Knowledge Sessions'),
            ..._sessions.map((s) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: GlassCard(
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color:
                                AppColors.gold.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Icon(Icons.event_rounded,
                              color: AppColors.gold),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(s.topic,
                                  style: AppText.heading(context, size: 15)),
                              const SizedBox(height: 2),
                              Text(s.description,
                                  style: AppText.body(context, size: 13)),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(s.day,
                            style: AppText.label(context,
                                size: 11, color: AppColors.accentEmerald)),
                      ],
                    ),
                  ),
                )),
            const SizedBox(height: 16),
            PrimaryButton(
              label: 'Join the Community',
              icon: Icons.groups_rounded,
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const CommunityScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FaqTile extends StatefulWidget {
  final FaqItem item;
  const _FaqTile({required this.item});

  @override
  State<_FaqTile> createState() => _FaqTileState();
}

class _FaqTileState extends State<_FaqTile> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GlassCard(
        onTap: () => setState(() => _open = !_open),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(widget.item.question,
                      style: AppText.heading(context, size: 15)),
                ),
                AnimatedRotation(
                  turns: _open ? 0.5 : 0,
                  duration: const Duration(milliseconds: 250),
                  child: const Icon(Icons.keyboard_arrow_down_rounded,
                      color: AppColors.accentEmerald),
                ),
              ],
            ),
            AnimatedCrossFade(
              firstChild: const SizedBox(width: double.infinity),
              secondChild: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(widget.item.answer,
                    style: AppText.body(context, size: 14)),
              ),
              crossFadeState: _open
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 250),
            ),
          ],
        ),
      ),
    );
  }
}
