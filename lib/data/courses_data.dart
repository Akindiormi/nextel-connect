import 'package:flutter/material.dart';
import '../models/course.dart';
import '../models/lesson.dart';

// =============================================================================
// COURSE CONTENT
//
// All content is original educational material written around the Nigerian
// telecom reseller market. Figures cited (market size, subscriber counts,
// operator share) are widely reported industry estimates used here for
// teaching context, not financial advice. This app makes no income promises.
// =============================================================================

// Reusable quiz bank helper keeps question construction terse.
QuizQuestion _q(String question, List<String> options, int correct,
        [String explain = '']) =>
    QuizQuestion(
        question: question,
        options: options,
        correctIndex: correct,
        explanation: explain);

// Compact lesson builder for the remaining lessons and courses.
Lesson _lesson(
  String courseId,
  int index,
  String title,
  int minutes,
  List<String> paragraphs, {
  List<KeyConcept> concepts = const [],
  List<String> steps = const [],
  List<String> takeaways = const [],
  List<QuizQuestion> quiz = const [],
}) =>
    Lesson(
      id: '${courseId}l$index',
      courseId: courseId,
      index: index,
      title: title,
      readingMinutes: minutes,
      paragraphs: paragraphs,
      keyConcepts: concepts,
      actionSteps: steps,
      keyTakeaways: takeaways,
      quiz: quiz,
    );

// ---------------------------------------------------------------------------
// COURSE 1 — Telecom Business Fundamentals (20 lessons)
// ---------------------------------------------------------------------------

final Course _course1 = Course(
  id: 'c1',
  title: 'Telecom Business Fundamentals',
  description:
      'The complete ground-up foundation for anyone entering the Nigerian '
      'telecom reselling space. Understand the market, the money, and the '
      'moves that build a lasting business.',
  category: 'Beginners',
  difficulty: Difficulty.beginner,
  icon: Icons.cell_tower_rounded,
  durationMinutes: 180,
  order: 1,
  lessons: [
    Lesson(
      id: 'c1l1',
      courseId: 'c1',
      index: 1,
      title: 'What is the Telecom Industry?',
      readingMinutes: 6,
      paragraphs: [
        'The telecommunications industry is the invisible engine behind almost '
            'everything you do on your phone. Every call you make, every message '
            'you send, every naira of airtime you buy and every gigabyte of data '
            'you burn travels through infrastructure owned and operated by '
            'licensed telecom companies. In Nigeria, this is one of the largest '
            'and fastest growing sectors of the entire economy, and understanding '
            'how it works is the first step to building a business inside it.',
        'Nigeria\'s telecom story began in earnest in 2001, when the Nigerian '
            'Communications Commission (NCC) auctioned the first GSM licences. '
            'Before that year, the country had fewer than half a million working '
            'phone lines for a population of over 100 million. Getting a landline '
            'could take years and often required a bribe. When MTN and the other '
            'operators switched on their networks, the change was explosive. '
            'Within two decades Nigeria grew to more than 220 million active '
            'mobile lines. The sector is now valued in the region of nine trillion '
            'naira and contributes roughly 14 to 16 percent of national GDP, '
            'making it one of the biggest non-oil contributors to the economy.',
        'Four major operators dominate the market. MTN Nigeria is the largest, '
            'usually holding around 38 percent of subscribers, followed by Globacom '
            '(Glo), Airtel, and 9mobile, which has shrunk considerably from its '
            'Etisalat days. These are the mobile network operators, or MNOs. They '
            'own the licences, the spectrum, the base stations and the billing '
            'systems. Building and running that infrastructure costs hundreds of '
            'billions of naira, which is why only a handful of companies operate at '
            'that level. But here is the crucial insight for you: the operators do '
            'not sell most of their airtime and data directly. They rely on a vast '
            'chain of distributors, dealers, agents and resellers to reach the '
            'streets.',
        'This is the reseller ecosystem, and it is where the small entrepreneur '
            'fits in. The NCC regulates the whole market, setting rules on pricing, '
            'quality of service, SIM registration and consumer protection. Below '
            'the operators sit the super-dealers who buy airtime and data in huge '
            'volumes at a discount. Below them are sub-dealers and aggregators, and '
            'below them are the thousands of ordinary Nigerians who sell recharge, '
            'transfer data and register SIMs in every market, street corner and '
            'WhatsApp group in the country. Each layer buys at a discount and sells '
            'at a small margin, and the volume is enormous.',
        'Why does this matter to you? Because you do not need a telecom licence, '
            'a mast, or millions in capital to participate. You need to understand '
            'where in the chain you can plug in, buy at a discount, and serve '
            'customers reliably. A student selling airtime from a WhatsApp status, '
            'a shop owner running a Virtual Top-Up (VTU) terminal, an agent doing '
            'SIM registration and a data sub-dealer supplying smaller sellers are '
            'all businesses built on the same foundation. The telecom industry is '
            'not just the four big companies you see on billboards. It is a living '
            'pyramid of value, and there is room near the bottom for anyone willing '
            'to learn the rules and serve people well.',
        'Throughout this course we will move from this big picture down to the '
            'practical mechanics: how airtime is generated, how data is packaged, '
            'how margins work at each level, how to register a business, how to set '
            'prices, and how to keep customers coming back. By the end you will '
            'understand the industry not as a consumer but as an operator who knows '
            'exactly how the money moves and where you can earn your share of it '
            'honestly and sustainably.',
      ],
      keyConcepts: [
        KeyConcept('Mobile Network Operator (MNO)',
            'The licensed companies (MTN, Glo, Airtel, 9mobile) that own the network infrastructure and spectrum.'),
        KeyConcept('The NCC',
            'The Nigerian Communications Commission regulates licensing, pricing, quality and SIM registration.'),
        KeyConcept('The Reseller Ecosystem',
            'The chain of dealers, agents and resellers that distributes airtime and data from operators to end users.'),
      ],
      actionSteps: [
        'Write down the four major Nigerian operators and guess their market share order.',
        'Identify three airtime or data sellers you already know in your area.',
        'Note which layer of the ecosystem each of them likely operates in.',
        'Decide which entry point feels most realistic for you to start with.',
      ],
      keyTakeaways: [
        'Nigerian telecom is a ~N9 trillion sector contributing 14–16% of GDP.',
        'Operators rely on a huge reseller chain rather than selling everything directly.',
        'Small entrepreneurs plug into that chain without needing a licence or heavy capital.',
        'Understanding where the money moves is the foundation of the whole business.',
      ],
      quiz: [
        _q('In what year were Nigeria\'s first GSM licences auctioned?',
            ['1999', '2001', '2005', '2010'], 1,
            'The NCC auctioned the first GSM licences in 2001, transforming the market.'),
        _q('Which operator typically holds the largest market share?',
            ['Glo', '9mobile', 'MTN', 'Airtel'], 2),
        _q('What does NCC stand for?', [
          'National Cellular Council',
          'Nigerian Communications Commission',
          'Network Carrier Consortium',
          'Nigerian Connectivity Corporation'
        ], 1),
        _q('Where does the small entrepreneur fit in telecom?',
            ['As a licensed operator', 'Building masts', 'In the reseller ecosystem', 'Nowhere'], 2),
        _q('Roughly what share of GDP does telecom contribute?',
            ['1–2%', '5%', '14–16%', '40%'], 2),
      ],
    ),
    Lesson(
      id: 'c1l2',
      courseId: 'c1',
      index: 2,
      title: 'How Airtime Works in Nigeria',
      readingMinutes: 6,
      paragraphs: [
        'Airtime feels simple to the end user. You dial a code or tap an app, '
            'your balance goes up, and you can call or browse. But behind that '
            'simple experience is a distribution chain worth trillions of naira, '
            'and every link in that chain earns a margin. If you want to build a '
            'business selling airtime, you must understand exactly how it is '
            'generated and how it flows from the operator all the way to the person '
            'recharging fifty naira on the street.',
        'At the top, airtime is simply electronic value created by the operator\'s '
            'billing system. When MTN or Glo issues airtime, they are crediting '
            'their own system with sellable value. They release this value in bulk '
            'to their biggest partners, the super-dealers, at a discount. A '
            'super-dealer might buy one hundred million naira of airtime and '
            'receive it at, say, a three to five percent discount. That discount is '
            'their entire profit engine. They never mark the airtime up above face '
            'value, because a customer will always pay exactly the denomination. '
            'Instead, everyone in the chain earns from the discount they receive '
            'when buying.',
        'This is the single most important concept in airtime reselling: you do '
            'not sell airtime above its face value. A one hundred naira recharge '
            'sells for one hundred naira. You make money because you bought that '
            'one hundred naira of value for slightly less than one hundred naira. '
            'The super-dealer passes a smaller discount down to sub-dealers, who '
            'pass an even smaller one down to retailers and VTU sellers. By the '
            'time value reaches the street-level seller, the discount might be two '
            'to four percent depending on the network and the volume committed.',
        'There are two main forms of airtime. The first is the traditional '
            'physical recharge card, the scratch card printed with a hidden pin. '
            'These are still sold but are declining because of printing costs, '
            'theft and expiry risk. The second, now dominant, is Virtual Top-Up or '
            'VTU. With VTU, you load electronic value onto a platform and dispense '
            'it instantly to any number by transfer, USSD or an app. VTU is faster, '
            'has no printing cost, no expiry, and lets you serve customers anywhere '
            'in the country from your phone. Almost every serious modern airtime '
            'business runs on VTU.',
        'VTU platforms are the technology layer that makes street-level airtime '
            'selling possible. A VTU platform aggregates airtime and data from all '
            'the networks and lets you buy wallet value once, then dispense it '
            'across MTN, Glo, Airtel and 9mobile from a single balance. Good '
            'platforms give better discounts, instant delivery, and reliable '
            'customer support. Choosing the right platform, which we cover later in '
            'this course, directly affects your margins and your reputation, because '
            'a failed or delayed transaction is your problem to resolve with the '
            'customer, not the network\'s.',
        'Understanding these margins is what separates a hobby from a business. If '
            'you buy airtime at a three percent discount and sell at face value, you '
            'earn three naira on every hundred naira dispensed. That sounds tiny, '
            'and on a single sale it is. But volume changes everything. A seller '
            'moving three hundred thousand naira of airtime a month at three percent '
            'earns nine thousand naira in margin, and a busy VTU point in a market '
            'can move far more than that. This is a volume business built on trust '
            'and speed, not on big markups. Master the flow of airtime, choose your '
            'platform wisely, and you have the first real pillar of a telecom '
            'reselling business.',
      ],
      keyConcepts: [
        KeyConcept('Face Value Rule',
            'Airtime always sells at its denomination. Profit comes from the discount you buy at, never a markup.'),
        KeyConcept('Virtual Top-Up (VTU)',
            'Electronic airtime dispensed instantly from a wallet to any number, now the dominant form of resale.'),
        KeyConcept('The Discount Chain',
            'Discounts shrink from super-dealer to sub-dealer to retailer; volume, not markup, drives earnings.'),
      ],
      actionSteps: [
        'Explain in one sentence why you cannot sell airtime above face value.',
        'List two disadvantages of physical recharge cards versus VTU.',
        'Calculate the margin on N500,000 monthly volume at a 3% discount.',
        'Search for two VTU platforms and note the discounts they advertise.',
      ],
      keyTakeaways: [
        'Airtime is electronic value released in bulk to dealers at a discount.',
        'You earn from the buying discount, never by selling above face value.',
        'VTU has largely replaced physical cards for speed and zero expiry.',
        'It is a volume business — small margins multiplied by high turnover.',
      ],
    ),
    Lesson(
      id: 'c1l3',
      courseId: 'c1',
      index: 3,
      title: 'Understanding Data Plans',
      readingMinutes: 6,
      paragraphs: [
        'If airtime is the entry drug of telecom reselling, data is where the real '
            'margins live. Nigerians consume enormous amounts of mobile data, from '
            'students streaming lectures to traders running WhatsApp shops to '
            'families watching video. Data is packaged, priced and discounted very '
            'differently from airtime, and understanding those differences is what '
            'lets a smart reseller earn far more per transaction than airtime alone '
            'could ever provide.',
        'Data is sold in bundles: a fixed volume of megabytes or gigabytes valid '
            'for a set period, from daily plans to monthly and even yearly plans. '
            'Operators price these bundles to encourage larger commitments, so the '
            'cost per gigabyte usually falls as the bundle size grows. A one-day one '
            'gigabyte plan is expensive per gigabyte; a thirty-day forty gigabyte '
            'plan is far cheaper per gigabyte. This tiering creates the opportunity '
            'for resellers, because the discounts available on certain data types '
            'are much larger than on airtime.',
        'The most important distinction for a reseller is between direct network '
            'data and SME data. Direct data is what a customer buys straight from '
            'the network at standard retail prices. SME data, sometimes called '
            'gifting data or corporate data, is a special category the operators '
            'created for small and medium enterprises to share data among staff. '
            'Resellers buy SME data in bulk at a steep discount and transfer it to '
            'customers as a bundle. The margins on SME data are typically much '
            'better than airtime, often in the range of ten to twenty percent or '
            'more depending on the network and volume, which is why experienced '
            'sellers push data hard.',
        'Different networks have different strengths. MTN SME data is extremely '
            'popular because of network coverage; Glo often offers the most '
            'generous volumes per naira; Airtel sits in between with strong data '
            'quality in cities. Data rollover policies also matter to customers: '
            'some plans let unused data carry over when you renew before expiry, '
            'which is a selling point you can highlight. Knowing which plans give '
            'the best value on each network lets you advise customers honestly and '
            'become the person they trust to recommend the right bundle, not just '
            'the biggest one.',
        'Profit margins in data reselling are the reason many operators of small '
            'telecom businesses eventually shift most of their focus to data. '
            'Consider the arithmetic. Selling airtime at three percent means N3 on '
            'every N100. Selling SME data at fifteen percent means N15 on every '
            'N100 of value moved. The same effort and roughly the same customer '
            'base can produce several times the margin simply by steering people '
            'toward data bundles. Data customers also tend to be repeat customers on '
            'a predictable monthly cycle, which makes revenue more stable.',
        'Which plans sell best and why? Small daily and weekly bundles sell in '
            'high volume to price-sensitive customers who buy little and often. '
            'Mid-size monthly bundles are the sweet spot for working adults and '
            'students who want reliability. Large bundles sell to heavy users and '
            'small businesses. A good reseller stocks knowledge of all of them and '
            'matches the plan to the customer\'s real usage. When you can tell a '
            'customer, honestly, which plan will save them money for how they '
            'actually use their phone, you stop being a vendor and become an '
            'adviser, and advisers keep customers for years.',
      ],
      keyConcepts: [
        KeyConcept('SME / Gifting Data',
            'Bulk-discounted data resellers buy cheaply and transfer to customers, carrying much higher margins than airtime.'),
        KeyConcept('Cost Per Gigabyte',
            'Larger bundles cost less per GB; matching bundle size to real usage saves customers money.'),
        KeyConcept('Data Rollover',
            'Some plans carry unused data forward on timely renewal — a genuine selling point.'),
      ],
      actionSteps: [
        'Compare the price per GB of a daily vs a monthly plan on one network.',
        'Find the current SME data reseller discount for MTN or Glo.',
        'Work out the margin difference between 3% airtime and 15% data on N100,000.',
        'Pick one network whose data you will specialise in first, and why.',
      ],
      keyTakeaways: [
        'Data generally carries far higher reseller margins than airtime.',
        'SME/gifting data is the reseller\'s high-margin workhorse.',
        'Cost per GB falls with bundle size — advise, don\'t just upsell.',
        'Data customers repeat on monthly cycles, stabilising revenue.',
      ],
      quiz: [
        _q('Which usually carries higher reseller margins?',
            ['Airtime', 'Data', 'They are identical', 'Recharge cards'], 1),
        _q('What is SME data best described as?', [
          'Data only for large companies',
          'Bulk-discounted data resellers transfer to customers',
          'Free network data',
          'Data that never expires'
        ], 1),
        _q('As bundle size grows, cost per gigabyte usually…',
            ['Rises', 'Falls', 'Stays the same', 'Doubles'], 1),
        _q('Why do data customers stabilise revenue?',
            ['They pay more tax', 'They repeat on monthly cycles', 'They never complain', 'They buy airtime too'], 1),
        _q('A good reseller matches a plan to the customer\'s…',
            ['Star sign', 'Real usage', 'Favourite colour', 'Network operator only'], 1),
      ],
    ),
    Lesson(
      id: 'c1l4',
      courseId: 'c1',
      index: 4,
      title: 'The Telecom Reseller Opportunity',
      readingMinutes: 6,
      paragraphs: [
        'Now that you understand how airtime and data flow through the market, we '
            'can look honestly at the opportunity in front of you. Telecom '
            'reselling is one of the most accessible businesses in Nigeria for a '
            'simple reason: demand is universal, constant and recession-resistant. '
            'People will cut many things before they cut their ability to '
            'communicate. Even in hard times, Nigerians find money for airtime and '
            'data because their livelihoods, families and social lives depend on '
            'staying connected.',
        'The first great advantage is that this is a low-risk business. Unlike '
            'selling perishable goods or fashion that can go out of style, airtime '
            'and data do not rot, expire on your shelf, or fall out of fashion. '
            'Your stock is electronic wallet value that you dispense on demand. '
            'There is no warehouse, no spoilage, and very little that can be '
            'physically stolen if you run a VTU operation carefully. The main risks '
            'are operational: sending value to the wrong number, platform downtime, '
            'or extending credit to customers who do not pay. All of these are '
            'manageable with discipline, which this course will teach you.',
        'The second advantage is scalable capital. You can start with as little as '
            'five or ten thousand naira loaded onto a VTU platform and grow from '
            'there, or you can start with hundreds of thousands if you have it and '
            'move serious volume from day one. There is no fixed entry price. A '
            'student can begin selling to classmates from a WhatsApp status with '
            'almost nothing, while someone with more capital can set up a shop, buy '
            'SME data in bulk, and supply smaller sellers. The business meets you '
            'where you are and grows as your capital and customer base grow.',
        'It is important, though, to hold realistic expectations. Telecom '
            'reselling is a thin-margin, high-volume business, not a get-rich-quick '
            'scheme. In your first weeks you may earn very little as you build a '
            'customer base and learn the operational ropes. Anyone promising '
            'guaranteed daily income or effortless riches from airtime is selling '
            'you a fantasy. Real money in this business comes from consistency, '
            'reinvestment and steadily growing volume over months, not from a lucky '
            'break. The sellers who win are the ones who show up every day, serve '
            'reliably, and reinvest their small margins back into more stock and '
            'better service.',
        'New resellers make a predictable set of mistakes, and knowing them in '
            'advance is half the battle. The most common is giving airtime and data '
            'on credit to friends and family who then delay or refuse to pay, '
            'quietly eating the seller\'s thin capital. The second is failing to '
            'keep records, so the seller has no idea whether they are actually '
            'making money. The third is choosing a cheap, unreliable VTU platform '
            'that fails transactions and destroys customer trust. The fourth is '
            'pricing in panic, either undercutting so hard there is no margin or '
            'trying to mark up airtime above face value, which drives customers '
            'away instantly.',
        'You can avoid every one of these from day one. Sell on cash or confirmed '
            'transfer only, at least until you know a customer well. Record every '
            'transaction, even in a simple notebook or the customer records tool in '
            'this very app. Choose a reputable platform even if its discount is '
            'slightly smaller, because reliability earns you more than an extra half '
            'percent ever will. Price competitively but never below your cost, and '
            'never above face value on airtime. Do these four things and you will '
            'already be ahead of the majority of people who start and quit within a '
            'month. The opportunity is real, but it rewards the disciplined, not the '
            'desperate.',
      ],
      keyConcepts: [
        KeyConcept('Low-Risk Stock',
            'Airtime and data are electronic value that never spoils or goes out of fashion.'),
        KeyConcept('Scalable Entry',
            'Start with a few thousand naira or a large float — the business grows with your capital.'),
        KeyConcept('The Four Beginner Mistakes',
            'Uncontrolled credit, no records, unreliable platforms, and panic pricing.'),
      ],
      actionSteps: [
        'Write your honest starting capital and what volume it can support.',
        'Commit in writing to a no-credit rule for your first month.',
        'Choose how you will record every transaction from day one.',
        'List the four beginner mistakes and how you will avoid each.',
      ],
      keyTakeaways: [
        'Demand for airtime and data is universal and recession-resistant.',
        'Stock is electronic and low-risk; capital requirements are flexible.',
        'It is a consistency business, not a get-rich-quick scheme.',
        'Avoid credit, keep records, pick a reliable platform, price sanely.',
      ],
    ),
    Lesson(
      id: 'c1l5',
      courseId: 'c1',
      index: 5,
      title: 'Building Your Business Foundation',
      readingMinutes: 7,
      paragraphs: [
        'Understanding the market is essential, but at some point you must lay the '
            'concrete foundation of an actual business. The difference between '
            'someone who sells a little airtime to friends and someone who runs a '
            'telecom business is structure: a name, a legal footing, a dedicated '
            'account, a working platform and a clear price list. This lesson walks '
            'you through building that foundation properly so that your business can '
            'grow, earn trust, and be taken seriously by customers and suppliers '
            'alike.',
        'It starts with choosing your business name. Your name is the first thing '
            'customers meet, and it should be short, memorable and easy to type in '
            'a WhatsApp chat or hear over a noisy phone call. Avoid names that are '
            'hard to spell or that promise things you cannot deliver. Something '
            'clean and professional like a personal or invented name plus a word '
            'such as Data, Telecom, Connect or Digital usually works well. Check '
            'that the name is not already widely used in your area and that a '
            'matching WhatsApp and social handle is available, because consistency '
            'across channels makes you look established.',
        'Next comes registration. In Nigeria you register a business name with the '
            'Corporate Affairs Commission (CAC). Registering a business name is '
            'affordable and can be done online or through an agent. It is not '
            'strictly required to start selling, but it matters enormously as you '
            'grow. A CAC registration lets you open a corporate bank account in the '
            'business name, gives customers confidence that you are a real '
            'enterprise, and is often required by the better VTU platforms and data '
            'suppliers before they will grant you dealer-level discounts. Treat it '
            'as an early investment in credibility rather than an optional extra.',
        'The third pillar is a dedicated business bank account. One of the fastest '
            'ways new sellers lose control of their money is mixing business funds '
            'with personal spending. When your float, your profit and your rent all '
            'live in one account, you cannot tell whether you are actually making '
            'money, and you will spend your capital without realising it. Open a '
            'separate account used only for the business: customers pay into it, you '
            'buy stock from it, and you pay yourself a deliberate withdrawal from it. '
            'This single discipline will do more for your survival than almost any '
            'other decision.',
        'The fourth pillar is your VTU platform, the technology through which you '
            'will actually buy and dispense airtime and data. We devote a full '
            'lesson to choosing one later, but at foundation stage you need to '
            'select a reputable platform, register your business on it, fund your '
            'wallet, and learn its interface until dispensing value is second '
            'nature. Practise sending small amounts to your own lines so that when '
            'a real customer is waiting, you are fast and confident. A fumbling, '
            'uncertain seller loses customers; a smooth, quick one keeps them.',
        'The final pillar is your first price list. Before you serve a single '
            'customer you should know exactly what you charge for every common '
            'airtime denomination and every popular data bundle across all four '
            'networks. Write it down, because pricing on the fly leads to mistakes '
            'and inconsistency. Your price list should reflect your buying cost, '
            'leave you a sensible margin, and stay competitive with other sellers '
            'nearby. Keep airtime at face value and compete on speed and '
            'reliability; on data, price a little below the network\'s direct price '
            'so customers see clear value in buying from you.',
        'With these five pillars in place, a name, CAC registration, a dedicated '
            'account, a working platform and a clear price list, you have crossed '
            'the line from casual seller to business owner. Everything else in this '
            'course, from customer service to marketing to scaling, is built on this '
            'foundation. Take the time to lay it properly now, and the growth that '
            'follows will have something solid to stand on.',
      ],
      keyConcepts: [
        KeyConcept('CAC Registration',
            'Registering your business name with the Corporate Affairs Commission unlocks corporate accounts, credibility and dealer discounts.'),
        KeyConcept('Dedicated Account',
            'A separate business bank account keeps float, profit and personal money from blurring together.'),
        KeyConcept('The Price List',
            'A written list of your charges across all networks prevents errors and keeps you consistent.'),
      ],
      actionSteps: [
        'Brainstorm five possible business names and check their availability.',
        'Research the current CAC business-name registration steps and cost.',
        'Open (or earmark) a dedicated account for the business only.',
        'Draft a first price list for airtime and top data bundles on all networks.',
      ],
      keyTakeaways: [
        'A real business needs a name, legal footing, dedicated account, platform and price list.',
        'CAC registration builds credibility and unlocks better supplier terms.',
        'Never mix business float with personal money.',
        'A written price list keeps you consistent and error-free.',
      ],
    ),
    ..._course1RemainingLessons,
  ],
);

// Lessons 6–20 of Course 1. Each carries real, topic-specific guidance,
// action steps and takeaways, with quizzes on every third lesson.
final List<Lesson> _course1RemainingLessons = [
  _lesson('c1', 6, 'Understanding Your Competition', 5, [
    'No telecom business exists in a vacuum. On almost every street and in every '
        'WhatsApp group there are other people selling the same airtime and data '
        'you sell. Understanding your competition is not about fear; it is about '
        'positioning yourself so customers choose you. The first step is simply to '
        'map who else is selling around you, what they charge, how fast they '
        'deliver, and how they treat people. Buy from two or three of them '
        'yourself and experience their service as a customer would.',
    'Most small resellers compete only on price, which is a race to the bottom '
        'that nobody wins. Because airtime sells at face value and data margins '
        'are thin, undercutting endlessly just destroys everyone\'s profit. The '
        'smarter move is to compete on the things customers actually feel: speed '
        'of delivery, reliability, politeness, availability at odd hours, and '
        'honest advice on which plan suits them. A customer who has been let down '
        'by a slow or rude seller will happily move to someone who answers fast '
        'and never fails a transaction, even at the same price.',
    'Study your competitors to find the gaps they leave open. Maybe they close '
        'early and you can serve late-night customers. Maybe they are slow to '
        'reply and you can guarantee delivery within two minutes. Maybe they only '
        'sell one network well and you can master all four. Every weakness in a '
        'competitor is an opening for you to become the obvious choice for a group '
        'of customers they are underserving. Position deliberately, and you never '
        'have to win on price alone.',
  ], concepts: [
    KeyConcept('Race to the Bottom',
        'Competing only on price destroys margins for everyone; differentiate instead.'),
    KeyConcept('Service Differentiation',
        'Speed, reliability, hours and honest advice win customers price cuts cannot.'),
  ], steps: [
    'List three sellers who compete with you and buy from each.',
    'Note one weakness in each that you could turn into your strength.',
    'Write the one promise (speed, hours, advice) you will be known for.',
  ], takeaways: [
    'Competition is universal — position, don\'t panic.',
    'Competing only on price is a losing race.',
    'Win on speed, reliability, hours and honest advice.',
    'Every competitor weakness is your opening.',
  ]),
  _lesson('c1', 7, 'Setting Up Your VTU Platform', 6, [
    'Your VTU platform is the engine room of your business. It is where you fund '
        'a wallet, buy airtime and data across all networks, and dispense value to '
        'customers instantly. Choosing and setting up the right platform is one of '
        'the most consequential early decisions you will make, because it directly '
        'affects your discounts, your delivery speed, and how often transactions '
        'fail. A platform that saves you half a percent on discount but fails one '
        'in twenty transactions will cost you far more in lost trust than it ever '
        'saves.',
    'When evaluating platforms, look at four things. First, the discount rates '
        'across each network, since these are your margins. Second, reliability and '
        'uptime, ideally confirmed by other resellers who use it daily. Third, the '
        'speed and quality of the platform\'s own customer support, because when a '
        'transaction hangs you need a human who responds quickly. Fourth, the '
        'funding options and minimum wallet top-up, which affect how easily you can '
        'keep your float stocked. Do not choose on discount alone; weigh all four.',
    'Once you have chosen, register your business, ideally with your CAC details '
        'to access dealer tiers, fund your wallet, and practise relentlessly before '
        'serving real customers. Send small top-ups to your own lines, buy a data '
        'bundle for yourself, and learn exactly where every button is. Set up your '
        'transaction PIN carefully and never share it. The goal is to reach the '
        'point where dispensing value is so fast and automatic that a customer is '
        'served before they finish sending their transfer confirmation.',
  ], concepts: [
    KeyConcept('Four Platform Criteria',
        'Discounts, reliability, support quality and funding options — weigh all four, not just price.'),
    KeyConcept('Float',
        'The wallet value you keep stocked so you can dispense instantly on demand.'),
  ], steps: [
    'Shortlist two VTU platforms and compare them on all four criteria.',
    'Register your business and fund a small starting wallet.',
    'Practise ten test transactions to your own lines before going live.',
  ], takeaways: [
    'The platform decides your discounts, speed and reliability.',
    'Judge on discounts, uptime, support and funding — not price alone.',
    'Register with CAC details to unlock better dealer tiers.',
    'Practise until dispensing is fast and automatic.',
  ]),
  _lesson('c1', 8, 'Managing Your Business Finances', 6, [
    'A telecom business can be busy and still be quietly losing money if the '
        'owner does not manage finances deliberately. Because margins are thin and '
        'transactions are many, small leaks add up fast: a bit of unpaid credit '
        'here, a personal withdrawal from the float there, an unnoticed platform '
        'fee somewhere else. Financial management in this business is not '
        'complicated accounting; it is a few simple habits practised without '
        'exception. The most important is separating your float from your profit '
        'from your personal money.',
    'Think of your money in three buckets. The float is the working capital you '
        'use to buy stock and dispense value; it must be protected and replenished. '
        'Profit is the margin you earn on top, which accumulates as the business '
        'runs. Personal money is what you deliberately pay yourself as a salary or '
        'drawing. New sellers fail when these three blur into one pool, because '
        'they spend their float believing it is profit and slowly shrink their '
        'ability to trade. Keep them mentally and, where possible, physically '
        'separate.',
    'Record every transaction and reconcile daily. At the end of each day you '
        'should know how much value you dispensed, how much margin you earned, how '
        'much is owed to you, and what your float balance is. This app\'s customer '
        'records and profit tools can help, but even a notebook works if used '
        'consistently. Reconciling daily catches errors while they are small and '
        'gives you the true picture of whether the business is growing. What you do '
        'not measure, you cannot manage.',
  ], concepts: [
    KeyConcept('Three Buckets',
        'Float, profit and personal money must stay separate or the business bleeds capital.'),
    KeyConcept('Daily Reconciliation',
        'Closing each day with known volume, margin, debts and float balance keeps errors small.'),
  ], steps: [
    'Define your float, profit and personal-pay buckets in writing.',
    'Set a fixed daily time to reconcile your numbers.',
    'Decide the deliberate amount you will pay yourself, and stick to it.',
  ], takeaways: [
    'Thin margins mean small leaks sink businesses.',
    'Keep float, profit and personal money strictly separate.',
    'Record every transaction and reconcile daily.',
    'What you do not measure, you cannot manage.',
  ], quiz: [
    _q('The three money buckets are float, profit and…',
        ['Tax', 'Personal money', 'Loans', 'Savings'], 1),
    _q('Why reconcile daily?',
        ['To impress customers', 'To catch errors while small', 'It is legally required', 'To pay less tax'], 1),
    _q('Spending your float believing it is profit leads to…',
        ['Faster growth', 'Shrinking trading capacity', 'Higher margins', 'More customers'], 1),
    _q('A busy telecom business can still…',
        ['Never lose money', 'Quietly lose money without management', 'Avoid all fees', 'Skip record-keeping'], 1),
    _q('What you do not measure, you cannot…',
        ['Sell', 'Manage', 'Buy', 'Register'], 1),
  ]),
  _lesson('c1', 9, 'Customer Service Excellence', 5, [
    'In a business where everyone sells identical airtime and data at similar '
        'prices, customer service is the single greatest advantage a small '
        'operator has. Customers do not remember the exact discount you gave; they '
        'remember how you made them feel and whether you solved their problem when '
        'something went wrong. Excellent service turns one-time buyers into loyal '
        'regulars who not only return but refer their friends, family and '
        'colleagues to you without being asked.',
    'Great service in telecom reselling comes down to a few concrete behaviours: '
        'reply fast, deliver value quickly, be polite even under pressure, and '
        'resolve failed transactions calmly and completely. When a transaction '
        'hangs and a customer is anxious about their money, how you handle that '
        'moment defines your reputation. Reassure them, investigate immediately, '
        'and make it right. A problem handled well often builds more loyalty than '
        'a hundred smooth transactions, because it proves you can be trusted when '
        'it matters.',
    'Consistency is what turns good service into a brand. If you are fast and '
        'friendly on Monday but slow and short on Friday, customers never know '
        'what they will get and cannot rely on you. Decide the standard you will '
        'hold every single day, no matter your mood, and hold it. Over months, '
        'that reliability becomes your reputation, and reputation is the compound '
        'interest of a service business.',
  ], concepts: [
    KeyConcept('The Recovery Moment',
        'How you handle a failed transaction builds more trust than flawless ones ever could.'),
    KeyConcept('Consistency as Brand',
        'Holding one service standard every day turns good service into a reliable reputation.'),
  ], steps: [
    'Write your maximum acceptable reply and delivery times.',
    'Script how you will calmly handle a failed transaction.',
    'Commit to one service standard you will hold every day.',
  ], takeaways: [
    'Service is the biggest edge when products are identical.',
    'Customers remember how you handled problems.',
    'Recovering well from failures builds deep loyalty.',
    'Consistency turns service into reputation.',
  ]),
  _lesson('c1', 10, 'Building a Loyal Customer Base', 5, [
    'Acquiring a customer is only the beginning; the real value is in keeping '
        'them. A loyal customer who buys airtime and data from you every week for '
        'two years is worth far more than a stranger who buys once. Loyalty in '
        'telecom reselling is built on reliability, familiarity and small human '
        'touches that make customers feel known rather than processed. The good '
        'news is that because people recharge and buy data constantly, you have '
        'frequent chances to reinforce that loyalty.',
    'Start by capturing and remembering your customers. Keep a record of their '
        'names, numbers and the networks and plans they usually buy. When a '
        'regular messages you, greeting them by name and already knowing their '
        'usual plan makes them feel valued and speeds up the sale. A simple '
        'broadcast list lets you tell your regulars about a data plan that offers '
        'better value, or remind them when their monthly bundle is due, turning '
        'you from a vendor into a helpful part of their routine.',
    'Reward and appreciate loyalty in small ways. A word of thanks, remembering '
        'a repeat customer\'s preferences, or being flexible with a trusted regular '
        'in a pinch all deepen the relationship. You are not running a loyalty '
        'points scheme; you are being a reliable, appreciative human being in a '
        'market full of faceless transactions. Over time, a core of loyal '
        'customers becomes the stable base on which the whole business rests, and '
        'their referrals become your cheapest and best marketing.',
  ], concepts: [
    KeyConcept('Customer Lifetime Value',
        'A loyal weekly customer is worth vastly more than a one-time buyer.'),
    KeyConcept('Broadcast List',
        'A simple WhatsApp broadcast keeps regulars informed and buying without spamming.'),
  ], steps: [
    'Start recording regulars\' names, numbers and usual plans.',
    'Build a small broadcast list of willing customers.',
    'Choose two small ways you will show appreciation to loyal buyers.',
  ], takeaways: [
    'Keeping customers beats constantly chasing new ones.',
    'Remember names and usual plans to make people feel known.',
    'A broadcast list keeps regulars buying.',
    'Loyal customers become your best, cheapest marketing.',
  ]),
  _lesson('c1', 11, 'Digital Tools for Telecom Business', 5, [
    'Running a modern telecom business by memory and guesswork leaves money on '
        'the table. A handful of simple digital tools lets even a solo operator '
        'work like a much larger, more organised business. These tools do not have '
        'to be expensive or complicated; often the phone already in your hand, '
        'plus a few free apps and this very application, is enough to track '
        'customers, calculate margins, manage stock and communicate at scale.',
    'The essentials are a customer record system, a way to calculate profit and '
        'pricing, and a broadcast communication channel. Recording customers lets '
        'you remember who buys what and follow up intelligently. Profit and pricing '
        'tools ensure every sale actually makes money and every price is set '
        'deliberately rather than in panic. A broadcast list or status channel lets '
        'you reach dozens or hundreds of customers with one message. The business '
        'tools built into this app cover exactly these needs so you can start '
        'without hunting for separate software.',
    'The point of tooling is leverage: doing more with the same effort. When your '
        'records, calculations and communications are handled by tools rather than '
        'memory, you make fewer mistakes, spot opportunities faster, and free your '
        'attention for serving customers and growing. Adopt tools deliberately, '
        'learn them well, and let them quietly multiply what one person can do.',
  ], concepts: [
    KeyConcept('Leverage',
        'Good tools let one operator do the work of several without more hours.'),
    KeyConcept('The Essential Stack',
        'Customer records, profit/pricing calculators, and a broadcast channel.'),
  ], steps: [
    'Open each business tool in this app and try it once.',
    'Record five real customers in the customer records tool.',
    'Run one real sale through the profit calculator.',
  ], takeaways: [
    'Simple tools let a solo operator work like a bigger business.',
    'The essentials: records, profit/pricing tools, broadcast.',
    'Tools reduce mistakes and free attention for growth.',
    'This app provides the core stack to start.',
  ]),
  _lesson('c1', 12, 'Marketing on a Budget', 5, [
    'You do not need an advertising budget to grow a telecom business. The most '
        'effective marketing for a small reseller is almost free: your existing '
        'relationships, your phone\'s social features, and the word of mouth that '
        'flows from excellent service. The goal of budget marketing is to make it '
        'easy and natural for people who already know you to buy from you and to '
        'tell others, then to widen that circle steadily without spending money '
        'you do not have.',
    'Your WhatsApp status is the single most powerful free marketing channel '
        'available to you. Posting your available plans, prices and a simple call '
        'to action to your contacts, consistently, keeps you top of mind whenever '
        'someone needs airtime or data. Beyond status, ask satisfied customers for '
        'referrals directly, join local groups where your potential customers '
        'gather, and make sure everyone in your daily life knows what you do. '
        'Consistency matters more than cleverness; showing up regularly beats a '
        'single flashy campaign.',
    'As you grow, referrals become your engine. A happy customer telling a friend '
        '"just buy from this person, they never fail me" is worth more than any '
        'advert, and it costs nothing but the good service that earned it. Make '
        'referrals easy by being memorable, reliable and easy to reach, and gently '
        'encourage them. Budget marketing is really just consistent visibility '
        'plus great service compounding over time.',
  ], concepts: [
    KeyConcept('WhatsApp Status',
        'A free, high-frequency channel that keeps you top of mind with everyone you know.'),
    KeyConcept('Referral Engine',
        'Great service turns customers into unpaid marketers through word of mouth.'),
  ], steps: [
    'Design a simple, repeatable WhatsApp status format for your plans.',
    'Ask three satisfied customers for a referral this week.',
    'List two local groups where your customers gather.',
  ], takeaways: [
    'Growth does not require an ad budget.',
    'WhatsApp status is your most powerful free channel.',
    'Consistency beats one flashy campaign.',
    'Great service compounds into referrals.',
  ]),
  _lesson('c1', 13, 'Scaling from Solo to Team', 5, [
    'There comes a point where a single person cannot serve every customer '
        'quickly enough, and the choice becomes whether to stay small or build a '
        'team. Scaling from solo to team is a significant shift, because it turns '
        'you from a seller into a manager of sellers. Done well, it multiplies your '
        'reach and revenue; done carelessly, it introduces trust, training and '
        'cash-handling risks that can sink a previously healthy business.',
    'The first form of scaling is usually sub-dealers or agents: smaller sellers '
        'you supply with wallet value or SME data at a slightly better rate, who '
        'then serve their own customers. You earn a margin on the volume they move '
        'while they build their own businesses under your supply. This can grow '
        'your turnover dramatically without you personally handling every '
        'transaction, but it requires clear terms, reliable supply, and firm rules '
        'about credit and payment so that a defaulting agent cannot drain your '
        'float.',
    'The second form is bringing on staff to help run a shop or handle customer '
        'messages during peak hours. Here your challenges are training people to '
        'your service standard and controlling the money they handle. Start small, '
        'document how you want things done, and build trust gradually with clear '
        'accountability. Scaling is not about growing as fast as possible; it is '
        'about growing without losing the reliability and control that made the '
        'business work in the first place.',
  ], concepts: [
    KeyConcept('Sub-Dealer Model',
        'Supplying smaller sellers at a better rate multiplies volume without handling every sale.'),
    KeyConcept('Controlled Growth',
        'Scaling must preserve the reliability and cash control that made the business work.'),
  ], steps: [
    'Decide whether sub-dealers or staff fit your next growth step.',
    'Write clear supply and payment terms before adding anyone.',
    'Document your service standard so others can follow it.',
  ], takeaways: [
    'Scaling turns a seller into a manager of sellers.',
    'Sub-dealers multiply volume without handling every sale.',
    'Growth introduces trust and cash-handling risks to manage.',
    'Grow without losing reliability and control.',
  ]),
  _lesson('c1', 14, 'Legal and Regulatory Compliance', 5, [
    'Operating within the law protects your business and your customers. The '
        'Nigerian telecom space is regulated by the NCC, and while a small '
        'reseller is not licensed like an operator, there are still rules and good '
        'practices you must observe, particularly around SIM registration, the '
        'National Identification Number linkage, and honest dealing. Staying '
        'compliant keeps you out of trouble and, importantly, builds the trust that '
        'lets your business last.',
    'If your business involves SIM registration or swaps, you must follow the '
        'NCC and operator requirements strictly, including proper capture of '
        'customer identity and NIN details. Mishandling registrations, or worse '
        'enabling fraud, can end your business and expose you to serious legal '
        'consequences. Always verify identities properly, never register SIMs '
        'improperly, and treat customer data with care and confidentiality. Your '
        'integrity here is both a legal obligation and a competitive asset.',
    'Beyond specific telecom rules, general business compliance matters too: '
        'registering your business, keeping honest records, and dealing fairly with '
        'customers and suppliers. Avoid any scheme that promises guaranteed returns '
        'or looks like it moves money for others in suspicious ways, as these can '
        'cross into illegal territory. A clean, compliant, honestly run business '
        'may grow a little slower, but it grows on solid ground that will not '
        'collapse under a regulator\'s scrutiny or a customer\'s complaint.',
  ], concepts: [
    KeyConcept('SIM & NIN Rules',
        'Registration and swaps must strictly follow NCC and operator identity requirements.'),
    KeyConcept('Integrity as Asset',
        'Honest, compliant dealing protects you legally and builds lasting trust.'),
  ], steps: [
    'Learn the current SIM registration and NIN requirements if you offer it.',
    'Set a firm policy of proper identity verification, no exceptions.',
    'Review whether any offer you plan could look non-compliant.',
  ], takeaways: [
    'The NCC regulates telecom; resellers still have rules to follow.',
    'Handle SIM registration and NIN data strictly and honestly.',
    'Avoid schemes promising guaranteed or suspicious returns.',
    'Compliant businesses grow on ground that will not collapse.',
  ]),
  _lesson('c1', 15, 'Building Supplier Relationships', 5, [
    'Your suppliers, the VTU platforms, super-dealers and SME data sources you '
        'buy from, are the backbone of your ability to serve customers. A strong '
        'relationship with reliable suppliers means better rates, priority support '
        'when transactions fail, and early access to new plans or better discounts. '
        'Many new resellers treat suppliers as interchangeable and chase the '
        'cheapest rate everywhere, missing the compounding value of being a '
        'trusted, consistent customer to a good supplier.',
    'The old wisdom that the best time to find a supplier is before you urgently '
        'need one applies powerfully here. If your main platform goes down during '
        'peak hours and you have no backup relationship, you cannot serve customers '
        'and you lose both sales and trust. Cultivate at least one reliable primary '
        'supplier and a secondary backup, keep both funded modestly, and maintain '
        'good communication so that when you need help fast, you are a known and '
        'valued customer rather than a stranger.',
    'Build these relationships the way you build customer loyalty: by being '
        'reliable, communicative and fair. Pay promptly, communicate clearly, and '
        'grow your volume with suppliers who serve you well, because higher volume '
        'often unlocks better tiers and discounts. A supplier who trusts you may '
        'extend better terms, alert you to opportunities, and go the extra mile '
        'when you have a problem. Treat suppliers as partners in your success, not '
        'as faceless vendors to squeeze.',
  ], concepts: [
    KeyConcept('Primary + Backup',
        'Always keep a reliable main supplier and a funded backup for downtime.'),
    KeyConcept('Volume Tiers',
        'Growing loyalty and volume with a good supplier unlocks better rates and terms.'),
  ], steps: [
    'Identify your primary supplier and a backup, and fund both.',
    'Set reminders to keep both wallets minimally stocked.',
    'Plan how you will grow volume to reach better discount tiers.',
  ], takeaways: [
    'Suppliers are the backbone of your ability to serve.',
    'Find suppliers before you urgently need them.',
    'Keep a primary and a backup supplier funded.',
    'Loyalty and volume unlock better terms.',
  ]),
  _lesson('c1', 16, 'Handling Business Challenges', 5, [
    'Every business faces challenges, and telecom reselling has its own recurring '
        'set: failed transactions, platform downtime, customers who dispute or '
        'refuse to pay, thin cash flow, and the emotional grind of a high-volume, '
        'low-margin operation. What separates businesses that survive from those '
        'that fold is not the absence of problems but the owner\'s ability to stay '
        'calm, solve them systematically, and learn from each one so it happens '
        'less often.',
    'For operational problems like failed transactions and downtime, the answer '
        'is preparation: reliable suppliers, backups, clear records so you can '
        'prove what happened, and calm communication with the affected customer. '
        'For financial challenges like thin cash flow, the answer is discipline: '
        'protecting your float, avoiding credit, and reinvesting profit so your '
        'working capital grows. Most crises in this business trace back to a habit '
        'that was skipped, and fixing the habit prevents the crisis from recurring.',
    'The human challenges, difficult customers, discouragement, and the '
        'temptation to quit during a slow patch, are just as real. Build resilience '
        'by remembering that this is a consistency business where the reward comes '
        'to those who keep showing up. Lean on the community of other resellers, '
        'keep your standards even when it is hard, and treat setbacks as data '
        'rather than defeat. The operator who calmly solves problems day after day '
        'is the one still standing, and growing, when others have given up.',
  ], concepts: [
    KeyConcept('Problems Trace to Habits',
        'Most crises come from a skipped discipline; fix the habit to prevent recurrence.'),
    KeyConcept('Resilience',
        'Consistency through slow patches is what separates survivors from quitters.'),
  ], steps: [
    'Write your calm, step-by-step response to a failed transaction.',
    'Identify the one habit that would prevent your most common problem.',
    'Name someone or a community you can lean on during hard patches.',
  ], takeaways: [
    'Every business has problems; response is what matters.',
    'Preparation solves operational challenges.',
    'Discipline solves financial challenges.',
    'Resilience and consistency keep you standing.',
  ]),
  _lesson('c1', 17, 'Creating Multiple Income Streams', 5, [
    'Once your core airtime and data business is running smoothly, you can grow '
        'earnings by adding related income streams that serve the same customers '
        'with more of what they need. Because you have already earned trust and '
        'built a customer base, offering additional useful services is far easier '
        'than starting from scratch, and it increases both your revenue per '
        'customer and your usefulness to them, which deepens loyalty.',
    'Natural adjacent services include bill payments such as electricity tokens '
        'and cable subscriptions, which many VTU platforms already support from the '
        'same wallet. Selling data across all networks rather than specialising in '
        'one, offering SIM registration and swaps where permitted, and supplying '
        'smaller sub-dealers are all ways to earn more from your existing setup. '
        'Each new stream should genuinely serve your customers and fit your '
        'operation, not scatter your focus across unrelated ventures.',
    'The principle is to deepen before you widen. Add streams that share your '
        'customer base, your platform and your skills, so each new offering '
        'reinforces rather than dilutes the business. A customer who buys airtime, '
        'data, electricity tokens and cable renewal from you is far more valuable '
        'and far more loyal than one who buys only airtime. Multiple aligned income '
        'streams turn a single-product seller into an indispensable digital '
        'services hub for a community.',
  ], concepts: [
    KeyConcept('Adjacent Services',
        'Bill payments, tokens and cable renewals often run from the same VTU wallet.'),
    KeyConcept('Deepen Before Widen',
        'Add streams that share your customers, platform and skills, not unrelated ventures.'),
  ], steps: [
    'List which bill-payment services your platform already supports.',
    'Choose one adjacent service to add and learn it well.',
    'Tell your existing customers about the new service.',
  ], takeaways: [
    'Extra streams earn more from customers you already have.',
    'Bill payments and tokens fit the same wallet and base.',
    'Deepen before you widen — keep streams aligned.',
    'Aligned streams make you an indispensable services hub.',
  ]),
  _lesson('c1', 18, 'Building Your Online Presence', 5, [
    'In today\'s market, a customer\'s first impression of your business is often '
        'digital: a WhatsApp profile, a status update, or a social media page. A '
        'clean, consistent online presence makes a one-person operation look '
        'established and trustworthy, which directly affects whether new customers '
        'feel comfortable sending you their money. You do not need a website or '
        'paid ads; you need a coherent, professional presence on the platforms your '
        'customers already use.',
    'Start with the basics done well: a clear business name and logo on your '
        'WhatsApp, a professional profile photo or brand image, and a consistent '
        'way of presenting your plans and prices. Post regularly so customers know '
        'you are active and available. Where it fits your market, a simple '
        'Instagram or Facebook page reinforces credibility and gives customers a '
        'place to see reviews and reach you. Consistency of name, colours and tone '
        'across every channel makes you look like a real, dependable brand.',
    'Your online presence is also where social proof lives. Encourage satisfied '
        'customers to leave a word of recommendation, share testimonials on your '
        'status, and let the visible activity of a busy, responsive business speak '
        'for itself. In a market where trust is everything and scams are a real '
        'fear, a professional, active, consistent online presence quietly reassures '
        'new customers that you are safe to buy from, and that reassurance converts '
        'directly into sales.',
  ], concepts: [
    KeyConcept('Digital First Impression',
        'Your WhatsApp and social profiles often decide whether a new customer trusts you.'),
    KeyConcept('Social Proof',
        'Visible testimonials and activity reassure nervous new buyers.'),
  ], steps: [
    'Polish your WhatsApp profile with brand name, photo and clear info.',
    'Set a simple regular posting rhythm for plans and prices.',
    'Collect two customer testimonials to share as social proof.',
  ], takeaways: [
    'First impressions are often digital.',
    'Consistent branding makes a solo operation look established.',
    'Post regularly to signal you are active and available.',
    'Social proof converts nervous new buyers.',
  ]),
  _lesson('c1', 19, 'Long-Term Business Planning', 5, [
    'Most small telecom sellers operate day to day with no plan beyond the next '
        'sale, and that short horizon is exactly why so many stay small or fade '
        'out. A little long-term planning, thinking in terms of months and years '
        'rather than days, transforms a hustle into a business with direction. '
        'Planning does not require a formal document; it requires deciding where '
        'you want to be, what it will take, and reviewing your progress regularly.',
    'Set clear, realistic goals with timeframes: a target monthly volume, a '
        'number of loyal customers, a savings buffer, or a new income stream to '
        'add by a certain date. Break each goal into the concrete steps that would '
        'achieve it, and use the goal tracker in this app to keep them visible. '
        'Reinvestment is central to any long-term plan; consistently putting a '
        'portion of profit back into more float, better tools and new services is '
        'what compounds a small operation into a substantial one over time.',
    'Review and adjust regularly. Markets shift, network offerings change, and '
        'your own capacity grows, so a plan is a living guide, not a fixed script. '
        'Every month, look at what worked, what did not, and what you will change, '
        'then reset your targets. The seller who plans, reinvests and reviews is '
        'quietly building something durable while others simply react to each day. '
        'Long-term thinking is the bridge from surviving to genuinely growing.',
  ], concepts: [
    KeyConcept('Reinvestment Compounding',
        'Consistently reinvesting profit into float, tools and services grows a small business into a large one.'),
    KeyConcept('Living Plan',
        'Goals reviewed and adjusted monthly guide the business as conditions change.'),
  ], steps: [
    'Set one realistic six-month goal with a clear timeframe.',
    'Add it to the goal tracker and break it into steps.',
    'Schedule a monthly review of progress and targets.',
  ], takeaways: [
    'A short horizon keeps sellers small.',
    'Set realistic, time-bound goals and track them.',
    'Reinvestment compounds a small operation over time.',
    'Review and adjust monthly — the plan is alive.',
  ]),
  _lesson('c1', 20, 'Your First 90 Days Action Plan', 6, [
    'Everything you have learned in this course comes together in a concrete plan '
        'for your first ninety days. The purpose of this final lesson is to turn '
        'knowledge into motion, because a plan acted on beats a perfect plan left '
        'on the shelf. Ninety days is long enough to build real habits and a real '
        'customer base, and short enough to keep you focused and accountable. Treat '
        'this as your launch runway.',
    'In the first thirty days, lay the foundation and start selling. Choose and '
        'register your business name, open a dedicated account, select and fund a '
        'reliable VTU platform, build your price list, and make your first sales to '
        'people who already trust you. Focus on learning the operational ropes '
        'flawlessly, recording every transaction, and delivering fast, friendly '
        'service. Do not chase scale yet; chase reliability and your first loyal '
        'customers.',
    'In days thirty-one to sixty, deepen and widen carefully. Grow your customer '
        'base through consistent WhatsApp status marketing and referrals, push '
        'higher-margin data alongside airtime, and start reinvesting your margins '
        'into a larger float. Begin using the business tools seriously: track '
        'customers, monitor your profit, and set goals. Identify one adjacent '
        'service to add, such as bill payments, and learn it. By day sixty you '
        'should have steady daily activity and a clear picture of your numbers.',
    'In days sixty-one to ninety, consolidate and plan the next phase. Review '
        'what is working, cut what is not, strengthen supplier relationships, and '
        'set your goals for the following quarter. Decide whether your next growth '
        'step is more volume, a sub-dealer model, or additional services. By the '
        'end of ninety days you will have moved from a nervous beginner to a '
        'disciplined operator with real customers, real records and real '
        'direction. From here, the compounding of consistency, reinvestment and '
        'service does the rest. Your telecom business is no longer an idea; it is '
        'underway.',
  ], concepts: [
    KeyConcept('The 30-30-30 Rhythm',
        'Found and launch, then deepen and widen, then consolidate and plan the next quarter.'),
    KeyConcept('Action Over Perfection',
        'A plan acted on beats a perfect plan left unused.'),
  ], steps: [
    'Write your day 1–30 foundation and first-sales checklist.',
    'Write your day 31–60 growth and tooling checklist.',
    'Write your day 61–90 consolidation and next-quarter plan.',
    'Set a start date and commit to it publicly.',
  ], takeaways: [
    'Ninety days turns knowledge into a launched business.',
    'Days 1–30: found and start selling reliably.',
    'Days 31–60: deepen, widen and reinvest.',
    'Days 61–90: consolidate and plan the next quarter.',
  ], quiz: [
    _q('The first 30 days should focus on…',
        ['Maximum scale', 'Foundation and reliable first sales', 'Hiring staff', 'Adding many services'], 1),
    _q('Days 31–60 emphasise…',
        ['Quitting', 'Deepening, widening and reinvesting', 'Ignoring records', 'Cutting all marketing'], 1),
    _q('A plan acted on beats…',
        ['A cheap platform', 'A perfect plan left unused', 'A loyal customer', 'A price list'], 1),
    _q('By day 90 you should have…',
        ['Given up', 'Real customers, records and direction', 'A telecom licence', 'A physical warehouse'], 1),
    _q('What does the compounding of consistency rely on?',
        ['Luck', 'Reinvestment and service over time', 'Big markups', 'Guaranteed income'], 1),
  ]),
];

// ---------------------------------------------------------------------------
// COURSE 2 — Airtime Reselling 101 (18 lessons)
// ---------------------------------------------------------------------------

final Course _course2 = Course(
  id: 'c2',
  title: 'Airtime Reselling 101',
  description:
      'Everything you need to start and run a profitable airtime reselling '
      'operation, from your first float to smooth daily operations.',
  category: 'Airtime Business',
  difficulty: Difficulty.beginner,
  icon: Icons.phone_iphone_rounded,
  durationMinutes: 150,
  order: 2,
  lessons: [
    _lesson('c2', 1, 'The Airtime Reselling Model', 4, [
      'Airtime reselling is the most accessible on-ramp into the telecom '
          'business. You buy electronic value at a discount and dispense it to '
          'customers at face value, earning the difference. This lesson frames the '
          'whole model so you understand exactly where your money comes from before '
          'you spend a naira on float.',
      'The model works on volume, not markup. A two to four percent discount feels '
          'small on one sale but becomes meaningful across hundreds of daily '
          'transactions. Your job is to move as much value as possible, as '
          'reliably as possible, to as many trusting customers as possible.',
    ], concepts: [
      KeyConcept('Buy Low, Sell at Face',
          'Profit is the discount you buy at; airtime always sells at its denomination.'),
    ], steps: [
      'State your expected discount rate and starting float.',
      'Estimate the daily volume you need to hit a target margin.',
    ], takeaways: [
      'Airtime reselling is the easiest telecom entry point.',
      'You earn the buying discount, not a markup.',
      'It is a volume and reliability game.',
    ]),
    _lesson('c2', 2, 'Calculating Your Starting Capital', 5, [
      'Before you launch, you need to know how much float to start with and what '
          'it can realistically support. Your float is your working stock of '
          'electronic value; the larger it is, the more you can dispense before '
          'needing to top up. Starting too small means constant interruptions; '
          'starting with what you can afford and reinvesting steadily is the sane '
          'path.',
      'Work backwards from the volume you expect. If you think you can serve fifty '
          'thousand naira of recharges a day and you top up once daily, a float '
          'around that size keeps you smooth. Add a buffer for busy days. Never '
          'borrow heavily to inflate your float before you have proven demand.',
    ], steps: [
      'Estimate your realistic daily dispensing volume.',
      'Set a starting float that covers a day plus a buffer.',
      'Plan how reinvested margin will grow the float.',
    ], takeaways: [
      'Float size should match expected daily volume.',
      'Start with what you can afford, then reinvest.',
      'Avoid heavy borrowing before proving demand.',
    ]),
    _lesson('c2', 3, 'Choosing the Right VTU Platform', 5, [
      'Your platform determines your discounts, delivery speed and reliability. '
          'Compare candidates on discount rates per network, uptime, support '
          'responsiveness, and funding convenience. A slightly smaller discount on '
          'a rock-solid platform beats a bigger discount on one that fails during '
          'peak hours.',
      'Test before you commit. Fund a small wallet, run real transactions across '
          'all four networks, and time the delivery. Ask other resellers about '
          'their experience. Reliability is worth more than the last half percent '
          'of discount, because a failed transaction costs you a customer.',
    ], concepts: [
      KeyConcept('Reliability Over Rate',
          'A dependable platform earns more than an extra fraction of discount ever will.'),
    ], steps: [
      'Shortlist two platforms and test each with real transactions.',
      'Score them on discount, uptime, support and funding.',
    ], takeaways: [
      'The platform sets your discounts, speed and reliability.',
      'Test with real transactions before committing.',
      'Reliability beats a marginally bigger discount.',
    ], quiz: [
      _q('Airtime is sold to customers at…',
          ['A markup', 'Face value', 'A random price', 'Below cost'], 1),
      _q('Your profit in airtime comes from…',
          ['Markup', 'The buying discount', 'Late fees', 'Registration'], 1),
      _q('When choosing a platform, reliability should be weighed…',
          ['Less than discount', 'Above a marginal discount', 'Not at all', 'Only for data'], 1),
      _q('Float size should match…',
          ['Your rent', 'Expected daily volume', 'Your age', 'The weather'], 1),
      _q('Airtime reselling primarily rewards…',
          ['Big markups', 'Volume and reliability', 'Luck', 'Borrowing'], 1),
    ]),
    _lesson('c2', 4, 'Funding and Managing Your Wallet', 4, [
      'Keeping your wallet funded is the operational heartbeat of an airtime '
          'business. Run dry during a rush and you turn customers away; overfund '
          'carelessly and you tie up cash you might need elsewhere. The skill is '
          'matching top-ups to your rhythm so you are always ready without '
          'stranding capital.',
      'Learn your platform\'s funding options and their speed. Set a minimum '
          'balance threshold that triggers a top-up before you run low, especially '
          'ahead of predictable busy periods like evenings, weekends and month-end '
          'when data renewals spike.',
    ], steps: [
      'Set a minimum wallet threshold that triggers a top-up.',
      'Identify your fastest funding method for emergencies.',
    ], takeaways: [
      'Never run dry during a rush.',
      'Match top-ups to your daily and weekly rhythm.',
      'Know your fastest emergency funding route.',
    ]),
    _lesson('c2', 5, 'Setting Competitive Prices', 4, [
      'Since airtime sells at face value, your pricing lever is limited, but how '
          'you present value still matters. You compete on speed, reliability and, '
          'where you offer data or bill payments, on how your bundle prices compare '
          'to nearby sellers. Never try to sell airtime above face value; customers '
          'know the denomination and will leave instantly.',
      'Position yourself as the seller who never fails and always delivers in '
          'seconds. That reliability is your real price advantage. On adjacent '
          'products where you do have margin flexibility, price a little keener than '
          'competitors to win the relationship, then keep it with service.',
    ], takeaways: [
      'Airtime cannot be marked up above face value.',
      'Compete on speed and reliability, not price gouging.',
      'Use margin flexibility on data and bills to win relationships.',
    ], steps: [
      'Confirm your airtime prices exactly match face value.',
      'Set keen but profitable prices on your data bundles.',
    ]),
    _lesson('c2', 6, 'The Daily Operations Routine', 4, [
      'A smooth airtime business runs on a repeatable daily routine. Opening with '
          'a funded wallet, a check of the previous day\'s reconciliation, and a '
          'fresh WhatsApp status keeps you ready and visible. Throughout the day, '
          'fast delivery and instant confirmation keep customers happy.',
      'Closing the day with a full reconciliation, recording debts, and topping '
          'up for tomorrow turns chaos into control. A consistent routine is what '
          'lets you serve high volume without mistakes or burnout.',
    ], steps: [
      'Write your opening, midday and closing routine.',
      'Add a daily reconciliation step you never skip.',
    ], takeaways: [
      'A repeatable routine turns volume into control.',
      'Open funded and visible; close reconciled and restocked.',
      'Consistency prevents mistakes and burnout.',
    ]),
    _lesson('c2', 7, 'Avoiding Common Reselling Mistakes', 4, [
      'The mistakes that sink airtime resellers are predictable: giving credit '
          'that never comes back, sending value to the wrong number, keeping no '
          'records, and choosing an unreliable platform. Each one quietly drains '
          'the thin margins the business depends on.',
      'Protect yourself with simple rules: cash or confirmed transfer only, '
          'double-check every number before dispensing, record every transaction, '
          'and pick reliability over the cheapest rate. Discipline on these four '
          'points puts you ahead of most beginners.',
    ], concepts: [
      KeyConcept('The Wrong-Number Trap',
          'Always confirm the recipient number before dispensing — mistakes come out of your pocket.'),
    ], steps: [
      'Adopt a no-credit rule for new customers.',
      'Create a habit of reading numbers back before dispensing.',
    ], takeaways: [
      'Credit, wrong numbers, no records and bad platforms sink resellers.',
      'Cash or confirmed transfer only, at first.',
      'Confirm every number; record every sale.',
    ]),
    _lesson('c2', 8, 'Handling Failed Transactions', 4, [
      'Failed or hanging transactions are inevitable, and how you handle them '
          'defines your reputation. When value does not arrive, stay calm, check '
          'your platform\'s transaction log, and communicate clearly with the '
          'worried customer. Most failures resolve or reverse within a set window.',
      'Keep records so you can prove what happened, know your platform\'s dispute '
          'process, and never let a customer feel abandoned mid-problem. A failure '
          'handled with calm competence often wins more loyalty than a hundred '
          'smooth sales.',
    ], steps: [
      'Learn your platform\'s failed-transaction and reversal process.',
      'Script a calm message for customers during a failure.',
    ], takeaways: [
      'Failures are inevitable; your response is what matters.',
      'Check logs, communicate, and follow the dispute process.',
      'Well-handled failures build deep loyalty.',
    ]),
    _lesson('c2', 9, 'Building Trust with Customers', 4, [
      'Trust is the currency of airtime reselling. Customers are sending you money '
          'and expecting instant value, often before they receive anything. Every '
          'fast, honest, reliable transaction deposits trust; every failure or '
          'delay withdraws it. Your whole business rests on that balance.',
      'Build trust deliberately: deliver instantly, communicate clearly, be '
          'honest when something goes wrong, and be consistently available. A '
          'professional presence and visible track record reassure new customers, '
          'while flawless service turns them into regulars who vouch for you.',
    ], takeaways: [
      'Customers pay before receiving — trust is everything.',
      'Instant, honest, reliable service builds trust.',
      'Consistency and availability turn buyers into advocates.',
    ], steps: [
      'List three concrete ways you will signal reliability.',
      'Ask a happy customer to vouch for you publicly.',
    ], quiz: [
      _q('A failed transaction handled calmly can…',
          ['Ruin you instantly', 'Build strong loyalty', 'Never happen', 'Be ignored'], 1),
      _q('Trust in airtime reselling matters because…',
          ['Customers pay before receiving value', 'It is legally required', 'Networks demand it', 'It lowers tax'], 0),
      _q('The wrong-number trap means losses…',
          ['Are covered by the network', 'Come out of your pocket', 'Never occur', 'Are the customer\'s fault'], 1),
      _q('Giving credit to new customers is…',
          ['Recommended', 'A common way to lose capital', 'Required', 'Risk-free'], 1),
      _q('A daily routine helps you…',
          ['Avoid customers', 'Serve volume without mistakes', 'Skip reconciliation', 'Raise prices'], 1),
    ]),
    _lesson('c2', 10, 'Growing Your Customer Numbers', 4, [
      'Steady growth in customer numbers is how an airtime business scales its '
          'thin margins into real income. Growth comes from consistent visibility '
          'and referrals rather than paid advertising. The more people who know you '
          'sell reliably, the more your volume climbs.',
      'Post your availability consistently, ask satisfied customers to refer '
          'others, and make yourself the obvious, easy choice whenever someone '
          'needs recharge. Every new regular adds recurring volume to your base.',
    ], steps: [
      'Commit to a daily availability post.',
      'Ask two customers for referrals this week.',
    ], takeaways: [
      'Growth turns thin margins into real income.',
      'Visibility and referrals beat paid ads.',
      'Every regular adds recurring volume.',
    ]),
    _lesson('c2', 11, 'Introducing Data to Your Airtime Business', 4, [
      'Most successful airtime sellers eventually add data, because data margins '
          'are far higher. Your existing customers already buy data somewhere; '
          'offering it yourself captures that spend and increases your earnings per '
          'customer without finding new people.',
      'Start by learning the best-value bundles on each network and the SME data '
          'reseller options. Introduce data to your existing base as a natural '
          'extension, and watch your margins improve as customers consolidate their '
          'airtime and data purchases with you.',
    ], concepts: [
      KeyConcept('Capture Existing Spend',
          'Your airtime customers already buy data — offer it and earn the higher margin yourself.'),
    ], takeaways: [
      'Data margins dwarf airtime margins.',
      'Your customers already buy data somewhere.',
      'Adding data raises earnings per customer.',
    ], steps: [
      'Identify the best-value data bundles on each network.',
      'Offer data to five existing airtime customers.',
    ]),
    _lesson('c2', 12, 'Record Keeping and Reconciliation', 4, [
      'Records are what separate a business from a guessing game. Every '
          'transaction, debt and top-up should be logged so you know your true '
          'position at any time. Reconciliation — matching what you dispensed '
          'against what you earned and what remains — catches errors and theft '
          'early.',
      'Use the customer records and profit tools in this app, or a disciplined '
          'notebook, and reconcile every single day. Consistent records reveal '
          'whether you are truly profitable and where your money is leaking.',
    ], steps: [
      'Log every transaction for a full week without exception.',
      'Reconcile daily and note any discrepancies.',
    ], takeaways: [
      'Records turn guessing into knowing.',
      'Reconcile daily to catch errors early.',
      'Tools or a disciplined notebook both work.',
    ]),
    _lesson('c2', 13, 'Managing Cash Flow', 4, [
      'Cash flow, the timing of money in and out, can strangle a profitable '
          'business if mismanaged. In airtime reselling, your float can be healthy '
          'on paper but stranded if too much is tied up in unpaid credit or if you '
          'withdraw profit you actually needed for stock.',
      'Protect your float, minimise credit, and keep a clear line between working '
          'capital and profit you can safely take. Smooth cash flow lets you '
          'restock without stress and seize opportunities when they appear.',
    ], takeaways: [
      'Profitable businesses can still fail on cash flow.',
      'Protect float; minimise credit.',
      'Separate working capital from withdrawable profit.',
    ], steps: [
      'Total any outstanding credit and set a plan to shrink it.',
      'Define how much profit you can safely withdraw weekly.',
    ]),
    _lesson('c2', 14, 'Peak Periods and Demand Planning', 4, [
      'Demand for airtime and data is not flat; it spikes in the evenings, at '
          'weekends, at month-end and around salary days and holidays. Anticipating '
          'these peaks lets you fund up in advance and capture the extra volume '
          'instead of running dry at the busiest moment.',
      'Track your own sales patterns to learn your personal peaks, then plan '
          'float and availability around them. Being fully stocked and responsive '
          'when everyone else is scrambling is a quiet but powerful advantage.',
    ], steps: [
      'Note your busiest hours and days over two weeks.',
      'Pre-fund your wallet ahead of predictable peaks.',
    ], takeaways: [
      'Demand spikes at evenings, weekends and month-end.',
      'Pre-fund ahead of peaks to capture volume.',
      'Being stocked when others run dry is an edge.',
    ]),
    _lesson('c2', 15, 'Customer Retention Tactics', 4, [
      'Retaining customers is cheaper and more profitable than constantly finding '
          'new ones. In airtime reselling, retention comes from unfailing '
          'reliability, remembering regulars, and small human touches that make '
          'people feel valued rather than processed.',
      'Keep records of your regulars\' habits, greet them by name, and be the '
          'seller they never have to think twice about. A retained customer buying '
          'weekly for years is the backbone of a stable business.',
    ], takeaways: [
      'Retention is cheaper than acquisition.',
      'Reliability and recognition retain customers.',
      'Regulars buying for years stabilise the business.',
    ], steps: [
      'Identify your top ten regulars and their usual buys.',
      'Choose one personal touch to use with them.',
    ]),
    _lesson('c2', 16, 'Expanding Your Service Offerings', 4, [
      'Once airtime and data run smoothly, adjacent services like electricity '
          'tokens, cable subscriptions and other bill payments let you earn more '
          'from the same customers using the same wallet. Each addition increases '
          'your usefulness and your revenue per customer.',
      'Add services that share your platform and customer base, learn each one '
          'well before promoting it, and let your existing customers know. '
          'Becoming a one-stop digital services point deepens loyalty '
          'substantially.',
    ], takeaways: [
      'Adjacent services earn more from the same customers.',
      'Add what shares your wallet and base.',
      'A one-stop point deepens loyalty.',
    ], steps: [
      'List bill-payment services your platform supports.',
      'Launch one new service to your existing base.',
    ]),
    _lesson('c2', 17, 'When and How to Reinvest', 4, [
      'Reinvestment is the engine of growth in a thin-margin business. Consistently '
          'putting a portion of profit back into a larger float, better tools and '
          'new services compounds a small operation into a substantial one over '
          'months and years.',
      'Decide a fixed share of profit to reinvest, resist the urge to consume all '
          'your earnings early, and direct reinvestment toward whatever most '
          'increases your capacity to serve. Discipline here is what separates '
          'sellers who grow from those who stay small.',
    ], concepts: [
      KeyConcept('Reinvestment Discipline',
          'A fixed share of profit returned to the business compounds growth over time.'),
    ], takeaways: [
      'Reinvestment compounds thin margins into growth.',
      'Fix a share of profit to reinvest.',
      'Direct it to what increases serving capacity.',
    ], steps: [
      'Set the percentage of profit you will reinvest.',
      'Choose your next reinvestment priority.',
    ]),
    _lesson('c2', 18, 'From Reseller to Established Operator', 5, [
      'The final step in airtime reselling mastery is the shift in mindset from '
          'casual seller to established operator. An operator has systems, records, '
          'reliable suppliers, a loyal base and a plan, and treats the venture as a '
          'real business with direction rather than a side hustle reacting to each '
          'day.',
      'Consolidate everything you have learned: run tight operations, keep clean '
          'records, retain customers relentlessly, reinvest with discipline, and '
          'plan your growth. With these in place, you are no longer just someone who '
          'sells airtime; you are running a durable telecom business ready to scale '
          'into data, agency and beyond.',
    ], takeaways: [
      'Operators have systems, records, suppliers, base and a plan.',
      'Treat it as a real business, not a reactive hustle.',
      'Consolidated discipline readies you to scale.',
    ], steps: [
      'Audit your operation against the operator checklist.',
      'Set your next growth goal beyond basic reselling.',
    ], quiz: [
      _q('Reinvestment discipline means…',
          ['Spending all profit', 'Returning a fixed share to the business', 'Never growing', 'Borrowing constantly'], 1),
      _q('Retention is generally ______ than acquisition.',
          ['More expensive', 'Cheaper and more profitable', 'Illegal', 'Slower'], 1),
      _q('Demand for airtime typically spikes at…',
          ['Random times', 'Evenings, weekends and month-end', 'Only January', 'Never'], 1),
      _q('Adding data to an airtime business mainly…',
          ['Lowers margins', 'Raises earnings per customer', 'Loses customers', 'Is illegal'], 1),
      _q('An established operator is defined by…',
          ['Luck', 'Systems, records and a plan', 'Big markups', 'Guaranteed income'], 1),
    ]),
  ],
);

// ---------------------------------------------------------------------------
// COURSE 3 — Data Distribution Business (15 lessons)
// ---------------------------------------------------------------------------

final Course _course3 = Course(
  id: 'c3',
  title: 'Data Distribution Business',
  description:
      'Master the high-margin world of SME data reselling, from setup to '
      'agency-level distribution across all networks.',
  category: 'Data Business',
  difficulty: Difficulty.intermediate,
  icon: Icons.wifi_rounded,
  durationMinutes: 140,
  order: 3,
  lessons: [
    _lesson('c3', 1, 'Why Data Beats Airtime on Margin', 4, [
      'Data reselling exists because the margins dwarf airtime. Where airtime '
          'yields two to four percent, SME and gifting data can yield ten to twenty '
          'percent or more. For the same effort and customer base, focusing on data '
          'multiplies your earnings, which is why serious operators steer toward it.',
      'This course goes deep on the data business: the plan types, the SME model, '
          'sourcing, pricing, and scaling to agency level. Understanding why data '
          'is so profitable is the motivation to master its details.',
    ], concepts: [
      KeyConcept('The Margin Multiplier',
          'Data margins can be several times airtime margins for the same effort.'),
    ], takeaways: [
      'Data margins far exceed airtime margins.',
      'Same customers and effort, higher earnings.',
      'Serious operators prioritise data.',
    ], steps: [
      'Compare a data margin to an airtime margin on N100,000.',
      'Decide which network\'s data you will master first.',
    ]),
    _lesson('c3', 2, 'SME Data Explained', 5, [
      'SME data, sometimes called gifting or corporate data, is the reseller\'s '
          'engine. Operators created these bundles for businesses to share data '
          'among staff, and resellers buy them in bulk at steep discounts, then '
          'transfer bundles to customers. The gap between bulk cost and retail '
          'value is your margin.',
      'Different networks have different SME structures, discounts and transfer '
          'methods. Learning exactly how SME data is purchased and dispensed on each '
          'network is the core technical skill of the data business.',
    ], concepts: [
      KeyConcept('SME / Gifting Data',
          'Bulk-discounted data resellers transfer to customers, carrying the highest margins.'),
    ], takeaways: [
      'SME data is bought in bulk and transferred to customers.',
      'The bulk-to-retail gap is your margin.',
      'Each network has its own SME structure to learn.',
    ], steps: [
      'Research SME data on your chosen network.',
      'Learn its exact purchase and transfer method.',
    ]),
    _lesson('c3', 3, 'Sourcing Data Cheaply and Reliably', 5, [
      'Your data margins depend entirely on your source. The cheaper and more '
          'reliable your supply, the better your prices and profits. Sources range '
          'from VTU platforms with SME data to direct sub-dealer arrangements with '
          'larger data distributors.',
      'Evaluate sources on price, reliability and delivery speed, and always keep '
          'a backup. Building a strong relationship with a dependable data supplier, '
          'and growing your volume with them, unlocks better tiers over time.',
    ], takeaways: [
      'Your margin depends on your data source.',
      'Judge sources on price, reliability and speed.',
      'Keep a backup and grow volume for better tiers.',
    ], steps: [
      'Identify a primary and backup data source.',
      'Compare their SME prices for your top network.',
    ], quiz: [
      _q('SME data typically carries margins of about…',
          ['0%', '2–4%', '10–20%+', 'Negative'], 2),
      _q('SME data is best described as…',
          ['Free data', 'Bulk-discounted data transferred to customers', 'Airtime', 'Recharge cards'], 1),
      _q('Your data margin depends most on…',
          ['The weather', 'Your source', 'Your age', 'Your phone brand'], 1),
      _q('Compared to airtime, data margins are…',
          ['Lower', 'Much higher', 'Identical', 'Zero'], 1),
      _q('You should always keep a data source…',
          ['Secret', 'Backup', 'Unfunded', 'Unreliable'], 1),
    ]),
    _lesson('c3', 4, 'Understanding Plan Types and Validity', 4, [
      'Data plans vary by volume, validity and network, and matching the right '
          'plan to a customer\'s real usage is a core skill. Daily and weekly plans '
          'suit light, price-sensitive users; monthly plans suit steady users; large '
          'bundles suit heavy users and small businesses.',
      'Knowing validity and rollover rules lets you advise honestly. A customer '
          'who buys the right-sized plan saves money and trusts you more, becoming a '
          'loyal repeat buyer on a predictable cycle.',
    ], takeaways: [
      'Plans vary by volume, validity and network.',
      'Match plan size to real usage.',
      'Honest advice builds loyal repeat buyers.',
    ], steps: [
      'List the daily, weekly and monthly plans you will stock knowledge of.',
      'Note validity and rollover rules for each.',
    ]),
    _lesson('c3', 5, 'Pricing Data for Profit and Value', 4, [
      'Data pricing balances margin against competitiveness. Because customers can '
          'compare your price to the network\'s direct price, you must offer clear '
          'value while protecting a healthy margin. Price a little below direct '
          'retail so customers see the benefit of buying from you.',
      'Use the pricing calculator in this app to set prices from your cost and '
          'desired margin, and review them as source costs change. Consistent, '
          'transparent pricing builds trust and repeat business.',
    ], takeaways: [
      'Price below direct retail but protect your margin.',
      'Customers compare to network prices — offer clear value.',
      'Review prices as source costs change.',
    ], steps: [
      'Use the pricing tool to set data prices from cost and margin.',
      'Compare your prices to direct network prices.',
    ]),
    _lesson('c3', 6, 'Serving Individual Customers', 4, [
      'Individual retail customers are the bread and butter of a starting data '
          'business. They buy for themselves and their families, often on a monthly '
          'cycle. Fast delivery, correct bundles and honest advice turn them into '
          'loyal regulars.',
      'Keep records of what each regular buys so you can remind them at renewal '
          'and recommend better value. Reliable service to individuals builds the '
          'base from which agency-level growth later springs.',
    ], takeaways: [
      'Individuals on monthly cycles are the starting base.',
      'Fast, correct, honest service retains them.',
      'Records enable renewal reminders and upsell.',
    ], steps: [
      'Record five data regulars and their usual bundles.',
      'Set renewal reminders for them.',
    ]),
    _lesson('c3', 7, 'Selling to Small Businesses', 4, [
      'Small businesses consume far more data than individuals and buy more '
          'predictably, making them prized customers. Shops, cyber cafes, offices '
          'and online sellers all need steady data and value a reliable supplier '
          'who never leaves them stranded.',
      'Approach small businesses with reliability and slightly bulk-friendly '
          'pricing. Winning a handful of steady business customers can transform '
          'your volume and stability.',
    ], concepts: [
      KeyConcept('Business Customers',
          'Small firms buy more data, more predictably, than individuals — prize them.'),
    ], takeaways: [
      'Businesses buy more data, more predictably.',
      'Reliability matters most to them.',
      'A few steady business customers transform volume.',
    ], steps: [
      'List local small businesses that need steady data.',
      'Prepare a reliability-focused pitch for them.',
    ]),
    _lesson('c3', 8, 'Building a Data Subscriber Base', 4, [
      'A subscriber base is a group of customers who buy from you regularly, '
          'ideally on predictable cycles. Building one turns unpredictable sales '
          'into a stable, forecastable income stream. Every loyal data customer '
          'added compounds your monthly volume.',
      'Grow the base through consistent visibility, referrals and excellent '
          'service, and nurture it with renewal reminders and honest advice. A '
          'strong subscriber base is the single most valuable asset a data business '
          'can own.',
    ], takeaways: [
      'A subscriber base makes income stable and forecastable.',
      'Grow it via visibility, referrals and service.',
      'It is the data business\'s most valuable asset.',
    ], steps: [
      'Set a target number of monthly data subscribers.',
      'Plan how renewal reminders will retain them.',
    ]),
    _lesson('c3', 9, 'Managing High-Volume Transactions', 4, [
      'As data volume grows, operational discipline becomes critical. High volume '
          'means more transfers, more records and more chances for error. Systems '
          'and records keep you accurate and prevent losses at scale.',
      'Use tools to track every transaction, reconcile daily, and keep your source '
          'wallets funded ahead of demand. Smooth high-volume operation is what '
          'lets a data business scale without chaos.',
    ], takeaways: [
      'High volume raises error risk without systems.',
      'Track every transaction and reconcile daily.',
      'Fund source wallets ahead of demand.',
    ], steps: [
      'Adopt a transaction-logging habit for all data sales.',
      'Set wallet thresholds to pre-fund before peaks.',
    ], quiz: [
      _q('Small businesses are prized data customers because they buy…',
          ['Rarely', 'More and more predictably', 'Only airtime', 'Below cost'], 1),
      _q('A subscriber base makes income…',
          ['Random', 'Stable and forecastable', 'Illegal', 'Smaller'], 1),
      _q('At high volume, the biggest risk without systems is…',
          ['Boredom', 'Errors and losses', 'Too much profit', 'Fame'], 1),
      _q('Data prices should sit… relative to direct network prices.',
          ['Far above', 'A little below', 'Exactly triple', 'At zero'], 1),
      _q('The most valuable asset of a data business is…',
          ['Its logo', 'Its subscriber base', 'Its phone', 'Its rent'], 1),
    ]),
    _lesson('c3', 10, 'Introduction to Agency-Level Distribution', 5, [
      'Agency-level distribution means supplying other sellers rather than only '
          'end customers. As an agent or sub-distributor, you buy data in large '
          'volume at better rates and supply smaller resellers, earning a margin on '
          'their turnover. This multiplies your reach far beyond what you could '
          'sell personally.',
      'Moving to agency level requires more capital, reliable supply, and clear '
          'terms with the sellers you serve. Done well, it turns your data business '
          'into a distribution hub with many downstream sellers depending on you.',
    ], concepts: [
      KeyConcept('Agency Distribution',
          'Supplying smaller resellers in bulk multiplies reach beyond personal sales.'),
    ], takeaways: [
      'Agency level means supplying other sellers.',
      'It multiplies reach beyond personal capacity.',
      'It needs capital, reliable supply and clear terms.',
    ], steps: [
      'Assess whether your volume justifies agency-level buying.',
      'Draft terms for supplying downstream sellers.',
    ]),
    _lesson('c3', 11, 'Supplying Sub-Dealers', 4, [
      'Supplying sub-dealers is the practical core of agency distribution. You '
          'provide smaller sellers with data at a rate between your cost and retail, '
          'letting them profit while you earn on their combined volume. Clear rules '
          'on payment and no uncontrolled credit protect your capital.',
      'Support your sub-dealers with reliability and fair terms so they grow, '
          'because their growth is your growth. A network of thriving sub-dealers '
          'is a powerful, scalable engine.',
    ], takeaways: [
      'Supply sub-dealers between cost and retail.',
      'Clear payment rules protect your capital.',
      'Their growth is your growth.',
    ], steps: [
      'Set your sub-dealer pricing and payment terms.',
      'Identify two potential sub-dealers to supply.',
    ]),
    _lesson('c3', 12, 'Technology and Automation for Data', 4, [
      'At scale, technology multiplies what one person can handle. Platforms that '
          'automate transfers, track transactions and manage sub-dealer accounts '
          'let you serve far more customers accurately. Automation reduces errors '
          'and frees your time for growth.',
      'Adopt tools deliberately as you scale, ensuring they are reliable and fit '
          'your operation. The right technology stack is what lets a data business '
          'grow from solo retail to agency distribution without breaking.',
    ], takeaways: [
      'Technology multiplies capacity at scale.',
      'Automation reduces errors and frees time.',
      'A reliable stack enables agency-level growth.',
    ], steps: [
      'Identify one process you could automate as you grow.',
      'Evaluate a platform that supports sub-dealer management.',
    ]),
    _lesson('c3', 13, 'Scaling Capital and Cash Flow', 4, [
      'Agency-level data distribution ties up more capital and makes cash flow '
          'management vital. Large bulk purchases, sub-dealer credit exposure and '
          'timing mismatches can strain even a profitable operation. Discipline and '
          'clear terms keep the money moving.',
      'Protect your working capital, minimise credit exposure, and reinvest '
          'growth deliberately. Sound cash flow management is what lets you scale '
          'volume without a liquidity crisis.',
    ], takeaways: [
      'Scaling ties up more capital.',
      'Credit exposure and timing can strain cash flow.',
      'Discipline and clear terms keep money moving.',
    ], steps: [
      'Map your capital tied up at higher volume.',
      'Set strict credit limits for sub-dealers.',
    ]),
    _lesson('c3', 14, 'Risk Management in Data Distribution', 4, [
      'Larger operations carry larger risks: supplier failure, sub-dealer default, '
          'transaction errors and market price shifts. Managing these risks '
          'deliberately protects the business you have built. Diversified suppliers, '
          'credit controls and solid records are your defences.',
      'Anticipate what could go wrong and prepare for it before it happens. A '
          'data distributor who manages risk calmly and systematically survives the '
          'shocks that fold less prepared competitors.',
    ], takeaways: [
      'Bigger operations carry bigger risks.',
      'Diversify suppliers and control credit.',
      'Prepared distributors survive shocks.',
    ], steps: [
      'List your top three distribution risks.',
      'Define one safeguard for each.',
    ]),
    _lesson('c3', 15, 'Becoming a Regional Data Distributor', 5, [
      'The summit of the data business is becoming a recognised regional '
          'distributor with many downstream sellers, strong supplier tiers, and '
          'substantial, stable volume. This is built over time through reliability, '
          'reinvestment, and steadily growing a network of loyal customers and '
          'sub-dealers.',
      'Consolidate everything: high-margin data mastery, a strong subscriber base, '
          'reliable agency supply, sound cash flow and risk management, and a clear '
          'growth plan. With these, your data business becomes a durable '
          'distribution enterprise serving a whole region.',
    ], takeaways: [
      'The summit is recognised regional distribution.',
      'It is built on reliability and reinvestment over time.',
      'Consolidated mastery creates a durable enterprise.',
    ], steps: [
      'Define what regional distribution would look like for you.',
      'Set a long-term plan to build toward it.',
    ], quiz: [
      _q('Agency-level distribution means…',
          ['Selling only to individuals', 'Supplying other sellers in bulk', 'Quitting data', 'Buying at retail'], 1),
      _q('Supplying sub-dealers, their growth is…',
          ['Your loss', 'Your growth', 'Irrelevant', 'A risk only'], 1),
      _q('Scaling data distribution makes ______ vital.',
          ['Ignoring records', 'Cash flow management', 'Higher markups', 'Guaranteed income'], 1),
      _q('A key defence against distribution risk is…',
          ['Single supplier', 'Diversified suppliers and credit control', 'No records', 'Unlimited credit'], 1),
      _q('Regional distribution is built through…',
          ['Luck overnight', 'Reliability and reinvestment over time', 'Big markups', 'Avoiding customers'], 1),
    ]),
  ],
);

// ---------------------------------------------------------------------------
// COURSE 4 — Customer Acquisition Strategies (12 lessons)
// ---------------------------------------------------------------------------

final Course _course4 = Course(
  id: 'c4',
  title: 'Customer Acquisition Strategies',
  description:
      'Proven, low-cost ways to win telecom customers — WhatsApp marketing, '
      'referrals, smart pricing and retention that keeps them.',
  category: 'Marketing',
  difficulty: Difficulty.intermediate,
  icon: Icons.groups_2_rounded,
  durationMinutes: 110,
  order: 4,
  lessons: [
    _lesson('c4', 1, 'Understanding Your Ideal Customer', 4, [
      'Winning customers starts with knowing exactly who you serve. Students, '
          'traders, office workers and small businesses each have different buying '
          'habits, price sensitivity and preferred networks. Defining your ideal '
          'customer sharpens every marketing move.',
      'Describe your target in detail: where they are, what they buy, what they '
          'value. The clearer your picture, the easier it is to reach and convince '
          'them.',
    ], concepts: [
      KeyConcept('Customer Persona',
          'A clear picture of who you serve sharpens every acquisition effort.'),
    ], takeaways: [
      'Know exactly who you serve.',
      'Different customers buy differently.',
      'Clarity makes acquisition easier.',
    ], steps: [
      'Write a one-paragraph profile of your ideal customer.',
      'Note where they gather and what they value.',
    ]),
    _lesson('c4', 2, 'Starting With Your Warm Network', 4, [
      'Your first customers come from people who already trust you: family, '
          'friends, classmates, colleagues and neighbours. This warm network is the '
          'cheapest and fastest source of early sales because trust is already '
          'established.',
      'Let everyone in your circle know what you do, make buying from you easy, '
          'and deliver flawlessly so they become your first advocates. Your first '
          'ten customers almost always come from here.',
    ], takeaways: [
      'First customers come from those who trust you.',
      'Warm networks convert fastest.',
      'Flawless service turns them into advocates.',
    ], steps: [
      'List twenty people in your warm network.',
      'Tell five of them what you sell this week.',
    ]),
    _lesson('c4', 3, 'WhatsApp Marketing Mastery', 5, [
      'WhatsApp is the most powerful free acquisition channel for telecom '
          'sellers. Your status, broadcast lists and quick replies let you reach '
          'and serve dozens or hundreds of contacts at almost no cost. Consistency '
          'is the key: posting your plans and availability daily keeps you top of '
          'mind.',
      'Craft clear, repeatable status posts with your plans, prices and a simple '
          'call to action. Build broadcast lists of willing customers and message '
          'them with genuine value, not spam. Done well, WhatsApp alone can drive a '
          'whole business.',
    ], concepts: [
      KeyConcept('Status Consistency',
          'Daily, clear WhatsApp status posts keep you top of mind at zero cost.'),
    ], takeaways: [
      'WhatsApp is the top free acquisition channel.',
      'Consistency keeps you top of mind.',
      'Broadcast value, never spam.',
    ], steps: [
      'Design a repeatable status template.',
      'Build a broadcast list of willing customers.',
    ], quiz: [
      _q('Your first customers usually come from…',
          ['Strangers', 'People who already trust you', 'Paid ads', 'Billboards'], 1),
      _q('The top free acquisition channel for telecom sellers is…',
          ['Television', 'WhatsApp', 'Radio', 'Newspaper'], 1),
      _q('A customer persona helps you…',
          ['Pay tax', 'Sharpen acquisition', 'Avoid selling', 'Raise prices only'], 1),
      _q('WhatsApp status works best when it is…',
          ['Rare', 'Consistent and clear', 'Spammy', 'Hidden'], 1),
      _q('Broadcast lists should deliver…',
          ['Spam', 'Genuine value', 'Nothing', 'Complaints'], 1),
    ]),
    _lesson('c4', 4, 'Building a Referral Engine', 4, [
      'Referrals are the highest-quality, lowest-cost customers you can get, '
          'because they arrive pre-trusted through someone they know. A referral '
          'engine turns your satisfied customers into a steady source of new ones.',
      'Make referrals easy and natural by being memorable and reliable, and '
          'gently ask happy customers to recommend you. Every great transaction is '
          'a chance to earn a referral.',
    ], takeaways: [
      'Referrals arrive pre-trusted and cost nothing.',
      'Great service earns referrals.',
      'Ask happy customers to recommend you.',
    ], steps: [
      'Ask three satisfied customers for referrals.',
      'Make your contact easy to share.',
    ]),
    _lesson('c4', 5, 'Pricing to Win Customers', 4, [
      'Smart pricing wins customers first, then improves as volume grows. Early '
          'on, keen but profitable prices attract people to try you; once they '
          'experience your reliability, they stay even as your margins normalise.',
      'Never price below cost or above airtime face value, but use sensible '
          'introductory value on data and bundles to win the relationship. The '
          'relationship, not the single sale, is the prize.',
    ], concepts: [
      KeyConcept('Win-Then-Grow',
          'Keen early pricing wins the relationship; margins improve as volume grows.'),
    ], takeaways: [
      'Price to win the relationship first.',
      'Never below cost or above face value.',
      'The relationship is the real prize.',
    ], steps: [
      'Set keen but profitable introductory data prices.',
      'Plan how margins normalise as customers stay.',
    ]),
    _lesson('c4', 6, 'Local and Community Marketing', 4, [
      'Beyond your phone, the physical and online communities around you are rich '
          'sources of customers. Markets, campuses, estates, religious groups and '
          'local WhatsApp and Facebook groups all gather potential customers in one '
          'place.',
      'Show up consistently and helpfully in these communities, making your '
          'services known without spamming. Becoming the trusted telecom person in '
          'a community can supply steady customers for years.',
    ], takeaways: [
      'Local and online communities gather customers.',
      'Show up helpfully, not spammily.',
      'Being the community\'s telecom person pays for years.',
    ], steps: [
      'List three communities you belong to.',
      'Plan a helpful, non-spammy presence in each.',
    ]),
    _lesson('c4', 7, 'Creating Irresistible Offers', 4, [
      'A well-crafted offer gives hesitant customers a reason to try you now '
          'rather than later. Offers should add genuine value, such as bundling, '
          'reliability guarantees or a small first-time benefit, without gimmicks '
          'or unsustainable giveaways.',
      'Design offers that attract trials and convert them into regulars through '
          'great service. The goal of any offer is a lasting customer, not a '
          'one-time bargain hunter.',
    ], takeaways: [
      'Offers give a reason to try you now.',
      'Add genuine value, avoid gimmicks.',
      'The goal is a lasting customer.',
    ], steps: [
      'Design one genuine first-time offer.',
      'Plan how you convert triallists to regulars.',
    ]),
    _lesson('c4', 8, 'Handling Objections and Doubts', 4, [
      'New customers often hesitate out of fear of scams or unreliable sellers. '
          'Addressing these doubts directly, with proof of reliability, '
          'testimonials and a professional presence, converts the hesitant into '
          'buyers.',
      'Listen to concerns, reassure with evidence, and let a smooth first '
          'transaction do the rest. Overcoming initial doubt is often all that '
          'stands between you and a loyal customer.',
    ], takeaways: [
      'Hesitation usually comes from fear of scams.',
      'Proof and professionalism convert doubters.',
      'A smooth first transaction seals trust.',
    ], steps: [
      'Prepare answers to the top three customer doubts.',
      'Gather proof and testimonials to reassure.',
    ]),
    _lesson('c4', 9, 'Converting One-Time Buyers to Regulars', 4, [
      'The real value is in turning a first sale into a lasting relationship. A '
          'one-time buyer becomes a regular through reliability, recognition and '
          'gentle follow-up that reminds them you are there when they next need '
          'airtime or data.',
      'Record new customers, deliver flawlessly, and stay in light, valuable '
          'contact. Each regular you create adds recurring revenue and stability.',
    ], takeaways: [
      'Turn first sales into lasting relationships.',
      'Reliability and follow-up create regulars.',
      'Each regular adds recurring revenue.',
    ], steps: [
      'Record every new customer for follow-up.',
      'Plan a light, valuable follow-up message.',
    ]),
    _lesson('c4', 10, 'Retention: Keeping Customers for Years', 4, [
      'Retention is where profit compounds. A customer kept for years, buying '
          'weekly, is worth vastly more than the effort to win them. Retention '
          'comes from unfailing reliability and making customers feel valued.',
      'Track regulars, remember their preferences, and never give them a reason '
          'to look elsewhere. Retention, not constant acquisition, is the quiet '
          'engine of a stable business.',
    ], concepts: [
      KeyConcept('Retention Compounds',
          'A customer kept for years is worth far more than the cost to win them.'),
    ], takeaways: [
      'Retention is where profit compounds.',
      'Reliability and recognition retain customers.',
      'Retention beats constant acquisition.',
    ], steps: [
      'Identify your at-risk regulars and re-engage them.',
      'Choose one retention habit to adopt.',
    ]),
    _lesson('c4', 11, 'Measuring What Works', 4, [
      'Not every acquisition tactic pays off equally, and measuring results tells '
          'you where to focus. Track how new customers found you, which channels '
          'produce the most, and which offers convert best.',
      'Double down on what works and drop what does not. Simple measurement turns '
          'guesswork into a focused, efficient acquisition effort.',
    ], takeaways: [
      'Measure how customers find you.',
      'Focus on the channels that produce.',
      'Measurement turns guesswork into focus.',
    ], steps: [
      'Start asking new customers how they found you.',
      'Note which channel produces the most.',
    ]),
    _lesson('c4', 12, 'Your Acquisition Action Plan', 5, [
      'Everything comes together in a concrete acquisition plan. Combine your '
          'warm network, consistent WhatsApp marketing, referrals, community '
          'presence and smart pricing into a repeatable weekly rhythm that steadily '
          'grows your customer base.',
      'Set targets, act consistently, measure results and adjust. A disciplined '
          'acquisition plan, executed every week, is what turns a handful of '
          'customers into a thriving base.',
    ], takeaways: [
      'Combine tactics into a weekly rhythm.',
      'Set targets and measure results.',
      'Consistency grows the base.',
    ], steps: [
      'Write your weekly acquisition routine.',
      'Set a 90-day customer growth target.',
    ], quiz: [
      _q('Retention matters because a long-kept customer is worth…',
          ['Less', 'Far more than the cost to win them', 'The same', 'Nothing'], 1),
      _q('Measuring acquisition tells you…',
          ['Nothing useful', 'Where to focus effort', 'Your tax', 'The weather'], 1),
      _q('Good offers aim to create…',
          ['One-time bargain hunters', 'Lasting customers', 'Losses', 'Confusion'], 1),
      _q('Customer hesitation usually comes from…',
          ['Boredom', 'Fear of scams', 'Too much trust', 'Low prices'], 1),
      _q('An acquisition plan should be executed…',
          ['Once', 'Consistently every week', 'Never', 'Randomly'], 1),
    ]),
  ],
);

// ---------------------------------------------------------------------------
// COURSE 5 — Scaling Your Telecom Agency (16 lessons)
// ---------------------------------------------------------------------------

final Course _course5 = Course(
  id: 'c5',
  title: 'Scaling Your Telecom Agency',
  description:
      'Move from solo operator to a structured agency — building teams, '
      'managing suppliers, systems and a brand that scales.',
  category: 'Agency',
  difficulty: Difficulty.advanced,
  icon: Icons.hub_rounded,
  durationMinutes: 160,
  order: 5,
  lessons: [
    _lesson('c5', 1, 'When Are You Ready to Scale?', 4, [
      'Scaling too early breaks a business; scaling too late wastes opportunity. '
          'You are ready when your solo operation is consistently profitable, your '
          'systems and records are solid, and demand exceeds what you can '
          'personally serve.',
      'Assess your readiness honestly against these signs before adding people, '
          'sub-dealers or locations. Scaling amplifies whatever you already are, so '
          'the foundation must be sound first.',
    ], concepts: [
      KeyConcept('Scale Amplifies',
          'Growth multiplies your existing strengths and weaknesses — fix the base first.'),
    ], takeaways: [
      'Ready when profitable, systematic and demand-constrained.',
      'Scaling amplifies existing strengths and flaws.',
      'Sound foundations must come first.',
    ], steps: [
      'Assess your profitability and systems honestly.',
      'Confirm demand exceeds your solo capacity.',
    ]),
    _lesson('c5', 2, 'The Sub-Dealer Growth Model', 4, [
      'The most capital-efficient way to scale is supplying sub-dealers who serve '
          'their own customers using value they buy from you. You earn on their '
          'combined volume without handling every transaction.',
      'Set clear pricing and payment terms, control credit strictly, and support '
          'sub-dealers so they thrive. A network of successful sub-dealers '
          'multiplies your reach dramatically.',
    ], takeaways: [
      'Sub-dealers scale reach capital-efficiently.',
      'You earn on their combined volume.',
      'Clear terms and credit control are essential.',
    ], steps: [
      'Design your sub-dealer pricing and terms.',
      'Identify your first two sub-dealers.',
    ]),
    _lesson('c5', 3, 'Building and Training a Team', 5, [
      'When you bring on staff, your job shifts from doing to leading. A good team '
          'multiplies capacity, but only if trained to your service standard and '
          'trusted with clear accountability, especially around money.',
      'Document how things should be done, train deliberately, and build trust '
          'gradually with clear roles and controls. Your team becomes an asset only '
          'when it can uphold your standards without you watching.',
    ], concepts: [
      KeyConcept('Document Then Delegate',
          'Write down your standard so others can uphold it without you.'),
    ], takeaways: [
      'Scaling shifts you from doing to leading.',
      'Train the team to your standard.',
      'Clear roles and money controls are vital.',
    ], steps: [
      'Document your core service procedures.',
      'Define roles and cash-handling controls.',
    ], quiz: [
      _q('You are ready to scale when your solo operation is…',
          ['Barely surviving', 'Profitable and systematic with excess demand', 'Brand new', 'Unrecorded'], 1),
      _q('Scaling amplifies…',
          ['Only strengths', 'Existing strengths and weaknesses', 'Nothing', 'Only luck'], 1),
      _q('The most capital-efficient scaling model is…',
          ['Opening ten shops', 'Supplying sub-dealers', 'Quitting', 'Only ads'], 1),
      _q('Before delegating, you should…',
          ['Hide your methods', 'Document your standard', 'Fire everyone', 'Stop selling'], 1),
      _q('When you hire staff, your role shifts to…',
          ['Doing everything alone', 'Leading', 'Quitting', 'Ignoring quality'], 1),
    ]),
    _lesson('c5', 4, 'Systems and Standard Operating Procedures', 4, [
      'Systems are what let a business run without depending on the owner\'s '
          'memory. Standard operating procedures for funding, dispensing, records, '
          'reconciliation and customer service make quality repeatable across '
          'people and locations.',
      'Write down how each core task should be done, then improve the procedures '
          'over time. Systematising is what turns a personal hustle into a '
          'scalable enterprise.',
    ], takeaways: [
      'Systems remove dependence on the owner\'s memory.',
      'SOPs make quality repeatable.',
      'Systematising enables true scale.',
    ], steps: [
      'Write SOPs for your five core tasks.',
      'Review and refine them monthly.',
    ]),
    _lesson('c5', 5, 'Managing Multiple Suppliers', 4, [
      'At agency scale, relying on one supplier is dangerous. Multiple reliable '
          'suppliers give you better rates through competition, protection against '
          'downtime, and leverage in negotiation.',
      'Cultivate a primary and secondary supplier per key product, keep them '
          'funded, and grow volume to unlock better tiers. Diversified supply is '
          'both a safety net and a margin lever.',
    ], takeaways: [
      'One supplier is a single point of failure.',
      'Multiple suppliers give rates, safety and leverage.',
      'Volume unlocks better tiers.',
    ], steps: [
      'Establish a primary and backup for each key product.',
      'Plan volume growth to reach better tiers.',
    ]),
    _lesson('c5', 6, 'Cash Flow at Scale', 4, [
      'Larger operations move much more money, and small percentage leaks become '
          'large absolute losses. Cash flow discipline, protecting float, '
          'controlling credit and timing purchases, becomes mission-critical at '
          'scale.',
      'Forecast your cash needs, keep buffers, and never let sub-dealer credit or '
          'bulk purchases strand your liquidity. Sound cash flow is what lets you '
          'scale volume safely.',
    ], takeaways: [
      'Small leaks become large losses at scale.',
      'Protect float and control credit.',
      'Forecast needs and keep buffers.',
    ], steps: [
      'Forecast your cash needs at target volume.',
      'Set liquidity buffers and credit limits.',
    ]),
    _lesson('c5', 7, 'Technology for a Growing Agency', 4, [
      'The right technology lets a small team serve a large customer base '
          'accurately. Platforms that manage sub-dealers, automate transactions and '
          'produce records reduce errors and free your people for growth.',
      'Adopt reliable, fit-for-purpose tools as you scale, and train your team to '
          'use them. Technology is the multiplier that makes agency-scale service '
          'possible.',
    ], takeaways: [
      'Technology lets a small team serve many.',
      'Automation reduces errors at scale.',
      'Adopt reliable, fit-for-purpose tools.',
    ], steps: [
      'Identify processes to automate as you grow.',
      'Train your team on your core tools.',
    ]),
    _lesson('c5', 8, 'Managing People and Accountability', 4, [
      'People are your biggest asset and biggest risk at scale. Clear roles, fair '
          'treatment, and strong accountability, especially around cash, keep a '
          'team productive and honest.',
      'Lead by example, communicate expectations clearly, and address problems '
          'early. A well-managed team upholds your standards and grows the '
          'business; a poorly managed one erodes it.',
    ], takeaways: [
      'People are the biggest asset and risk at scale.',
      'Clear roles and accountability keep teams honest.',
      'Lead by example and address issues early.',
    ], steps: [
      'Define clear expectations for each team member.',
      'Set cash-handling accountability checks.',
    ]),
    _lesson('c5', 9, 'Expanding to New Locations', 4, [
      'Physical expansion, opening additional points or shops, multiplies reach '
          'but adds cost, staffing and control challenges. Each new location must '
          'be justified by demand and run to the same standard as the first.',
      'Expand deliberately, proving each location before opening the next, and '
          'replicate your systems and standards. Uncontrolled expansion is a common '
          'way growing businesses overreach and stumble.',
    ], takeaways: [
      'New locations multiply reach and cost.',
      'Justify each by demand; run to standard.',
      'Expand deliberately, not recklessly.',
    ], steps: [
      'Assess demand before any new location.',
      'Plan how systems replicate to it.',
    ]),
    _lesson('c5', 10, 'Building Your Agency Brand', 4, [
      'At scale, a recognisable, trusted brand attracts customers and sub-dealers '
          'and commands loyalty. A consistent name, look and reputation for '
          'reliability make your agency the obvious choice in its market.',
      'Invest in consistent branding across every location and channel, and '
          'protect your reputation relentlessly. A strong brand is a durable asset '
          'that compounds over time.',
    ], takeaways: [
      'A trusted brand attracts customers and sub-dealers.',
      'Consistency across locations builds it.',
      'Reputation is a compounding asset.',
    ], steps: [
      'Standardise your branding everywhere.',
      'Define the reputation you will protect.',
    ]),
    _lesson('c5', 11, 'Negotiating Better Terms', 4, [
      'As your volume grows, so does your negotiating power. Better discounts, '
          'credit terms and support are available to high-volume, reliable '
          'partners. Negotiation, done professionally, directly improves your '
          'margins.',
      'Track your volume, know your worth to suppliers, and negotiate terms that '
          'reflect it. The rates you accept are not fixed; they grow with your '
          'leverage.',
    ], takeaways: [
      'Volume grows your negotiating power.',
      'Better terms improve margins directly.',
      'Rates grow with your leverage.',
    ], steps: [
      'Document your volume with each supplier.',
      'Prepare a case for better terms.',
    ]),
    _lesson('c5', 12, 'Risk and Fraud Prevention', 4, [
      'Larger operations attract larger risks, including fraud from customers, '
          'sub-dealers or even staff. Strong records, verification, credit controls '
          'and clear accountability are your defences.',
      'Anticipate how fraud could occur and close the gaps before they are '
          'exploited. Vigilance and good systems protect the business you have '
          'worked hard to build.',
    ], takeaways: [
      'Scale attracts fraud risk.',
      'Records, verification and controls defend you.',
      'Close gaps before they are exploited.',
    ], steps: [
      'List where fraud could occur in your operation.',
      'Add a control for each vulnerability.',
    ]),
    _lesson('c5', 13, 'Financial Management for Agencies', 4, [
      'Agency-level finances demand real bookkeeping: tracking revenue, costs, '
          'margins, debts and reinvestment across a larger operation. Clear '
          'financial visibility is what keeps a growing agency profitable.',
      'Keep disciplined books, review your numbers regularly, and make decisions '
          'from data rather than feel. Financial clarity is the difference between '
          'busy and profitable.',
    ], takeaways: [
      'Agencies need real bookkeeping.',
      'Track revenue, costs, margins and debts.',
      'Decide from data, not feel.',
    ], steps: [
      'Set up disciplined books for the agency.',
      'Schedule regular financial reviews.',
    ]),
    _lesson('c5', 14, 'Sustaining Growth and Momentum', 4, [
      'Reaching a larger scale is not the finish line; sustaining momentum '
          'requires continued reinvestment, adaptation and care for your team, '
          'customers and suppliers. Complacency at scale invites decline.',
      'Keep improving systems, developing people and serving customers well. '
          'Sustained growth comes from doing the fundamentals consistently, even '
          'once you are big.',
    ], takeaways: [
      'Scale is not the finish line.',
      'Momentum needs reinvestment and adaptation.',
      'Fundamentals matter even when big.',
    ], steps: [
      'Identify one system to improve this quarter.',
      'Plan how you will avoid complacency.',
    ]),
    _lesson('c5', 15, 'Leadership and Vision', 4, [
      'A scaled agency reflects its leader\'s vision and discipline. Clear '
          'direction, strong values and the ability to inspire a team distinguish '
          'businesses that keep growing from those that plateau.',
      'Define where you want the agency to go, communicate it, and lead by '
          'example. Leadership, not just operations, is what carries a business to '
          'its full potential.',
    ], takeaways: [
      'A scaled agency reflects its leader.',
      'Vision and values guide growth.',
      'Leadership carries a business to its potential.',
    ], steps: [
      'Write a one-line vision for your agency.',
      'Identify one leadership habit to strengthen.',
    ]),
    _lesson('c5', 16, 'Your Agency Scaling Roadmap', 5, [
      'Bring it together into a roadmap: prove your solo base, add sub-dealers, '
          'build systems and a team, diversify suppliers, manage cash and risk, '
          'strengthen your brand, and lead with vision. Sequenced deliberately, '
          'these steps carry you from operator to agency owner.',
      'Set milestones, execute consistently, and review regularly. A clear '
          'scaling roadmap turns the ambition of a real telecom agency into a '
          'series of achievable steps.',
    ], takeaways: [
      'Sequence scaling steps deliberately.',
      'Set milestones and review regularly.',
      'A roadmap makes agency ambition achievable.',
    ], steps: [
      'Draft your personal scaling roadmap.',
      'Set the next three milestones.',
    ], quiz: [
      _q('Negotiating power grows with…',
          ['Age', 'Volume', 'Luck', 'Location only'], 1),
      _q('New locations should be justified by…',
          ['Ego', 'Demand', 'Boredom', 'Competitors only'], 1),
      _q('At scale, small percentage leaks become…',
          ['Smaller', 'Large absolute losses', 'Irrelevant', 'Profit'], 1),
      _q('A scaled agency reflects its…',
          ['Landlord', 'Leader\'s vision and discipline', 'Suppliers only', 'Customers only'], 1),
      _q('Sustaining momentum requires avoiding…',
          ['Reinvestment', 'Complacency', 'Customers', 'Records'], 1),
    ]),
  ],
);

// ---------------------------------------------------------------------------
// COURSE 6 — Digital Marketing for Telecom (13 lessons)
// ---------------------------------------------------------------------------

final Course _course6 = Course(
  id: 'c6',
  title: 'Digital Marketing for Telecom',
  description:
      'Grow your telecom business online — social media, content, WhatsApp '
      'and a professional presence that converts followers to customers.',
  category: 'Marketing',
  difficulty: Difficulty.intermediate,
  icon: Icons.campaign_rounded,
  durationMinutes: 120,
  order: 6,
  lessons: [
    _lesson('c6', 1, 'Digital Marketing Foundations', 4, [
      'Digital marketing lets a small telecom seller reach far beyond their '
          'immediate circle at little cost. The foundations are a clear message, a '
          'consistent presence, and channels where your customers already spend '
          'time.',
      'You do not need paid ads or a website to start. A focused, consistent '
          'presence on WhatsApp and social media, with a clear value message, is '
          'enough to grow steadily.',
    ], concepts: [
      KeyConcept('Message, Presence, Channel',
          'Clear message + consistent presence + the right channel drives digital growth.'),
    ], takeaways: [
      'Digital marketing extends reach cheaply.',
      'Clarity and consistency matter most.',
      'Start where your customers already are.',
    ], steps: [
      'Write your one-line value message.',
      'Pick the two channels your customers use most.',
    ]),
    _lesson('c6', 2, 'Optimising Your WhatsApp Presence', 4, [
      'WhatsApp is the workhorse of telecom digital marketing. A professional '
          'profile, clear business info, and consistent, valuable status posts turn '
          'it into a powerful sales channel.',
      'Optimise your profile, post plans and availability consistently, and use '
          'broadcast lists to reach customers with genuine value. A well-run '
          'WhatsApp presence alone can sustain a business.',
    ], takeaways: [
      'WhatsApp is the workhorse channel.',
      'Optimise profile and post consistently.',
      'Broadcast value to reach customers.',
    ], steps: [
      'Polish your WhatsApp business profile.',
      'Set a consistent status posting rhythm.',
    ]),
    _lesson('c6', 3, 'Content That Attracts Customers', 5, [
      'Content, useful posts about plans, tips and value, attracts and educates '
          'potential customers. Instead of only selling, sharing genuinely helpful '
          'information builds trust and keeps you top of mind.',
      'Mix promotional posts with educational and value-driven content that your '
          'audience finds useful. Helpful content turns followers into customers '
          'and customers into advocates.',
    ], concepts: [
      KeyConcept('Value Over Selling',
          'Helpful content builds trust that pure selling cannot.'),
    ], takeaways: [
      'Content attracts and educates.',
      'Mix promotion with genuine value.',
      'Helpful content builds trust.',
    ], steps: [
      'Plan a week of mixed promotional and helpful posts.',
      'Share one genuinely useful tip today.',
    ], quiz: [
      _q('Digital marketing foundations are message, presence and…',
          ['Budget', 'The right channel', 'Luck', 'Office'], 1),
      _q('The workhorse channel for telecom is…',
          ['Email', 'WhatsApp', 'Radio', 'Print'], 1),
      _q('Content marketing should favour…',
          ['Only selling', 'Value over selling', 'Silence', 'Spam'], 1),
      _q('To start digital marketing you…',
          ['Must buy ads', 'Do not need paid ads', 'Need a website', 'Need a TV'], 1),
      _q('Helpful content turns followers into…',
          ['Enemies', 'Customers and advocates', 'Nothing', 'Competitors'], 1),
    ]),
    _lesson('c6', 4, 'Using Social Media Effectively', 4, [
      'Beyond WhatsApp, platforms like Instagram, Facebook and TikTok can extend '
          'your reach where your customers gather. Each platform has its own style, '
          'and matching your content to it improves results.',
      'Maintain a consistent presence on the platforms that fit your market, '
          'engage genuinely, and guide interested people toward buying from you. '
          'Social media widens the top of your customer funnel.',
    ], takeaways: [
      'Social platforms extend reach.',
      'Match content to each platform\'s style.',
      'Engagement widens the funnel.',
    ], steps: [
      'Choose one extra platform to build presence on.',
      'Plan content that fits its style.',
    ]),
    _lesson('c6', 5, 'Building a Recognisable Brand Online', 4, [
      'Consistent branding, name, colours, tone and logo, across all your digital '
          'channels makes a small operation look established and trustworthy. '
          'Recognition builds trust, and trust drives sales.',
      'Apply your branding consistently everywhere and keep your tone '
          'professional and friendly. A recognisable online brand reassures new '
          'customers and reinforces loyalty.',
    ], takeaways: [
      'Consistent branding builds recognition.',
      'Recognition builds trust and sales.',
      'Apply branding everywhere.',
    ], steps: [
      'Define your name, colours, logo and tone.',
      'Apply them across all channels.',
    ]),
    _lesson('c6', 6, 'Growing Your Audience', 4, [
      'A larger, engaged audience means more potential customers. Growth comes '
          'from consistent posting, engagement, referrals and appearing where new '
          'people can discover you, all without buying followers or gimmicks.',
      'Focus on genuine, steady audience growth of people who could actually buy '
          'from you. Quality and relevance beat vanity numbers.',
    ], takeaways: [
      'A larger engaged audience means more customers.',
      'Grow through consistency and engagement.',
      'Relevance beats vanity numbers.',
    ], steps: [
      'Set a realistic audience growth goal.',
      'Plan how you will engage new followers.',
    ]),
    _lesson('c6', 7, 'Converting Followers to Buyers', 4, [
      'An audience only matters if it buys. Conversion comes from clear calls to '
          'action, easy ways to purchase, and trust built through content and '
          'social proof. Make the path from interest to purchase effortless.',
      'Guide followers to buy with clear instructions and a smooth first '
          'transaction. Every follower is a potential customer waiting for an easy '
          'reason to act.',
    ], concepts: [
      KeyConcept('Clear Call to Action',
          'Tell followers exactly how to buy and make it effortless.'),
    ], takeaways: [
      'Audiences matter only if they buy.',
      'Clear CTAs and easy buying convert.',
      'Make the path to purchase effortless.',
    ], steps: [
      'Add a clear call to action to your posts.',
      'Simplify how a follower places an order.',
    ]),
    _lesson('c6', 8, 'Managing Your Online Reputation', 4, [
      'Online, your reputation is visible and durable. Positive reviews and '
          'testimonials attract customers; unaddressed complaints repel them. '
          'Actively managing your reputation protects your growth.',
      'Encourage happy customers to share their experience, respond gracefully to '
          'complaints, and let a strong track record speak for you. Reputation is '
          'your most valuable digital asset.',
    ], takeaways: [
      'Online reputation is visible and durable.',
      'Reviews attract; ignored complaints repel.',
      'Manage reputation actively.',
    ], steps: [
      'Ask two happy customers for a public review.',
      'Prepare a gracious response to complaints.',
    ]),
    _lesson('c6', 9, 'Simple Analytics and Measurement', 4, [
      'Even basic measurement, which posts get engagement, which channels bring '
          'customers, tells you where to focus. You cannot improve what you do not '
          'measure, and small insights sharpen your marketing.',
      'Track simple metrics, note what works, and double down on it. Data-guided '
          'marketing steadily outperforms guesswork.',
    ], takeaways: [
      'Basic measurement guides focus.',
      'Track engagement and customer sources.',
      'Double down on what works.',
    ], steps: [
      'Note which posts get the most engagement.',
      'Track where new customers come from.',
    ]),
    _lesson('c6', 10, 'Low-Cost Paid Promotion', 4, [
      'When ready, small, targeted paid promotion can accelerate growth, but only '
          'once your organic presence and conversion process work. Boosting a '
          'proven post to a relevant local audience can bring new customers '
          'affordably.',
      'Start tiny, measure results, and only scale spending on what demonstrably '
          'returns customers. Never spend on ads to compensate for a weak offer or '
          'poor service.',
    ], takeaways: [
      'Paid promotion accelerates a working system.',
      'Start tiny and measure returns.',
      'Never use ads to mask a weak offer.',
    ], steps: [
      'Identify a proven post worth boosting.',
      'Set a tiny test budget and measure it.',
    ]),
    _lesson('c6', 11, 'Consistency and Content Calendars', 4, [
      'Consistency is the secret of digital marketing, and a simple content '
          'calendar makes it achievable. Planning your posts ahead prevents the '
          'gaps and bursts that confuse audiences and weaken results.',
      'Build a simple weekly calendar mixing promotion, value and engagement, and '
          'stick to it. Planned consistency beats sporadic effort every time.',
    ], takeaways: [
      'Consistency is the digital marketing secret.',
      'A calendar makes it achievable.',
      'Planned beats sporadic.',
    ], steps: [
      'Build a simple weekly content calendar.',
      'Schedule a mix of post types.',
    ]),
    _lesson('c6', 12, 'Avoiding Digital Marketing Mistakes', 4, [
      'Common mistakes waste effort: spamming, inconsistency, only ever selling, '
          'ignoring engagement, and chasing vanity metrics. Recognising them lets '
          'you avoid the traps that stall many sellers online.',
      'Focus on genuine value, consistency and real customer relationships rather '
          'than gimmicks. Avoiding the common mistakes puts you ahead of most '
          'competitors online.',
    ], takeaways: [
      'Spamming and inconsistency waste effort.',
      'Only-selling and vanity metrics stall growth.',
      'Value and consistency win.',
    ], steps: [
      'Audit your presence for these mistakes.',
      'Fix the biggest one this week.',
    ]),
    _lesson('c6', 13, 'Your Digital Marketing Plan', 5, [
      'Bring it together into a plan: a clear message, optimised WhatsApp and '
          'social presence, a content calendar mixing value and promotion, '
          'reputation management, and simple measurement. Executed consistently, '
          'this grows your business online steadily.',
      'Set goals, act on your calendar, measure and adjust. A disciplined digital '
          'marketing plan turns online effort into a reliable stream of new '
          'customers.',
    ], takeaways: [
      'Combine message, presence, content and measurement.',
      'Execute the calendar consistently.',
      'Measure and adjust for a reliable customer stream.',
    ], steps: [
      'Write your one-page digital marketing plan.',
      'Commit to a weekly execution routine.',
    ], quiz: [
      _q('Consistency in digital marketing is best supported by…',
          ['Guesswork', 'A content calendar', 'Spamming', 'Silence'], 1),
      _q('Paid promotion should start…',
          ['Huge', 'Tiny and measured', 'Before organic works', 'Never measured'], 1),
      _q('An audience matters only if it…',
          ['Is huge', 'Buys', 'Likes posts', 'Stays silent'], 1),
      _q('Online reputation is…',
          ['Invisible', 'Visible and durable', 'Unimportant', 'Temporary'], 1),
      _q('The secret of digital marketing is…',
          ['Luck', 'Consistency', 'Big budgets', 'Gimmicks'], 1),
    ]),
  ],
);

// ---------------------------------------------------------------------------
// COURSE 7 — Managing Business Finances (11 lessons)
// ---------------------------------------------------------------------------

final Course _course7 = Course(
  id: 'c7',
  title: 'Managing Business Finances',
  description:
      'Keep your telecom business profitable and stable with simple '
      'bookkeeping, profit tracking, cash flow control and smart reinvestment.',
  category: 'Agency',
  difficulty: Difficulty.intermediate,
  icon: Icons.account_balance_wallet_rounded,
  durationMinutes: 100,
  order: 7,
  lessons: [
    _lesson('c7', 1, 'Why Financial Discipline Wins', 4, [
      'In a thin-margin business, financial discipline is the difference between '
          'growth and quiet failure. Many busy sellers are actually losing money '
          'without realising it because they never track their finances. Discipline '
          'turns activity into profit.',
      'This course teaches the simple financial habits that keep a telecom '
          'business healthy: separating money, keeping records, tracking profit, '
          'managing cash flow and reinvesting wisely. None of it is complex; all of '
          'it is essential.',
    ], concepts: [
      KeyConcept('Discipline Over Complexity',
          'Simple, consistent financial habits matter more than sophisticated accounting.'),
    ], takeaways: [
      'Thin margins demand financial discipline.',
      'Busy can still mean losing money.',
      'Simple habits keep the business healthy.',
    ], steps: [
      'Commit to tracking your finances from today.',
      'List the financial habits you currently skip.',
    ]),
    _lesson('c7', 2, 'Separating Business and Personal Money', 4, [
      'Mixing business and personal money is the fastest way to lose control of '
          'your finances. When float, profit and personal spending share one '
          'pocket, you spend your working capital without knowing it and cannot '
          'tell if you are profitable.',
      'Keep a dedicated business account, pay yourself a deliberate amount, and '
          'never dip into float for personal needs. This single discipline '
          'protects your capital and clarifies your true profit.',
    ], takeaways: [
      'Never mix business and personal money.',
      'Use a dedicated account and deliberate pay.',
      'Separation protects capital and clarity.',
    ], steps: [
      'Open or confirm a dedicated business account.',
      'Set a fixed amount to pay yourself.',
    ]),
    _lesson('c7', 3, 'Simple Bookkeeping That Works', 5, [
      'Bookkeeping does not require accounting software or training. Recording '
          'every transaction, sale, purchase, debt and expense, in a notebook or '
          'the tools in this app gives you a true picture of your business at any '
          'time.',
      'The key is consistency: record everything, every day, without exception. '
          'Consistent simple books beat sophisticated systems used sporadically.',
    ], concepts: [
      KeyConcept('Record Everything Daily',
          'Consistent simple records beat sophisticated systems used sporadically.'),
    ], takeaways: [
      'Bookkeeping can be simple.',
      'Record every transaction daily.',
      'Consistency beats sophistication.',
    ], steps: [
      'Choose your record-keeping method.',
      'Record every transaction for a full week.',
    ], quiz: [
      _q('The fastest way to lose financial control is…',
          ['Keeping records', 'Mixing business and personal money', 'Saving', 'Reinvesting'], 1),
      _q('Effective bookkeeping requires…',
          ['Expensive software', 'Consistent daily recording', 'An accountant', 'Nothing'], 1),
      _q('In a thin-margin business, being busy…',
          ['Guarantees profit', 'Can still mean losing money', 'Avoids records', 'Raises margins'], 1),
      _q('You should pay yourself…',
          ['From float randomly', 'A deliberate fixed amount', 'Everything', 'Nothing ever'], 1),
      _q('Simple consistent books beat…',
          ['Nothing', 'Sophisticated systems used sporadically', 'Daily records', 'Discipline'], 1),
    ]),
    _lesson('c7', 4, 'Tracking Profit Accurately', 4, [
      'Profit is not the cash in your account; it is revenue minus all costs, '
          'including the cost of the value you dispensed. Many sellers mistake '
          'float for profit and overspend. Tracking true profit keeps you honest '
          'about how the business is really doing.',
      'Use the profit calculator in this app to know your margin on every sale, '
          'and total your real profit regularly. Accurate profit tracking guides '
          'every sound decision.',
    ], takeaways: [
      'Profit is revenue minus all costs.',
      'Float is not profit.',
      'Accurate profit tracking guides decisions.',
    ], steps: [
      'Calculate true profit on a recent sale.',
      'Total your real profit for the week.',
    ]),
    _lesson('c7', 5, 'Understanding and Managing Cash Flow', 4, [
      'Cash flow is the timing of money moving in and out. A profitable business '
          'can still fail if cash is stranded in credit or spent before it is '
          'needed for stock. Managing cash flow keeps you able to trade smoothly.',
      'Protect your float, minimise credit, and time your purchases and '
          'withdrawals carefully. Healthy cash flow lets you restock without stress '
          'and seize opportunities.',
    ], concepts: [
      KeyConcept('Timing Is Everything',
          'Cash flow is about when money moves, not just how much you earn.'),
    ], takeaways: [
      'Cash flow is about timing.',
      'Profitable businesses can fail on cash flow.',
      'Protect float and minimise credit.',
    ], steps: [
      'Total your outstanding credit and shrink it.',
      'Plan the timing of purchases and withdrawals.',
    ]),
    _lesson('c7', 6, 'Controlling Costs and Expenses', 4, [
      'Every cost eats into thin margins, so controlling expenses directly '
          'protects profit. Data subscriptions, transaction fees, transport and '
          'other costs add up and should be tracked and questioned.',
      'Review your expenses regularly, cut what does not earn its keep, and '
          'negotiate better terms where possible. Disciplined cost control keeps '
          'more of your margin as profit.',
    ], takeaways: [
      'Costs eat thin margins.',
      'Track, question and cut expenses.',
      'Cost control protects profit.',
    ], steps: [
      'List all your recurring business expenses.',
      'Identify one to cut or reduce.',
    ]),
    _lesson('c7', 7, 'Managing Credit and Debtors', 4, [
      'Uncontrolled credit is a leading cause of failure for small telecom '
          'sellers. Value given on credit that is not repaid silently drains your '
          'capital. Managing credit strictly protects the business.',
      'Limit credit to trusted customers, track every debt, and follow up '
          'promptly. When in doubt, sell only for cash or confirmed transfer. Your '
          'thin margins cannot absorb bad debt.',
    ], takeaways: [
      'Uncontrolled credit drains capital.',
      'Limit, track and follow up on all debt.',
      'When in doubt, cash only.',
    ], steps: [
      'Set a strict credit policy.',
      'List and follow up on current debtors.',
    ]),
    _lesson('c7', 8, 'Building a Financial Buffer', 4, [
      'A financial buffer, savings set aside for emergencies and opportunities, '
          'gives your business resilience. Without one, a single bad week or failed '
          'transaction can cripple operations. With one, you weather shocks and '
          'seize opportunities.',
      'Set aside a portion of profit consistently until you have a comfortable '
          'buffer, then maintain it. A buffer turns fragility into stability.',
    ], concepts: [
      KeyConcept('Resilience Buffer',
          'Savings set aside let the business survive shocks and seize opportunities.'),
    ], takeaways: [
      'A buffer gives resilience.',
      'It protects against shocks.',
      'Build and maintain it from profit.',
    ], steps: [
      'Set a target buffer amount.',
      'Start setting aside profit toward it.',
    ]),
    _lesson('c7', 9, 'Smart Reinvestment', 4, [
      'Reinvestment is how a small business grows, but it must be smart. Putting '
          'profit into a larger float, better tools, new services or marketing that '
          'demonstrably returns value compounds growth; spending on things that do '
          'not is waste.',
      'Decide a fixed reinvestment share, direct it to what most increases your '
          'capacity to serve and earn, and review the returns. Smart reinvestment '
          'is disciplined, not impulsive.',
    ], takeaways: [
      'Reinvestment grows a small business.',
      'Direct it to what returns value.',
      'Be disciplined, not impulsive.',
    ], steps: [
      'Set your reinvestment percentage.',
      'Choose your highest-return reinvestment.',
    ]),
    _lesson('c7', 10, 'Reading Your Numbers to Make Decisions', 4, [
      'Your financial records are only useful if you read them to guide '
          'decisions. Regularly reviewing your revenue, margins, costs, debts and '
          'buffer tells you what is working and what to change.',
      'Set a routine to review your numbers, and let data rather than feeling '
          'drive your decisions. The seller who decides from numbers steadily '
          'outperforms the one who guesses.',
    ], takeaways: [
      'Records must be read to be useful.',
      'Review revenue, margins, costs and debts.',
      'Decide from data, not feeling.',
    ], steps: [
      'Schedule a weekly numbers review.',
      'Make one decision from your data this week.',
    ]),
    _lesson('c7', 11, 'Your Financial Management System', 5, [
      'Bring it together into a simple system: separate accounts, daily records, '
          'accurate profit tracking, cash flow and credit control, a buffer, smart '
          'reinvestment and regular reviews. Practised consistently, these habits '
          'keep your business profitable and growing.',
      'Set up your system, run it every day and week, and refine it over time. '
          'Financial management is not glamorous, but it is what keeps a telecom '
          'business alive and thriving.',
    ], takeaways: [
      'Combine the habits into one system.',
      'Run it daily and weekly.',
      'Financial management keeps the business alive.',
    ], steps: [
      'Write your one-page financial system.',
      'Commit to daily and weekly financial routines.',
    ], quiz: [
      _q('Profit is…',
          ['Cash in your account', 'Revenue minus all costs', 'Your float', 'Your revenue'], 1),
      _q('Cash flow is about…',
          ['Only how much you earn', 'The timing of money in and out', 'Your logo', 'Your age'], 1),
      _q('Uncontrolled credit tends to…',
          ['Grow capital', 'Drain capital', 'Raise margins', 'Do nothing'], 1),
      _q('A financial buffer provides…',
          ['Risk', 'Resilience', 'Debt', 'Confusion'], 1),
      _q('Decisions should be driven by…',
          ['Feeling', 'Data', 'Luck', 'Rumour'], 1),
    ]),
  ],
);

// ---------------------------------------------------------------------------
// COURSE 8 — Building a Strong Brand (14 lessons)
// ---------------------------------------------------------------------------

final Course _course8 = Course(
  id: 'c8',
  title: 'Building a Strong Brand',
  description:
      'Turn your telecom business into a trusted brand — identity, customer '
      'trust, reputation and the consistency that makes people choose you.',
  category: 'Marketing',
  difficulty: Difficulty.advanced,
  icon: Icons.verified_rounded,
  durationMinutes: 130,
  order: 8,
  lessons: [
    _lesson('c8', 1, 'What a Brand Really Is', 4, [
      'A brand is not just a logo; it is the promise you make and the reputation '
          'you earn in customers\' minds. In telecom reselling, where products are '
          'identical, your brand is what makes people choose you over the seller '
          'next door.',
      'This course shows how to build a brand from identity through trust to '
          'reputation, so that your name itself becomes a reason customers buy. A '
          'strong brand is a durable, compounding asset.',
    ], concepts: [
      KeyConcept('Brand as Promise',
          'Your brand is the promise you make and the reputation you earn, not just a logo.'),
    ], takeaways: [
      'A brand is a promise and reputation.',
      'It differentiates identical products.',
      'A strong brand compounds over time.',
    ], steps: [
      'Write the promise your brand makes.',
      'Note what you want to be known for.',
    ]),
    _lesson('c8', 2, 'Defining Your Brand Identity', 5, [
      'Brand identity is the visible and felt expression of your business: your '
          'name, logo, colours, tone and personality. A clear, consistent identity '
          'makes you recognisable and trustworthy.',
      'Choose a memorable name, simple colours and a consistent tone, and apply '
          'them everywhere. A coherent identity signals professionalism and helps '
          'customers remember and refer you.',
    ], takeaways: [
      'Identity is your name, logo, colours and tone.',
      'Consistency makes you recognisable.',
      'A coherent identity signals professionalism.',
    ], steps: [
      'Define your brand name, colours and tone.',
      'Apply them consistently across channels.',
    ]),
    _lesson('c8', 3, 'Building Customer Trust', 5, [
      'Trust is the foundation of every telecom brand, because customers send '
          'money expecting instant, reliable value. Every dependable transaction '
          'builds trust; every failure erodes it. Your brand is really the '
          'accumulated trust of many interactions.',
      'Build trust through reliability, honesty, transparency and consistency. '
          'Over time, that trust becomes a reputation that draws customers to your '
          'brand automatically.',
    ], concepts: [
      KeyConcept('Trust Is Accumulated',
          'A brand is the sum of trust earned across many reliable interactions.'),
    ], takeaways: [
      'Trust is the foundation of a telecom brand.',
      'Reliability and honesty build it.',
      'Accumulated trust becomes reputation.',
    ], steps: [
      'List three ways you consistently prove reliability.',
      'Commit to honesty even when it costs you.',
    ], quiz: [
      _q('A brand is fundamentally…',
          ['Just a logo', 'A promise and reputation', 'A price', 'A location'], 1),
      _q('In telecom, brand matters because products are…',
          ['Unique', 'Identical', 'Illegal', 'Free'], 1),
      _q('Trust in a telecom brand is…',
          ['Instant', 'Accumulated across interactions', 'Irrelevant', 'Bought'], 1),
      _q('Brand identity includes name, logo, colours and…',
          ['Tax', 'Tone', 'Rent', 'Luck'], 1),
      _q('A strong brand is a…',
          ['Liability', 'Durable compounding asset', 'One-time cost', 'Gimmick'], 1),
    ]),
    _lesson('c8', 4, 'Consistency Across Every Touchpoint', 4, [
      'A brand is built or broken at every touchpoint: your status posts, your '
          'replies, your delivery speed, your shopfront and your tone. '
          'Inconsistency confuses customers and weakens trust; consistency '
          'reinforces your brand every time.',
      'Hold the same standard and identity across every interaction and channel. '
          'Consistency is what turns scattered efforts into a coherent, memorable '
          'brand.',
    ], takeaways: [
      'Every touchpoint shapes the brand.',
      'Inconsistency weakens trust.',
      'Consistency creates coherence.',
    ], steps: [
      'Audit your touchpoints for consistency.',
      'Align the weakest one with your brand.',
    ]),
    _lesson('c8', 5, 'Delivering on Your Brand Promise', 4, [
      'A brand promise only builds a brand if you deliver on it relentlessly. If '
          'you promise speed and reliability, every transaction must honour that. '
          'Broken promises destroy brands faster than anything else.',
      'Make promises you can keep, then keep them without exception. Consistently '
          'delivered promises turn a name into a trusted brand.',
    ], takeaways: [
      'Deliver on your promise relentlessly.',
      'Broken promises destroy brands.',
      'Kept promises build trust.',
    ], steps: [
      'Ensure your promise is one you can always keep.',
      'Commit to honouring it every time.',
    ]),
    _lesson('c8', 6, 'Managing Reputation and Reviews', 4, [
      'Reputation is your brand as others describe it. Positive word of mouth and '
          'reviews attract customers; unaddressed complaints repel them. Actively '
          'managing reputation protects and grows your brand.',
      'Encourage satisfied customers to share their experience, handle complaints '
          'gracefully, and let a strong track record speak. Reputation, carefully '
          'tended, becomes your most powerful marketing.',
    ], takeaways: [
      'Reputation is your brand in others\' words.',
      'Reviews attract; ignored complaints repel.',
      'Tended reputation is powerful marketing.',
    ], steps: [
      'Ask happy customers to share their experience.',
      'Prepare a gracious complaint response.',
    ]),
    _lesson('c8', 7, 'Standing Out From Competitors', 4, [
      'A strong brand gives customers a reason to choose you beyond price. '
          'Standing out comes from a clear identity, a distinctive promise, and '
          'consistently superior service that competitors do not match.',
      'Identify what makes you different and better, and make it central to your '
          'brand. Differentiation is what lets you avoid competing on price alone.',
    ], takeaways: [
      'A brand gives reasons to choose beyond price.',
      'Identity, promise and service differentiate.',
      'Differentiation avoids price-only competition.',
    ], steps: [
      'Define what makes you different and better.',
      'Make it central to your brand message.',
    ]),
    _lesson('c8', 8, 'Emotional Connection and Loyalty', 4, [
      'The strongest brands connect emotionally, making customers feel valued, '
          'understood and loyal. In telecom, small human touches, recognition, '
          'appreciation and genuine care, build the emotional loyalty that price '
          'cannot buy.',
      'Treat customers as people, not transactions, and let genuine care show. '
          'Emotional connection turns customers into devoted advocates for your '
          'brand.',
    ], concepts: [
      KeyConcept('Emotional Loyalty',
          'Feeling valued creates loyalty that price competition cannot break.'),
    ], takeaways: [
      'Strong brands connect emotionally.',
      'Human touches build loyalty.',
      'Care turns customers into advocates.',
    ], steps: [
      'Choose two ways to show genuine care.',
      'Treat customers as people, not transactions.',
    ]),
    _lesson('c8', 9, 'Brand Storytelling', 4, [
      'People connect with stories, and your brand story, why you started, what '
          'you stand for, who you serve, makes your business relatable and '
          'memorable. A genuine story differentiates you and deepens connection.',
      'Craft and share your authentic story across your channels. Storytelling '
          'turns a faceless seller into a brand people root for.',
    ], takeaways: [
      'Stories create connection.',
      'Your genuine story differentiates you.',
      'Storytelling makes people root for you.',
    ], steps: [
      'Write your authentic brand story.',
      'Share it on your channels.',
    ]),
    _lesson('c8', 10, 'Visual Branding Done Simply', 4, [
      'Strong visual branding, a clean logo, consistent colours and tidy '
          'presentation, makes a small business look professional and trustworthy. '
          'It need not be expensive; it must be consistent.',
      'Apply simple, consistent visuals across everything you do. Professional '
          'visuals reassure customers and reinforce recognition.',
    ], takeaways: [
      'Visual branding signals professionalism.',
      'It must be consistent, not expensive.',
      'Consistent visuals reinforce recognition.',
    ], steps: [
      'Finalise your logo and colour palette.',
      'Apply them consistently everywhere.',
    ]),
    _lesson('c8', 11, 'Building Brand Advocates', 4, [
      'Brand advocates, customers who actively recommend you, are the most '
          'powerful growth engine a brand can have. They arise from exceptional '
          'service, genuine care and a brand people are proud to associate with.',
      'Delight customers, appreciate them, and make it easy and natural for them '
          'to spread the word. A base of advocates grows your brand faster and '
          'cheaper than any advertising.',
    ], takeaways: [
      'Advocates are the most powerful growth engine.',
      'They arise from exceptional service and care.',
      'Advocates grow a brand cheaply.',
    ], steps: [
      'Identify your most enthusiastic customers.',
      'Make it easy for them to spread the word.',
    ]),
    _lesson('c8', 12, 'Protecting Your Brand', 4, [
      'A brand built over years can be damaged quickly by a scandal, a broken '
          'promise or careless behaviour. Protecting your brand means guarding its '
          'reputation vigilantly and never compromising the trust it rests on.',
      'Uphold your standards even under pressure, address problems quickly, and '
          'never betray customer trust for short-term gain. A protected brand '
          'endures.',
    ], takeaways: [
      'Brands built over years can break quickly.',
      'Guard reputation and trust vigilantly.',
      'Never betray trust for short-term gain.',
    ], steps: [
      'Identify the biggest risk to your reputation.',
      'Set a rule to protect trust under pressure.',
    ]),
    _lesson('c8', 13, 'Growing Brand Value Over Time', 4, [
      'A brand is an asset that grows in value with consistent care. As trust, '
          'recognition and reputation accumulate, your brand attracts customers and '
          'commands loyalty with less and less effort, compounding your earlier '
          'work.',
      'Keep investing in identity, trust and reputation consistently, and let '
          'time compound their value. The patient brand-builder ends up with '
          'something far more valuable than a series of transactions.',
    ], takeaways: [
      'A brand grows in value with care.',
      'Trust and recognition compound.',
      'Patience yields a valuable asset.',
    ], steps: [
      'Plan consistent brand investment over the year.',
      'Track how recognition grows over time.',
    ]),
    _lesson('c8', 14, 'Your Brand-Building Roadmap', 5, [
      'Bring it together: define your identity and promise, build trust through '
          'reliability, stay consistent across touchpoints, manage reputation, '
          'connect emotionally, tell your story, and protect and grow your brand '
          'over time. Followed consistently, this turns your business into a '
          'trusted name.',
      'Set brand goals, act consistently, and review your reputation regularly. A '
          'deliberate brand-building roadmap transforms a seller into a brand '
          'customers seek out and stay loyal to.',
    ], takeaways: [
      'Combine identity, trust, consistency and story.',
      'Act consistently and review reputation.',
      'A roadmap turns a seller into a trusted brand.',
    ], steps: [
      'Write your brand-building roadmap.',
      'Set your next three brand goals.',
    ], quiz: [
      _q('Brand advocates are…',
          ['A cost', 'A powerful growth engine', 'A risk', 'Irrelevant'], 1),
      _q('A brand promise builds a brand only if you…',
          ['Break it', 'Deliver on it relentlessly', 'Hide it', 'Forget it'], 1),
      _q('Emotional loyalty is created by…',
          ['Low prices only', 'Making customers feel valued', 'Ignoring them', 'Gimmicks'], 1),
      _q('A brand built over years can be damaged…',
          ['Never', 'Quickly by broken trust', 'Only by ads', 'By success'], 1),
      _q('Brand value over time tends to…',
          ['Shrink with care', 'Compound with consistent care', 'Stay flat', 'Disappear'], 1),
    ]),
  ],
);

// ---------------------------------------------------------------------------
// COURSE REGISTRY
// ---------------------------------------------------------------------------

final List<Course> kCourses = [
  _course1,
  _course2,
  _course3,
  _course4,
  _course5,
  _course6,
  _course7,
  _course8,
];

Course courseById(String id) => kCourses.firstWhere((c) => c.id == id);

/// All lessons flattened, used for lookups by id.
final List<Lesson> kAllLessons = [
  for (final c in kCourses) ...c.lessons,
];

Lesson? lessonById(String id) {
  for (final l in kAllLessons) {
    if (l.id == id) return l;
  }
  return null;
}

/// The course whose lessons a given lesson belongs to.
Course courseForLesson(Lesson lesson) => courseById(lesson.courseId);


