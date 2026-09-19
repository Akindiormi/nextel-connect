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

// ---------------------------------------------------------------------------
// COURSE 9 — POS & Cash-Out Business (5 lessons)
// ---------------------------------------------------------------------------

final Course _course9 = Course(
  id: 'c9',
  title: 'POS & Cash-Out Business',
  description:
      'Start and run a profitable POS agent business alongside your airtime '
      'and data operation. Covers capital, daily cash management, fraud '
      'protection, and scaling to multiple machines.',
  category: 'Agency Business',
  difficulty: Difficulty.beginner,
  icon: Icons.point_of_sale_rounded,
  durationMinutes: 170,
  order: 9,
  lessons: [
    _lesson('c9', 1, 'Understanding the POS Business Model', 5, [
      'A POS (Point of Sale) cash-out business is simple in concept: you let '
          'people withdraw cash from their bank account using your card '
          'machine, and you charge a small fee for the convenience. For '
          'millions of Nigerians without a nearby bank branch or a working '
          'ATM, your stand is the fastest way to turn their bank balance into '
          'cash in hand. That convenience is what you are actually selling.',
      'The money moves like this: a customer taps or inserts their card, you '
          'key in the amount they want, the machine debits their bank account '
          'electronically, and you hand them physical cash from what you have '
          'on hand. Your profit is the withdrawal fee — usually a percentage '
          'of the amount, sometimes with a flat charge added for smaller '
          'transactions. Your bank or POS provider credits the debited amount '
          'back to your settlement account, usually within one to two '
          'business days.',
      'This is a cash-flow business before it is a profit business. You need '
          'enough physical cash on hand to serve customers, and enough '
          'patience to wait for the bank to settle what your machine already '
          'debited. Agents who run out of cash mid-day turn away customers '
          'and lose trust fast — understanding this cash cycle is the single '
          'most important thing to get right before you open your stand.',
      'Done well, a POS stand can out-earn airtime and data reselling on a '
          'per-hour basis, especially in areas with heavy foot traffic and '
          'few working ATMs. It also pairs naturally with an existing '
          'telecom agency — customers who come to withdraw cash are the same '
          'people who buy airtime and data, so the two businesses feed each '
          'other.',
    ], concepts: [
      KeyConcept('Fee, Not Markup',
          'You earn a withdrawal fee for convenience, not a margin on goods — the model is service-based.'),
      KeyConcept('Settlement Lag',
          'Cash leaves your hand immediately; the matching bank credit can take 1-2 business days to arrive.'),
    ], steps: [
      'Write out the fee structure you plan to charge per withdrawal band (e.g. ₦100-5,000, ₦5,100-20,000).',
      'List two POS providers you could apply with and compare their settlement speed and commission split.',
    ], takeaways: [
      'A POS business sells convenience through a withdrawal fee, not a product markup.',
      'Physical cash goes out immediately; the matching bank settlement can take days.',
      'It pairs naturally with an existing airtime/data agency for shared foot traffic.',
    ], quiz: [
      _q('What does a POS cash-out agent actually sell?',
          ['A physical product', 'Convenience, through a withdrawal fee', 'Bank loans', 'Airtime only'],
          1,
          'The agent is paid for convenience — giving people fast access to cash — not for selling a physical good.'),
      _q('Where does the agent\'s profit come from?',
          ['Interest from the bank', 'A withdrawal fee charged to the customer', 'Government subsidy', 'Currency exchange'],
          1,
          'The withdrawal fee, usually a percentage of the amount withdrawn, is the agent\'s income.'),
      _q('How long can settlement to the agent\'s account typically take?',
          ['Instantly, always', '1-2 business days', 'One month', 'It never settles'],
          1,
          'Settlement is not instant — agents typically wait 1-2 business days for the debited amount to reflect.'),
      _q('Why is this described as a "cash-flow business before a profit business"?',
          ['Because it has no profit', 'Because you need enough physical cash on hand to keep serving customers', 'Because banks pay agents in advance', 'Because fees are paid annually'],
          1,
          'Running out of physical cash mid-day stops you from serving customers even though you are still "profitable" on paper.'),
      _q('What happens if an agent runs out of cash mid-day?',
          ['Nothing, customers wait', 'They turn away customers and lose trust', 'The bank sends emergency cash', 'Fees automatically increase'],
          1,
          'Customers go elsewhere, and repeat trust is hard to rebuild once a stand gets a reputation for running dry.'),
      _q('Why does a POS business pair well with an existing airtime/data agency?',
          ['They use the same machine', 'They share the same customer foot traffic', 'They are legally required to be combined', 'POS machines print airtime'],
          1,
          'People who stop to withdraw cash are also likely to buy airtime or data at the same stand — the two feed each other.'),
      _q('What is "settlement lag"?',
          ['The fee charged to customers', 'The gap between cash leaving your hand and the bank credit arriving', 'A type of POS machine', 'A tax on withdrawals'],
          1,
          'It describes the delay between when you hand out cash and when the matching bank settlement reaches you.'),
      _q('Which group of customers relies most on POS agents?',
          ['People with no bank account at all', 'People without a nearby branch or working ATM', 'Only business owners', 'Only salary earners'],
          1,
          'The core customer base is people who lack convenient access to a branch or a functioning ATM nearby.'),
      _q('What is typically true of fee structures for POS withdrawals?',
          ['A single flat fee regardless of amount', 'Usually a percentage, sometimes with a flat charge on small amounts', 'Fees are illegal to charge', 'Customers set their own fee'],
          1,
          'Most agents use a percentage-based fee, often with a minimum flat charge for very small withdrawals.'),
      _q('What is the main risk of poor cash-flow planning in this business?',
          ['Losing your POS license', 'Being unable to serve customers even while technically profitable', 'Paying more taxes', 'Losing your phone number'],
          1,
          'You can have plenty of paper profit and still fail customers in the moment if you don\'t have physical cash on hand.'),
    ]),
    _lesson('c9', 2, 'Getting Started: Capital, Machine, and Registration', 6, [
      'Before you touch a POS machine, you need three things lined up: '
          'starting capital, a provider relationship, and basic paperwork. '
          'Skipping any one of these leads to a shaky launch — undercapitalized '
          'agents run dry by midday, agents without a proper provider deal '
          'lose money to poor commission splits, and unregistered agents can '
          'run into compliance trouble as they grow.',
      'Your starting capital covers two separate things: the POS machine '
          'itself (either bought outright or provided free by some banks in '
          'exchange for transaction volume commitments) and your cash float — '
          'the physical naira you keep on hand to pay out withdrawals. A '
          'realistic starting float for a new stand in a moderately busy '
          'location is often in the ₦100,000-₦300,000 range; too little and '
          'you run out within hours on a good day.',
      'Choosing a provider matters more than most new agents realize. '
          'Providers differ in settlement speed, commission share, machine '
          'reliability, and customer support responsiveness when a '
          'transaction fails. A slightly lower commission with fast, '
          'reliable settlement beats a slightly higher commission from a '
          'provider whose machine goes down every other week.',
      'On the paperwork side, most providers require a valid ID, proof of '
          'address, and a BVN-linked bank account to onboard you as an agent. '
          'Some require a small registration or caution fee. Keep copies of '
          'everything you submit — disputes over reversed transactions are '
          'far easier to resolve when your agent status and history are '
          'clearly documented.',
    ], concepts: [
      KeyConcept('Two Kinds of Capital',
          'You need money for the machine itself and separate money for daily cash float — budget both.'),
      KeyConcept('Provider Quality Over Commission Rate',
          'Fast, reliable settlement is worth more long-term than a marginally higher commission percentage.'),
    ], steps: [
      'Compare at least two POS providers on commission split, settlement speed, and machine cost.',
      'Calculate your realistic starting float based on expected daily withdrawal volume in your area.',
      'Gather your ID, proof of address, and BVN-linked account details before applying.',
    ], takeaways: [
      'Capital splits into machine cost and daily cash float — plan for both separately.',
      'Provider reliability and settlement speed matter more long-term than a slightly better commission rate.',
      'Proper documentation protects you when disputes or reversed transactions happen.',
    ], quiz: [
      _q('What are the two separate things your starting capital needs to cover?',
          ['Rent and electricity', 'The POS machine and your daily cash float', 'Advertising and staff', 'Taxes and licensing only'],
          1,
          'You need money for the machine itself (or a deposit) and separate money to actually pay out withdrawals from.'),
      _q('What is a realistic starting float range mentioned for a moderately busy stand?',
          ['₦5,000-₦10,000', '₦100,000-₦300,000', '₦5 million+', 'No float is needed'],
          1,
          'That range gives enough cushion to serve a normal day\'s withdrawals without running dry quickly.'),
      _q('Why does provider choice matter beyond the commission percentage?',
          ['It doesn\'t matter at all', 'Settlement speed, reliability, and support responsiveness affect your business directly', 'All providers are identical', 'Only the machine color differs'],
          1,
          'A slightly lower commission from a fast, reliable provider often beats a higher commission from an unreliable one.'),
      _q('What documents do most providers require to onboard an agent?',
          ['Only a phone number', 'Valid ID, proof of address, and a BVN-linked account', 'A university degree', 'Nothing at all'],
          1,
          'Standard onboarding requires identity verification and a linked bank account tied to your BVN.'),
      _q('Why should you keep copies of everything submitted during registration?',
          ['It is not necessary', 'It makes resolving disputes over reversed transactions much easier', 'Providers require it be destroyed', 'For decoration'],
          1,
          'Clear documentation of your agent status and history speeds up dispute resolution significantly.'),
      _q('What happens to undercapitalized agents on a busy day?',
          ['Nothing changes', 'They run out of cash and have to turn customers away', 'They get bonus cash from the bank', 'Their fees automatically double'],
          1,
          'Without enough float, a busy day exposes cash shortages quickly, costing you customers.'),
      _q('How do some banks provide POS machines to agents?',
          ['Always at full retail price only', 'Sometimes free, in exchange for transaction volume commitments', 'Only by lottery', 'They never provide machines'],
          1,
          'Some banks waive machine costs if the agent commits to processing a minimum transaction volume.'),
      _q('What is one consequence of a poor commission split with your provider?',
          ['Better customer service', 'Reduced overall profit per transaction despite doing the same work', 'Free machine upgrades', 'Automatic tax exemption'],
          1,
          'A worse commission split eats into your margin on every single transaction you process.'),
      _q('What role does a BVN-linked account play in onboarding?',
          ['It is optional and rarely used', 'It verifies your identity and is required by most providers', 'It sets your withdrawal fee', 'It replaces the need for an ID'],
          1,
          'Providers use your BVN-linked account as part of verifying who you are before activating your agent status.'),
      _q('What is the risk of skipping proper registration as you grow?',
          ['No risk at all', 'Potential compliance trouble as your transaction volume increases', 'Lower fees automatically', 'Free machine replacements'],
          1,
          'Unregistered or improperly documented agents can run into compliance issues once volumes and scrutiny increase.'),
    ]),
    _lesson('c9', 3, 'Daily Operations: Managing Your Cash Float', 6, [
      'Once you are live, your daily job comes down to one core skill: '
          'managing your float so you never run out of cash and never sit on '
          'too much unused cash either. Every morning, count what you have on '
          'hand, note it down, and set a rough plan for when you will need to '
          'top up based on expected traffic.',
      'A simple rule many successful agents follow: keep enough float to '
          'cover your busiest two to three hours without a top-up. If '
          'mornings are your peak (salary days, market days), have your '
          'largest float ready before you open, not after the queue has '
          'already formed. Running to the bank mid-queue costs you customers '
          'who won\'t wait.',
      'Track every transaction, even the small ones. A simple notebook or a '
          'notes app entry — amount, fee charged, running balance — protects '
          'you if a dispute comes up later and helps you spot patterns, like '
          'which hours or days are consistently busiest, so you can plan '
          'float accordingly instead of guessing.',
      'At the end of each day, reconcile: does your physical cash on hand, '
          'plus what you expect to be settled from the bank, match what you '
          'recorded in transactions? Small discrepancies happen, but a '
          'growing gap over several days is a sign something needs '
          'attention — either a recording mistake or a real problem worth '
          'catching early.',
    ], concepts: [
      KeyConcept('Float Buffer Rule',
          'Keep enough cash to cover your busiest 2-3 hours without needing a mid-day top-up.'),
      KeyConcept('Daily Reconciliation',
          'Compare recorded transactions against actual cash + expected settlement every single day.'),
    ], steps: [
      'Start a simple daily log: opening float, each transaction, closing float.',
      'Identify your busiest hours this week and set your float top-up schedule around them.',
      'Reconcile your numbers at the end of each day before closing your stand.',
    ], takeaways: [
      'Manage float around your busiest hours, not an average across the whole day.',
      'Track every transaction, however small, to protect yourself and spot patterns.',
      'Daily reconciliation catches problems early, before they become bigger losses.',
    ], quiz: [
      _q('What is the core daily skill of running a POS stand?',
          ['Marketing', 'Managing your cash float so you never run dry or sit on excess idle cash', 'Accounting software use', 'Machine repair'],
          1,
          'Float management — having the right amount of cash at the right time — is the central daily operational skill.'),
      _q('What is the suggested float buffer rule?',
          ['Keep exactly ₦10,000 always', 'Keep enough to cover your busiest 2-3 hours without a top-up', 'Keep as little cash as possible', 'Float size does not matter'],
          1,
          'Having enough float to survive your peak hours without running to the bank mid-queue keeps customers from walking away.'),
      _q('Why is running to the bank mid-queue a problem?',
          ['It is illegal', 'It costs you customers who won\'t wait around', 'Banks charge extra for this', 'It improves customer trust'],
          1,
          'Customers with other options will simply leave rather than wait for you to restock cash.'),
      _q('What should be tracked for every transaction, even small ones?',
          ['Nothing, small ones don\'t matter', 'Amount, fee charged, and running balance', 'Only the customer\'s name', 'Only failed transactions'],
          1,
          'A simple log of amount, fee, and balance protects you in disputes and reveals useful patterns over time.'),
      _q('What does daily reconciliation involve?',
          ['Comparing recorded transactions against actual cash and expected settlement', 'Counting how many customers smiled', 'Calling your provider every day', 'Nothing, it is optional'],
          1,
          'Reconciliation checks that what you recorded matches what you physically have plus what is expected to settle.'),
      _q('What does a small daily discrepancy usually mean?',
          ['Immediate business failure', 'It can be normal, but a growing gap over days needs attention', 'Fraud has definitely occurred', 'The bank owes you money instantly'],
          1,
          'Occasional small gaps happen, but a persistent or growing pattern signals something worth investigating.'),
      _q('When should your largest float be ready, on a day with a morning peak?',
          ['After the queue has already formed', 'Before you open, ahead of the expected peak', 'It doesn\'t matter when', 'Only in the afternoon'],
          1,
          'Being prepared before the rush starts avoids the exact mid-queue cash-out problem this lesson warns about.'),
      _q('What tool is suggested for tracking daily transactions?',
          ['Expensive accounting software only', 'A simple notebook or notes app', 'Memory alone', 'Nothing is needed'],
          1,
          'Even a basic notebook or phone notes app is enough to track transactions consistently.'),
      _q('What is one benefit of spotting your busiest hours over time?',
          ['No real benefit', 'You can plan float top-ups around real patterns instead of guessing', 'It reduces your fees automatically', 'It changes your provider\'s commission'],
          1,
          'Knowing your actual peak periods lets you prepare float proactively instead of reacting after running short.'),
      _q('What is the risk of sitting on too much unused cash float?',
          ['No risk, more is always better', 'Idle cash is capital that could be working elsewhere, and carries theft/security risk', 'It increases your commission', 'It is required by law'],
          1,
          'Excess idle cash ties up capital and increases security risk without adding benefit beyond your actual buffer needs.'),
    ]),
    _lesson('c9', 4, 'Handling Risk: Fraud, Downtime, and Reversals', 6, [
      'POS agents face risks that airtime resellers rarely see: network '
          'downtime that strands customers mid-transaction, fraudulent cards '
          'or stolen card details, and reversed transactions that can leave '
          'you out of pocket if you are not careful. Knowing these risks '
          'before they happen is what separates agents who survive their '
          'first year from those who get burned early and quit.',
      'Network downtime is the most common headache. When your provider\'s '
          'system is slow or down, transactions can appear to fail on your '
          'end while still debiting the customer\'s account, or vice versa. '
          'Never hand out cash before confirming a transaction has fully gone '
          'through — a confirmation SMS, an approval code, or a clear '
          '"successful" screen on your machine. If a transaction looks '
          'unclear, ask the customer to wait a moment rather than risk paying '
          'out on an uncompleted debit.',
      'Fraud typically shows up as customers attempting withdrawals with '
          'cards that are not theirs, or numbers keyed in ways designed to '
          'exploit weak verification. Always require PIN entry directly by '
          'the customer, never key it in for them, and watch for signs of '
          'nervousness or someone reciting a PIN from a note rather than '
          'from memory. These are common indicators something is off.',
      'Reversals happen when a bank determines a transaction was disputed, '
          'fraudulent, or technically failed after you already paid out cash. '
          'This is the scenario that hurts most — you handed out real naira, '
          'and now the corresponding credit is being clawed back. The best '
          'protection is discipline: confirm every transaction clearly before '
          'paying, keep your transaction log, and know your provider\'s '
          'dispute process so you can push back on wrongful reversals.',
    ], concepts: [
      KeyConcept('Confirm Before You Pay',
          'Never hand out cash until you have clear confirmation the transaction succeeded — a screen, code, or SMS.'),
      KeyConcept('PIN Discipline',
          'Customers must enter their own PIN; you keying it in for them removes a critical fraud check.'),
    ], steps: [
      'Write your own personal rule for what counts as "confirmed" before you release cash.',
      'Learn your specific provider\'s dispute and reversal process in advance, not after it happens.',
      'Practice spotting nervous or scripted PIN entry as a fraud warning sign.',
    ], takeaways: [
      'Never release cash without clear confirmation the transaction succeeded.',
      'Customers must always enter their own PIN — this is a core fraud safeguard.',
      'Know your provider\'s dispute process before you need it, not during a crisis.',
    ], quiz: [
      _q('What should you always do before handing out cash?',
          ['Trust the customer\'s word', 'Confirm the transaction has clearly succeeded', 'Charge double the fee for safety', 'Call the police first'],
          1,
          'Clear confirmation — a screen, code, or SMS — protects you from paying out on a transaction that hasn\'t actually gone through.'),
      _q('What can happen during network downtime?',
          ['Nothing changes', 'A transaction can appear failed while still debiting the customer', 'Fees automatically waive', 'Machines shut off permanently'],
          1,
          'Downtime can create confusing situations where the debit happens but confirmation is unclear or delayed.'),
      _q('Who should enter the customer\'s PIN?',
          ['The agent, for speed', 'The customer themselves, always', 'Either person', 'PINs are not required'],
          1,
          'Customers entering their own PIN is a core fraud safeguard — an agent entering it removes that protection.'),
      _q('What is a warning sign of potential card fraud?',
          ['A confident, memorized PIN entry', 'Someone reciting a PIN from a written note or appearing nervous', 'A customer withdrawing a small amount', 'A customer using their own card'],
          1,
          'Reciting a PIN from a note or visible nervousness are common red flags worth paying attention to.'),
      _q('What is a "reversal" in this context?',
          ['A bonus payment from the bank', 'A bank clawing back a credit after determining the transaction was disputed or failed', 'A type of discount', 'A customer complaint with no financial effect'],
          1,
          'A reversal removes the credit you expected after you may have already paid out cash — the costliest risk in this lesson.'),
      _q('Why does a reversal hurt more than other risks discussed?',
          ['It doesn\'t hurt at all', 'You may have already paid out real cash before the credit is clawed back', 'It only affects the bank', 'It automatically doubles your fee'],
          1,
          'The pain comes from having already released physical cash before losing the matching credit.'),
      _q('What should you do if a transaction status looks unclear?',
          ['Pay out immediately to avoid delay', 'Ask the customer to wait a moment until it is confirmed', 'Cancel the customer\'s card', 'Ignore it and move to the next customer'],
          1,
          'Waiting for clarity is far safer than risking a payout on an unconfirmed or failed transaction.'),
      _q('Why should you know your provider\'s dispute process in advance?',
          ['It is not important', 'So you can push back on wrongful reversals when they happen', 'To get a discount on fees', 'It is required for machine setup'],
          1,
          'Understanding the dispute process before a crisis means you can act quickly and correctly when a reversal occurs.'),
      _q('What is one form fraud commonly takes at POS stands?',
          ['Customers withdrawing exact change', 'Customers attempting withdrawals with cards that are not theirs', 'Customers asking for receipts', 'Customers using the machine slowly'],
          1,
          'Unauthorized card use is one of the most common fraud patterns agents need to watch for.'),
      _q('What is the best overall protection against POS-related risk?',
          ['Charging very high fees', 'Discipline: confirming transactions, keeping logs, knowing your dispute process', 'Avoiding all customers', 'Refusing all card withdrawals'],
          1,
          'Consistent discipline around confirmation, logging, and knowing your recourse is the strongest overall defense.'),
    ]),
    _lesson('c9', 5, 'Growing: Multiple Machines and Locations', 5, [
      'Once your first stand is stable — consistent daily volume, a float '
          'routine that works, and no recurring fraud or reversal problems — '
          'growth usually means one of two paths: adding a second machine at '
          'the same location to handle peak-hour queues, or opening a second '
          'location entirely. Each has different capital and management '
          'demands, and picking the right one depends on what is actually '
          'limiting your current stand.',
      'If your bottleneck is queue length during predictable peak hours '
          '(salary days, weekends), a second machine at the same spot is the '
          'simpler move — same rent, same staff presence, same customer '
          'trust already built, just more throughput capacity. If your '
          'bottleneck is that your current location has hit its natural '
          'ceiling of daily footfall, a second location in an underserved '
          'area is the better growth path, even though it means training or '
          'hiring someone you trust to run it.',
      'Whichever path you take, the same float and reconciliation discipline '
          'from earlier lessons must scale with you — two machines with no '
          'system means two chances for cash to go missing or transactions to '
          'go untracked. Before adding capacity, make sure your recordkeeping '
          'system can handle it, whether that is a shared notebook system or '
          'a simple daily reporting habit between you and any staff.',
      'Growth should be funded by profits you have already proven the '
          'business generates, not by stretching your float so thin that your '
          'original stand starts running dry to support expansion. A second '
          'machine or location that starves your first one of cash is not '
          'growth — it is just moving the same risk around.',
    ], concepts: [
      KeyConcept('Two Growth Paths',
          'Add a second machine at the same spot for queue relief, or open a new location for reach — the bottleneck tells you which.'),
      KeyConcept('Systems Before Scale',
          'Your float and reconciliation discipline must scale with you, or growth just multiplies your risk.'),
    ], steps: [
      'Identify honestly whether your bottleneck is queue length or location ceiling.',
      'Estimate the float and staffing needs for your preferred growth path before committing capital.',
      'Set a rule: only expand using proven profit, never by starving your existing stand\'s float.',
    ], takeaways: [
      'A second machine solves queue congestion; a second location solves a footfall ceiling.',
      'Your tracking and float discipline must scale alongside any growth.',
      'Fund growth from proven profit, not by weakening your existing operation.',
    ], quiz: [
      _q('What are the two main growth paths described?',
          ['Selling the business, or quitting', 'A second machine at the same spot, or a second location entirely', 'Only franchising', 'Switching to airtime only'],
          1,
          'Growth typically means either adding capacity where you are, or expanding reach to a new spot.'),
      _q('When does a second machine at the same location make sense?',
          ['Never', 'When your bottleneck is queue length during predictable peak hours', 'Only if you have no customers', 'When you want to reduce fees'],
          1,
          'If the same location is simply overwhelmed at peak times, adding capacity there is the simpler fix.'),
      _q('When does a second location make more sense than a second machine?',
          ['When your current location has hit its natural daily footfall ceiling', 'When you dislike your current spot', 'Randomly, it doesn\'t matter', 'Only if a competitor opens nearby'],
          1,
          'If footfall itself is capped, adding another machine in the same spot won\'t help — you need new reach.'),
      _q('What must scale alongside any growth, according to this lesson?',
          ['Nothing needs to change', 'Your float and reconciliation discipline', 'Only your marketing', 'Your fees must double'],
          1,
          'Without systems scaling too, more machines or locations just multiply the chances of losing track of cash.'),
      _q('What is the risk of two machines with no tracking system?',
          ['No risk, more machines is always better', 'More chances for cash to go missing or transactions to go untracked', 'Lower fees automatically', 'Faster settlement times'],
          1,
          'Scaling without systems multiplies the exact risks the earlier lessons warned about.'),
      _q('How should growth ideally be funded?',
          ['By taking a large loan regardless of current performance', 'From profits the business has already proven it generates', 'By reducing your existing stand\'s float', 'It does not matter how it is funded'],
          1,
          'Funding expansion from proven profit avoids overextending and weakening your existing operation.'),
      _q('What happens if you starve your original stand\'s float to fund a new one?',
          ['This is smart, efficient growth', 'It is not real growth — it just moves the same risk to a different spot', 'It guarantees success at the new location', 'It has no effect either way'],
          1,
          'Weakening a working stand to fund a new one just relocates your risk instead of adding real capacity.'),
      _q('What does opening a second location usually require, that a second machine at the same spot does not?',
          ['Nothing extra', 'Training or hiring someone you trust to run it', 'A different type of POS machine', 'Government approval only'],
          1,
          'A separate location needs someone present to run it, unlike simply adding a machine where you already work.'),
      _q('What should you honestly assess before choosing a growth path?',
          ['Your favorite color', 'Whether your real bottleneck is queue length or a footfall ceiling', 'How many friends have POS businesses', 'Nothing, just pick randomly'],
          1,
          'Correctly diagnosing your actual bottleneck determines which growth path will actually solve the problem.'),
      _q('What is the underlying theme connecting growth to the earlier lessons in this course?',
          ['Growth is unrelated to earlier lessons', 'The same float, fraud, and reconciliation discipline must carry forward as you scale', 'Growth eliminates the need for float management', 'Fraud risk disappears with more machines'],
          1,
          'Everything taught about float, confirmation, and reconciliation still applies — just at a larger scale.'),
    ]),
  ],
);

// ---------------------------------------------------------------------------
// COURSE 10 — Choosing the Right Location for Your Stand (5 lessons)
// ---------------------------------------------------------------------------

final Course _course10 = Course(
  id: 'c10',
  title: 'Choosing the Right Location for Your Stand',
  description:
      'Location decides more of your daily revenue than almost anything '
      'else you control. Learn how to read foot traffic, size up '
      'competition, and negotiate a spot that actually works for your '
      'business.',
  category: 'Agency Business',
  difficulty: Difficulty.beginner,
  icon: Icons.location_on_rounded,
  durationMinutes: 150,
  order: 10,
  lessons: [
    _lesson('c10', 1, 'Why Location Determines Success', 5, [
      'Two agents can sell the exact same airtime, data, and POS services, '
          'use identical pricing, and still earn wildly different incomes — '
          'purely because of where they set up. Location controls how many '
          'potential customers walk past you every day, and no amount of '
          'good service can fully make up for a spot nobody passes through.',
      'A strong location does three things at once: it puts you in front of '
          'people who already have a reason to be nearby (a market, a bus '
          'stop, an office cluster), it makes you easy to find and return to, '
          'and it signals trust — an established-looking stand in a busy, '
          'visible spot feels safer to transact with than one tucked away '
          'somewhere quiet.',
      'This does not mean the busiest, most expensive spot always wins. A '
          'high-traffic location with rent you cannot sustain, or with heavy '
          'competition already established, can perform worse than a quieter '
          'but well-positioned spot with lower overhead. The goal is not '
          'maximum traffic — it is the best traffic-to-cost ratio for your '
          'specific services.',
      'Before you commit to any spot, you need a clear way to evaluate it '
          'objectively rather than picking based on gut feeling or what '
          'happens to be available. The rest of this course gives you that '
          'framework: reading foot traffic properly, sizing up competition, '
          'negotiating fairly, and knowing when to adjust if your first '
          'choice underperforms.',
    ], concepts: [
      KeyConcept('Traffic-to-Cost Ratio',
          'The best location isn\'t the busiest one — it\'s the one with the best balance of footfall against what you pay for it.'),
    ], steps: [
      'List 3 potential locations you are considering and write down what draws people there.',
      'Note the approximate rent or space cost for each one.',
    ], takeaways: [
      'Location controls how many potential customers see you daily — service alone can\'t fully offset a bad spot.',
      'A strong location combines existing foot traffic, visibility, and a sense of trust.',
      'The goal is the best traffic-to-cost ratio, not simply the busiest or cheapest option.',
    ], quiz: [
      _q('Why can two agents selling identical services earn very different incomes?',
          ['Random luck only', 'Location differences in foot traffic and visibility', 'One agent works harder always', 'Prices are never the same'],
          1,
          'Location controls how many potential customers even see the stand each day, which drives a huge income gap.'),
      _q('What are the three things a strong location does at once?',
          ['Lowers taxes, increases fees, reduces rent', 'Puts you near existing foot traffic, makes you easy to find, and signals trust', 'Guarantees no competition, free rent, and instant profit', 'Nothing specific'],
          1,
          'A good location combines existing footfall, visibility/memorability, and a sense of trust and safety.'),
      _q('Does the busiest, most expensive spot always win?',
          ['Yes, always', 'No — high rent or heavy competition can make it perform worse than a cheaper spot', 'Only on weekends', 'Busiest spots are always free'],
          1,
          'A location\'s value depends on the balance between traffic and what you pay for it, not raw traffic alone.'),
      _q('What is the "traffic-to-cost ratio"?',
          ['Your fee percentage', 'The balance between how much footfall a spot gets and what it costs to be there', 'A tax calculation', 'The number of competitors nearby'],
          1,
          'This ratio is the real metric for judging location value, rather than traffic or cost in isolation.'),
      _q('What can happen with a high-traffic location that has unsustainable rent?',
          ['It always performs best', 'It can underperform a quieter, lower-cost spot', 'Rent never affects performance', 'Customers pay your rent for you'],
          1,
          'If rent eats too much of your margin, high traffic alone doesn\'t guarantee the location is actually the best choice.'),
      _q('Why does visibility matter for a stand\'s location?',
          ['It doesn\'t matter', 'It makes you easy to find and return to, building repeat business', 'It only matters for large businesses', 'It increases your fees automatically'],
          1,
          'Being easy to spot and remember helps convert passersby into repeat, loyal customers.'),
      _q('What role does "trust" play in location choice?',
          ['None', 'A visible, established-looking spot in a busy area feels safer to transact with', 'Trust is unrelated to physical location', 'Only paperwork builds trust'],
          1,
          'Customers are more comfortable handing over cash or cards at a stand that looks established and is in a visible, active area.'),
      _q('What should you avoid doing when picking a location?',
          ['Comparing traffic and cost carefully', 'Picking based purely on gut feeling without evaluation', 'Considering rent at all', 'Visiting the location beforehand'],
          1,
          'This course emphasizes an objective evaluation framework rather than relying on instinct alone.'),
      _q('What does this lesson say the rest of the course will provide?',
          ['A list of locations to avoid', 'A framework for reading traffic, competition, negotiation, and adjustment', 'A guaranteed profitable address', 'Nothing further'],
          1,
          'The course builds out a structured way to evaluate and choose (and later adjust) your location.'),
      _q('What is the main point of this opening lesson?',
          ['Location doesn\'t matter much', 'Location is one of the biggest levers on your income and deserves careful evaluation', 'Only rent matters', 'All locations perform equally'],
          1,
          'The lesson establishes why location deserves deliberate, structured evaluation rather than a casual choice.'),
    ]),
    _lesson('c10', 2, 'Reading Foot Traffic and Demographics', 6, [
      'Foot traffic is not just "how many people pass by" — it is about how '
          'many of those people are your kind of customer, at the times you '
          'will actually be open. A spot with huge traffic at 2am is useless '
          'if you close at 8pm. A spot full of tourists passing through once '
          'is different from one full of local residents who will pass by '
          'daily.',
      'Spend time actually observing a potential location before committing. '
          'Visit at different times of day — morning rush, midday lull, '
          'evening peak — and different days, including a market day or '
          'salary-week Friday if relevant. Count roughly how many people pass '
          'in a 15-minute window at each time, and note what they seem to be '
          'doing: commuting, shopping, waiting for transport.',
      'Demographics matter as much as raw numbers. A spot near a school will '
          'have heavy youth traffic with low individual spending; a spot near '
          'an office cluster will have fewer people but higher spending power '
          'and more predictable timing (lunch break, closing time). Match the '
          'location\'s demographic to the services you offer — POS cash-out '
          'does especially well near markets and transport hubs where people '
          'carry and need cash regularly.',
      'Also look for "anchor" points nearby — a bank branch, a popular '
          'market stall, a bus stop, a school gate. These anchors create '
          'reliable, repeating foot traffic patterns you can plan your hours '
          'and float around, rather than hoping for random passersby.',
    ], concepts: [
      KeyConcept('Relevant Traffic, Not Raw Traffic',
          'What matters is how many of the right customers pass by during your actual operating hours.'),
      KeyConcept('Anchor Points',
          'Nearby fixtures like bus stops, markets, or schools create predictable, repeating foot traffic you can plan around.'),
    ], steps: [
      'Visit your shortlisted location at 3 different times of day and count passersby for 15 minutes each time.',
      'Identify at least one anchor point near each location you are considering.',
    ], takeaways: [
      'Foot traffic only matters if it happens during your actual operating hours.',
      'Match the location\'s demographic (students, workers, market-goers) to your services.',
      'Anchor points nearby create predictable, repeating traffic you can plan around.',
    ], quiz: [
      _q('Why is raw foot traffic count alone not enough to judge a location?',
          ['It is always enough', 'Traffic needs to match your operating hours and target customer type', 'Traffic count is impossible to measure', 'Only rent matters'],
          1,
          'High traffic at times you\'re closed, or traffic that isn\'t your kind of customer, doesn\'t translate to sales.'),
      _q('What is recommended before committing to a location?',
          ['Signing immediately to secure it', 'Observing the spot at different times and days first', 'Asking only the landlord\'s opinion', 'Choosing based on price alone'],
          1,
          'Direct observation at varying times reveals real patterns that a single visit or assumption would miss.'),
      _q('Why observe a spot on a market day or salary-week Friday specifically?',
          ['These days are irrelevant', 'These are often peak-traffic days worth understanding for planning', 'It is required by law', 'To avoid customers entirely'],
          1,
          'Special high-traffic days reveal peak demand patterns important for float and staffing planning.'),
      _q('Why do demographics matter alongside raw traffic numbers?',
          ['They don\'t matter', 'Different customer types have different spending power and needs', 'All customers spend identically', 'Demographics only matter for large businesses'],
          1,
          'A school-heavy area behaves very differently from an office-heavy area in spending patterns and timing.'),
      _q('Where does POS cash-out business tend to do especially well?',
          ['Empty residential streets', 'Near markets and transport hubs where people need cash regularly', 'Only inside malls', 'Only near hospitals'],
          1,
          'Markets and transport hubs create consistent cash-need moments that suit a POS stand well.'),
      _q('What is an "anchor point"?',
          ['A type of POS machine', 'A nearby fixture like a bus stop or market that creates predictable traffic', 'A legal registration requirement', 'A pricing strategy'],
          1,
          'Anchors are nearby draws that reliably bring the same kind of traffic past your stand repeatedly.'),
      _q('Why are anchor points useful for planning?',
          ['They aren\'t useful', 'They create traffic patterns you can plan your hours and float around', 'They eliminate the need for float', 'They guarantee zero competition'],
          1,
          'Predictable traffic from anchors lets you plan staffing, hours, and cash float with more confidence.'),
      _q('What might a spot near an office cluster offer compared to one near a school?',
          ['Identical customer behavior', 'Fewer people, but higher spending power and predictable timing', 'No customers at all', 'Only youth customers'],
          1,
          'Office areas tend to have concentrated, predictable peaks (lunch, closing time) with higher individual spending.'),
      _q('What should you note when counting passersby during observation?',
          ['Nothing beyond the count', 'What people seem to be doing — commuting, shopping, waiting for transport', 'Only their clothing', 'Only their age'],
          1,
          'Understanding *why* people are passing through helps judge whether they are your kind of potential customer.'),
      _q('What is the main lesson about matching location to services?',
          ['All locations suit all services equally', 'The location\'s demographic should match the services you actually offer', 'Only price should guide the match', 'Services should be chosen after signing a lease'],
          1,
          'Aligning what a location naturally attracts with what you actually sell increases your chances of success.'),
    ]),
    _lesson('c10', 3, 'Evaluating Competition Nearby', 5, [
      'Competition is not automatically bad news. A cluster of similar '
          'stands can mean the area is proven to support this kind of '
          'business — customers already come there expecting to find agents '
          'like you. The real question is not "is there competition" but '
          '"is there room for another agent, and can I differentiate enough '
          'to earn a fair share."',
      'Walk the immediate area and count how many similar stands are within '
          'easy walking distance. Observe them for a while: are they '
          'constantly busy, or often idle? Busy competitors suggest strong '
          'demand that may support more supply; consistently idle '
          'competitors suggest the area may already be saturated.',
      'Look closely at what existing agents are doing well and poorly. Are '
          'they slow, rude, frequently out of float, limited in services '
          '(airtime only, no POS)? Gaps like these are opportunities — you '
          'can win customers by being faster, friendlier, better stocked, or '
          'offering a wider range of services than what is already there.',
      'If an area is genuinely saturated with strong, well-run competitors '
          'and no clear gap, it may be smarter to look elsewhere rather than '
          'fight for scraps of an already-served market. Sometimes the best '
          'move is a nearby underserved spot rather than head-to-head '
          'competition in the busiest block.',
    ], concepts: [
      KeyConcept('Competition as a Demand Signal',
          'A cluster of similar businesses often proves the area supports this kind of demand, not that it\'s automatically bad.'),
      KeyConcept('Find the Service Gap',
          'Slow, limited, or unreliable existing agents create room for you to win customers by doing it better.'),
    ], steps: [
      'Count competing stands within easy walking distance of your target location.',
      'Observe each competitor for 20-30 minutes and note whether they look consistently busy or idle.',
      'List at least 2 specific gaps (service, speed, reliability) you could fill better than existing agents.',
    ], takeaways: [
      'Competition can signal proven demand — the real question is whether there\'s room and a way to differentiate.',
      'Busy competitors suggest demand that may support more supply; idle ones suggest saturation.',
      'Look for gaps in service, speed, or reliability that you can exploit.',
    ], quiz: [
      _q('Is competition nearby automatically a bad sign?',
          ['Yes, always avoid it', 'No — it can signal the area supports this kind of business', 'It has no meaning either way', 'It always means the market is full'],
          1,
          'A cluster of similar stands often proves customers already expect and seek out this kind of business there.'),
      _q('What is the real question to ask about competition?',
          ['Whether competition exists at all', 'Whether there is room for another agent and a way to differentiate', 'Whether competitors are friendly', 'Whether competitors use the same POS provider'],
          1,
          'The presence of competition matters less than whether there\'s room and a differentiation strategy.'),
      _q('What does it suggest if competing stands are constantly busy?',
          ['The area is oversaturated', 'Strong demand that may support more supply', 'Customers dislike the area', 'Prices are too high'],
          1,
          'Consistently busy competitors are a positive demand signal, suggesting the market can potentially support you too.'),
      _q('What does it suggest if competing stands are often idle?',
          ['High unmet demand', 'The area may already be saturated', 'The stands are new', 'Nothing meaningful'],
          1,
          'Idle competitors can be a warning sign that supply already exceeds demand in that spot.'),
      _q('What should you look for in existing agents\' weaknesses?',
          ['Nothing, weaknesses don\'t matter', 'Gaps like slowness, limited services, or frequent float shortages — opportunities for you', 'Only their pricing', 'Their personal appearance'],
          1,
          'Weaknesses in existing agents represent openings you can exploit by doing those things better.'),
      _q('How can you win customers in a competitive area?',
          ['By copying competitors exactly', 'By being faster, friendlier, better stocked, or offering more services', 'By lowering fees to zero', 'By avoiding all customers'],
          1,
          'Differentiating on speed, service quality, reliability, or range of offerings helps you earn share in a competitive spot.'),
      _q('What should you do if an area is saturated with strong, well-run competitors?',
          ['Fight for scraps of the market regardless', 'Consider a nearby underserved spot instead', 'Immediately lower your fees to zero', 'Give up on the business entirely'],
          1,
          'Sometimes it\'s smarter to find an underserved nearby spot than compete head-to-head where supply already meets demand well.'),
      _q('What is a practical first step for evaluating competition?',
          ['Ignoring nearby stands entirely', 'Walking the area and counting similar stands within easy distance', 'Only asking friends about the area', 'Assuming there is no competition'],
          1,
          'A direct walk-through and count gives you a real picture of how crowded the competitive landscape actually is.'),
      _q('Why is observing competitors over time useful?',
          ['It isn\'t useful', 'It reveals whether they are consistently busy or idle, indicating demand levels', 'It only reveals their fees', 'It has no bearing on your decision'],
          1,
          'Extended observation gives a more accurate read on demand than a single glance at a busy or quiet moment.'),
      _q('What is the overall theme of this lesson on competition?',
          ['Avoid all areas with any competition', 'Competition is data — read it to find demand signals and gaps to exploit', 'Competition guarantees failure', 'Competition is irrelevant to location choice'],
          1,
          'The lesson frames competition as useful information rather than a simple red flag to avoid.'),
    ]),
    _lesson('c10', 4, 'Negotiating Rent and Space', 5, [
      'Once you have identified a promising spot, negotiating the terms — '
          'rent, space size, duration, what happens if you want to leave '
          'early — directly affects your profitability from day one. Many '
          'new agents accept the first price offered simply because they are '
          'eager to start, and end up locked into terms that squeeze their '
          'margin for months.',
      'Before negotiating, know your numbers: what daily revenue you '
          'realistically expect from this location based on your traffic '
          'observation, and what percentage of that revenue you are willing '
          'to spend on rent. A common guideline is keeping rent well under '
          '15-20% of expected revenue, though this varies by business type '
          'and local market rates.',
      'Ask around for what similar spaces nearby actually rent for — '
          'landlords sometimes quote higher to new or eager-looking tenants. '
          'Having a comparison figure from a neighboring shop owner or '
          'another agent gives you real leverage and prevents overpaying '
          'simply because you didn\'t know the going rate.',
      'Negotiate more than just the headline rent figure. Ask about the '
          'length of commitment required, whether there is a deposit and how '
          'refundable it is, who covers repairs to fixtures like a shelter or '
          'canopy, and what notice period is needed if you need to leave. '
          'These terms matter as much as the monthly figure when things don\'t '
          'go as planned.',
    ], concepts: [
      KeyConcept('Rent-to-Revenue Ceiling',
          'Set a personal limit (commonly under 15-20% of expected revenue) for what you\'ll pay in rent before you start negotiating.'),
      KeyConcept('Negotiate Terms, Not Just Price',
          'Deposit refundability, commitment length, and exit notice matter as much as the monthly rent figure.'),
    ], steps: [
      'Estimate realistic daily/monthly revenue for the location before any rent conversation.',
      'Ask at least one nearby shop owner or agent what similar space actually costs.',
      'Write down your rent ceiling and your minimum acceptable exit terms before negotiating.',
    ], takeaways: [
      'Know your expected revenue and rent ceiling before you start negotiating, not during.',
      'Comparison figures from nearby tenants give you real negotiating leverage.',
      'Negotiate commitment length, deposit terms, and exit notice — not just the headline rent.',
    ], quiz: [
      _q('Why do many new agents end up with poor rental terms?',
          ['Landlords are always dishonest', 'They accept the first price offered out of eagerness to start', 'Rent is always fixed by law', 'It is impossible to negotiate rent'],
          1,
          'Eagerness to begin operating often leads new agents to skip negotiation entirely, locking in worse terms.'),
      _q('What should you know before entering a rent negotiation?',
          ['Nothing, just negotiate on instinct', 'Your realistically expected revenue and your rent ceiling', 'Only the landlord\'s asking price', 'Your competitor\'s exact profits'],
          1,
          'Knowing your numbers gives you a clear, defensible position rather than negotiating blind.'),
      _q('What is a common guideline mentioned for rent as a share of expected revenue?',
          ['50-60%', 'Well under 15-20%', 'Exactly 100%', 'There is no useful guideline'],
          1,
          'Keeping rent to a modest share of expected revenue protects your overall margin.'),
      _q('Why ask nearby shop owners what similar spaces rent for?',
          ['It is rude to ask', 'It gives you a comparison figure and real negotiating leverage', 'It has no effect on negotiation', 'Landlords always tell the truth about pricing'],
          1,
          'A real comparison prevents overpaying due to inflated quotes given to eager or new tenants.'),
      _q('What terms besides monthly rent should be negotiated?',
          ['None, only rent matters', 'Commitment length, deposit refundability, and exit notice period', 'Only the paint color', 'The landlord\'s personal schedule'],
          1,
          'These terms materially affect your flexibility and risk if the location doesn\'t work out as planned.'),
      _q('Why does deposit refundability matter?',
          ['It never matters', 'It affects how much money you can recover if you need to leave', 'Deposits are always non-refundable everywhere', 'It only affects landlords'],
          1,
          'Knowing whether and how a deposit is refundable protects your capital if plans change.'),
      _q('Why is a shorter or clearer exit notice period valuable?',
          ['It has no value', 'It gives you flexibility if the location underperforms', 'It guarantees higher revenue', 'It eliminates rent entirely'],
          1,
          'Clear, reasonable exit terms reduce your risk if a location doesn\'t perform as expected.'),
      _q('Who is often responsible for fixture repairs (like a shelter or canopy) and why should this be clarified?',
          ['It never needs clarifying', 'Responsibility should be agreed upfront to avoid disputes later', 'The government always covers this', 'Fixtures never need repair'],
          1,
          'Clarifying repair responsibility upfront avoids costly disputes or surprises down the line.'),
      _q('What mistake does eagerness to start often cause?',
          ['Better negotiating outcomes', 'Accepting unfavorable terms without comparison or negotiation', 'Lower rent automatically', 'No mistake at all'],
          1,
          'Rushing to start can mean skipping the research and negotiation that protects your margin long-term.'),
      _q('What is the overall goal of this lesson?',
          ['To avoid renting space entirely', 'To negotiate rent and terms deliberately, based on real numbers and comparisons', 'To always accept the landlord\'s first offer', 'To ignore lease terms beyond price'],
          1,
          'The lesson pushes for informed, deliberate negotiation rather than accepting terms passively.'),
    ]),
    _lesson('c10', 5, 'Testing and Adjusting Your Location', 5, [
      'Even careful evaluation cannot guarantee a location performs exactly '
          'as expected once you are actually operating. Real customer '
          'behavior, seasonal shifts, and changes nearby (a competitor '
          'opening, a road diversion) can all affect performance in ways '
          'that are hard to predict from observation alone. This is why '
          'treating your first weeks as a genuine test, not a final verdict, '
          'matters.',
      'Set a fair evaluation window — often 4 to 8 weeks — before deciding '
          'whether a location is working. Track your actual daily revenue, '
          'transaction count, and peak hours against what you originally '
          'expected. A slow first week or two is normal as customers '
          'discover and build trust in a new stand; a consistently weak '
          'month is a clearer signal.',
      'If performance is below expectations, diagnose before abandoning the '
          'spot. Is the issue visibility (people don\'t notice you), hours '
          '(you\'re open at the wrong times), service gaps (missing something '
          'customers want), or genuinely insufficient traffic? Each of these '
          'has a different fix — better signage, adjusted hours, added '
          'services — that\'s cheaper than relocating entirely.',
      'If after honest adjustment attempts the location still underperforms, '
          'it is better to relocate early than to keep absorbing losses out '
          'of stubbornness or sunk-cost thinking. The capital and time saved '
          'by cutting a genuinely bad location short is worth more than '
          'proving a point about a spot that simply isn\'t working.',
    ], concepts: [
      KeyConcept('Fair Evaluation Window',
          'Give a new location 4-8 weeks before judging performance — early weeks are naturally slower as trust builds.'),
      KeyConcept('Diagnose Before You Relocate',
          'Visibility, hours, and service gaps are cheaper fixes than moving — rule these out before assuming the spot itself is bad.'),
    ], steps: [
      'Set a specific evaluation date (4-8 weeks out) before you open, and commit to reviewing honestly then.',
      'Track daily revenue and transaction count from day one so you have real data to review.',
      'If underperforming, list possible causes (visibility, hours, services) before considering relocation.',
    ], takeaways: [
      'Treat your first weeks at a new location as a genuine test, not a final judgment.',
      'A slow start is normal; a consistently weak month over a fair window is a clearer signal.',
      'Diagnose fixable issues (visibility, hours, services) before assuming you need to relocate.',
    ], quiz: [
      _q('Why can\'t careful evaluation alone guarantee a location\'s performance?',
          ['Evaluation is always perfectly accurate', 'Real customer behavior, seasonality, and nearby changes are hard to predict in advance', 'Locations never change', 'It can always guarantee performance'],
          1,
          'Actual operation reveals things (seasonal shifts, new competitors, etc.) that observation alone can\'t fully predict.'),
      _q('What is the recommended fair evaluation window before judging a location?',
          ['1-2 days', '4 to 8 weeks', 'A single afternoon', '2 years minimum'],
          1,
          'This window balances giving the location a fair chance against not dragging out a genuinely bad decision.'),
      _q('Why is a slow first week or two often normal?',
          ['It never happens', 'Customers need time to discover and build trust in a new stand', 'It means the location is definitely bad', 'It means fees are too high'],
          1,
          'New stands take time to become known and trusted, so early slowness alone isn\'t a reliable signal.'),
      _q('What should you do before deciding a location has failed?',
          ['Relocate immediately at any sign of slowness', 'Diagnose whether the issue is visibility, hours, or service gaps', 'Nothing, just wait indefinitely', 'Raise your fees dramatically'],
          1,
          'Diagnosing the actual cause helps you find a cheaper fix than relocating, if one exists.'),
      _q('What is an example of a "visibility" problem at a location?',
          ['Too many customers', 'People simply don\'t notice your stand', 'Rent is too low', 'Competitors are too friendly'],
          1,
          'If people don\'t notice you exist, better signage or positioning may solve the problem without moving.'),
      _q('Why might being open at the wrong hours hurt performance?',
          ['Hours never matter', 'You could be missing the actual peak traffic times for that location', 'Customers prefer closed stands', 'It has no effect on revenue'],
          1,
          'If your hours don\'t align with the real peak traffic pattern, you miss the customers who are actually there.'),
      _q('What is a cheaper fix than relocating, if service gaps are the issue?',
          ['Nothing can be done', 'Adding the missing service customers are asking for', 'Immediately closing the business', 'Doubling your fees'],
          1,
          'Filling a specific gap in what you offer is often far cheaper and faster than relocating entirely.'),
      _q('When should you consider relocating despite honest adjustment attempts?',
          ['Never, always stay no matter what', 'If the location still underperforms after fixing visibility, hours, and service gaps', 'Immediately, without trying fixes first', 'Only if a competitor asks you to'],
          1,
          'Relocation becomes the right call once genuine fixes have been tried and the spot still isn\'t working.'),
      _q('What is "sunk-cost thinking" a risk of, in this context?',
          ['Making good decisions faster', 'Staying in a bad location too long just because you\'ve already invested in it', 'Choosing a location too quickly', 'Negotiating rent too aggressively'],
          1,
          'Sunk-cost thinking can trap you into continuing to absorb losses rather than cutting a bad location short.'),
      _q('What is the overall message of this final lesson?',
          ['Once chosen, never reconsider a location', 'Track real performance, diagnose issues fairly, and be willing to adjust or relocate if needed', 'Location choice has no long-term consequences', 'Always relocate after one bad day'],
          1,
          'The lesson closes the course by emphasizing ongoing evaluation and willingness to adjust, not a one-time decision.'),
    ]),
  ],
);

final Course _course11 = Course(
  id: 'c11', title: 'Bulk SMS & USSD Services',
  description: 'Add bulk SMS and USSD-based services to your agency for higher margins beyond airtime and data.',
  category: 'Agency Business', difficulty: Difficulty.intermediate,
  icon: Icons.sms_rounded, durationMinutes: 140, order: 11,
  lessons: [
    _lesson('c11', 1, 'Why Add Bulk SMS to Your Agency', 5, [
      'Bulk SMS lets businesses, churches, schools, and event organizers send one message to hundreds or thousands of phone numbers at once. As an agent, you buy SMS credit wholesale and resell it, or resell access to a bulk SMS platform, earning margin on every unit sent — without needing your own telecom infrastructure.',
      'This service pairs naturally with your existing airtime/data customers. Small business owners who buy data from you daily are exactly the people who need to announce a new product, remind customers of an offer, or send appointment reminders — you already have their trust and attention.',
    ], concepts: [KeyConcept('Wholesale Margin', 'Buy SMS units in bulk at a wholesale rate, resell at a marked-up retail rate per unit or per campaign.')],
      steps: ['Research 2 bulk SMS reseller platforms and compare their wholesale rates.', 'Identify 3 existing customers who might need this service.'],
      takeaways: ['Bulk SMS is a natural upsell to your existing airtime/data customer base.', 'Margin comes from buying wholesale and reselling at a markup.', 'Local businesses, schools, and churches are strong target customers.'],
      quiz: [
        _q('What is bulk SMS used for?', ['Personal chatting only', 'Sending one message to many numbers at once', 'Making phone calls', 'Browsing the internet'], 1, 'It lets a single sender reach hundreds or thousands of recipients simultaneously.'),
        _q('How does an agent earn from bulk SMS?', ['Government subsidy', 'Buying credit wholesale and reselling at a markup', 'It is always free to resell', 'Only banks can offer this'], 1, 'The margin comes from the gap between wholesale cost and resale price.'),
        _q('Why does bulk SMS pair well with existing airtime/data customers?', ['It doesn\'t pair well', 'These customers already trust you and may need to reach their own customers', 'Airtime customers never run businesses', 'It requires a different customer base entirely'], 1, 'Business owners who already buy from you are prime candidates for announcing offers via SMS.'),
        _q('Who are strong target customers for this service?', ['Only large corporations', 'Local businesses, schools, and churches', 'Nobody in particular', 'Only government agencies'], 1, 'These groups regularly need to reach groups of people with announcements or reminders.'),
        _q('What should you research before offering this service?', ['Nothing, just start', 'Wholesale rates from bulk SMS reseller platforms', 'Only your own phone number', 'Government tax codes'], 1, 'Comparing wholesale rates helps you find a profitable resale margin.'),
        _q('What kind of infrastructure does an agent need to offer this?', ['A full telecom network', 'None of their own — they resell access to an existing platform', 'A government license only', 'A physical SMS tower'], 1, 'Agents resell existing bulk SMS platform access rather than building their own infrastructure.'),
        _q('What is one example use case for a business customer?', ['Sending personal love messages', 'Reminding customers of an offer or appointment', 'Filing taxes', 'Repairing phones'], 1, 'Appointment reminders and offer announcements are common, practical use cases.'),
        _q('What is the main advantage of this service for an existing agent?', ['It replaces airtime sales entirely', 'It is a natural, higher-margin upsell to customers you already serve', 'It requires no customer relationships', 'It only works for large cities'], 1, 'Bulk SMS builds on trust and reach you\'ve already established with existing customers.'),
      ]),
    _lesson('c11', 2, 'Getting Started with a Bulk SMS Platform', 5, [
      'Signing up as a reseller typically requires registering with a provider, choosing a pricing tier based on expected volume, and topping up a wallet you draw SMS units from. Compare providers on delivery reliability (do messages actually arrive quickly) as much as price — a cheap platform with poor delivery rates damages your reputation with customers.',
      'Most platforms give you a simple web dashboard where you upload a customer\'s contact list, type or paste their message, and schedule or send immediately. Learn this dashboard thoroughly before your first paying customer, so you don\'t fumble through it live.',
    ], concepts: [KeyConcept('Delivery Reliability Over Price', 'A slightly pricier platform with fast, consistent delivery beats a cheap one that drops messages.')],
      steps: ['Sign up for a trial account with a bulk SMS reseller platform.', 'Send a test campaign to your own number to confirm delivery speed.'],
      takeaways: ['Compare providers on delivery reliability, not just price.', 'Learn the sending dashboard before your first real customer.', 'A wallet-based top-up system is standard for reseller accounts.'],
      quiz: [
        _q('What should resellers compare beyond price when choosing a platform?', ['Nothing else matters', 'Delivery reliability', 'The provider\'s logo design', 'Office location'], 1, 'A cheap platform that fails to deliver messages reliably will hurt your reputation with customers.'),
        _q('What typically happens during reseller sign-up?', ['Nothing is required', 'Registering, choosing a pricing tier, and topping up a wallet', 'Only a phone call is needed', 'You must buy physical hardware'], 1, 'Standard onboarding includes registration, a pricing plan choice, and wallet funding.'),
        _q('What should you do before serving your first paying customer?', ['Nothing extra', 'Learn the sending dashboard thoroughly', 'Change your phone number', 'Register a new business name'], 1, 'Practicing with the dashboard first avoids fumbling through an unfamiliar interface live with a client watching.'),
        _q('What is a "wallet" in this context?', ['A physical item', 'A balance you top up and draw SMS units from', 'A type of phone case', 'A bank loan'], 1, 'Reseller platforms typically use a prepaid wallet system for buying SMS credit.'),
        _q('What can happen with a cheap but unreliable platform?', ['Nothing negative', 'Messages may not deliver, damaging your reputation', 'Prices automatically improve', 'Customers never notice'], 1, 'Poor delivery rates are visible to your customers and reflect badly on your service.'),
        _q('What is typically included in a platform\'s dashboard?', ['Nothing useful', 'Contact list upload and message composing/scheduling', 'Only account settings', 'A game'], 1, 'Dashboards typically let you manage contact lists and compose/schedule messages.'),
        _q('Why send a test campaign to your own number first?', ['It is unnecessary', 'To confirm delivery speed and reliability before serving customers', 'It is required by law', 'To waste SMS credit'], 1, 'Testing on yourself first validates the platform before a real customer relies on it.'),
        _q('What is the risk of not understanding the dashboard well?', ['No risk at all', 'Fumbling through it live in front of a paying customer', 'Lower fees automatically', 'Faster delivery'], 1, 'Being unfamiliar with the tool live can look unprofessional and cause mistakes.'),
      ]),
    _lesson('c11', 3, 'Pricing and Packaging Your SMS Service', 5, [
      'Price per SMS unit, but package it in ways customers understand — "500 messages for ₦X" reads better to a small business owner than a raw per-unit rate they have to calculate. Offer a few clear packages (small, medium, large campaign) rather than infinite custom pricing that confuses people.',
      'Factor in your time, not just the wholesale unit cost. Helping a customer write their message, format their contact list, and schedule the send takes effort — either build this into your price or offer it as a small added service fee for customers who need the extra help.',
    ], concepts: [KeyConcept('Package, Don\'t Just Price Per Unit', 'Clear bundles ("500 messages for ₦X") sell better than a raw per-unit rate customers have to calculate.')],
      steps: ['Design 3 SMS package tiers based on typical customer campaign sizes.', 'Decide whether message-writing help is included or a separate add-on fee.'],
      takeaways: ['Clear packages sell better than raw per-unit pricing.', 'Factor your time (writing, formatting, scheduling help) into pricing.', 'A few simple tiers beat unlimited custom pricing.'],
      quiz: [
        _q('Why package pricing instead of quoting raw per-unit rates?', ['Packages are illegal', 'Clear bundles are easier for customers to understand and choose', 'Per-unit pricing is always better', 'It doesn\'t matter either way'], 1, 'Simple, understandable packages remove the mental math burden from customers.'),
        _q('What should be factored into your price beyond wholesale unit cost?', ['Nothing else', 'Your time spent helping write, format, and schedule messages', 'Only your rent', 'The weather'], 1, 'Service effort beyond the raw SMS units deserves to be reflected in what you charge.'),
        _q('How many pricing tiers are suggested as ideal?', ['Unlimited custom pricing', 'A few clear tiers (small, medium, large)', 'Exactly one price for everyone', 'None, pricing should be random'], 1, 'A handful of clear tiers is easier for both you and customers to work with than endless customization.'),
        _q('What is an example of a customer-friendly package description?', ['"0.85 naira per unit computed live"', '"500 messages for ₦X"', 'No description given', '"Contact us for a quote every time"'], 1, 'Clear bundle pricing reads better to small business owners than raw unit math.'),
        _q('What service might warrant an added fee beyond the SMS cost itself?', ['Nothing extra should ever be charged', 'Helping write, format, or schedule the message', 'Charging for the customer\'s phone', 'Charging extra for using your name'], 1, 'Time spent assisting with the message itself is a real service worth compensating.'),
        _q('What is the risk of offering unlimited custom pricing?', ['No risk', 'It can confuse customers and complicate your own operations', 'It always increases profit', 'It simplifies your business'], 1, 'Too much customization can create confusion and inconsistency in what you charge.'),
        _q('Who benefits from simple, tiered packaging?', ['Only the agent', 'Both the agent and the customer, through clarity', 'Neither party', 'Only competitors'], 1, 'Clear packaging reduces friction for the customer and simplifies your own pricing decisions.'),
        _q('What is the main lesson of this section?', ['Price randomly', 'Package your SMS service clearly and account for your added time/effort', 'Never charge for your time', 'Avoid all pricing structure'], 1, 'The lesson centers on clear, effort-inclusive packaging rather than raw or chaotic pricing.'),
      ]),
    _lesson('c11', 4, 'Understanding USSD-Based Services', 5, [
      'USSD codes (like the *123# style menus customers dial to check balances) power services beyond just balance checks — mobile banking, merchant payments, and simple customer surveys can all run through USSD. As an agent, you may resell access to USSD-based tools, such as a merchant payment code for a small business that doesn\'t have a full POS setup.',
      'USSD works without internet, which makes it valuable in areas with poor data connectivity — a real advantage over app-based alternatives. Understanding which of your customers lack reliable internet helps you position USSD services as the practical, reliable choice for them.',
    ], concepts: [KeyConcept('Works Without Internet', 'USSD\'s biggest advantage is functioning on any phone without a data connection — valuable in low-connectivity areas.')],
      steps: ['List which of your customers likely have unreliable internet access.', 'Research one USSD-based merchant tool you could resell.'],
      takeaways: ['USSD powers more than balance checks — banking, payments, surveys all use it.', 'It works without internet, a major advantage in low-connectivity areas.', 'Agents can resell USSD-based merchant tools to underserved small businesses.'],
      quiz: [
        _q('What is a key advantage of USSD over app-based services?', ['It requires high-speed internet', 'It works without an internet connection', 'It only works on smartphones', 'It is more expensive always'], 1, 'USSD functions on any phone without needing data, making it accessible in low-connectivity areas.'),
        _q('What services can run through USSD beyond balance checks?', ['Nothing else', 'Mobile banking, merchant payments, and surveys', 'Only video streaming', 'Only social media'], 1, 'USSD supports a range of transactional and informational services beyond simple balance inquiries.'),
        _q('Who might benefit most from a USSD merchant payment option?', ['Large corporations with full IT departments', 'A small business without a full POS setup', 'Nobody needs this', 'Only banks'], 1, 'Small merchants without POS infrastructure can use simpler USSD-based payment tools.'),
        _q('Why does internet independence matter for USSD services?', ['It doesn\'t matter', 'It is valuable in areas with poor or unreliable data connectivity', 'Internet is always available everywhere', 'USSD requires more data than apps'], 1, 'Many areas still lack reliable internet, making USSD a genuinely practical alternative.'),
        _q('What can an agent resell related to USSD?', ['Nothing, USSD cannot be resold', 'Access to USSD-based merchant or service tools', 'Only physical phones', 'Government services directly'], 1, 'Agents can offer access to USSD-based tools as a service to underserved businesses.'),
        _q('What customer trait makes USSD services a good fit for them?', ['High-speed home broadband', 'Unreliable or no internet access', 'A preference for apps', 'Living in a large city only'], 1, 'Customers with poor connectivity are the ones who benefit most from USSD\'s offline functionality.'),
        _q('What example of a USSD code style is mentioned?', ['A website URL', 'A *123# style menu', 'An email address', 'A social media handle'], 1, 'The classic short-code dial pattern is the standard USSD interface style.'),
        _q('What is the main opportunity described in this lesson?', ['Ignoring USSD entirely', 'Reselling USSD-based tools to businesses lacking reliable internet or POS setups', 'Only using USSD personally', 'Avoiding small businesses'], 1, 'The lesson frames USSD resale as a genuine opportunity for underserved small business customers.'),
      ]),
    _lesson('c11', 5, 'Building These Services Into Your Daily Agency', 5, [
      'Adding bulk SMS and USSD services works best as a natural conversation, not a hard sell — when a regular customer mentions they\'re running a promotion or opening a new location, that\'s your moment to mention you can help them reach their customers directly. Keep a short, simple explanation ready rather than a long pitch.',
      'Track which services each customer has used before, so you can follow up appropriately — a customer who ran a successful SMS campaign last month is a good candidate to ask about doing it again for their next promotion, turning a one-time sale into a repeat service relationship.',
    ], concepts: [KeyConcept('Natural Upsell Timing', 'Mention new services when a customer\'s own words create the opening — not as a forced, unrelated pitch.')],
      steps: ['Prepare a one-sentence explanation of your bulk SMS/USSD services you can say naturally in conversation.', 'Start a simple list of which customers have used which added services.'],
      takeaways: ['Introduce new services naturally, when customer conversation creates an opening.', 'Track service usage per customer to spot repeat opportunities.', 'A short, clear pitch beats a long sales speech.'],
      quiz: [
        _q('What is the recommended way to introduce these new services?', ['A long, forced sales pitch', 'Naturally, when conversation creates an opening', 'Only through flyers', 'Never mention them at all'], 1, 'Natural, conversational introductions feel less pushy and more relevant to the customer\'s actual need.'),
        _q('What is an example of a natural opening to mention SMS services?', ['Interrupting an unrelated conversation', 'A customer mentioning they\'re running a promotion or opening a new location', 'Waiting for the customer to ask first always', 'Sending unsolicited messages randomly'], 1, 'When a customer\'s own words reveal a relevant need, that\'s the ideal moment to offer the service.'),
        _q('Why track which services each customer has used?', ['It is unnecessary', 'To spot repeat opportunities and follow up appropriately', 'Tracking is illegal', 'Customers dislike being remembered'], 1, 'Knowing usage history helps you re-engage customers for their next relevant campaign.'),
        _q('What kind of pitch is recommended?', ['A long, detailed speech', 'A short, clear explanation', 'No explanation at all', 'A written legal contract'], 1, 'A brief, clear pitch is easier for customers to absorb in a casual conversation.'),
        _q('What can turn a one-time SMS sale into a repeat relationship?', ['Ignoring the customer afterward', 'Following up appropriately based on tracked usage history', 'Charging more each time', 'Nothing can achieve this'], 1, 'Thoughtful follow-up based on past usage builds an ongoing service relationship.'),
        _q('What should you prepare in advance for these conversations?', ['Nothing, improvise every time', 'A one-sentence explanation you can say naturally', 'A 10-page brochure', 'A legal disclaimer'], 1, 'Having a ready, simple explanation makes it easy to mention the service smoothly when the moment arises.'),
        _q('Why is a hard sell approach discouraged here?', ['Hard selling always works best', 'It can feel forced and less effective than a natural conversation-based approach', 'It is required by providers', 'It has no downsides'], 1, 'A forced pitch is less effective and can feel unwelcome compared to a naturally timed offer.'),
        _q('What is the overall goal of this final lesson?', ['To avoid offering these services at all', 'To integrate bulk SMS/USSD naturally into your everyday agency conversations', 'To only sell these services once per customer ever', 'To replace airtime sales entirely'], 1, 'The lesson closes the course by showing how to weave these services into normal, ongoing customer relationships.'),
      ]),
  ],
);

final Course _course12 = Course(
  id: 'c12', title: 'Managing Multiple Vendor Accounts',
  description: 'Juggle MTN, Airtel, Glo, and 9mobile dashboards efficiently without losing track of balances or missing restocks.',
  category: 'Agency Business', difficulty: Difficulty.intermediate,
  icon: Icons.dashboard_rounded, durationMinutes: 130, order: 12,
  lessons: [
    _lesson('c12', 1, 'Why Multiple Vendor Accounts Matter', 5, [
      'Serving customers across all major networks means maintaining separate vendor accounts with MTN, Airtel, Glo, and 9mobile — each with its own dashboard, balance, and top-up process. Customers expect you to have whatever network they need, so gaps in your vendor coverage directly translate to lost sales.',
      'Each network has different commission rates and different peak demand patterns based on which network dominates in your area. Understanding this lets you allocate your working capital sensibly instead of spreading it evenly and running short on your highest-demand network.',
    ], concepts: [KeyConcept('Coverage Drives Sales', 'Missing a network in your vendor lineup means turning away every customer who needs exactly that network.')],
      steps: ['List which networks dominate demand in your specific area.', 'Check your current balance across all vendor accounts today.'],
      takeaways: ['Full network coverage prevents lost sales from gaps.', 'Commission rates and demand differ by network — allocate capital accordingly.', 'Know your local network demand pattern, not a generic assumption.'],
      quiz: [
        _q('Why maintain accounts across all major networks?', ['It is required by law', 'Customers expect coverage, and gaps mean lost sales', 'It reduces your total profit', 'Only one network is ever needed'], 1, 'A customer needing a network you don\'t stock is a sale you simply lose to a competitor.'),
        _q('Do all networks offer the same commission rate?', ['Yes, always identical', 'No, commission rates differ by network', 'Commission is irrelevant', 'Only one network pays commission'], 1, 'Understanding differing rates helps you allocate capital toward the most profitable balance.'),
        _q('What should guide how you allocate working capital across networks?', ['Random distribution', 'Local demand patterns for each network', 'Your personal favorite network', 'Government mandate'], 1, 'Matching capital to actual local demand avoids running short on your highest-demand network.'),
        _q('What happens if you run out of stock on a popular local network?', ['Nothing, customers wait patiently', 'You lose that sale to a competitor who has it', 'The network compensates you', 'Demand shifts to other networks automatically'], 1, 'Customers needing that specific network will simply go elsewhere if you can\'t serve them.'),
        _q('What is a risk of spreading capital evenly across all networks regardless of demand?', ['No risk at all', 'Running short on your highest-demand network while overstocking a low-demand one', 'Guaranteed maximum profit', 'It eliminates the need for restocking'], 1, 'Even distribution ignores real demand differences, leading to inefficient capital use.'),
        _q('What should you check regularly across vendor accounts?', ['Nothing, set and forget', 'Your balance on each network account', 'Only your bank balance', 'Only your phone\'s storage'], 1, 'Regularly monitoring each vendor balance prevents unexpected stockouts.'),
        _q('Why does network dominance vary by area?', ['It never varies', 'Different regions have different network coverage and customer preferences', 'All areas are identical', 'Only cities have network coverage'], 1, 'Local infrastructure and customer habits create real geographic differences in network demand.'),
        _q('What is the main theme of this lesson?', ['Stick to one network only', 'Understand and plan around multi-network coverage and demand', 'Ignore commission differences', 'Avoid vendor accounts entirely'], 1, 'The lesson establishes why thoughtful multi-vendor management matters for sales and profit.'),
      ]),
    _lesson('c12', 2, 'Organizing Your Dashboards and Logins', 5, [
      'Each network vendor platform has its own login, its own interface, and sometimes its own app. Without organization, agents waste time logging in and out, or worse, lock themselves out during a busy moment because of a forgotten password. Keep a secure, organized record of every login — a password manager app is ideal, a written notebook kept safe is a workable fallback.',
      'Bookmark or pin each vendor\'s dashboard so you can switch between them quickly during busy periods. Some agents keep all four open in browser tabs on a dedicated phone or tablet used only for the business, reducing the friction of constant re-logging.',
    ], concepts: [KeyConcept('Fast Access Beats Memory', 'Bookmarks, saved logins, or a dedicated device save critical seconds during busy, high-traffic moments.')],
      steps: ['Set up a secure password manager or a dedicated notebook for all vendor logins.', 'Bookmark each vendor dashboard for quick access.'],
      takeaways: ['Disorganized logins waste time and risk lockouts during busy moments.', 'A password manager or secure notebook prevents this.', 'Quick-access bookmarks or a dedicated device speed up daily operations.'],
      quiz: [
        _q('What problem can disorganized vendor logins cause?', ['No problems at all', 'Wasted time or lockouts during busy moments', 'Automatic discounts', 'Faster service'], 1, 'Fumbling for forgotten credentials during a rush directly costs you time and customers.'),
        _q('What is a recommended way to store vendor logins securely?', ['Writing them on a public wall', 'A password manager app or a securely kept notebook', 'Memorizing nothing and guessing each time', 'Sharing them publicly online'], 1, 'Secure, organized storage prevents lockouts and protects your accounts.'),
        _q('Why bookmark each vendor dashboard?', ['Bookmarks serve no purpose', 'For quick access and faster switching during busy periods', 'It is required by providers', 'To slow down your workflow'], 1, 'Quick access reduces friction when switching between vendor platforms during busy service.'),
        _q('What is one approach some agents use for managing multiple dashboards?', ['Using a random stranger\'s phone', 'Keeping a dedicated device with all dashboards open in tabs', 'Refusing to use more than one network', 'Deleting apps after each use'], 1, 'A dedicated business device with tabs ready reduces constant re-login friction.'),
        _q('What risk comes from forgetting a vendor password during a busy moment?', ['No risk', 'Getting locked out and unable to serve customers', 'Automatic account upgrade', 'Free credit from the provider'], 1, 'A lockout at the wrong moment can mean turning away paying customers.'),
        _q('What is an acceptable fallback to a password manager app?', ['Nothing, there is no fallback', 'A written notebook kept safe', 'Publicly posting your passwords', 'Never writing anything down'], 1, 'A securely kept notebook is a workable manual alternative to a digital password manager.'),
        _q('Why might switching between four vendor accounts be time-consuming without organization?', ['It never takes any time', 'Each requires separate logins and interfaces to navigate', 'All vendors share one login', 'Switching is automatic'], 1, 'Each platform is distinct, so unorganized access multiplies time spent per transaction.'),
        _q('What is the overall goal of this lesson?', ['Avoid using multiple vendors', 'Organize access to reduce friction and prevent costly lockouts', 'Memorize everything without any system', 'Ignore security entirely'], 1, 'The lesson focuses on practical organization to keep multi-vendor operations smooth and secure.'),
      ]),
    _lesson('c12', 3, 'Tracking Balances Across Networks', 5, [
      'With four (or more) separate vendor balances to watch, a simple daily habit of checking each one prevents the embarrassing moment of trying to sell airtime you don\'t actually have loaded. Set a fixed time each day — opening or closing — to check and record every balance in one place.',
      'Keep a simple running log: date, network, balance, and any top-up made. Over weeks, this reveals which network you restock most often, helping you plan ahead rather than reactively topping up mid-transaction when a customer is already waiting.',
    ], concepts: [KeyConcept('One Daily Check-In', 'A fixed daily habit of checking all vendor balances prevents mid-sale surprises.')],
      steps: ['Pick a fixed daily time to check all vendor balances.', 'Start a simple log tracking balance and top-ups per network.'],
      takeaways: ['Check all vendor balances at a fixed time daily to avoid surprises.', 'A simple log reveals which networks you restock most often.', 'Proactive restocking beats reactive mid-transaction top-ups.'],
      quiz: [
        _q('What daily habit is recommended for managing balances?', ['Checking balances only when a sale fails', 'Checking all vendor balances at a fixed time daily', 'Never checking balances', 'Checking balances once a month'], 1, 'A consistent daily check prevents unexpected shortfalls during customer transactions.'),
        _q('What should a simple tracking log include?', ['Nothing specific', 'Date, network, balance, and top-ups made', 'Only your name', 'Customer personal details'], 1, 'This basic log structure gives you a clear history to review and plan from.'),
        _q('What can a balance log reveal over time?', ['Nothing useful', 'Which networks you restock most often', 'Your competitor\'s income', 'The weather forecast'], 1, 'Patterns in restocking frequency help you plan capital allocation more accurately.'),
        _q('What is the downside of reactive mid-transaction top-ups?', ['There is no downside', 'It delays the customer and looks unprofessional', 'It is always faster than planning ahead', 'It increases your commission'], 1, 'Having to pause and top up while a customer waits creates a poor experience and wastes time.'),
        _q('Why check balances at a fixed time rather than randomly?', ['Fixed times have no benefit', 'Consistency builds a reliable habit that prevents gaps', 'Random checking is always better', 'It is required by providers'], 1, 'A consistent routine ensures the check actually happens every day without being forgotten.'),
        _q('What embarrassing situation does this lesson aim to prevent?', ['Overcharging a customer', 'Trying to sell airtime you don\'t actually have loaded', 'Closing your stand early', 'Accepting cash payments'], 1, 'Discovering an empty balance mid-sale is avoidable with a simple daily check-in habit.'),
        _q('What is a benefit of tracking top-ups alongside balances?', ['No benefit', 'It builds a historical pattern useful for planning ahead', 'It increases your fees automatically', 'It replaces the need for vendor accounts'], 1, 'Historical top-up data helps you anticipate future restocking needs more accurately.'),
        _q('What is the overall aim of this lesson?', ['Avoid tracking balances at all', 'Build a simple, consistent balance-tracking habit across all networks', 'Only track one network', 'Rely purely on memory'], 1, 'The lesson promotes a lightweight but consistent system for balance visibility.'),
      ]),
    _lesson('c12', 4, 'Restocking Strategy Across Vendors', 5, [
      'Restocking too early ties up cash unnecessarily across networks you don\'t need yet; restocking too late means turning away customers. A practical middle ground: set a personal "reorder trigger" balance for each network — when it drops to that level, top up immediately rather than waiting until it hits zero.',
      'Negotiate or compare bulk top-up discounts where available — some vendors offer slightly better rates for larger top-up amounts. Balance this against tying up too much capital in networks with lower local demand.',
    ], concepts: [KeyConcept('Reorder Trigger Balance', 'Set a specific balance level per network that automatically signals "top up now" — not zero, not guesswork.')],
      steps: ['Set a reorder trigger balance for each of your vendor accounts.', 'Check whether any vendor offers a bulk top-up discount worth using.'],
      takeaways: ['A reorder trigger balance prevents both running dry and over-tying capital.', 'Bulk top-up discounts can help, but weigh them against local demand per network.', 'Restocking should be proactive, based on a clear signal, not guesswork.'],
      quiz: [
        _q('What problem does restocking too early cause?', ['No problem at all', 'Unnecessarily tying up cash across networks not yet needed', 'Guaranteed higher profit', 'Faster customer service'], 1, 'Excess early restocking locks up capital that could be used more efficiently elsewhere.'),
        _q('What problem does restocking too late cause?', ['No problem', 'Turning away customers when the balance is empty', 'Automatic bonus credit', 'Lower fees'], 1, 'Waiting too long to restock risks running out exactly when a customer needs that network.'),
        _q('What is a "reorder trigger balance"?', ['A random number', 'A set balance level that signals it\'s time to top up', 'A type of vendor discount', 'A customer loyalty program'], 1, 'This proactive trigger point helps avoid both early over-stocking and late stockouts.'),
        _q('Why not just wait until a balance hits zero to restock?', ['Waiting until zero is ideal', 'It risks turning away customers during the gap before you can top up', 'Zero balance is impossible to reach', 'It saves time'], 1, 'Hitting zero means you can\'t serve customers until you\'ve topped up, losing sales in the meantime.'),
        _q('What should you compare when considering bulk top-up discounts?', ['Nothing, always take any discount', 'The discount benefit against local demand for that specific network', 'Only the vendor\'s logo', 'Your competitor\'s prices'], 1, 'A discount is only worthwhile if the network actually has enough local demand to use the stock reasonably.'),
        _q('What is the risk of over-committing capital to a low-demand network for a bulk discount?', ['No risk', 'Tying up capital that could serve higher-demand networks better', 'Automatic profit increase', 'Improved customer service'], 1, 'Capital locked in low-demand stock is capital unavailable for your actually busy networks.'),
        _q('What should restocking decisions be based on?', ['Random guesswork', 'A clear reorder trigger balance per network', 'Waiting for customers to complain', 'Copying a competitor exactly'], 1, 'A defined trigger point removes guesswork and keeps restocking proactive and consistent.'),
        _q('What is the overall goal of this lesson?', ['Restock unpredictably', 'Build a proactive, balanced restocking strategy across all vendor accounts', 'Only restock one network ever', 'Avoid restocking entirely'], 1, 'The lesson focuses on a disciplined, trigger-based approach to restocking across networks.'),
      ]),
    _lesson('c12', 5, 'Building a Simple Multi-Vendor Routine', 5, [
      'Bringing everything together: a consistent daily routine — check all balances at a fixed time, log them, compare against your reorder triggers, and top up proactively — turns multi-vendor management from a daily stressor into a five-minute habit. Consistency is what makes this manageable at scale as you add more services.',
      'As your business grows and you consider adding more vendors or services (like the bulk SMS and USSD tools from earlier courses), this same routine scales — just add new accounts into your existing check-log-restock habit rather than inventing a new system each time.',
    ], concepts: [KeyConcept('One Routine, Not Four Separate Systems', 'The same simple check-log-restock habit scales to cover new vendors and services as you grow.')],
      steps: ['Write out your full daily multi-vendor routine in one place.', 'Time yourself doing it once to confirm it\'s genuinely quick.'],
      takeaways: ['A consistent daily routine turns multi-vendor management into a quick habit.', 'The same system scales as you add more vendors or services.', 'Consistency, not complexity, is what makes multi-vendor management sustainable.'],
      quiz: [
        _q('What does bringing together the daily routine accomplish?', ['Nothing new', 'Turns multi-vendor management into a quick, manageable habit', 'Increases daily stress', 'Requires hiring extra staff'], 1, 'A consistent, combined routine simplifies what could otherwise be a chaotic daily task.'),
        _q('What four steps make up the suggested daily routine?', ['Guess, ignore, panic, restock randomly', 'Check balances, log them, compare to triggers, top up proactively', 'Only checking balances once a week', 'Calling customer support daily'], 1, 'This simple sequence covers the full cycle needed to stay on top of multiple vendor accounts.'),
        _q('How does this routine scale as you add more services?', ['It doesn\'t scale at all', 'New accounts simply get added into the same check-log-restock habit', 'A completely new system must be built each time', 'It becomes impossible to manage'], 1, 'The same lightweight habit accommodates growth without needing to be reinvented.'),
        _q('What is emphasized as the key to sustainable multi-vendor management?', ['Complexity', 'Consistency', 'Avoiding all vendors', 'Hiring more staff immediately'], 1, 'A simple, consistently applied routine is what makes this manageable long-term, not added complexity.'),
        _q('What should you do to confirm your routine is genuinely quick?', ['Assume it is fine', 'Time yourself doing it once', 'Skip testing it', 'Ask a competitor'], 1, 'Actually timing the routine validates that it\'s a lightweight, sustainable daily habit.'),
        _q('What happens if you invent a new system for every new vendor or service?', ['This is the recommended approach', 'It creates unnecessary complexity instead of scaling one simple habit', 'It has no downside', 'It automatically increases profit'], 1, 'Reinventing your process each time adds friction; extending one consistent system is more sustainable.'),
        _q('What ties this lesson back to earlier courses like bulk SMS and USSD?', ['Nothing connects them', 'Those services can be added into the same daily multi-vendor routine', 'They require an entirely separate business', 'They eliminate the need for vendor tracking'], 1, 'New services integrate into the same proven daily habit rather than needing a separate management approach.'),
        _q('What is the overall message of this final lesson?', ['Multi-vendor management is inherently unmanageable', 'A simple, consistent daily routine makes multi-vendor management sustainable and scalable', 'Avoid adding any new vendors ever', 'Balances don\'t need regular attention'], 1, 'The course closes by tying the earlier lessons into one practical, repeatable daily system.'),
      ]),
  ],
);

final Course _course13 = Course(
  id: 'c13', title: 'Handling Failed Transactions & Reversals',
  description: 'The operational side nobody teaches — what to do when a transaction fails, hangs, or gets reversed after payout.',
  category: 'Agency Business', difficulty: Difficulty.intermediate,
  icon: Icons.error_outline_rounded, durationMinutes: 130, order: 13,
  lessons: [
    _lesson('c13', 1, 'Why Failed Transactions Happen', 5, [
      'Failed transactions come from several sources: network downtime between you and your provider, insufficient balance on the customer\'s account discovered mid-transaction, or a technical glitch on either side. Understanding which category a failure falls into determines your correct next step.',
      'Not every failure means money is lost — most simply mean the transaction didn\'t complete and nothing was debited. The dangerous cases are the ones where a debit occurred but confirmation didn\'t arrive clearly, which is why the confirm-before-you-pay discipline from earlier POS lessons matters so much here too.',
    ], concepts: [KeyConcept('Not All Failures Are Equal', 'A clean failure (nothing debited) is harmless; an unclear failure (debit uncertain) is the dangerous case requiring caution.')],
      steps: ['List the 3 most common failure types you\'ve personally experienced.', 'Write your personal rule for what to do when a transaction status is unclear.'],
      takeaways: ['Failures can come from network issues, balance problems, or technical glitches.', 'Most failures mean nothing was debited — those are low-risk.', 'Unclear failures where a debit may have occurred are the real risk to manage carefully.'],
      quiz: [
        _q('What are common sources of failed transactions?', ['Only customer mistakes', 'Network downtime, balance issues, or technical glitches', 'Government interference', 'Weather conditions'], 1, 'These three categories cover most real-world causes of transaction failures.'),
        _q('Is every failed transaction a lost-money situation?', ['Yes, always', 'No, most simply mean nothing was debited', 'Only sometimes on weekends', 'Failures always cost the agent money'], 1, 'Most failures are clean — the transaction simply didn\'t go through, with no money changing hands.'),
        _q('What is the dangerous type of failure to watch for?', ['A clearly successful transaction', 'An unclear failure where a debit may have occurred without confirmation', 'A failure with no customer present', 'Any failure at all is equally dangerous'], 1, 'Ambiguous failures where money might have moved are the real risk requiring caution.'),
        _q('Why does the "confirm before you pay" discipline from POS lessons apply here too?', ['It doesn\'t apply here', 'Because unclear failures are exactly where premature payout risk lives', 'Confirmation is never needed for failures', 'This only applies to successful transactions'], 1, 'The same caution about confirming status before releasing cash directly prevents losses from unclear failures.'),
        _q('What determines your correct next step after a failure?', ['Random choice', 'Understanding which category of failure occurred', 'Always assuming the worst immediately', 'Ignoring it and moving on'], 1, 'Correctly diagnosing the failure type guides whether you can safely proceed, retry, or need to investigate further.'),
        _q('What could cause a mid-transaction failure related to the customer\'s account?', ['The customer\'s mood', 'Insufficient balance discovered during the transaction', 'The agent\'s haircut', 'Weather patterns'], 1, 'A balance shortfall on the customer\'s side is a common, straightforward failure cause.'),
        _q('What is the safest assumption when a transaction status is genuinely unclear?', ['Assume it succeeded and pay out', 'Treat it cautiously and confirm before acting', 'Ignore it completely', 'Always assume it failed with certainty'], 1, 'Caution and confirmation are safer than assuming either outcome without clear evidence.'),
        _q('What is the overall purpose of this opening lesson?', ['To discourage using POS machines', 'To help you correctly categorize and respond to different failure types', 'To eliminate all transaction risk permanently', 'To blame customers for all failures'], 1, 'The lesson builds the foundational understanding needed to handle failures correctly in later lessons.'),
      ]),
    _lesson('c13', 2, 'What to Do When a Transaction Hangs', 5, [
      'A "hanging" transaction — one that neither clearly succeeds nor clearly fails within a reasonable time — is one of the most stressful moments for an agent, especially with a customer waiting. The right move is patience paired with process: wait a reasonable, defined time (your provider\'s guidance usually gives one), check your transaction history/dashboard rather than just the machine screen, and avoid repeating the transaction until status is clear.',
      'Repeating a hung transaction without confirming the first one failed is one of the most common ways agents accidentally double-debit a customer or double-pay from their own float. Always check history first; only retry once you\'ve confirmed the original attempt did not go through.',
    ], concepts: [KeyConcept('Never Retry Blind', 'Check transaction history to confirm the first attempt truly failed before retrying — retrying blind risks double transactions.')],
      steps: ['Learn where to check transaction history on your specific POS/vendor platform.', 'Write your personal wait-time rule before deciding a transaction has truly hung.'],
      takeaways: ['A hanging transaction needs patience and process, not panic.', 'Always check transaction history before retrying.', 'Retrying blind risks accidental double transactions.'],
      quiz: [
        _q('What defines a "hanging" transaction?', ['One that clearly succeeded', 'One that neither clearly succeeds nor fails within a reasonable time', 'One the customer cancelled', 'A transaction from yesterday'], 1, 'The ambiguity of status is exactly what makes a hanging transaction stressful and risky.'),
        _q('What is the recommended first response to a hanging transaction?', ['Immediately retry it', 'Wait a reasonable time and check transaction history', 'Cancel the customer\'s card', 'Pay out cash immediately regardless'], 1, 'Patience combined with checking actual records is safer than an immediate reaction.'),
        _q('Where should you check status, rather than just the machine screen?', ['Nowhere else is needed', 'Your transaction history or dashboard', 'The customer\'s phone', 'A competitor\'s machine'], 1, 'Dashboards and transaction history often show more reliable status than a possibly frozen machine screen.'),
        _q('What risk comes from retrying a hung transaction without confirming failure first?', ['No risk', 'Accidentally double-debiting the customer or double-paying from your float', 'Automatic refund to the customer', 'Improved transaction speed'], 1, 'Retrying blind can result in two transactions processing when only one was intended.'),
        _q('What should you confirm before retrying a hung transaction?', ['Nothing, just retry immediately', 'That the original attempt truly failed', 'The customer\'s home address', 'Your own mood'], 1, 'Confirming the original outcome prevents the costly mistake of an accidental duplicate.'),
        _q('Why is patience emphasized for hanging transactions?', ['Patience has no value here', 'Reacting hastily can create bigger problems than the hang itself', 'Customers prefer immediate action always', 'Patience guarantees a successful outcome'], 1, 'A measured, process-driven response avoids compounding the original ambiguity with a new mistake.'),
        _q('What is a practical step to prepare for hanging transactions in advance?', ['Nothing can be prepared in advance', 'Learning where to check transaction history on your platform beforehand', 'Avoiding all POS transactions', 'Refusing all customers'], 1, 'Knowing your platform\'s history/dashboard location in advance saves critical time during a real hang.'),
        _q('What is the overall lesson here?', ['Always retry immediately when unsure', 'Combine patience with verified process to handle hangs safely', 'Hanging transactions are impossible to resolve', 'Ignore hanging transactions entirely'], 1, 'The lesson teaches a disciplined, verification-first approach to the stressful hanging-transaction scenario.'),
      ]),
    _lesson('c13', 3, 'Understanding Reversals and Chargebacks', 5, [
      'A reversal happens when a bank or provider determines, after the fact, that a transaction should be undone — because it failed technically, was disputed by the customer, or was flagged as fraudulent. If you already paid out cash based on that transaction, a reversal means the corresponding credit disappears from your settlement, leaving you out of pocket.',
      'Chargebacks work similarly but usually originate from the customer\'s bank disputing a charge — sometimes legitimately (genuine fraud), sometimes not (a customer falsely claiming non-receipt). Your best protection against wrongful chargebacks is the transaction log and confirmation discipline covered earlier — clear records make disputing a wrongful reversal much easier.',
    ], concepts: [KeyConcept('Reversals Undo Settled Money, Not Undo Cash Already Paid', 'The gap between "credit reversed" and "cash already handed out" is exactly where agent losses come from.')],
      steps: ['Read your specific provider\'s reversal/dispute policy document if you haven\'t already.', 'Confirm your transaction log includes enough detail to support a dispute if needed.'],
      takeaways: ['A reversal removes a settlement credit after the fact, which hurts if cash was already paid out.', 'Chargebacks can be legitimate or wrongful — clear records help you contest wrongful ones.', 'Good documentation from earlier lessons is your main defense here.'],
      quiz: [
        _q('What is a reversal?', ['A bonus payment', 'A bank undoing a transaction after the fact', 'A type of discount', 'A customer complaint with no financial impact'], 1, 'Reversals remove a previously expected credit once a transaction is found to be invalid, disputed, or failed.'),
        _q('Why do reversals hurt agents specifically?', ['They never affect agents', 'If cash was already paid out, the agent is left out of pocket', 'They always benefit the agent', 'They only affect banks'], 1, 'The agent has already given real cash before the credit disappears, creating a genuine loss.'),
        _q('What is a chargeback typically initiated by?', ['The agent themselves', 'The customer\'s bank, based on a dispute', 'Random government audit', 'A software bug only'], 1, 'Chargebacks usually stem from a customer disputing a charge through their bank.'),
        _q('Are all chargebacks legitimate?', ['Yes, always', 'No, some are legitimate fraud cases and some are wrongful claims', 'Chargebacks are never legitimate', 'Legitimacy doesn\'t matter'], 1, 'Chargebacks can range from genuine fraud protection to false claims of non-receipt.'),
        _q('What is your best protection against wrongful chargebacks?', ['Ignoring the dispute process', 'Clear transaction logs and confirmation discipline', 'Refusing all future transactions', 'Charging higher fees'], 1, 'Solid documentation makes it much easier to contest a wrongful reversal or chargeback.'),
        _q('What should you do with your provider\'s reversal/dispute policy?', ['Ignore it entirely', 'Read and understand it in advance', 'Only read it after a dispute happens', 'It doesn\'t exist for any provider'], 1, 'Understanding the process in advance means you can act quickly and correctly when a real dispute arises.'),
        _q('What connects this lesson to earlier lessons on daily operations?', ['Nothing connects them', 'The transaction logging discipline taught earlier is your main defense here', 'Logging is irrelevant to reversals', 'This lesson replaces the need for logging'], 1, 'The daily logging habit from earlier directly supports your ability to dispute wrongful reversals now.'),
        _q('What is the overall theme of this lesson?', ['Reversals never happen in practice', 'Understanding reversals and chargebacks, and how documentation protects you', 'Avoiding all card transactions to prevent reversals', 'Reversals are always the agent\'s fault'], 1, 'The lesson explains the mechanics of reversals/chargebacks and how to protect yourself against wrongful ones.'),
    ]),
    _lesson('c13', 4, 'Responding to a Reversal When It Happens', 5, [
      'When you notice a reversal — usually a drop in your settlement amount you weren\'t expecting — the first step is to identify exactly which transaction it relates to using your log and the provider\'s notification or dashboard entry. Don\'t assume; confirm the specific transaction before deciding whether to contest it.',
      'If you believe the reversal was made in error (the transaction was genuinely valid and completed), gather your evidence — transaction reference number, timestamp, your log entry, and any confirmation screenshot — and follow your provider\'s formal dispute process promptly. Delays in disputing can reduce your chances of a successful resolution.',
    ], concepts: [KeyConcept('Confirm the Specific Transaction First', 'Never contest a reversal generically — identify the exact transaction and gather specific evidence before disputing.')],
      steps: ['Set up a habit of checking your settlement report against your log weekly.', 'Prepare a simple evidence checklist (reference number, timestamp, log entry, screenshot) for disputes.'],
      takeaways: ['Identify the specific transaction behind a reversal before acting.', 'Gather concrete evidence (reference number, log, screenshots) for any dispute.', 'Dispute promptly — delays reduce your chances of a successful resolution.'],
      quiz: [
        _q('What usually alerts an agent to a reversal?', ['A phone call from the customer', 'An unexpected drop in settlement amount', 'A notification from the government', 'Nothing alerts an agent'], 1, 'A settlement shortfall compared to expectations is typically how agents first notice a reversal occurred.'),
        _q('What should you do first upon noticing a possible reversal?', ['Assume it is an error and ignore it', 'Identify exactly which transaction it relates to', 'Immediately close your business', 'Blame the customer without checking'], 1, 'Confirming the specific transaction is essential before deciding how to respond.'),
        _q('What evidence should you gather to dispute a wrongful reversal?', ['Nothing is needed', 'Reference number, timestamp, log entry, and confirmation screenshot', 'Only your personal opinion', 'A verbal statement with no documentation'], 1, 'Concrete, specific evidence gives your dispute the best chance of a successful outcome.'),
        _q('Why does dispute timing matter?', ['Timing has no effect', 'Delays in disputing can reduce your chances of a successful resolution', 'Disputing immediately always fails', 'Providers ignore all disputes regardless of timing'], 1, 'Prompt action generally improves your odds of resolving a dispute in your favor.'),
        _q('What should you avoid doing when contesting a reversal?', ['Gathering specific evidence', 'Contesting generically without identifying the specific transaction', 'Following the provider\'s formal process', 'Acting promptly'], 1, 'Vague, non-specific disputes are far less effective than ones tied to clear transaction evidence.'),
        _q('What is a practical weekly habit suggested in this lesson?', ['Ignoring settlement reports', 'Checking your settlement report against your personal log', 'Changing your provider every week', 'Refusing all future transactions'], 1, 'Regular reconciliation helps you catch reversals early rather than discovering them much later.'),
        _q('What should you do if you\'re unsure whether a reversal is legitimate or an error?', ['Assume it\'s always an error', 'Investigate using your log and the provider\'s dashboard before concluding', 'Ignore it and hope it resolves itself', 'Immediately escalate to the media'], 1, 'Careful investigation, not assumption, should guide your response to any reversal.'),
        _q('What is the overall goal of this lesson?', ['Avoid ever using POS again after a reversal', 'Respond to reversals methodically, with evidence and prompt action', 'Accept all reversals without question', 'Blame your provider automatically every time'], 1, 'The lesson equips you with a clear, methodical process for responding to actual reversals.'),
      ]),
    _lesson('c13', 5, 'Building Habits That Reduce Failed Transactions Overall', 5, [
      'While you can\'t eliminate all failures, technical glitches, and reversals, a few consistent habits meaningfully reduce how often they hurt you: always confirm before paying, always log every transaction with enough detail, always check history before retrying, and know your provider\'s dispute process before you need it — not during a crisis.',
      'Periodically review your own failure/reversal history (weekly or monthly) to spot patterns — maybe failures cluster around specific times of network congestion, or a particular type of transaction. Recognizing your own patterns lets you adjust proactively, whether that means avoiding certain transaction types at certain hours or switching providers if problems persist.',
    ], concepts: [KeyConcept('Review Your Own Patterns', 'Periodically reviewing your failure/reversal history reveals patterns you can proactively adjust around.')],
      steps: ['Combine the four core habits (confirm, log, check history, know dispute process) into one written checklist.', 'Schedule a monthly review of your own failure/reversal history.'],
      takeaways: ['Four core habits — confirm, log, check history, know your dispute process — reduce failure impact overall.', 'Periodic review of your own history reveals patterns worth adjusting for.', 'You can\'t eliminate failures, but you can meaningfully reduce their cost to you.'],
      quiz: [
        _q('Can all transaction failures and reversals be fully eliminated?', ['Yes, with the right habits they disappear completely', 'No, but their impact can be meaningfully reduced', 'Failures are always avoidable with enough experience', 'Reversals are illegal so they never happen'], 1, 'The realistic goal is reducing impact and frequency, not eliminating these risks entirely.'),
        _q('What are the four core habits mentioned for reducing failure impact?', ['Ignore, guess, retry blindly, panic', 'Confirm before paying, log transactions, check history before retrying, know your dispute process', 'Only checking your phone battery', 'Avoiding all POS transactions'], 1, 'These four habits, covered across this course, form the practical foundation for minimizing failure-related losses.'),
        _q('Why review your own failure/reversal history periodically?', ['It serves no purpose', 'To spot patterns you can proactively adjust around', 'It is required by law', 'To increase your fees'], 1, 'Recognizing your own recurring issues lets you make proactive changes rather than reacting each time.'),
        _q('What might a pattern review reveal?', ['Nothing useful ever', 'Failures clustering around specific times or transaction types', 'Only random noise with no meaning', 'Your competitor\'s secrets'], 1, 'Patterns like network congestion times or specific transaction types can emerge from consistent review.'),
        _q('What should you do if problems persist with a specific provider despite good habits?', ['Nothing can be done', 'Consider whether switching providers is warranted', 'Immediately quit the business', 'Blame customers exclusively'], 1, 'Persistent provider-side issues, despite your own good practices, may justify reconsidering that provider relationship.'),
        _q('When should you learn your provider\'s dispute process?', ['Only during an active crisis', 'In advance, before you need it', 'It is unnecessary to ever learn this', 'Only after quitting the business'], 1, 'Knowing the process ahead of time lets you act quickly and correctly when a real dispute arises.'),
        _q('What is the practical output suggested from combining the four habits?', ['Nothing specific', 'One written checklist you can follow consistently', 'A legal contract', 'A new business license'], 1, 'Turning the habits into a simple checklist makes them easier to apply consistently day to day.'),
        _q('What is the overall closing message of this course?', ['Failures are unavoidable and nothing helps', 'Consistent habits and periodic review meaningfully reduce the cost and frequency of transaction problems', 'Only luck determines transaction outcomes', 'Reversals should always be accepted without question'], 1, 'The course closes by reinforcing that discipline and review, not luck, are what protect an agent long-term.'),
      ]),
  ],
);

final Course _course14 = Course(
  id: 'c14', title: 'Building a Sub-Agent Network',
  description: 'Recruit and manage resellers under you to multiply your reach without multiplying your own hours worked.',
  category: 'Agency Business', difficulty: Difficulty.advanced,
  icon: Icons.hub_rounded, durationMinutes: 140, order: 14,
  lessons: [
    _lesson('c14', 1, 'What a Sub-Agent Network Actually Is', 5, [
      'A sub-agent network means recruiting other people to sell airtime, data, or other services under your account, earning you a small margin on their sales in exchange for the credit line, support, or brand you provide them. This is how a single agent scales income without personally serving every customer.',
      'This works because trust and credit access are the real bottlenecks for many small resellers — someone with capital and standing to get a vendor account can extend that access to others who lack it, earning a cut for the risk and infrastructure they provide.',
    ], concepts: [KeyConcept('You Sell Access, Not Just Airtime', 'Sub-agents pay you for the credit line and infrastructure access you provide, not just the product itself.')],
      steps: ['Identify 2-3 people in your network who already resell informally and could become sub-agents.', 'Decide what margin split feels fair for the access and support you\'d provide.'],
      takeaways: ['A sub-agent network multiplies your reach without multiplying your personal hours.', 'You are effectively selling access and trust, not just product.', 'Trust and capital access are the real bottleneck most small resellers face.'],
      quiz: [
        _q('What does a sub-agent network involve?', ['Working alone forever', 'Recruiting others to sell under your account for a margin cut', 'Selling your business entirely', 'Avoiding all resellers'], 1, 'This structure lets you earn from others\' sales in exchange for the access and support you provide.'),
        _q('What is the real bottleneck this model solves for sub-agents?', ['Nothing, it solves no problem', 'Lack of trust or capital access to get their own vendor account', 'A lack of customers', 'A lack of phones'], 1, 'Many small resellers lack the standing or capital to open direct vendor accounts themselves.'),
        _q('How does a sub-agent network let you scale?', ['By working more hours personally', 'By earning from others\' sales without personally serving every customer', 'It doesn\'t allow scaling', 'By reducing your own sales to zero'], 1, 'Delegating sales through sub-agents multiplies reach beyond what one person could serve alone.'),
        _q('What are you effectively selling to a sub-agent?', ['Only physical airtime cards', 'Access, credit line, and support', 'Nothing of value', 'A government license'], 1, 'The value you provide is the access and infrastructure, which is what a sub-agent pays a margin for.'),
        _q('Who are good candidates to recruit as sub-agents?', ['Complete strangers with no track record', 'People already informally reselling who lack their own vendor access', 'Only your direct competitors', 'People with no interest in the business'], 1, 'Existing informal resellers are a natural fit since they already have the customer relationships.'),
        _q('What determines a fair margin split with a sub-agent?', ['Random guessing', 'The value of the access, credit, and support you provide', 'It should always be 50/50 regardless of context', 'Government regulation'], 1, 'The split should reflect the real value and risk you\'re providing through your access and support.'),
        _q('What risk do you take on by extending credit/access to sub-agents?', ['No risk at all', 'The risk that a sub-agent doesn\'t pay you back appropriately', 'Automatic profit with no downside', 'Legal liability for their taxes'], 1, 'Extending your account\'s access carries a real risk if a sub-agent mismanages funds owed to you.'),
        _q('What is the main idea of this opening lesson?', ['Sub-agent networks never work', 'Recruiting sub-agents lets you scale by selling access and trust, not just product', 'Only large corporations can do this', 'Sub-agents should be avoided entirely'], 1, 'The lesson introduces the core concept and rationale behind building a sub-agent network.'),
      ]),
    _lesson('c14', 2, 'Recruiting the Right Sub-Agents', 5, [
      'Not everyone makes a good sub-agent. Look for people who already have some customer base or foot traffic (a shop owner, a community figure), who are reliable with money (a track record matters more than enthusiasm), and who you can realistically reach for support and follow-up.',
      'Start small — one or two sub-agents first — so you can properly learn the operational side (tracking their sales, managing credit, resolving their issues) before scaling to more. A network of ten unreliable sub-agents is worse than two excellent ones.',
    ], concepts: [KeyConcept('Reliability Over Enthusiasm', 'A sub-agent\'s track record with money matters more than how excited they seem about the opportunity.')],
      steps: ['List the qualities you\'ll screen for in a potential sub-agent.', 'Start with just 1-2 sub-agents before considering scaling further.'],
      takeaways: ['Look for existing customer base, financial reliability, and reachability.', 'Reliability with money matters more than raw enthusiasm.', 'Start small with 1-2 sub-agents before scaling the network.'],
      quiz: [
        _q('What quality matters more than enthusiasm when recruiting?', ['Physical appearance', 'Reliability with money, based on track record', 'Age', 'Number of social media followers'], 1, 'A proven track record with financial reliability predicts performance better than initial excitement.'),
        _q('What existing asset should you look for in a candidate?', ['Nothing, anyone qualifies equally', 'An existing customer base or foot traffic', 'A university degree', 'Ownership of a car'], 1, 'Candidates with existing reach can put your access to work immediately.'),
        _q('Why is reachability for support and follow-up important?', ['It isn\'t important', 'You need to realistically manage and support each sub-agent', 'Reachability is only relevant to customers', 'Sub-agents never need support'], 1, 'Being able to actually reach and support a sub-agent is necessary for the relationship to function well.'),
        _q('How many sub-agents should you start with?', ['As many as possible immediately', 'One or two, before scaling', 'Exactly ten', 'None at all'], 1, 'Starting small lets you learn the operational side properly before expanding the network.'),
        _q('Why is a network of ten unreliable sub-agents worse than two excellent ones?', ['It is always better regardless of quality', 'Unreliable sub-agents create more risk and management burden than value', 'More sub-agents always means more profit', 'Quality doesn\'t matter in this business'], 1, 'Quality matters more than quantity — unreliable partners can cost you more than they earn you.'),
        _q('What should you learn before scaling your sub-agent network?', ['Nothing, just add more people quickly', 'The operational side: tracking sales, managing credit, resolving issues', 'Only marketing techniques', 'How to reduce your own margin to zero'], 1, 'Mastering the operational basics with a small group first sets you up to scale successfully later.'),
        _q('What is a good example of an existing customer base candidate?', ['A random stranger', 'A shop owner or community figure', 'Someone with no local presence', 'Only online influencers'], 1, 'Shop owners and community figures often already have the trust and foot traffic needed to succeed.'),
        _q('What is the overall recruiting philosophy in this lesson?', ['Recruit as many people as possible immediately', 'Recruit carefully and start small, prioritizing reliability', 'Avoid recruiting anyone at all', 'Only recruit family members'], 1, 'The lesson emphasizes deliberate, careful recruitment over rapid, indiscriminate expansion.'),
      ]),
    _lesson('c14', 3, 'Setting Terms and Managing Credit', 5, [
      'Before a sub-agent starts selling under you, agree clearly on terms: how much credit they can carry, how often they need to settle up with you, what margin split applies, and what happens if they fall behind on payment. Verbal agreements lead to disputes — write these terms down, even informally, and both parties keep a copy.',
      'Extend credit gradually. Start a new sub-agent with a small credit limit and short settlement cycle, and increase both as they build a track record of paying reliably and on time. This protects you from a large loss with someone whose reliability you haven\'t yet proven.',
    ], concepts: [KeyConcept('Gradual Credit Extension', 'Start new sub-agents with small credit limits and short settlement cycles, increasing both only as trust is proven.')],
      steps: ['Draft a simple written terms sheet covering credit limit, settlement frequency, and margin split.', 'Set a starting credit limit appropriately small for a new, unproven sub-agent.'],
      takeaways: ['Written terms prevent disputes that verbal agreements often create.', 'Extend credit gradually, starting small and increasing with proven reliability.', 'Clear settlement frequency and consequences for falling behind protect both parties.'],
      quiz: [
        _q('Why should terms with a sub-agent be written down, even informally?', ['Written terms are unnecessary', 'Verbal agreements often lead to disputes', 'Writing terms is illegal', 'It has no practical benefit'], 1, 'Clear, written terms reduce the chance of misunderstandings or disputes down the line.'),
        _q('What should sub-agent terms cover?', ['Nothing specific', 'Credit limit, settlement frequency, margin split, and consequences for falling behind', 'Only their phone number', 'Their favorite color'], 1, 'These core terms establish a clear, mutually understood working relationship.'),
        _q('How should credit be extended to a new sub-agent?', ['Immediately at the maximum amount', 'Gradually, starting small and increasing with proven reliability', 'Never extend any credit at all', 'Randomly without any pattern'], 1, 'Gradual credit extension protects you from large losses with an unproven partner.'),
        _q('What happens as a sub-agent builds a track record of reliable payment?', ['Nothing changes ever', 'Their credit limit and settlement flexibility can reasonably increase', 'Their margin split is reduced as punishment', 'They are removed from the network'], 1, 'Proven reliability justifies gradually extending more trust and credit over time.'),
        _q('What is the risk of extending large credit to an unproven sub-agent immediately?', ['No risk at all', 'A large potential loss if they turn out to be unreliable', 'Guaranteed higher profit', 'Improved customer service'], 1, 'Without a track record, a large credit extension carries significant financial risk if things go wrong.'),
        _q('What should happen if a sub-agent falls behind on settlement?', ['Nothing, ignore it', 'Consequences should be clearly defined in the agreed terms', 'Immediately end all business relationships everywhere', 'Increase their credit limit as a reward'], 1, 'Having predefined consequences avoids ambiguity and awkward conflict when a sub-agent falls behind.'),
        _q('Why keep a copy of the terms for both parties?', ['It is unnecessary', 'So both sides have a clear, shared reference if disputes arise', 'Only the agent needs a copy', 'Copies increase disputes'], 1, 'A shared, agreed record protects both the agent and sub-agent if disagreements come up later.'),
        _q('What is the overall goal of this lesson?', ['Avoid setting any terms at all', 'Establish clear, written terms and manage credit extension gradually and carefully', 'Extend maximum credit to everyone immediately', 'Rely purely on trust with no documentation'], 1, 'The lesson focuses on structured, documented terms and cautious credit management as the network grows.'),
      ]),
    _lesson('c14', 4, 'Supporting and Retaining Sub-Agents', 5, [
      'A sub-agent who feels unsupported — can\'t reach you when there\'s a problem, doesn\'t understand how to use the systems, or feels the margin split is unfair — will eventually leave or, worse, become unreliable while still active. Regular check-ins, clear communication channels, and fair treatment keep good sub-agents loyal.',
      'Recognize and reward your best-performing sub-agents, whether through a slightly better margin split as they grow, priority support, or simply consistent, positive communication. Retaining a good sub-agent is far cheaper than constantly recruiting and training replacements.',
    ], concepts: [KeyConcept('Support Prevents Attrition', 'Unsupported sub-agents don\'t just underperform — they eventually leave, costing you the relationship you invested in building.')],
      steps: ['Set a regular check-in cadence (weekly or bi-weekly) with each sub-agent.', 'Identify one way to recognize your best-performing sub-agent this month.'],
      takeaways: ['Unsupported sub-agents become unreliable or leave entirely.', 'Regular check-ins and clear communication build loyalty.', 'Retaining good sub-agents is cheaper than constantly recruiting replacements.'],
      quiz: [
        _q('What happens to a sub-agent who feels unsupported?', ['They always perform better', 'They may become unreliable or leave the network', 'Nothing changes for them', 'They automatically get promoted'], 1, 'Lack of support tends to erode reliability and loyalty over time.'),
        _q('What are examples of feeling unsupported?', ['Receiving too much communication', 'Not being able to reach you with problems, or not understanding the systems', 'Getting a fair margin split', 'Regular positive feedback'], 1, 'Poor access to support and unclear systems are common sources of sub-agent frustration.'),
        _q('What helps keep good sub-agents loyal?', ['Ignoring them entirely', 'Regular check-ins, clear communication, and fair treatment', 'Reducing their margin without explanation', 'Never responding to their questions'], 1, 'Consistent, fair, and responsive treatment builds the trust that keeps sub-agents engaged.'),
        _q('Why is retaining good sub-agents valuable compared to constant recruitment?', ['Recruitment is always cheaper', 'Retention avoids the repeated cost and effort of training new replacements', 'There is no difference either way', 'New recruits always perform better immediately'], 1, 'Constantly replacing sub-agents wastes the time and effort already invested in the ones you have.'),
        _q('What is one way to reward top-performing sub-agents?', ['Reducing their credit limit', 'A slightly better margin split or priority support', 'Ignoring their performance entirely', 'Publicly criticizing lower performers'], 1, 'Recognizing strong performance encourages continued loyalty and effort from your best partners.'),
        _q('What is a suggested regular practice for supporting sub-agents?', ['Never communicating with them', 'Regular check-ins on a set cadence', 'Only speaking when there is a problem', 'Communicating once a year'], 1, 'Scheduled check-ins maintain a consistent, supportive relationship rather than only reactive contact.'),
        _q('What can result from an unfair margin split perception?', ['Increased loyalty', 'Resentment that leads to unreliability or departure', 'No effect on the relationship', 'Automatic improvement in performance'], 1, 'Perceived unfairness in the split can directly damage the sub-agent relationship over time.'),
        _q('What is the overall message of this lesson?', ['Sub-agents need no support once recruited', 'Ongoing support and fair treatment are essential to retaining a productive sub-agent network', 'Only recruitment matters, not retention', 'Rewarding good performance is unnecessary'], 1, 'The lesson emphasizes that recruitment alone isn\'t enough — ongoing support sustains the network.'),
      ]),
    _lesson('c14', 5, 'Scaling Your Network Sustainably', 5, [
      'As your sub-agent network grows beyond a handful of people, the same tracking discipline from earlier lessons (logging, reconciliation) needs a simple system to handle multiple relationships at once — a spreadsheet or notebook tracking each sub-agent\'s credit limit, current balance owed, and settlement history.',
      'Grow deliberately: add new sub-agents at a pace where you can still properly onboard, set terms, and support each one, rather than recruiting aggressively and letting quality and oversight slip. A smaller, well-managed network reliably outperforms a large, poorly managed one.',
    ], concepts: [KeyConcept('Systems Must Scale With Headcount', 'A tracking system that worked for 2 sub-agents breaks down at 10 without deliberate structure.')],
      steps: ['Build a simple tracking sheet with one row per sub-agent (credit limit, balance owed, settlement history).', 'Set a personal pace limit for how many new sub-agents you\'ll onboard per month.'],
      takeaways: ['Growing networks need a simple system to track multiple relationships at once.', 'Deliberate, paced growth beats aggressive recruitment that outpaces your oversight capacity.', 'A smaller, well-managed network outperforms a large, poorly managed one.'],
      quiz: [
        _q('What needs to scale alongside a growing sub-agent network?', ['Nothing needs to change', 'Your tracking and management system', 'Only your marketing', 'Your personal phone number'], 1, 'A system that worked for a couple of sub-agents needs structure to handle many more reliably.'),
        _q('What should a simple tracking system include per sub-agent?', ['Nothing specific', 'Credit limit, balance owed, and settlement history', 'Only their name', 'Their personal social media'], 1, 'These core details let you manage multiple sub-agent relationships without losing track of any one of them.'),
        _q('What is the recommended pace for adding new sub-agents?', ['As many as possible immediately', 'A deliberate pace you can properly onboard and support', 'Exactly one per year', 'No new sub-agents ever'], 1, 'Growing at a manageable pace preserves the quality of onboarding, terms-setting, and support for each new addition.'),
        _q('What happens if you recruit aggressively without matching oversight capacity?', ['Nothing negative happens', 'Quality and oversight slip, increasing risk across the network', 'Profit always increases regardless', 'The network becomes automatically more reliable'], 1, 'Outpacing your own capacity to manage the network well introduces real risk of mismanagement and loss.'),
        _q('Which performs better: a smaller well-managed network or a large poorly managed one?', ['The large poorly managed one always wins', 'The smaller, well-managed network', 'Size alone determines success', 'They perform identically'], 1, 'Quality of management matters more than raw headcount for a sustainable, profitable network.'),
        _q('What tool is suggested for tracking multiple sub-agents?', ['Memory alone', 'A spreadsheet or notebook system', 'No tracking is necessary', 'A government database'], 1, 'A simple, organized tracking tool is sufficient and necessary as the network grows beyond a couple of people.'),
        _q('Why does deliberate growth protect the network\'s overall quality?', ['It doesn\'t protect anything', 'It ensures each new sub-agent gets proper onboarding, terms, and support', 'Deliberate growth always slows profit', 'Growth pace has no effect on quality'], 1, 'Careful pacing ensures the same care given to early sub-agents extends to new ones as the network expands.'),
        _q('What is the overall closing message of this course?', ['Grow as fast as possible regardless of consequences', 'Build and scale your sub-agent network deliberately, with systems that grow alongside it', 'Sub-agent networks should never grow beyond one person', 'Tracking systems are unnecessary at any scale'], 1, 'The course closes by reinforcing sustainable, systems-supported growth over reckless expansion.'),
      ]),
  ],
);

final Course _course15 = Course(
  id: 'c15', title: 'Bookkeeping Basics for Small Business',
  description: 'Simple daily record-keeping for your business, no accounting degree needed.',
  category: 'Business Skills', difficulty: Difficulty.beginner,
  icon: Icons.book_rounded, durationMinutes: 130, order: 15,
  lessons: [
    _lesson('c15', 1, 'Why Bookkeeping Matters Even for a Small Stand', 5, [
      'Many small business owners keep everything in their head, confident they\'ll remember what came in and went out. This works until it doesn\'t — a busy week blurs together, cash gets mixed with personal spending, and by month-end nobody can say confidently whether the business actually made money.',
      'Bookkeeping isn\'t about complex accounting software or formal statements. At its simplest, it\'s just writing down what money came in, what went out, and why — consistently enough that you can answer basic questions about your business at any time, not just guess.',
    ], concepts: [KeyConcept('Memory Is Not a Record', 'Confidence in remembering transactions fails under real business volume — a written record doesn\'t.')],
      steps: ['Reflect honestly: could you state your exact profit from last week right now?', 'Decide on one simple tool (notebook or app) to start recording daily transactions.'],
      takeaways: ['Relying on memory alone breaks down as business volume grows.', 'Bookkeeping at its core is simply recording money in, money out, and why.', 'You don\'t need formal accounting training to start keeping useful records.'],
      quiz: [
        _q('What commonly goes wrong when owners rely purely on memory?', ['Nothing goes wrong', 'Cash gets mixed with personal spending and details are forgotten', 'Memory always improves with more transactions', 'Bookkeeping becomes unnecessary'], 1, 'Memory reliably breaks down under real volume, mixing business and personal finances confusingly.'),
        _q('What is bookkeeping at its simplest?', ['Complex accounting software', 'Recording money in, money out, and why', 'A government requirement only for large companies', 'Guessing your profit at month-end'], 1, 'At its core, bookkeeping is just a consistent written record of transactions and their purpose.'),
        _q('Do you need formal accounting training to start bookkeeping?', ['Yes, it is required', 'No, simple consistent recording is enough to start', 'Only certified accountants can keep records', 'Bookkeeping requires a university degree'], 1, 'Basic, consistent recording is accessible to any business owner without formal training.'),
        _q('What question should good bookkeeping let you answer confidently?', ['Nothing in particular', 'Whether your business actually made money in a given period', 'Only your competitor\'s profit', 'The weather forecast'], 1, 'Clear records let you confidently assess your actual business performance rather than guessing.'),
        _q('What happens without any recordkeeping by month-end?', ['Perfect clarity on profit', 'Uncertainty about whether the business actually made money', 'Automatic profit calculation', 'No effect on business understanding'], 1, 'Without records, month-end profit assessment becomes guesswork rather than fact.'),
        _q('What is a risk of mixing business cash with personal spending?', ['No risk at all', 'Losing clarity on actual business performance', 'Automatic tax benefits', 'Improved recordkeeping'], 1, 'Mixed funds make it much harder to assess true business profitability.'),
        _q('What tool is suggested to start simple bookkeeping?', ['Expensive software only', 'A notebook or simple app', 'Nothing, memory is sufficient', 'A university course'], 1, 'A basic notebook or app is entirely sufficient to begin consistent recordkeeping.'),
        _q('What is the overall message of this opening lesson?', ['Bookkeeping is unnecessary for small businesses', 'Simple, consistent bookkeeping is essential and accessible for any business owner', 'Only accountants should track money', 'Memory is a reliable long-term record'], 1, 'The lesson establishes why even the simplest business needs basic, consistent recordkeeping.'),
      ]),
    _lesson('c15', 2, 'What to Record Every Day', 5, [
      'At minimum, record every sale (amount and what was sold), every expense (amount and what it was for), and your cash balance at the start and end of each day. This simple daily habit, done consistently, gives you everything needed to understand your business\'s basic financial health.',
      'Separate personal withdrawals from business expenses clearly — if you take cash from the business for personal use, record it as a distinct line, not as a business expense. This distinction is what lets you actually know if the business itself is profitable, separate from your personal spending habits.',
    ], concepts: [KeyConcept('Separate Personal From Business', 'Personal withdrawals must be recorded distinctly from business expenses to see true business profitability.')],
      steps: ['Create simple columns for your daily record: sales, expenses, personal withdrawals, opening/closing balance.', 'Record today\'s transactions using this format as practice.'],
      takeaways: ['Record every sale, every expense, and daily opening/closing cash balance.', 'Keep personal withdrawals clearly separate from business expenses.', 'This simple daily habit reveals your business\'s basic financial health.'],
      quiz: [
        _q('What should be recorded for every sale?', ['Nothing specific', 'The amount and what was sold', 'Only the customer\'s name', 'The weather that day'], 1, 'Amount and description give enough detail to understand your sales patterns over time.'),
        _q('What should be recorded for every expense?', ['Nothing needed', 'The amount and what it was for', 'Only the total for the month', 'Your mood that day'], 1, 'Recording both amount and purpose lets you understand where your money is actually going.'),
        _q('What should be tracked at the start and end of each day?', ['Nothing daily, only monthly', 'Your cash balance', 'The number of customers only', 'Your competitor\'s prices'], 1, 'Opening and closing balances help verify your records match your actual cash on hand.'),
        _q('Why separate personal withdrawals from business expenses?', ['It doesn\'t matter, they\'re the same thing', 'To accurately see whether the business itself is profitable', 'Personal withdrawals should never be recorded', 'Separation is only required by banks'], 1, 'Mixing personal spending into business expenses distorts your true understanding of business profitability.'),
        _q('What happens if personal spending is recorded as a business expense?', ['Nothing changes', 'It falsely reduces your apparent business profit', 'It increases your actual profit', 'It has no effect on your records'], 1, 'Misclassifying personal spending makes the business appear less profitable than it actually is.'),
        _q('What is a suggested simple record format?', ['A single blank page with no structure', 'Columns for sales, expenses, personal withdrawals, and balances', 'Only a total number with no detail', 'A verbal daily report to no one'], 1, 'Clear, consistent columns make daily recording fast and useful for later review.'),
        _q('How often should this basic recording happen?', ['Once a year', 'Every day, consistently', 'Only when you remember to', 'Only on slow days'], 1, 'Daily consistency is what makes the record trustworthy and useful over time.'),
        _q('What does this daily habit ultimately reveal?', ['Nothing useful', 'Your business\'s basic financial health', 'Only your competitor\'s performance', 'The national economy\'s status'], 1, 'Consistent daily recording builds a clear, accurate picture of how your business is actually doing.'),
      ]),
    _lesson('c15', 3, 'Reconciling and Reviewing Weekly', 5, [
      'Once a week, take ten minutes to review your daily records together: total sales, total expenses, total personal withdrawals, and whether your actual cash on hand matches what the math says it should be. Small mismatches are normal at first; consistently large ones signal a recording habit that needs tightening.',
      'Use this weekly review to spot simple trends — which days are busiest, which expenses are creeping up, whether personal withdrawals are eating into what should be reinvested capital. This turns raw daily data into decisions you can actually act on.',
    ], concepts: [KeyConcept('Weekly Review Turns Data Into Decisions', 'Raw daily records are only useful once you step back weekly and look for patterns and mismatches.')],
      steps: ['Schedule a fixed 10-minute weekly slot to review your records.', 'Compare your calculated cash position against your actual cash on hand this week.'],
      takeaways: ['A short weekly review catches recording mistakes early.', 'Weekly review reveals patterns in sales, expenses, and personal withdrawals.', 'Turning raw data into a habit of reflection is what makes bookkeeping actually useful.'],
      quiz: [
        _q('How often is a review of daily records suggested?', ['Once a year', 'Weekly', 'Every few years', 'Never, daily recording alone is enough'], 1, 'A regular weekly cadence catches issues early and keeps the habit manageable.'),
        _q('What should a weekly review compare?', ['Nothing in particular', 'Recorded totals against your actual cash on hand', 'Only your mood', 'Your competitor\'s sales'], 1, 'Checking recorded numbers against physical cash verifies your recording accuracy.'),
        _q('What does a small mismatch during review usually mean?', ['A serious crime has occurred', 'It is normal at first and not immediately alarming', 'Your business has failed', 'You must close immediately'], 1, 'Minor discrepancies are common early on; the concern is a consistently growing or large gap.'),
        _q('What does a consistently large mismatch signal?', ['Nothing important', 'A recording habit that needs tightening', 'Guaranteed fraud by a third party', 'The need to stop bookkeeping entirely'], 1, 'Persistent large gaps suggest something in your recording process needs closer attention.'),
        _q('What trends can weekly review help you spot?', ['None, trends are unimportant', 'Busiest days, rising expenses, and personal withdrawal patterns', 'Only global economic trends', 'Your competitor\'s exact profit'], 1, 'These practical, business-specific patterns become visible through consistent weekly review.'),
        _q('What is the value of turning raw data into a weekly habit?', ['No value, raw data is enough alone', 'It converts information into decisions you can act on', 'It replaces the need for daily recording', 'It only benefits accountants'], 1, 'Review transforms passive data collection into active, useful business insight.'),
        _q('How long is the suggested weekly review time?', ['Several hours', 'About ten minutes', 'A full day', 'No specific time is needed'], 1, 'A short, focused review session is enough to catch what matters without becoming a burden.'),
        _q('What is the overall purpose of this lesson?', ['To discourage regular review', 'To build a simple weekly habit that catches errors and reveals actionable patterns', 'To replace daily recording entirely', 'To focus only on personal spending'], 1, 'The lesson establishes weekly review as the bridge between raw records and useful business insight.'),
      ]),
    _lesson('c15', 4, 'Understanding Your Simple Profit Picture', 5, [
      'With consistent daily records and weekly reviews, calculating a basic monthly profit becomes straightforward: total sales, minus total business expenses, equals your business profit — separate entirely from whatever you\'ve personally withdrawn along the way.',
      'This simple profit picture is more valuable than it seems. It tells you honestly whether your business is growing, shrinking, or flat month over month, and it\'s the foundation for decisions covered in other courses — how much you can safely save, reinvest, or borrow against.',
    ], concepts: [KeyConcept('Sales Minus Expenses, Not Minus Withdrawals', 'True business profit excludes your personal withdrawals — those are a separate use of profit, not a cost of doing business.')],
      steps: ['Calculate last month\'s total sales and total business expenses from your records.', 'Subtract to find your simple monthly profit figure.'],
      takeaways: ['Monthly profit = total sales minus total business expenses, not minus personal withdrawals.', 'A clear monthly profit picture shows whether your business is growing, shrinking, or flat.', 'This figure is the foundation for saving, reinvestment, and borrowing decisions.'],
      quiz: [
        _q('What is the basic formula for monthly profit?', ['Sales plus expenses', 'Total sales minus total business expenses', 'Personal withdrawals minus sales', 'There is no simple formula'], 1, 'This straightforward calculation gives a clear, honest profit figure for the period.'),
        _q('Should personal withdrawals be subtracted to calculate business profit?', ['Yes, always subtract them', 'No, they are a separate use of profit, not a business cost', 'Withdrawals should be added instead', 'Withdrawals are irrelevant to any calculation'], 1, 'Personal withdrawals come out of profit after it\'s earned — they aren\'t a cost of running the business itself.'),
        _q('What does a clear monthly profit figure tell you?', ['Nothing useful', 'Whether your business is growing, shrinking, or flat over time', 'Only your competitor\'s status', 'The national inflation rate'], 1, 'Tracking this figure month over month reveals real business trends you can act on.'),
        _q('What foundation does this profit figure provide for other decisions?', ['None, it is purely informational', 'A basis for saving, reinvestment, and borrowing decisions', 'It only matters for tax purposes', 'It replaces the need for any further planning'], 1, 'Knowing your real profit is essential before making informed decisions about saving, reinvesting, or borrowing.'),
        _q('What two figures are needed to calculate simple monthly profit?', ['Only total sales', 'Total sales and total business expenses', 'Only personal withdrawals', 'Only your bank balance'], 1, 'Both figures together give you the complete picture needed for an accurate profit calculation.'),
        _q('Why is this described as a "simple" profit picture?', ['Because it is inaccurate', 'Because it uses basic recorded totals without complex accounting', 'It requires professional accountants', 'It only applies to large businesses'], 1, 'The calculation is intentionally accessible, using only the basic records already being kept.'),
        _q('What happens if you skip tracking this monthly profit figure?', ['Nothing changes, it is optional', 'You lose clarity on whether your business is actually improving over time', 'Your business automatically profits more', 'Bookkeeping becomes easier'], 1, 'Without this figure, you can\'t reliably assess your business\'s real trajectory.'),
        _q('What is the overall goal of this lesson?', ['To avoid calculating profit at all', 'To show how simple, consistent records translate into a clear monthly profit figure', 'To replace bookkeeping with guesswork', 'To combine personal and business finances'], 1, 'The lesson ties together the earlier recording and review habits into one clear, useful profit metric.'),
      ]),
    _lesson('c15', 5, 'Making Bookkeeping a Permanent Habit', 5, [
      'The biggest risk to any bookkeeping system isn\'t complexity — it\'s abandonment after a few busy weeks. Protect the habit by keeping the system as simple as possible (resist the urge to add complicated categories you won\'t maintain) and tying it to something you already do daily, like closing your stand.',
      'As your business grows — more products, a sub-agent network, multiple tools — your bookkeeping can grow with it, but only after the basic daily habit is genuinely solid. Adding complexity to a shaky habit just makes it more likely to be abandoned entirely.',
    ], concepts: [KeyConcept('Simplicity Protects the Habit', 'A slightly imperfect but consistently kept simple record beats an elaborate system abandoned after two weeks.')],
      steps: ['Tie your daily recording habit to an existing routine, like closing your stand each evening.', 'Commit to keeping your system simple until it is genuinely a habit, before adding complexity.'],
      takeaways: ['The biggest risk to bookkeeping is abandonment, not complexity.', 'Keep the system simple and tie it to an existing daily routine.', 'Only add complexity once the basic habit is genuinely solid.'],
      quiz: [
        _q('What is described as the biggest risk to a bookkeeping system?', ['Being too accurate', 'Abandonment after a few busy weeks', 'Using too simple a system', 'Recording too many details'], 1, 'Consistency, not perfection, is what makes bookkeeping actually valuable over time.'),
        _q('What should you resist adding too early?', ['Any recording at all', 'Complicated categories you won\'t realistically maintain', 'A notebook or simple app', 'A daily habit'], 1, 'Overcomplicating the system early increases the risk you\'ll abandon it altogether.'),
        _q('What is suggested to help make recording a lasting habit?', ['Nothing, habits form automatically', 'Tying it to something you already do daily, like closing your stand', 'Doing it randomly whenever convenient', 'Only recording once a month'], 1, 'Attaching a new habit to an existing routine makes it far more likely to stick long-term.'),
        _q('When should you consider adding more complexity to your bookkeeping?', ['Immediately, from day one', 'Only after the basic daily habit is genuinely solid', 'Never, simplicity should be permanent regardless of growth', 'Before starting the habit at all'], 1, 'Building complexity on a shaky foundation increases the risk of abandoning the whole system.'),
        _q('What happens if complexity is added to a shaky habit?', ['The habit becomes easier to maintain', 'It makes abandonment more likely', 'Nothing changes either way', 'Profit automatically increases'], 1, 'Adding difficulty to an already fragile habit tends to accelerate giving up on it.'),
        _q('What is preferable: a perfect system abandoned in two weeks, or an imperfect one kept consistently?', ['The perfect system abandoned quickly', 'The imperfect system kept consistently', 'Neither has any value', 'They are equally valuable'], 1, 'Consistency over time provides more real business value than short-lived perfection.'),
        _q('How should bookkeeping evolve as a business grows?', ['It should never change', 'It can grow in complexity, but only once the basic habit is solid', 'It should be abandoned entirely at scale', 'Growth has no relationship to bookkeeping'], 1, 'Bookkeeping can scale with the business, but a stable foundation must come first.'),
        _q('What is the overall closing message of this course?', ['Bookkeeping is too complex for small businesses', 'A simple, consistently kept system, tied to daily routine, is what makes bookkeeping actually work', 'Perfection matters more than consistency', 'Bookkeeping should be abandoned once mastered'], 1, 'The course closes by reinforcing that sustainable simplicity beats short-lived complexity.'),
      ]),
  ],
);

final Course _course16 = Course(
  id: 'c16', title: 'Understanding Business Loans & Credit',
  description: 'When to borrow, how to evaluate loan terms, and the red flags that separate helpful credit from a trap.',
  category: 'Business Skills', difficulty: Difficulty.intermediate,
  icon: Icons.account_balance_rounded, durationMinutes: 140, order: 16,
  lessons: [
    _lesson('c16', 1, 'When Borrowing Actually Makes Sense', 5, [
      'Borrowing for a business is neither automatically good nor automatically bad — it depends entirely on what the money is for and whether it will generate more value than it costs to repay. Borrowing to buy inventory that will sell quickly at a profit is very different from borrowing to cover a shortfall with no clear plan to repay it.',
      'A useful test: will this loan fund something that increases your business\'s earning capacity (more stock, a second machine, a tool that saves time) or is it plugging a gap caused by a deeper problem (poor cash flow management, overspending)? Loans are a poor substitute for fixing an underlying business problem.',
    ], concepts: [KeyConcept('Fund Growth, Not Gaps', 'A loan should fund something that increases earning capacity, not paper over a deeper cash-flow problem.')],
      steps: ['Before considering any loan, write down exactly what it would fund and how it increases earning capacity.', 'Ask honestly: is there an underlying problem a loan would just be masking?'],
      takeaways: ['Borrowing makes sense when it funds growth that outpaces its cost, not just any need for cash.', 'Distinguish between funding growth and papering over a deeper cash-flow problem.', 'A loan is a poor substitute for fixing an underlying business issue.'],
      quiz: [
        _q('Is borrowing for a business automatically good or bad?', ['Always good', 'Always bad', 'Neither — it depends on what the money funds and its return', 'Borrowing has no real effect on a business'], 1, 'The value of borrowing depends entirely on whether it funds something that outpaces its cost.'),
        _q('What is a good use of a loan, according to this lesson?', ['Covering a shortfall with no repayment plan', 'Buying inventory that will sell quickly at a profit', 'Personal luxury spending', 'Paying off an unrelated debt with no plan'], 1, 'Funding something with clear, quick earning potential is a reasonable use of borrowed capital.'),
        _q('What is a poor use of a loan?', ['Buying a second POS machine to handle more volume', 'Plugging a cash gap caused by a deeper, unaddressed problem', 'Purchasing inventory with proven demand', 'Funding a tool that saves time'], 1, 'Using debt to mask an underlying issue like poor cash management doesn\'t solve the real problem.'),
        _q('What is the suggested test before borrowing?', ['Whether you feel like it', 'Whether the loan increases your earning capacity or just plugs a gap', 'Whether your friends have also borrowed money', 'Whether the lender is popular'], 1, 'This test helps distinguish productive borrowing from borrowing that avoids addressing a real problem.'),
        _q('What can a loan not effectively fix?', ['Inventory shortages', 'An underlying business problem like poor cash flow management', 'Equipment needs', 'Growth opportunities'], 1, 'Debt doesn\'t resolve root causes like mismanagement — it can actually make such problems worse.'),
        _q('What kind of purchase increases earning capacity?', ['A personal vacation', 'A second machine or tool that expands what you can sell or how fast', 'Paying rent you were already going to pay anyway', 'None of these examples'], 1, 'Investments that expand your operational capacity are a productive use of borrowed capital.'),
        _q('What should guide the decision to borrow?', ['Random impulse', 'A clear plan for what the money funds and how it will be repaid', 'Whatever the lender suggests without question', 'Avoiding all financial planning'], 1, 'A deliberate plan tied to genuine value creation should guide any borrowing decision.'),
        _q('What is the overall message of this opening lesson?', ['Never borrow under any circumstances', 'Borrow deliberately, only when it funds real growth rather than masking a problem', 'Always borrow when cash is tight', 'Loans are inherently harmful regardless of use'], 1, 'The lesson sets up a thoughtful framework for evaluating when borrowing genuinely makes sense.'),
      ]),
    _lesson('c16', 2, 'Reading and Understanding Loan Terms', 5, [
      'Before signing anything, understand exactly what you\'re agreeing to: the interest rate (and whether it\'s flat or reducing balance — these can produce very different real costs for the same stated rate), the repayment schedule, any fees beyond interest, and what happens if you\'re late or default.',
      'A "flat rate" loan charges interest on the full original amount for the entire loan term, even as you pay down the balance — this makes the real (effective) interest rate much higher than the advertised rate suggests. A "reducing balance" loan charges interest only on what you still owe, which is genuinely cheaper for the same headline percentage.',
    ], concepts: [KeyConcept('Flat Rate vs Reducing Balance', 'The same advertised interest rate can mean very different real costs depending on which calculation method is used.')],
      steps: ['Before accepting any loan, ask explicitly whether it uses flat rate or reducing balance interest.', 'Calculate or ask for the total amount you\'ll repay across the full loan term.'],
      takeaways: ['Understand interest rate type, repayment schedule, fees, and default consequences before signing.', 'Flat rate loans are more expensive in reality than the advertised rate suggests.', 'Always know the total amount you\'ll repay, not just the headline interest rate.'],
      quiz: [
        _q('What should you understand before signing a loan agreement?', ['Nothing, just sign and proceed', 'Interest rate type, repayment schedule, fees, and default consequences', 'Only the lender\'s name', 'The color of the loan document'], 1, 'Full understanding of these terms prevents unpleasant surprises later in the loan.'),
        _q('What is a "flat rate" loan?', ['Interest charged only on the remaining balance', 'Interest charged on the full original amount for the entire term', 'A loan with no interest at all', 'A one-time fee with no interest'], 1, 'Flat rate loans keep charging interest on the original amount even as you pay it down, making them costlier.'),
        _q('What is a "reducing balance" loan?', ['Interest charged on the full original amount always', 'Interest charged only on what you still owe', 'A loan that never needs repayment', 'A type of savings account'], 1, 'This method charges interest on the actual remaining balance, which is generally cheaper for the same stated rate.'),
        _q('Why can two loans with the same advertised rate cost differently?', ['They never cost differently', 'Because flat rate and reducing balance calculations produce different real costs', 'Advertised rates are always identical to real costs', 'The lender\'s office location affects cost'], 1, 'The calculation method behind the stated rate significantly affects your true total repayment.'),
        _q('What else besides interest rate should you check in loan terms?', ['Nothing else matters', 'Fees, repayment schedule, and default consequences', 'Only the lender\'s working hours', 'The loan officer\'s name'], 1, 'A complete understanding requires looking beyond just the headline interest figure.'),
        _q('What is a practical question to ask before accepting a loan?', ['What is your favorite color?', 'Is this a flat rate or reducing balance loan?', 'How many other people have this lender?', 'Is the office decorated nicely?'], 1, 'This specific question reveals a lot about the real cost you\'ll actually face.'),
        _q('What number should you always know before signing?', ['Only the monthly payment', 'The total amount you\'ll repay across the full loan term', 'The lender\'s annual revenue', 'Nothing beyond the interest percentage'], 1, 'The total repayment figure gives you the clearest picture of the loan\'s real cost.'),
        _q('What is the overall goal of this lesson?', ['To discourage understanding loan terms', 'To help you fully understand loan terms before committing, especially interest calculation method', 'To make all loans seem equally risky', 'To avoid reading any loan documents'], 1, 'The lesson equips you to evaluate real loan cost accurately rather than being misled by a headline rate.'),
      ]),
    _lesson('c16', 3, 'Spotting Predatory or Risky Lending', 5, [
      'Some lenders target small business owners specifically because they are eager for quick capital and less likely to scrutinize terms closely. Red flags include: interest rates far above the going market rate, pressure to sign quickly without time to review terms, unclear or hidden fees revealed only after signing, and aggressive or threatening collection practices.',
      'Legitimate lenders are generally transparent about total cost, willing to answer questions clearly, and registered/licensed appropriately. If a lender avoids clear answers about total repayment cost, or pressures you to decide immediately, treat that as a serious warning sign rather than urgency to act fast.',
    ], concepts: [KeyConcept('Pressure Is a Red Flag', 'Legitimate lenders let you take time to review terms; pressure to sign immediately is a warning sign, not urgency to trust.')],
      steps: ['List the red flags from this lesson and keep them as a personal checklist for evaluating any future lender.', 'Research whether a lender you\'re considering is properly registered/licensed.'],
      takeaways: ['Predatory lenders often target eager small business owners with unclear terms and pressure tactics.', 'Red flags include above-market rates, sign-now pressure, hidden fees, and aggressive collection.', 'Legitimate lenders are transparent and give you time to review terms properly.'],
      quiz: [
        _q('Who do predatory lenders often specifically target?', ['Large corporations only', 'Small business owners eager for quick capital', 'Government agencies', 'Banks themselves'], 1, 'Eagerness for fast capital can make small business owners less likely to scrutinize risky terms closely.'),
        _q('What is a red flag related to interest rates?', ['Rates in line with the market', 'Rates far above the going market rate', 'Clearly disclosed rates', 'Rates explained patiently'], 1, 'Unusually high rates compared to market norms are a clear warning sign of predatory lending.'),
        _q('What is a red flag related to signing pressure?', ['Being given time to review terms', 'Pressure to sign quickly without time to review', 'Clear written terms provided in advance', 'Patient, transparent answers to questions'], 1, 'Urgency to sign immediately, without allowing review time, is a classic predatory tactic.'),
        _q('What is a red flag related to fees?', ['All fees disclosed upfront clearly', 'Unclear or hidden fees revealed only after signing', 'No fees charged at all', 'Fees explained in simple language beforehand'], 1, 'Fees that surface only after you\'ve signed are a serious warning sign of a predatory arrangement.'),
        _q('What is a sign of a legitimate lender?', ['Refusing to answer questions about cost', 'Transparency about total cost and being properly registered/licensed', 'Aggressive collection tactics', 'Pressuring immediate decisions'], 1, 'Legitimate lenders are open about costs and operate within proper regulatory registration.'),
        _q('How should you respond to a lender pressuring an immediate decision?', ['Sign immediately to avoid missing out', 'Treat it as a serious warning sign, not urgency to act', 'Ignore the pressure and sign anyway', 'Assume all lenders behave this way normally'], 1, 'Genuine urgency from a lender to sign without review time should raise real concern, not compliance.'),
        _q('What should you do if a lender avoids clear answers about total repayment cost?', ['Proceed anyway, it\'s normal', 'Treat this evasiveness as a red flag', 'Assume the cost must be very low', 'Sign immediately to lock in the deal'], 1, 'Evasiveness about the real cost of a loan is a strong signal something isn\'t being disclosed honestly.'),
        _q('What is the overall purpose of this lesson?', ['To discourage borrowing entirely', 'To help you recognize and avoid predatory or risky lending practices', 'To recommend borrowing from any available lender', 'To suggest all lenders are equally trustworthy'], 1, 'The lesson arms you with concrete red flags to protect yourself from harmful lending arrangements.'),
      ]),
    _lesson('c16', 4, 'Calculating Whether a Loan Actually Pays Off', 5, [
      'Before accepting a loan, run a simple calculation: will the additional profit generated by what the loan funds exceed the total cost of repaying it (principal plus all interest and fees)? If borrowing ₦100,000 to buy stock will generate ₦130,000 in additional profit over the loan period, and total repayment is ₦115,000, the loan is worthwhile. If repayment exceeds the extra profit generated, it isn\'t.',
      'Build in a margin of safety — your projected extra profit should comfortably exceed loan repayment, not just barely cover it, because business projections rarely play out exactly as planned. A loan that only breaks even on paper carries real risk if actual results come in below projection.',
    ], concepts: [KeyConcept('Compare Extra Profit to Total Repayment', 'A loan is only worthwhile if what it funds generates more profit than the full cost of repaying it.')],
      steps: ['Pick a real loan scenario you\'re considering and calculate expected extra profit vs total repayment.', 'Add a safety margin to your profit projection to account for real-world uncertainty.'],
      takeaways: ['Compare the extra profit a loan funds against the total repayment cost, not just the interest rate.', 'A loan only makes sense if extra profit clearly exceeds total repayment.', 'Build in a safety margin since real results rarely match projections exactly.'],
      quiz: [
        _q('What should be compared to decide if a loan pays off?', ['Only the interest rate', 'Extra profit generated versus total repayment cost', 'The lender\'s reputation only', 'Nothing needs to be compared'], 1, 'This direct comparison reveals whether borrowing actually creates net value for your business.'),
        _q('If a loan funds ₦100,000 of stock generating ₦130,000 extra profit, and total repayment is ₦115,000, is the loan worthwhile?', ['No, it is a loss', 'Yes, the extra profit exceeds total repayment', 'It depends on the weather', 'There is not enough information'], 1, 'Since ₦130,000 in profit exceeds the ₦115,000 total repayment, this loan creates genuine net value.'),
        _q('What happens if total repayment exceeds the extra profit generated?', ['The loan is automatically worthwhile', 'The loan does not pay off and creates a net loss', 'Nothing changes for the business', 'This scenario is impossible'], 1, 'When repayment costs more than the value generated, the loan actually hurts the business financially.'),
        _q('Why build in a safety margin on profit projections?', ['Margins are unnecessary', 'Real-world results rarely match projections exactly', 'Safety margins guarantee failure', 'Projections are always perfectly accurate'], 1, 'A cushion protects you if actual results come in below your optimistic projection.'),
        _q('What is the risk of a loan that only "breaks even" on paper?', ['No risk at all', 'Real risk if actual results underperform the projection', 'Guaranteed extra profit regardless', 'It is the safest type of loan'], 1, 'A break-even projection leaves no cushion if reality falls short of expectations.'),
        _q('What two figures are essential to this loan payoff calculation?', ['Only the interest rate and fees', 'Expected extra profit and total repayment cost', 'Only the lender\'s name and address', 'The loan officer\'s personal opinion'], 1, 'These two figures together determine whether the loan genuinely creates value for the business.'),
        _q('What should you do before accepting any loan, according to this lesson?', ['Sign immediately without calculation', 'Run this simple profit-versus-repayment calculation first', 'Ignore the numbers and trust instinct', 'Ask a stranger for their opinion only'], 1, 'A deliberate calculation grounds the borrowing decision in real numbers rather than assumption.'),
        _q('What is the overall lesson here?', ['Loans should never be calculated, only felt out', 'A loan is worthwhile only when the value it creates clearly exceeds its full cost', 'All loans are equally good or bad', 'Interest rates are the only number that matters'], 1, 'The lesson provides a concrete, numbers-based method for evaluating any loan decision.'),
      ]),
    _lesson('c16', 5, 'Building Good Credit Habits Over Time', 5, [
      'Whether you borrow from formal lenders, cooperative societies, or informal networks, your repayment behavior builds (or damages) your reputation and future borrowing options. Paying on time, even when it\'s tight, protects access to better terms and larger amounts later — a track record is valuable capital in itself.',
      'If you ever find yourself unable to make a scheduled payment, communicate proactively with your lender rather than going silent. Lenders are often more flexible with a borrower who communicates honestly about a temporary problem than one who simply stops responding, which usually triggers the harshest collection response.',
    ], concepts: [KeyConcept('A Repayment Track Record Is Valuable Capital', 'Consistent, on-time repayment builds a reputation that unlocks better future borrowing terms.')],
      steps: ['If you have any active loans, review whether your payment history is fully on track.', 'Prepare a plan for proactively communicating with a lender if a payment is ever at risk.'],
      takeaways: ['On-time repayment builds a valuable track record for future borrowing.', 'Proactive communication with a lender during difficulty is far better than going silent.', 'Good credit habits open access to better terms and larger amounts over time.'],
      quiz: [
        _q('What does consistent on-time repayment build?', ['Nothing valuable', 'A track record that unlocks better future borrowing options', 'Higher interest rates automatically', 'No relationship with future lenders'], 1, 'A reliable repayment history is genuinely valuable capital for accessing better terms later.'),
        _q('What should you do if you\'re at risk of missing a scheduled payment?', ['Go silent and avoid the lender', 'Communicate proactively about the situation', 'Ignore the payment entirely', 'Immediately default without explanation'], 1, 'Proactive, honest communication is generally received far better than silence.'),
        _q('How do lenders typically respond to a borrower who communicates honestly about a problem?', ['With immediate harsh collection action', 'Often with more flexibility than for a silent borrower', 'They always refuse to help regardless', 'They report it as fraud automatically'], 1, 'Transparency tends to earn more understanding and flexibility from lenders facing a temporary issue.'),
        _q('What tends to trigger the harshest collection response?', ['Proactive communication about a delay', 'Going silent and unresponsive', 'Paying slightly early', 'Asking questions about loan terms'], 1, 'Silence often signals unwillingness to resolve the issue, prompting stronger collection measures.'),
        _q('What does this lesson call a "track record" being?', ['Worthless information', 'Valuable capital in itself', 'A legal requirement only', 'Irrelevant to future borrowing'], 1, 'Your repayment history functions as a genuine asset that opens future opportunities.'),
        _q('What kinds of lenders does this lesson apply to?', ['Only formal banks', 'Formal lenders, cooperative societies, and informal networks alike', 'Only informal networks', 'No lenders, this doesn\'t apply broadly'], 1, 'Good repayment habits matter across any type of lending relationship, not just formal institutions.'),
        _q('What is a benefit of a strong repayment reputation over time?', ['Worse future loan terms', 'Access to better terms and larger amounts later', 'No effect on future borrowing', 'Immediate loan forgiveness'], 1, 'A proven track record makes future lenders more willing to offer favorable terms and higher amounts.'),
        _q('What is the overall closing message of this course?', ['Borrowing has no lasting consequences', 'Responsible borrowing and communication build a valuable long-term financial reputation', 'Always go silent if payments become difficult', 'Credit habits don\'t matter once a loan is repaid'], 1, 'The course closes by connecting responsible borrowing behavior to long-term financial opportunity.'),
      ]),
  ],
);

final Course _course17 = Course(
  id: 'c17', title: 'Saving & Reinvesting Profit',
  description: 'The discipline of not spending all your revenue — building savings and reinvesting deliberately for growth.',
  category: 'Business Skills', difficulty: Difficulty.beginner,
  icon: Icons.savings_rounded, durationMinutes: 130, order: 17,
  lessons: [
    _lesson('c17', 1, 'Why Profit Disappears Without a Plan', 5, [
      'It\'s common for a business to generate real profit month after month, yet the owner has nothing to show for it — no savings, no reinvestment, no growth. This usually isn\'t because the business is unprofitable; it\'s because profit without a plan tends to get absorbed into daily spending, small purchases, and personal needs until nothing is left.',
      'Profit that isn\'t deliberately allocated somewhere — savings, reinvestment, planned withdrawal — defaults to being spent. This is a universal pattern, not a personal failing, which is why a simple system, not willpower alone, is what actually protects profit.',
    ], concepts: [KeyConcept('Unallocated Profit Gets Spent', 'Profit without a deliberate destination defaults to disappearing into daily spending — this is normal, not a personal failing.')],
      steps: ['Reflect: where did last month\'s profit actually go?', 'Decide on one simple rule for allocating profit before you spend any of it.'],
      takeaways: ['Real profit can disappear without a deliberate plan for where it goes.', 'Unallocated profit tends to default into daily spending.', 'A simple system, not willpower, is what protects profit long-term.'],
      quiz: [
        _q('Why might a profitable business owner have nothing to show for it?', ['The business is secretly unprofitable', 'Profit without a plan tends to get absorbed into daily spending', 'Profit always disappears due to theft', 'Profitable businesses never have this problem'], 1, 'Unallocated profit commonly gets spent gradually rather than saved or reinvested deliberately.'),
        _q('What happens to profit that isn\'t deliberately allocated?', ['It automatically saves itself', 'It defaults to being spent', 'It disappears from existence', 'It converts into loan repayment automatically'], 1, 'Without a clear destination, profit tends to get absorbed into everyday spending.'),
        _q('Is this pattern a personal failing or a universal tendency?', ['A rare personal failing', 'A universal pattern that affects most people', 'It only affects irresponsible people', 'It never happens to disciplined people'], 1, 'This is described as a common, near-universal pattern rather than a unique personal weakness.'),
        _q('What actually protects profit long-term, according to this lesson?', ['Pure willpower alone', 'A simple system for allocation', 'Ignoring the problem', 'Earning more profit only'], 1, 'A structured system removes reliance on willpower, which tends to fail under daily pressure.'),
        _q('What is a practical first step suggested in this lesson?', ['Ignoring where past profit went', 'Reflecting on where last month\'s profit actually went', 'Immediately taking out a loan', 'Stopping all business spending entirely'], 1, 'Honest reflection on past spending patterns is the starting point for building a better system.'),
        _q('What should guide profit allocation, according to this lesson?', ['Random spontaneous decisions', 'A deliberate rule set before spending any of it', 'Spending everything immediately', 'Waiting until year-end to decide'], 1, 'Deciding allocation rules in advance protects profit from disappearing into unplanned spending.'),
        _q('What is the core problem this lesson identifies?', ['Businesses are rarely profitable', 'Profit without a plan tends to vanish into daily spending', 'Savings accounts are unreliable', 'Reinvestment is always a bad idea'], 1, 'The lesson diagnoses the common gap between earning profit and actually retaining or growing it.'),
        _q('What is the overall purpose of this opening lesson?', ['To discourage earning profit', 'To explain why a deliberate plan is necessary to actually keep and grow profit', 'To suggest profit doesn\'t matter', 'To recommend spending all profit immediately'], 1, 'The lesson sets up the need for the systems covered in the rest of the course.'),
      ]),
    _lesson('c17', 2, 'The Pay-Yourself-First Principle', 5, [
      'A simple, effective system: as soon as profit is calculated (using the bookkeeping habit from earlier courses), immediately set aside a fixed percentage for savings and reinvestment before any of it becomes available for general spending — treat this allocation as non-negotiable, the same way a fixed expense would be treated.',
      'The exact percentage matters less than the consistency. Even 10-20% set aside immediately, every single time profit is realized, compounds into meaningful savings and reinvestment capital over months, in a way that "saving whatever is left over" almost never does.',
    ], concepts: [KeyConcept('Pay Yourself First, Not Last', 'Setting aside savings/reinvestment immediately, before spending, works far better than hoping something is left over at the end.')],
      steps: ['Decide on a fixed percentage of profit to set aside immediately going forward.', 'Set up a separate place (account, envelope, or app) to hold this allocation apart from spending money.'],
      takeaways: ['Set aside a fixed percentage of profit immediately, before any spending happens.', 'Consistency matters more than the exact percentage chosen.', 'A separate holding place for savings/reinvestment prevents accidental spending.'],
      quiz: [
        _q('What is the "pay-yourself-first" principle?', ['Spending everything before saving', 'Setting aside savings/reinvestment immediately before general spending', 'Waiting until year-end to save', 'Paying employees before yourself'], 1, 'This principle prioritizes savings and reinvestment ahead of discretionary spending, not after it.'),
        _q('What does this lesson say matters more than the exact percentage saved?', ['Nothing matters more', 'Consistency in applying it every time', 'The lender\'s opinion', 'Saving only in December'], 1, 'Regularly applying even a modest percentage consistently outperforms sporadic, larger, one-off savings attempts.'),
        _q('Why is "saving whatever is left over" often ineffective?', ['It always works perfectly', 'Because spending tends to expand to use up all available money first', 'Leftover savings are always larger', 'This approach guarantees more savings'], 1, 'Without a first-priority allocation, little or nothing is typically left over to save.'),
        _q('What is suggested to hold the saved/reinvestment allocation separately?', ['Nothing, keep it mixed with spending money', 'A separate account, envelope, or app', 'Cash under a mattress only', 'It should not be separated at all'], 1, 'Physical or digital separation reduces the temptation to accidentally spend the set-aside amount.'),
        _q('What earlier course habit does this system rely on?', ['None, it stands alone', 'The bookkeeping habit of calculating profit', 'Negotiation skills', 'Vendor account management'], 1, 'Knowing your actual profit, from earlier bookkeeping lessons, is necessary to apply this allocation system.'),
        _q('What percentage range is mentioned as an example?', ['80-90%', '10-20%', '1-2%', '100%'], 1, 'This example range shows a realistic, sustainable starting point for the practice.'),
        _q('What should this allocation be treated as?', ['An optional bonus', 'A non-negotiable fixed commitment, like a fixed expense', 'Something to skip during busy weeks', 'Irrelevant to daily operations'], 1, 'Treating the allocation as mandatory, not optional, is what makes the system actually work.'),
        _q('What is the overall goal of this lesson?', ['To discourage saving profit', 'To establish a simple, consistent system for setting aside profit before spending it', 'To recommend spending all profit immediately', 'To replace bookkeeping entirely'], 1, 'The lesson introduces a concrete, actionable system building directly on the previous lesson\'s diagnosis.'),
      ]),
    _lesson('c17', 3, 'Deciding Between Saving and Reinvesting', 5, [
      'Savings and reinvestment serve different purposes and shouldn\'t be treated as the same pool. Savings act as a safety net — accessible cash for emergencies or slow periods. Reinvestment actively grows the business — more stock, a new tool, expanded capacity — with the goal of increasing future profit.',
      'A reasonable starting split for your set-aside allocation might be roughly even between the two until you have a comfortable safety net (often discussed further in emergency fund planning), after which you might shift more of your allocation toward reinvestment since the safety-net need is already covered.',
    ], concepts: [KeyConcept('Two Different Purposes', 'Savings protects you from bad times; reinvestment actively grows the business — both matter but serve different needs.')],
      steps: ['Decide roughly how you\'ll split your set-aside allocation between savings and reinvestment for now.', 'Identify one specific reinvestment opportunity you\'d fund once you have the capital.'],
      takeaways: ['Savings and reinvestment serve different purposes and shouldn\'t be lumped together.', 'Savings is a safety net; reinvestment actively grows future earning capacity.', 'The split between the two can shift over time as your safety net becomes established.'],
      quiz: [
        _q('What is the purpose of savings, as described here?', ['To actively grow the business', 'To act as a safety net for emergencies or slow periods', 'To pay for personal luxuries', 'Savings have no clear purpose'], 1, 'Savings exist to protect the business during unexpected difficult periods.'),
        _q('What is the purpose of reinvestment?', ['To sit unused indefinitely', 'To actively grow the business and increase future profit', 'To cover personal emergencies only', 'To replace bookkeeping'], 1, 'Reinvestment is specifically about expanding capacity to earn more in the future.'),
        _q('Should savings and reinvestment be treated as the same pool of money?', ['Yes, they are identical', 'No, they serve different purposes and should be considered separately', 'Only reinvestment matters', 'Only savings matters'], 1, 'Distinguishing between the two purposes helps you allocate profit more intentionally.'),
        _q('What is a reasonable starting split suggested in this lesson?', ['100% to reinvestment only', 'Roughly even between savings and reinvestment initially', '100% to savings only', 'No split is needed'], 1, 'An even initial split balances building a safety net with beginning to grow the business.'),
        _q('When might you shift more allocation toward reinvestment?', ['Immediately, from day one', 'Once you have a comfortable safety net established', 'Never, savings should always dominate', 'Only if a competitor suggests it'], 1, 'Once the safety-net need is reasonably covered, shifting more toward growth makes sense.'),
        _q('What is an example of reinvestment mentioned in this lesson?', ['Personal vacation spending', 'More stock, a new tool, or expanded capacity', 'A one-time gift to a friend', 'Paying an unrelated old debt'], 1, 'These are direct examples of using capital to grow the business\'s earning capacity.'),
        _q('What happens if all profit set-aside goes only to spending, ignoring both savings and reinvestment?', ['The business grows fastest this way', 'The business has no safety net and no capacity to grow', 'Nothing negative happens', 'This is the recommended approach'], 1, 'Neglecting both savings and reinvestment leaves the business vulnerable and stagnant.'),
        _q('What is the overall message of this lesson?', ['Savings and reinvestment are the same thing', 'Deliberately split your allocation between safety-net savings and growth-focused reinvestment', 'Only save, never reinvest', 'Only reinvest, never save'], 1, 'The lesson helps you think clearly about balancing these two distinct but complementary priorities.'),
      ]),
    _lesson('c17', 4, 'Making Reinvestment Decisions Wisely', 5, [
      'Not every reinvestment opportunity is equally good. Before committing capital, ask: what specific increase in revenue or efficiency will this create, how long until it pays for itself, and what happens to the business if this particular bet doesn\'t work out as expected.',
      'Prioritize reinvestments with a clear, fast payback period and low risk before considering larger, slower, riskier bets. A second POS machine that pays for itself in weeks through captured queue-time sales is a safer reinvestment than an unrelated new venture with an unclear return timeline.',
    ], concepts: [KeyConcept('Payback Period and Risk First', 'Prioritize reinvestments with clear, fast, low-risk returns before larger and riskier bets.')],
      steps: ['For any reinvestment idea, estimate its payback period before committing.', 'Rank your current reinvestment ideas from lowest to highest risk.'],
      takeaways: ['Ask what specific return, payback period, and risk each reinvestment carries before committing.', 'Prioritize clear, fast, low-risk reinvestments first.', 'A fast payback period reduces the business\'s exposure if a bet doesn\'t work out.'],
      quiz: [
        _q('What should you ask before committing capital to a reinvestment opportunity?', ['Nothing, just proceed', 'What return it creates, its payback period, and what happens if it fails', 'Only whether it sounds exciting', 'Whether a competitor has done it'], 1, 'These questions ground the decision in real, evaluable expectations rather than excitement alone.'),
        _q('What should be prioritized before larger, riskier reinvestments?', ['Nothing should be prioritized', 'Clear, fast payback, low-risk opportunities', 'Only the biggest possible bets', 'Random selection'], 1, 'Starting with safer, faster-return investments builds capital and confidence before bigger risks.'),
        _q('What is an example of a low-risk, fast-payback reinvestment mentioned?', ['An unrelated new venture', 'A second POS machine paying for itself through captured queue-time sales', 'A personal luxury purchase', 'A long-term speculative investment'], 1, 'This example directly ties reinvestment to an existing, proven revenue stream with quick returns.'),
        _q('Why does payback period matter?', ['It has no relevance', 'A faster payback reduces the business\'s exposure if the bet doesn\'t work out', 'Slower payback is always better', 'Payback period only matters for loans'], 1, 'Shorter payback periods limit how long your capital is at risk before it starts returning value.'),
        _q('What should you consider about a reinvestment that doesn\'t work out as expected?', ['Nothing, failure is impossible', 'What happens to the business if this specific bet fails', 'Only the potential upside', 'Ignore this possibility entirely'], 1, 'Considering the downside scenario is part of responsible reinvestment decision-making.'),
        _q('What distinguishes a "safer" reinvestment from a "riskier" one in this lesson?', ['Safer ones have unclear returns', 'Safer ones have clear, fast payback with lower risk', 'Riskier ones are always better choices', 'There is no meaningful distinction'], 1, 'Clarity of return and speed of payback are key markers of a lower-risk reinvestment.'),
        _q('What is the overall approach recommended for reinvestment decisions?', ['Pure instinct with no analysis', 'A deliberate evaluation of return, payback, and risk before committing', 'Committing to every opportunity available', 'Avoiding reinvestment entirely'], 1, 'The lesson promotes thoughtful, criteria-based reinvestment decisions over impulsive ones.'),
        _q('What is the practical output of this lesson\'s approach?', ['Random capital allocation', 'A prioritized list of reinvestment ideas ranked by risk and payback', 'No changes to decision-making', 'Avoiding all business growth'], 1, 'Applying this framework produces a clearer, prioritized view of which reinvestments to pursue first.'),
      ]),
    _lesson('c17', 5, 'Reviewing and Adjusting Your System Over Time', 5, [
      'Your saving and reinvestment system shouldn\'t be set once and forgotten. Review it periodically — every few months — to check whether your percentage allocation still makes sense given how the business has grown, whether your safety net has reached a comfortable level, and whether past reinvestments actually delivered the returns you expected.',
      'Learning from past reinvestment outcomes — which ones paid off as planned, which underperformed — sharpens your judgment for future decisions. Treat this as an ongoing skill you\'re building, not a one-time formula you apply and forget.',
    ], concepts: [KeyConcept('Review, Learn, Adjust', 'Periodically reviewing past reinvestment outcomes sharpens future decision-making — this is a skill built over time, not a fixed formula.')],
      steps: ['Set a recurring reminder to review your saving/reinvestment system every few months.', 'Look back at your last reinvestment decision and honestly assess whether it delivered as expected.'],
      takeaways: ['Review your saving/reinvestment system periodically, not just once.', 'Check whether your safety net level and allocation percentages still make sense as the business grows.', 'Learning from past reinvestment outcomes sharpens future judgment.'],
      quiz: [
        _q('Should your saving/reinvestment system be set once and forgotten?', ['Yes, it never needs review', 'No, it should be reviewed periodically', 'Only review it once a decade', 'Systems never need adjustment'], 1, 'Regular review ensures the system stays relevant as your business circumstances change.'),
        _q('What should a periodic review check?', ['Nothing specific', 'Whether allocation percentages, safety net level, and past reinvestment returns still make sense', 'Only your competitor\'s system', 'The weather forecast'], 1, 'These checkpoints ensure your system evolves appropriately with your business\'s real situation.'),
        _q('What can you learn from past reinvestment outcomes?', ['Nothing useful', 'Which types of reinvestments paid off and which underperformed', 'Only how to avoid all reinvestment', 'Your competitor\'s exact strategy'], 1, 'Reviewing outcomes sharpens your judgment for evaluating future reinvestment opportunities.'),
        _q('How is this system best described, according to the lesson?', ['A fixed, unchanging formula', 'An ongoing skill built over time through review and adjustment', 'A one-time decision with no follow-up', 'Something to ignore once established'], 1, 'The lesson frames financial discipline as a developing skill rather than a static, set-once rule.'),
        _q('How often is review suggested?', ['Every few months', 'Once every ten years', 'Never', 'Only when the business fails'], 1, 'A regular few-month cadence keeps the system responsive without being burdensome.'),
        _q('What might prompt an adjustment to your allocation percentage?', ['Nothing should ever change it', 'Business growth or a newly established comfortable safety net', 'Random preference with no basis', 'Government mandate only'], 1, 'Changing circumstances, like reaching a safety net goal, are natural triggers for adjusting your approach.'),
        _q('What is the value of honestly assessing a past reinvestment decision?', ['No value at all', 'It builds better judgment for future decisions', 'It guarantees future success regardless', 'It should be avoided to prevent discouragement'], 1, 'Honest reflection, whether the outcome was good or disappointing, improves future decision-making.'),
        _q('What is the overall closing message of this course?', ['Set your system once and never revisit it', 'Building saving and reinvestment discipline is an ongoing, reviewable skill, not a fixed formula', 'Reinvestment decisions should never be reviewed', 'Profit allocation has no long-term impact'], 1, 'The course closes by framing financial discipline as a skill that improves through ongoing practice and review.'),
      ]),
  ],
);

final Course _course18 = Course(
  id: 'c18', title: 'Negotiation Skills for Vendors & Suppliers',
  description: 'Getting better rates and terms from vendors and suppliers without damaging important business relationships.',
  category: 'Business Skills', difficulty: Difficulty.intermediate,
  icon: Icons.handshake_rounded, durationMinutes: 130, order: 18,
  lessons: [
    _lesson('c18', 1, 'Why Negotiation Matters for Small Businesses', 5, [
      'Every percentage point saved on what you pay suppliers or vendors goes straight to your bottom line, often more reliably than trying to find new customers. Yet many small business owners accept the first quoted price out of politeness or fear of seeming difficult, leaving real money on the table repeatedly.',
      'Negotiation isn\'t about being aggressive or difficult — it\'s a normal, expected part of business relationships. Most vendors expect some negotiation and build room for it into their initial quotes; not negotiating at all often just means paying their maximum price for no reason.',
    ], concepts: [KeyConcept('Savings Go Straight to Profit', 'A percentage saved on costs is often easier to achieve than the equivalent increase in sales, and it drops straight to your margin.')],
      steps: ['Identify one recurring cost (vendor rate, rent, supply cost) you\'ve never actually negotiated.', 'Reflect on what has stopped you from negotiating in the past.'],
      takeaways: ['Savings from negotiation go directly to your profit margin.', 'Most vendors expect and build room for negotiation into their initial quotes.', 'Not negotiating at all often just means paying unnecessarily high prices.'],
      quiz: [
        _q('Why do savings from negotiation matter so much to profit?', ['They have no effect on profit', 'They go straight to the bottom line, often more reliably than new sales', 'They only matter for large businesses', 'Savings reduce profit'], 1, 'Cost reductions directly increase margin without needing to find and convert new customers.'),
        _q('Why do many small business owners avoid negotiating?', ['They always negotiate successfully', 'Politeness or fear of seeming difficult', 'Negotiation is illegal', 'Vendors refuse all negotiation attempts'], 1, 'Social discomfort is a common, avoidable barrier that costs real money over time.'),
        _q('Is negotiation inherently aggressive or difficult?', ['Yes, always', 'No, it\'s a normal, expected part of business relationships', 'Negotiation is rude by definition', 'Only large companies can negotiate'], 1, 'Most vendor relationships expect and accommodate reasonable negotiation as standard practice.'),
        _q('What do many vendors build into their initial quotes?', ['No room for negotiation ever', 'Room for negotiation', 'Only the lowest possible price', 'Random pricing with no logic'], 1, 'Initial quotes often have built-in flexibility, expecting the buyer to negotiate.'),
        _q('What happens if you never negotiate at all?', ['You automatically get the best price', 'You often just pay the vendor\'s maximum price unnecessarily', 'Vendors lower prices automatically', 'Nothing changes either way'], 1, 'Skipping negotiation entirely usually means leaving savings on the table that were available.'),
        _q('What is a practical first step suggested in this lesson?', ['Avoiding all vendor conversations', 'Identifying a recurring cost you\'ve never negotiated', 'Switching vendors immediately without discussion', 'Ignoring costs entirely'], 1, 'Starting with a specific, real cost gives you a concrete opportunity to practice negotiation.'),
        _q('What is the relationship between negotiation and business relationships?', ['Negotiation always damages relationships', 'Reasonable negotiation is a normal, expected part of healthy business relationships', 'Negotiation is only for strangers', 'Vendors dislike any negotiation attempt'], 1, 'Done respectfully, negotiation is a standard, accepted part of ongoing vendor relationships.'),
        _q('What is the overall message of this opening lesson?', ['Avoid negotiating to keep peace', 'Negotiation is a normal, valuable skill that directly protects your profit margin', 'Negotiation only works for large businesses', 'Vendors always refuse negotiation attempts'], 1, 'The lesson establishes why developing negotiation skill is worth the small business owner\'s time and effort.'),
      ]),
    _lesson('c18', 2, 'Preparing Before You Negotiate', 5, [
      'Walking into a negotiation unprepared is the most common reason it goes poorly. Before any conversation, know your numbers: what you currently pay, what you believe a fair market rate is (from research or comparison), and your walk-away point — the price above which the deal simply isn\'t worth it to you.',
      'Also understand what matters to the other side, not just yourself. A vendor may value consistent, reliable order volume over a slightly higher per-unit price — knowing this lets you offer something they value (a longer commitment, predictable ordering) in exchange for a better rate, rather than just pushing on price alone.',
    ], concepts: [KeyConcept('Know Your Numbers and Their Priorities', 'Walk in knowing your fair-price research and walk-away point, and understanding what the other side actually values.')],
      steps: ['Research what a fair market rate looks like for your next negotiation.', 'Identify your walk-away point before entering the conversation.'],
      takeaways: ['Unpreparedness is the most common reason negotiations go poorly.', 'Know your current cost, fair market rate, and walk-away point before negotiating.', 'Understand what the other side values, not just what you want.'],
      quiz: [
        _q('What is the most common reason negotiations go poorly, per this lesson?', ['Being too polite', 'Walking in unprepared', 'Negotiating too often', 'Vendors being unreasonable'], 1, 'Lack of preparation undermines your position before the conversation even starts.'),
        _q('What should you know about your current situation before negotiating?', ['Nothing specific', 'What you currently pay and what a fair market rate looks like', 'Only the vendor\'s name', 'The vendor\'s personal life'], 1, 'These baseline facts give you a concrete, informed starting position.'),
        _q('What is a "walk-away point"?', ['The vendor\'s office exit', 'The price above which the deal isn\'t worth it to you', 'A type of discount', 'The negotiation\'s starting offer'], 1, 'Knowing this threshold in advance protects you from accepting a genuinely bad deal under pressure.'),
        _q('Why is it useful to understand what the other side values?', ['It isn\'t useful', 'It lets you offer something they value in exchange for a better deal', 'The other side\'s priorities never matter', 'Understanding them makes negotiation harder'], 1, 'Trading on their priorities (like order consistency) can unlock value beyond a simple price argument.'),
        _q('What might a vendor value more than a slightly higher per-unit price?', ['Nothing else matters to vendors', 'Consistent, reliable order volume', 'Random, unpredictable orders', 'Complicated payment terms'], 1, 'Predictability is often genuinely valuable to a vendor, creating room to trade for better pricing.'),
        _q('What can you offer in exchange for a better rate, besides pushing on price?', ['Nothing else is possible', 'A longer commitment or predictable ordering pattern', 'Threats or aggression', 'Nothing, price is the only lever'], 1, 'Offering something the vendor values creates a win-win basis for a better deal.'),
        _q('What research is suggested before negotiating?', ['None is needed', 'What a fair market rate looks like for the item or service', 'Only your own opinion', 'The vendor\'s personal finances'], 1, 'Market rate research grounds your negotiating position in realistic, defensible numbers.'),
        _q('What is the overall focus of this lesson?', ['Negotiating without any preparation', 'Thorough preparation, including numbers and understanding the other side\'s priorities', 'Avoiding negotiation altogether', 'Only focusing on your own needs'], 1, 'The lesson emphasizes preparation as the foundation of an effective negotiation.'),
      ]),
    _lesson('c18', 3, 'Negotiating Tactics That Actually Work', 5, [
      'Effective negotiation tactics for small business owners are usually simple and respectful: ask directly for a better rate (many people simply never ask), reference comparable rates you\'ve found elsewhere, propose a specific trade (volume commitment for a discount), and be willing to sit in silence after making an offer rather than nervously filling it.',
      'Avoid tactics that damage trust for short-term gain — exaggerating competing offers that don\'t exist, or being needlessly aggressive, can win a single negotiation but cost you the relationship long-term, which matters more for an ongoing vendor you\'ll work with repeatedly.',
    ], concepts: [KeyConcept('Simple, Respectful Tactics Work Best', 'Asking directly, referencing comparisons, and proposing specific trades outperform aggression for ongoing vendor relationships.')],
      steps: ['Practice directly asking for a specific better rate before your next vendor conversation.', 'Prepare one specific trade you could propose (e.g. volume commitment for a discount).'],
      takeaways: ['Simply asking directly for a better rate is an underused, effective tactic.', 'Reference comparable rates and propose specific trades rather than vague requests.', 'Avoid dishonest or aggressive tactics that damage long-term vendor relationships.'],
      quiz: [
        _q('What is an underused but effective negotiation tactic?', ['Never asking directly', 'Simply asking directly for a better rate', 'Threatening the vendor', 'Avoiding all conversation'], 1, 'Many people simply never ask, missing out on savings that were available with a direct request.'),
        _q('What can referencing comparable rates accomplish?', ['Nothing useful', 'It grounds your request in a realistic, defensible comparison', 'It always offends the vendor', 'It has no effect on negotiations'], 1, 'Concrete comparisons give your request credibility and context.'),
        _q('What is an example of a specific trade you might propose?', ['Nothing specific', 'A volume commitment in exchange for a discount', 'Threatening to never return', 'Refusing to explain your request'], 1, 'Offering something concrete the vendor values makes the trade mutually beneficial.'),
        _q('What should you do after making an offer, according to this lesson?', ['Immediately fill the silence nervously', 'Be willing to sit in silence and let them respond', 'Withdraw the offer immediately', 'Apologize for making the offer'], 1, 'Comfortable silence after an offer gives the other side space to genuinely consider and respond.'),
        _q('What tactic is discouraged due to damaging long-term trust?', ['Direct, honest requests', 'Exaggerating competing offers that don\'t exist', 'Proposing fair trades', 'Referencing real market comparisons'], 1, 'Dishonest tactics may win short-term but risk damaging an ongoing, valuable vendor relationship.'),
        _q('Why does long-term relationship matter more than winning a single negotiation?', ['It doesn\'t matter at all', 'You likely work with this vendor repeatedly over time', 'Single negotiations are always more important', 'Relationships have no bearing on business'], 1, 'For an ongoing supplier relationship, preserving trust matters more than any single negotiated win.'),
        _q('What kind of tactics are recommended overall in this lesson?', ['Aggressive and dishonest tactics', 'Simple, direct, and respectful tactics', 'No tactics at all, just accept quotes', 'Manipulative tactics only'], 1, 'The lesson favors straightforward, honest approaches over aggression or deception.'),
        _q('What is the overall goal of this lesson?', ['To avoid using any negotiation tactics', 'To teach simple, effective, trust-preserving negotiation tactics', 'To recommend dishonesty for better deals', 'To discourage all vendor relationships'], 1, 'The lesson equips you with practical tactics that work without damaging valuable business relationships.'),
      ]),
    _lesson('c18', 4, 'Negotiating Without Damaging the Relationship', 5, [
      'For vendors and suppliers you\'ll work with repeatedly, how you negotiate matters as much as what you negotiate for. Stay respectful and professional even when pushing firmly for a better deal — frame requests collaboratively ("how can we make this work for both of us") rather than as a demand or an ultimatum.',
      'If a vendor genuinely can\'t offer what you\'re asking for, accept a reasonable "no" gracefully rather than souring the relationship over it. There will be future opportunities to negotiate again, and a vendor who remembers you as reasonable and respectful is more likely to work with you when it matters most.',
    ], concepts: [KeyConcept('Collaborative Framing Preserves Relationships', 'Framing requests as "how can we make this work" rather than a demand keeps the relationship healthy regardless of outcome.')],
      steps: ['Practice reframing a negotiation request into collaborative language before your next conversation.', 'Decide in advance how you\'ll respond gracefully if the vendor says no.'],
      takeaways: ['How you negotiate matters as much as what you\'re negotiating for, in ongoing relationships.', 'Frame requests collaboratively rather than as demands.', 'Accept a reasonable "no" gracefully to preserve the relationship for future opportunities.'],
      quiz: [
        _q('What matters as much as what you\'re negotiating for, in ongoing vendor relationships?', ['Nothing else matters', 'How you negotiate', 'The vendor\'s mood that day', 'The time of day you negotiate'], 1, 'Approach and tone significantly affect the health of a relationship you\'ll rely on repeatedly.'),
        _q('What kind of framing is recommended for requests?', ['A demand or ultimatum', 'Collaborative framing, like "how can we make this work for both of us"', 'An aggressive threat', 'No framing at all, just silence'], 1, 'Collaborative language invites cooperation rather than triggering defensiveness.'),
        _q('What should you do if a vendor genuinely can\'t meet your request?', ['Sour the relationship over it', 'Accept a reasonable "no" gracefully', 'Immediately end all business with them', 'Demand an explanation aggressively'], 1, 'Graceful acceptance preserves the relationship for future opportunities to negotiate again.'),
        _q('Why does preserving the relationship matter even after a "no"?', ['It doesn\'t matter at all', 'There will be future opportunities to negotiate again', 'Vendors never remember past interactions', 'Only the current negotiation matters'], 1, 'Ongoing vendor relationships offer repeated chances to negotiate, which a damaged relationship jeopardizes.'),
        _q('What is a likely benefit of being remembered as reasonable and respectful?', ['No benefit at all', 'The vendor is more likely to work with you favorably in the future', 'Vendors prefer difficult customers', 'It guarantees every future request is granted'], 1, 'A positive reputation with a vendor tends to pay off in future interactions and flexibility.'),
        _q('What tone is recommended even while pushing firmly for a better deal?', ['Hostile and demanding', 'Respectful and professional', 'Dismissive and cold', 'Silent and unresponsive'], 1, 'Firmness and respect aren\'t mutually exclusive — you can push for a good deal while staying professional.'),
        _q('What is an example of a non-collaborative, discouraged framing?', ['"How can we make this work for both of us?"', 'An ultimatum or demand', 'A polite direct question', 'A respectful comparison of rates'], 1, 'Ultimatums tend to create adversarial dynamics rather than cooperative problem-solving.'),
        _q('What is the overall closing message of this course?', ['Win every negotiation at any relationship cost', 'Negotiate firmly but respectfully, preserving relationships that matter for the long term', 'Avoid negotiating with vendors you\'ll see again', 'Accepting "no" is always a failure'], 1, 'The course closes by balancing negotiation effectiveness with the importance of lasting business relationships.'),
      ]),
    _lesson('c18', 5, 'Practicing Negotiation as an Ongoing Skill', 5, [
      'Negotiation improves with practice, like any other business skill. Start with lower-stakes conversations — a small supplier, a minor service fee — to build comfort and confidence before tackling your most important vendor relationships. Each conversation, successful or not, teaches you something for the next one.',
      'Keep a simple record of what you negotiated, what worked, and what didn\'t, similar to your other business tracking habits. Over time, this personal record becomes a valuable reference for your own negotiation style and what tends to work with different types of vendors.',
    ], concepts: [KeyConcept('Practice on Low-Stakes Conversations First', 'Build negotiation comfort and confidence on smaller conversations before tackling your most important vendor relationships.')],
      steps: ['Identify one low-stakes negotiation opportunity to practice on soon.', 'Start a simple log of what you negotiate, what worked, and what didn\'t.'],
      takeaways: ['Negotiation is a skill that improves with practice, like any other.', 'Start with lower-stakes conversations to build confidence.', 'Track what worked and what didn\'t to sharpen your approach over time.'],
      quiz: [
        _q('Is negotiation a fixed talent or a skill that improves with practice?', ['A fixed talent only some people have', 'A skill that improves with practice', 'It cannot be improved at all', 'Only formal training improves it'], 1, 'Like other business skills, negotiation ability develops through repeated, deliberate practice.'),
        _q('What is recommended as a starting point for practice?', ['Your most important vendor relationship first', 'Lower-stakes conversations, like a small supplier or minor fee', 'Avoiding practice entirely', 'Only negotiating once per year'], 1, 'Lower-stakes practice builds comfort and confidence before higher-stakes negotiations.'),
        _q('What can every negotiation conversation teach you?', ['Nothing, only successful ones teach anything', 'Something useful for the next one, whether successful or not', 'Only failures are worth learning from', 'Negotiation offers no learning value'], 1, 'Both successful and unsuccessful negotiations offer useful lessons for future conversations.'),
        _q('What is suggested to track over time?', ['Nothing, memory is sufficient', 'What you negotiated, what worked, and what didn\'t', 'Only the vendor\'s personal details', 'Your competitor\'s negotiation history'], 1, 'A simple record builds a valuable personal reference for improving your negotiation approach.'),
        _q('What does this negotiation log become useful for over time?', ['Nothing useful', 'A valuable reference for your own style and what works with different vendors', 'Legal documentation only', 'Tax filing purposes'], 1, 'Reviewing past negotiation outcomes sharpens your judgment and approach for future conversations.'),
        _q('How is negotiation described in relation to other business skills?', ['Completely unrelated to other skills', 'Similar — it improves with practice like other business skills', 'Impossible to develop', 'Only relevant to large corporations'], 1, 'The lesson frames negotiation as a learnable, practicable skill just like bookkeeping or customer service.'),
        _q('What is the benefit of practicing on smaller, lower-stakes negotiations first?', ['No benefit', 'Building comfort and confidence before higher-stakes conversations', 'It wastes valuable time', 'It guarantees failure later'], 1, 'Building skill gradually on smaller stakes reduces risk while you develop confidence.'),
        _q('What is the overall closing message of this course?', ['Negotiation should be avoided entirely', 'Negotiation is a practicable, trackable skill worth developing deliberately over time', 'Only naturally gifted people can negotiate well', 'Tracking negotiation outcomes is unnecessary'], 1, 'The course closes by framing negotiation as an ongoing, improvable skill rather than a one-time event.'),
      ]),
  ],
);

final Course _course19 = Course(
  id: 'c19', title: 'Handling Difficult Customers',
  description: 'De-escalation, refunds, and disputes — keeping a difficult moment from costing you a customer or your reputation.',
  category: 'Business Skills', difficulty: Difficulty.beginner,
  icon: Icons.support_agent_rounded, durationMinutes: 130, order: 19,
  lessons: [
    _lesson('c19', 1, 'Why Difficult Moments Are Inevitable', 5, [
      'No matter how well you run your business, difficult customer moments will happen — a failed transaction, a misunderstanding about price, a genuinely frustrated person having a bad day. Expecting these moments, rather than being caught off guard by them, is what lets you respond calmly instead of defensively.',
      'How you handle a difficult moment often matters more to your reputation than the fact that something went wrong in the first place. A customer treated well during a problem often becomes more loyal than one who never experienced an issue at all — the recovery is what they remember.',
    ], concepts: [KeyConcept('Recovery Matters More Than the Problem', 'How you handle a difficult moment often shapes a customer\'s loyalty more than the original problem itself.')],
      steps: ['Recall a recent difficult customer moment and reflect honestly on how you handled it.', 'Mentally prepare for the fact that these moments are a normal, expected part of business.'],
      takeaways: ['Difficult customer moments are inevitable, not a sign you\'re doing something wrong.', 'Expecting these moments helps you respond calmly rather than defensively.', 'How you handle a problem often matters more to loyalty than the problem itself.'],
      quiz: [
        _q('Are difficult customer moments avoidable with a well-run business?', ['Yes, completely avoidable', 'No, they are inevitable even in well-run businesses', 'Only poorly run businesses have this problem', 'Difficult moments only happen rarely'], 1, 'Even the best-run businesses experience difficult moments — they are a normal part of serving customers.'),
        _q('What helps you respond calmly rather than defensively?', ['Being caught off guard', 'Expecting these moments in advance', 'Avoiding all customer interaction', 'Ignoring the possibility entirely'], 1, 'Anticipating that difficult moments will happen prepares you to handle them more composedly.'),
        _q('What often matters more than the original problem itself?', ['Nothing matters more', 'How you handle the difficult moment', 'The exact cause of the problem', 'Whether the customer is always right'], 1, 'Recovery and handling often shape customer perception and loyalty more than the initial issue.'),
        _q('What can happen to a customer treated well during a problem?', ['They become less loyal', 'They can become more loyal than a customer with no issues at all', 'They always leave regardless', 'Nothing changes about their loyalty'], 1, 'Good handling of a problem can actually deepen trust and loyalty beyond a trouble-free experience.'),
        _q('What is an example of a difficult moment mentioned?', ['A perfectly smooth transaction', 'A failed transaction or misunderstanding about price', 'A customer leaving a positive review', 'An empty stand with no customers'], 1, 'These are common, realistic examples of the kinds of friction that naturally arise in business.'),
        _q('What mindset shift does this lesson recommend?', ['Viewing difficult moments as personal failures', 'Viewing them as a normal, expected part of business', 'Avoiding customers to prevent problems', 'Blaming customers for all issues'], 1, 'Reframing difficult moments as normal and expected reduces defensiveness and improves your response.'),
        _q('What do customers tend to remember most about a problem?', ['Nothing at all', 'The recovery — how the problem was handled', 'Only that a problem occurred', 'The exact time the problem happened'], 1, 'The way an issue was resolved often leaves a stronger, more lasting impression than the issue itself.'),
        _q('What is the overall message of this opening lesson?', ['Difficult moments should be avoided at all costs', 'Expecting and handling difficult moments well protects your reputation and builds loyalty', 'Difficult customers should be ignored', 'Problems always damage a business permanently'], 1, 'The lesson reframes difficult moments as manageable, expected events rather than crises to fear.'),
      ]),
    _lesson('c19', 2, 'Staying Calm and Listening First', 5, [
      'When a customer is upset, the instinct to immediately explain, defend, or correct them often makes things worse. The first move that actually helps is listening fully — letting them explain the full problem without interruption, even if you already sense what happened.',
      'This isn\'t just politeness; a customer who feels heard often calms down significantly before you\'ve even offered a solution, simply because their frustration was acknowledged rather than dismissed or talked over. Listening first makes every subsequent step of resolving the issue easier.',
    ], concepts: [KeyConcept('Listening Calms Before Solving Does', 'A customer who feels heard often calms down before you\'ve even proposed a solution — listening itself is the first step of resolution.')],
      steps: ['Practice letting a customer finish speaking fully before responding, even when you think you already understand.', 'Notice how acknowledging frustration verbally ("I understand this is frustrating") affects the conversation.'],
      takeaways: ['Immediately explaining or defending often makes an upset customer more frustrated.', 'Listening fully, without interruption, is the first effective step in de-escalation.', 'A customer who feels heard often calms down before any solution is even offered.'],
      quiz: [
        _q('What often makes an upset customer situation worse?', ['Listening fully first', 'Immediately explaining, defending, or correcting them', 'Acknowledging their frustration', 'Staying calm'], 1, 'Jumping straight to defense or correction can feel dismissive and escalate frustration.'),
        _q('What is the recommended first move when a customer is upset?', ['Interrupting to correct them quickly', 'Listening fully without interruption', 'Walking away from the conversation', 'Arguing your side immediately'], 1, 'Full, uninterrupted listening is the foundational first step in de-escalating a difficult moment.'),
        _q('Why does listening matter beyond simple politeness?', ['It has no real effect', 'A customer who feels heard often calms down before a solution is even offered', 'It only wastes time', 'Listening always makes customers angrier'], 1, 'Feeling heard directly reduces frustration, independent of whatever solution comes next.'),
        _q('What should you do even if you already sense what happened?', ['Interrupt immediately to save time', 'Still let the customer explain the full problem', 'Correct them right away', 'Assume you already know everything relevant'], 1, 'Letting them fully explain shows respect and often surfaces details you hadn\'t considered.'),
        _q('What effect does acknowledging frustration verbally have?', ['It has no effect on the conversation', 'It can help calm the customer and improve the conversation', 'It always makes things worse', 'Acknowledgment is unnecessary'], 1, 'Simple verbal acknowledgment of frustration is a small but powerful de-escalation tool.'),
        _q('What does listening first make easier?', ['Nothing, it has no benefit', 'Every subsequent step of resolving the issue', 'Only the paperwork involved', 'It makes resolution harder'], 1, 'A calmer starting point, achieved through listening, smooths the path to actually resolving the problem.'),
        _q('What is a practical exercise suggested in this lesson?', ['Interrupting customers more often', 'Practicing letting a customer finish speaking fully before responding', 'Avoiding all customer conversations', 'Ignoring customer frustration entirely'], 1, 'Deliberately practicing full listening builds the habit needed for real difficult moments.'),
        _q('What is the overall focus of this lesson?', ['Solving problems as fast as possible without listening', 'The importance of listening fully as the first step in de-escalation', 'Avoiding difficult customers entirely', 'Defending your position immediately'], 1, 'The lesson establishes listening as the essential first skill in handling difficult customer moments.'),
      ]),
    _lesson('c19', 3, 'Resolving the Actual Problem Fairly', 5, [
      'After listening, move to actually resolving the issue — this means being honest about what happened, offering a fair solution (a correction, a refund, a redo of a failed transaction), and being clear about what you can and cannot do, rather than making vague promises you can\'t keep.',
      'Fair doesn\'t always mean giving the customer everything they ask for. Sometimes the fair resolution is explaining clearly why something isn\'t possible (a reversal genuinely outside your control) while still treating the customer respectfully throughout — fairness and full concession aren\'t the same thing.',
    ], concepts: [KeyConcept('Fair, Not Always Full Concession', 'A fair resolution is honest and respectful — it doesn\'t always mean giving the customer everything they initially ask for.')],
      steps: ['Write out your personal policy for common issues (failed transaction, wrong amount, delay) so you have consistent, fair responses ready.', 'Practice explaining a "no" clearly and respectfully without being defensive.'],
      takeaways: ['Be honest about what happened and clear about what you can and cannot do.', 'A fair resolution isn\'t always full concession to what the customer initially asks for.', 'Consistent, prepared responses to common issues help you resolve problems fairly and confidently.'],
      quiz: [
        _q('What should follow after fully listening to a customer\'s complaint?', ['Nothing further is needed', 'Actually resolving the issue honestly and fairly', 'Ending the conversation immediately', 'Ignoring the complaint entirely'], 1, 'Listening is the first step; genuine resolution is what actually addresses the customer\'s problem.'),
        _q('What should you be clear about during resolution?', ['Nothing needs clarity', 'What you can and cannot do', 'Only vague promises', 'Your personal opinions about the customer'], 1, 'Clarity about real possibilities avoids making promises you can\'t keep, which damages trust further.'),
        _q('Does "fair" always mean giving the customer everything they ask for?', ['Yes, always give full concession', 'No, fairness can include honestly explaining limits', 'Fairness is irrelevant to resolution', 'Customers are always entitled to everything requested'], 1, 'Fair resolution means honesty and respect, not automatic agreement to every demand.'),
        _q('What is an example of a fair resolution that isn\'t full concession?', ['Ignoring the customer\'s complaint', 'Clearly explaining why a reversal is genuinely outside your control', 'Promising something you can\'t deliver', 'Refusing to discuss the issue at all'], 1, 'An honest, respectful explanation of genuine limits is itself a fair way to handle the situation.'),
        _q('Why is it important to avoid vague promises?', ['Vague promises always work well', 'Unkept promises damage trust further', 'Promises have no effect on trust', 'Customers prefer vague answers'], 1, 'Overpromising and then failing to deliver compounds the original problem with a new trust issue.'),
        _q('What is suggested to prepare in advance?', ['Nothing, handle each issue randomly', 'A personal policy for common issues, for consistent and fair responses', 'Only vague general statements', 'Avoiding all policies entirely'], 1, 'Having thought-through responses ready helps you resolve common issues confidently and consistently.'),
        _q('What should you practice regarding saying "no"?', ['Avoiding ever saying no', 'Explaining a "no" clearly and respectfully without being defensive', 'Being defensive and dismissive when saying no', 'Saying no without any explanation'], 1, 'A respectful, clear "no" is sometimes the genuinely fair resolution, delivered without defensiveness.'),
        _q('What is the overall goal of this lesson?', ['Always agreeing with the customer regardless of facts', 'Resolving issues honestly and fairly, which doesn\'t always mean full concession', 'Avoiding resolution entirely', 'Making vague promises to end conversations quickly'], 1, 'The lesson teaches honest, fair, and consistent resolution as the core skill following good listening.'),
      ]),
    _lesson('c19', 4, 'Handling Refunds and Disputes Specifically', 5, [
      'Refund and dispute situations need extra care because real money is involved. Have a clear personal policy in advance — what qualifies for a refund, what doesn\'t, and how you verify a claim (checking your transaction log from earlier lessons) before agreeing to anything.',
      'Verify before you concede. A customer claiming a transaction failed when your log shows it succeeded deserves a calm, evidence-based conversation, not an automatic refund out of a desire to avoid conflict — giving in to unverified claims trains customers (and yourself) that disputing works regardless of the facts.',
    ], concepts: [KeyConcept('Verify Before You Concede', 'Check your own records before agreeing to a refund or dispute claim — giving in without verification undermines your business over time.')],
      steps: ['Write a clear personal refund policy: what qualifies, what doesn\'t, and how you verify claims.', 'Practice referencing your transaction log calmly during a hypothetical dispute conversation.'],
      takeaways: ['Refund and dispute situations need a clear, prepared personal policy.', 'Always verify a claim against your own records before conceding.', 'Automatic concession without verification can train customers that disputing works regardless of facts.'],
      quiz: [
        _q('Why do refund and dispute situations need extra care?', ['They don\'t need any special care', 'Real money is directly involved', 'They are always simple to resolve', 'Customers never dispute refunds'], 1, 'The direct financial stakes make careful, consistent handling especially important here.'),
        _q('What should you have in advance for refund situations?', ['Nothing prepared', 'A clear personal policy on what qualifies and how you verify claims', 'Only vague intentions', 'A policy of always refusing refunds'], 1, 'Advance preparation ensures consistent, fair, and confident handling when a real situation arises.'),
        _q('What should you do before agreeing to a refund claim?', ['Agree immediately to avoid conflict', 'Verify the claim against your own transaction records', 'Ignore the claim entirely', 'Assume the customer is always mistaken'], 1, 'Checking your own log first grounds the decision in facts rather than pressure or assumption.'),
        _q('What risk comes from giving unverified refunds to avoid conflict?', ['No risk at all', 'It can train customers that disputing works regardless of facts', 'It always improves customer loyalty', 'It has no long-term effect'], 1, 'Conceding without verification can invite more unfounded claims over time.'),
        _q('What tool from earlier lessons helps with verification here?', ['Nothing from earlier lessons applies', 'Your transaction log', 'A vendor discount', 'A loan agreement'], 1, 'The daily transaction logging habit from earlier lessons directly supports fair, evidence-based dispute resolution.'),
        _q('How should a discrepancy between a customer\'s claim and your records be handled?', ['With an automatic refund regardless', 'With a calm, evidence-based conversation', 'By ignoring the customer', 'By accusing the customer of lying immediately'], 1, 'A calm, fact-based conversation respects the customer while protecting your business from unfounded claims.'),
        _q('What does a clear refund policy help you do?', ['Nothing useful', 'Handle refund requests consistently and confidently', 'Avoid all refund requests entirely', 'Randomly decide each case'], 1, 'Consistency from a prepared policy makes handling each individual case easier and fairer.'),
        _q('What is the overall lesson here?', ['Always refund immediately to avoid conflict', 'Handle refunds and disputes with a clear policy and verification against your own records', 'Refuse all refund requests automatically', 'Avoid keeping any transaction records'], 1, 'The lesson provides a structured, fact-based approach to the highest-stakes customer service situations.'),
      ]),
    _lesson('c19', 5, 'Turning Difficult Moments Into Loyalty', 5, [
      'The best outcome of a well-handled difficult moment is a customer who trusts you more, not less. Follow up after resolving a significant issue — a simple check-in to confirm they\'re satisfied — shows genuine care beyond just closing the immediate problem.',
      'Reflect on recurring difficult moments over time. If the same type of complaint keeps coming up, it may point to a real operational issue worth fixing (unclear pricing, a confusing process) rather than something to keep resolving one customer at a time indefinitely.',
    ], concepts: [KeyConcept('Recurring Complaints Are Data', 'The same complaint happening repeatedly often points to a fixable operational issue, not just isolated bad luck.')],
      steps: ['After your next significant issue resolution, follow up briefly to confirm the customer is satisfied.', 'Review your recent difficult moments for any recurring pattern worth fixing at the root.'],
      takeaways: ['A well-handled difficult moment can build more trust than a problem-free experience.', 'Following up after resolving a significant issue shows genuine care.', 'Recurring complaints often point to a real, fixable operational issue.'],
      quiz: [
        _q('What is the best possible outcome of a well-handled difficult moment?', ['A customer who trusts you less', 'A customer who trusts you more than before', 'No change in the relationship', 'The customer leaves permanently'], 1, 'Good handling of a genuine problem can actually strengthen the customer relationship.'),
        _q('What is suggested after resolving a significant issue?', ['Nothing further is needed', 'A simple follow-up check-in to confirm satisfaction', 'Avoiding the customer afterward', 'Charging an extra fee for the trouble'], 1, 'A brief follow-up demonstrates genuine care beyond simply closing the immediate problem.'),
        _q('What might a recurring complaint pattern indicate?', ['Nothing meaningful', 'A real, fixable operational issue', 'Random bad luck with no cause', 'Customers being unreasonable'], 1, 'Repeated complaints of the same type often point to something systemic worth addressing directly.'),
        _q('What should you do if you notice a recurring complaint pattern?', ['Ignore it and keep resolving individually', 'Consider fixing the underlying operational issue', 'Blame customers for the pattern', 'Stop offering the affected service entirely'], 1, 'Addressing the root cause is more effective than repeatedly resolving the same issue one customer at a time.'),
        _q('What is an example of an operational issue that might cause recurring complaints?', ['Perfect, flawless pricing clarity', 'Unclear pricing or a confusing process', 'Excellent customer service', 'Nothing, operational issues never cause complaints'], 1, 'Systemic issues like unclear pricing are common root causes of repeated customer frustration.'),
        _q('What does following up after an issue demonstrate?', ['Indifference to the customer', 'Genuine care beyond just closing the immediate problem', 'A desire to create more problems', 'Nothing meaningful'], 1, 'A thoughtful follow-up signals that you genuinely value the customer\'s satisfaction, not just resolving the transaction.'),
        _q('How should recurring difficult moments be treated over time?', ['As unrelated, isolated incidents always', 'As potential data pointing to a real issue worth fixing', 'As something to ignore completely', 'As proof that customers are always wrong'], 1, 'Viewing patterns as useful data helps you improve your business rather than just repeatedly firefighting.'),
        _q('What is the overall closing message of this course?', ['Difficult moments always damage the business permanently', 'Well-handled difficult moments can build loyalty, and patterns in them reveal real improvements to make', 'Avoid ever following up with customers', 'Complaints should always be dismissed'], 1, 'The course closes by showing how difficult moments, handled well, become opportunities for loyalty and genuine business improvement.'),
      ]),
  ],
);

final Course _course20 = Course(
  id: 'c20', title: 'Basic Business Taxes & Compliance (Nigeria)',
  description: 'What small operators actually need to know about taxes and compliance, without the overwhelm.',
  category: 'Business Skills', difficulty: Difficulty.intermediate,
  icon: Icons.gavel_rounded, durationMinutes: 140, order: 20,
  lessons: [
    _lesson('c20', 1, 'Why Compliance Matters, Even for a Small Stand', 5, [
      'Many small operators assume tax and compliance rules only apply to large, registered companies, and ignore the topic entirely. In reality, even small businesses have basic obligations, and understanding them early avoids bigger problems later — unexpected penalties, difficulty accessing loans, or trouble formalizing the business as it grows.',
      'This course isn\'t about becoming a tax expert. It\'s about understanding the basics well enough to make informed decisions, know when you genuinely need professional help, and avoid the most common and costly mistakes small operators make out of simple unawareness.',
    ], concepts: [KeyConcept('Awareness, Not Expertise', 'The goal is understanding the basics well enough to make informed decisions and know when to seek professional help — not becoming a tax expert.')],
      steps: ['Reflect honestly on what you currently know (or don\'t know) about your tax obligations.', 'Note any specific compliance questions you want answered by the end of this course.'],
      takeaways: ['Even small businesses have basic tax and compliance obligations.', 'Ignoring compliance can lead to penalties, loan difficulties, or problems formalizing the business.', 'The goal is informed awareness, not becoming a tax expert.'],
      quiz: [
        _q('Do tax and compliance rules only apply to large, registered companies?', ['Yes, only large companies', 'No, even small businesses have basic obligations', 'Compliance rules don\'t exist for businesses', 'Only foreign companies are affected'], 1, 'Small operators are often unaware that basic obligations can apply to them too, regardless of size.'),
        _q('What can result from ignoring compliance as a small business?', ['No consequences at all', 'Unexpected penalties, loan access difficulty, or formalization problems', 'Automatic tax exemption', 'Increased government support'], 1, 'Ignorance of basic obligations can create real problems as the business grows or seeks formal support.'),
        _q('What is the goal of this course?', ['To make you a certified tax expert', 'To build informed awareness of the basics and know when to seek professional help', 'To avoid taxes entirely', 'To discourage business registration'], 1, 'The course aims for practical, actionable awareness rather than deep technical expertise.'),
        _q('When should you seek professional help, according to this lesson?', ['Never, always handle everything yourself', 'When a specific situation genuinely calls for expert guidance', 'Only if the government demands it', 'Professional help is never necessary for small businesses'], 1, 'Knowing your own limits and when to bring in expert help is part of responsible compliance awareness.'),
        _q('What is a common assumption this lesson corrects?', ['That taxes apply to everyone equally', 'That compliance rules only apply to large, registered companies', 'That small businesses never need any advice', 'That compliance is always simple'], 1, 'This lesson directly challenges the common but incorrect assumption that small operators are exempt from all obligations.'),
        _q('What can understanding basic compliance help you avoid?', ['Nothing significant', 'The most common and costly mistakes small operators make from unawareness', 'All future business growth', 'The need for any bookkeeping'], 1, 'Awareness of common pitfalls helps you sidestep costly, avoidable mistakes.'),
        _q('What kind of decisions does this course aim to support?', ['No decisions in particular', 'Informed decisions about your business\'s compliance obligations', 'Only decisions about pricing', 'Decisions unrelated to compliance'], 1, 'The course is framed around building practical, decision-supporting awareness.'),
        _q('What is the overall purpose of this opening lesson?', ['To discourage engaging with compliance topics', 'To establish why even small businesses should understand basic compliance', 'To suggest compliance is optional for everyone', 'To recommend avoiding all business registration'], 1, 'The lesson sets the stage for why this often-avoided topic genuinely matters for small operators.'),
      ]),
    _lesson('c20', 2, 'Understanding Business Registration Basics', 5, [
      'Registering your business (commonly with the Corporate Affairs Commission, CAC, in Nigeria) formalizes your operation and is often a prerequisite for other things you may eventually want — opening a proper business bank account, applying for certain loans, or working with bigger clients who require registered vendors.',
      'Registration doesn\'t need to happen the moment you start — many operators run informally at first and register once the business shows it will continue and grow. But delaying too long can create friction later, since formalizing retroactively (and catching up on any related obligations) is often more work than registering early.',
    ], concepts: [KeyConcept('Registration Unlocks Other Opportunities', 'Many business banking, loan, and client opportunities require formal registration as a prerequisite.')],
      steps: ['Research what CAC business registration actually requires and costs currently.', 'Decide honestly whether your business has reached a point where registration makes sense.'],
      takeaways: ['Business registration is often a prerequisite for banking, loans, and bigger client relationships.', 'Registration doesn\'t need to happen on day one, but delaying too long creates more work later.', 'Understanding the registration process removes the mystery around when and how to formalize.'],
      quiz: [
        _q('What is the common registration body referenced for Nigerian businesses?', ['A random international body', 'The Corporate Affairs Commission (CAC)', 'The local police station', 'A private company with no official standing'], 1, 'CAC is the standard official body for formal business registration in Nigeria.'),
        _q('What does registration often unlock?', ['Nothing useful', 'Business banking, certain loans, and bigger client relationships', 'Automatic profit increase', 'Exemption from all future obligations'], 1, 'Many practical business opportunities require formal registration as a prerequisite.'),
        _q('Does registration need to happen the moment you start a business?', ['Yes, immediately or it is illegal', 'No, many operators start informally and register as the business grows', 'Registration is never necessary', 'Only foreign businesses need to register'], 1, 'Starting informally and formalizing later is common, though delaying indefinitely creates more work eventually.'),
        _q('What can happen if formalization is delayed too long?', ['Nothing changes either way', 'Catching up on related obligations later can be more work than registering early', 'The business automatically becomes registered', 'Delaying always simplifies the process'], 1, 'Retroactive formalization tends to be more complicated than registering proactively.'),
        _q('What is one practical benefit of registration mentioned?', ['Avoiding all future paperwork', 'Access to a proper business bank account', 'Automatic tax exemption', 'Guaranteed free government support'], 1, 'A formal business bank account is a common, practical benefit unlocked by registration.'),
        _q('Why might a bigger client require you to be registered?', ['They never care about registration', 'They may require registered vendors for their own compliance reasons', 'Registration has no bearing on client relationships', 'Only small clients care about registration'], 1, 'Larger clients often have their own compliance requirements that favor working with registered businesses.'),
        _q('What is suggested as a first practical step in this lesson?', ['Ignoring registration entirely', 'Researching what registration actually requires and costs currently', 'Registering immediately without any research', 'Avoiding any research on the topic'], 1, 'Understanding the actual current requirements removes uncertainty and helps with planning.'),
        _q('What is the overall message of this lesson?', ['Registration is unnecessary for any business', 'Understanding registration basics helps you decide when and how to formalize your business', 'Registration should always happen immediately regardless of business stage', 'Registration guarantees business success'], 1, 'The lesson demystifies registration as a practical step tied to business growth, not an immediate mandatory hurdle.'),
      ]),
    _lesson('c20', 3, 'Basic Tax Obligations for Small Operators', 5, [
      'Tax obligations vary based on your business structure and income level, but common categories small operators should be aware of include personal income tax (if operating as an individual/sole proprietor) and, once registered, potential company-level taxes and levies depending on your specific business structure and location.',
      'Rather than trying to memorize exact rates and rules (which change and vary), the more valuable habit is knowing that these obligations exist, keeping the clean records from your bookkeeping habit (which make any tax filing far easier when the time comes), and consulting a tax professional or your local tax authority for your specific situation rather than guessing.',
    ], concepts: [KeyConcept('Know That It Exists, Don\'t Try to Memorize Everything', 'The practical goal is awareness that obligations exist and clean records — not memorizing exact rates that change over time.')],
      steps: ['Identify which basic tax category likely applies to your current business structure.', 'Confirm your bookkeeping records are clean enough to support a tax filing if needed.'],
      takeaways: ['Tax obligations vary by business structure, income level, and location.', 'Clean bookkeeping records make any tax filing far easier when the time comes.', 'Consult a tax professional or local authority for your specific situation rather than guessing.'],
      quiz: [
        _q('Do tax obligations look the same for every small operator?', ['Yes, always identical', 'No, they vary by business structure, income level, and location', 'Tax obligations don\'t exist for small operators', 'Only large companies have varying obligations'], 1, 'Individual circumstances significantly affect what specific tax obligations apply to a given operator.'),
        _q('What is more valuable than memorizing exact tax rates and rules?', ['Nothing is more valuable', 'Knowing these obligations exist and keeping clean records', 'Ignoring taxes entirely', 'Guessing rates based on assumption'], 1, 'Practical awareness and good records serve you better than trying to memorize frequently changing specifics.'),
        _q('What earlier course habit directly helps with tax filing?', ['Negotiation skills', 'Bookkeeping', 'Sub-agent network management', 'POS machine operation'], 1, 'Clean, consistent financial records from bookkeeping make tax filing significantly easier when needed.'),
        _q('What should you do for your specific tax situation, rather than guessing?', ['Guess based on assumptions', 'Consult a tax professional or your local tax authority', 'Ignore the question entirely', 'Copy exactly what a competitor does'], 1, 'Professional or official guidance ensures accuracy for your specific, individual circumstances.'),
        _q('What is an example of a common tax category mentioned?', ['International trade tariffs only', 'Personal income tax for individuals/sole proprietors', 'Only taxes for foreign companies', 'No taxes apply to any small business'], 1, 'Personal income tax is a common baseline obligation many small operators should be aware of.'),
        _q('What happens to tax rates and rules over time?', ['They never change', 'They change and vary, making memorization less useful than awareness', 'They always decrease', 'They are identical worldwide'], 1, 'Since rates and rules shift, ongoing awareness and professional consultation are more reliable than fixed memorization.'),
        _q('Why does this lesson recommend against trying to memorize everything?', ['Memorization is always best', 'Rules vary and change, making general awareness plus professional consultation more practical', 'Tax rules never matter in practice', 'Memorization is illegal'], 1, 'The practical, sustainable approach is awareness plus knowing when to seek specific expert guidance.'),
        _q('What is the overall goal of this lesson?', ['To make you memorize exact tax codes', 'To build practical awareness of basic tax obligations and the value of good records', 'To discourage any tax compliance', 'To replace the need for a tax professional entirely'], 1, 'The lesson focuses on practical, sustainable awareness rather than unrealistic technical mastery.'),
      ]),
    _lesson('c20', 4, 'Common Compliance Mistakes Small Operators Make', 5, [
      'A few mistakes come up repeatedly among small operators: mixing personal and business finances so thoroughly that any future tax or loan conversation becomes a nightmare to untangle, ignoring registration until a big opportunity requires it urgently (and then rushing), and assuming "I\'m too small to matter" without confirming that\'s actually true for their situation.',
      'Each of these mistakes is avoidable with the habits covered elsewhere in this app — the bookkeeping separation of personal and business finances, understanding registration proactively rather than reactively, and simply checking your actual obligations rather than assuming based on business size alone.',
    ], concepts: [KeyConcept('These Mistakes Are Avoidable', 'The most common compliance mistakes trace back to habits already covered elsewhere in this app — bookkeeping, proactive registration, and checking rather than assuming.')],
      steps: ['Honestly check whether you\'re currently making any of the three common mistakes described.', 'Pick one specific action to correct the mistake you identified.'],
      takeaways: ['Mixing personal and business finances creates major future headaches.', 'Reactive, last-minute registration under pressure is harder than proactive registration.', '"I\'m too small to matter" is an assumption worth actually verifying, not just accepting.'],
      quiz: [
        _q('What is a common mistake related to finances?', ['Keeping perfectly separate records', 'Mixing personal and business finances thoroughly', 'Tracking every transaction carefully', 'Using a bookkeeping system consistently'], 1, 'Mixed finances make any future tax or loan conversation significantly harder to untangle.'),
        _q('What is a common mistake related to registration?', ['Registering proactively and early', 'Ignoring registration until a big opportunity urgently requires it', 'Researching registration requirements in advance', 'Registering as soon as the business starts'], 1, 'Reactive, last-minute registration under time pressure is much harder than planning ahead.'),
        _q('What is a common mistaken assumption small operators make?', ['That they need to verify their obligations', 'That "I\'m too small to matter" without actually confirming it', 'That compliance matters for their business', 'That bookkeeping is important'], 1, 'This assumption is often simply accepted without verification, leading to unexpected exposure later.'),
        _q('What habit helps avoid the mixed-finances mistake?', ['Ignoring bookkeeping entirely', 'The bookkeeping separation of personal and business finances', 'Mixing finances more thoroughly', 'Avoiding any financial tracking'], 1, 'The bookkeeping course\'s emphasis on separation directly prevents this common compliance headache.'),
        _q('What helps avoid the reactive registration mistake?', ['Waiting until forced to register', 'Understanding registration proactively rather than reactively', 'Avoiding registration research entirely', 'Only registering when legally forced'], 1, 'Proactive understanding, covered in an earlier lesson, prevents rushed, stressful last-minute registration.'),
        _q('What helps avoid the "too small to matter" mistake?', ['Assuming without checking', 'Simply checking your actual obligations rather than assuming', 'Ignoring the question entirely', 'Trusting rumors from other small operators'], 1, 'Verifying your actual situation, rather than assuming based on size alone, avoids unexpected compliance gaps.'),
        _q('Are these common mistakes avoidable?', ['No, they are unavoidable', 'Yes, with habits already covered elsewhere in this course library', 'Only large businesses can avoid them', 'These mistakes have no real consequences'], 1, 'Each mistake connects directly to practical habits taught in this and other courses.'),
        _q('What is the overall message of this lesson?', ['These mistakes are inevitable and unavoidable', 'Common compliance mistakes are avoidable through habits already covered in this app', 'Small operators should ignore compliance entirely', 'Only large businesses make these mistakes'], 1, 'The lesson connects compliance awareness back to practical habits, reinforcing that avoidance is realistic and achievable.'),
      ]),
    _lesson('c20', 5, 'Building a Simple Compliance Habit Going Forward', 5, [
      'Rather than treating compliance as a one-time scramble, build it into your regular business review — alongside your weekly bookkeeping reconciliation and periodic profit review, periodically ask: has anything changed about my business (size, structure, registration status) that affects my obligations?',
      'When in doubt, a short consultation with a tax professional or your local tax office is far cheaper and less stressful than discovering a problem later. Treat this as a normal cost of doing business, the same way you\'d budget for rent or vendor fees, rather than an intimidating unknown to avoid thinking about.',
    ], concepts: [KeyConcept('Build Compliance Into Existing Review Habits', 'Fold compliance checks into your existing bookkeeping and profit review routine rather than treating it as a separate, avoided task.')],
      steps: ['Add a compliance check-in question to your existing periodic business review routine.', 'Identify one local tax professional or office you could consult if a specific question comes up.'],
      takeaways: ['Fold compliance review into your existing periodic bookkeeping and profit review habits.', 'A short professional consultation is cheaper and less stressful than discovering a problem later.', 'Treat compliance as a normal cost of doing business, not an intimidating unknown to avoid.'],
      quiz: [
        _q('How should compliance be treated, according to this final lesson?', ['As a one-time scramble when forced', 'As part of your regular, ongoing business review habits', 'As something to avoid thinking about entirely', 'As irrelevant to daily operations'], 1, 'Folding compliance into existing review habits makes it manageable rather than an occasional crisis.'),
        _q('What existing habits can compliance review be attached to?', ['None, it must be entirely separate', 'Weekly bookkeeping reconciliation and periodic profit review', 'Only negotiation practice', 'Sub-agent network management only'], 1, 'Attaching compliance checks to habits you already have makes the practice sustainable.'),
        _q('What question should a periodic compliance check ask?', ['Nothing specific', 'Has anything changed about my business that affects my obligations?', 'What is my competitor doing?', 'What is the weather forecast?'], 1, 'This simple, recurring question helps you stay aware of changes that might affect your compliance status.'),
        _q('What is recommended when you\'re in doubt about a compliance question?', ['Guessing and hoping for the best', 'A short consultation with a tax professional or local tax office', 'Ignoring the question indefinitely', 'Asking a random stranger'], 1, 'Professional consultation is a small, manageable cost compared to discovering a problem later.'),
        _q('How should the cost of occasional professional consultation be viewed?', ['As an unnecessary luxury', 'As a normal cost of doing business, like rent or vendor fees', 'As something to always avoid', 'As irrelevant to business planning'], 1, 'Budgeting for occasional professional guidance is a practical, normal part of running a business.'),
        _q('What is worse than a short professional consultation, according to this lesson?', ['Nothing is worse', 'Discovering a compliance problem later without having checked', 'Asking questions too often', 'Keeping clean records'], 1, 'Proactive, small consultations are far less costly and stressful than reactive problem discovery.'),
        _q('What overall tone does this lesson encourage toward compliance?', ['Fear and avoidance', 'Normalized, routine attention as part of regular business habits', 'Complete indifference', 'Panic whenever the topic arises'], 1, 'The lesson aims to normalize compliance as routine, not something intimidating to avoid.'),
        _q('What is the overall closing message of this course?', ['Compliance is too complex for small operators to manage', 'Building compliance into your regular business habits makes it manageable and reduces future risk', 'Compliance should only be addressed once, at business start', 'Professional consultation is never worth the cost'], 1, 'The course closes by tying compliance into the same sustainable-habit philosophy used throughout the other business courses.'),
      ]),
  ],
);

final Course _course21 = Course(
  id: 'c21', title: 'Time & Cash Flow Management',
  description: 'Avoiding the "broke while busy" trap — managing your time and cash so activity actually turns into profit.',
  category: 'Business Skills', difficulty: Difficulty.beginner,
  icon: Icons.schedule_rounded, durationMinutes: 130, order: 21,
  lessons: [
    _lesson('c21', 1, 'Why Busy Doesn\'t Always Mean Profitable', 5, [
      'Many small business owners work long hours, serve customers constantly, and still feel like there\'s never enough cash — "broke while busy." This usually isn\'t about how hard you\'re working; it\'s about a mismatch between when money comes in, when it goes out, and how your time is actually being spent.',
      'Being busy with low-value activity (chasing small, unprofitable tasks) feels productive but doesn\'t solve the underlying cash timing problem. Understanding this distinction is the first step toward fixing it.',
    ], concepts: [KeyConcept('Busy ≠ Profitable', 'Activity and effort don\'t automatically translate into available cash — timing and value matter more than raw busyness.')],
      steps: ['Reflect honestly: are you currently "broke while busy"? What does that look like for you specifically?', 'List your top 3 time-consuming daily activities and estimate their actual profit contribution.'],
      takeaways: ['Being busy doesn\'t automatically mean being profitable or cash-healthy.', 'The "broke while busy" trap usually comes from cash timing and time allocation, not lack of effort.', 'Recognizing this distinction is the first step to fixing it.'],
      quiz: [
        _q('Does being busy automatically mean a business is profitable?', ['Yes, always', 'No, busyness and profitability aren\'t the same thing', 'Busy businesses are always cash-rich', 'There is no relationship between the two ever'], 1, 'Activity level and actual profitability/cash health can be very different things.'),
        _q('What usually causes the "broke while busy" feeling?', ['Working too little', 'A mismatch between cash timing and time allocation', 'Having too much cash on hand', 'Government interference'], 1, 'It\'s typically about when money moves and where time goes, not a simple lack of effort.'),
        _q('What can make busyness feel productive without solving the real problem?', ['Nothing, busyness always solves problems', 'Low-value activity that feels productive but doesn\'t address cash timing', 'Taking time off', 'Ignoring customers entirely'], 1, 'Effort spent on low-value tasks can mask the real issue while not actually fixing it.'),
        _q('What is the first step to fixing this trap, according to this lesson?', ['Working even more hours', 'Recognizing the distinction between busy and profitable', 'Ignoring the problem entirely', 'Immediately closing the business'], 1, 'Awareness of this gap is the necessary starting point before any real fix can happen.'),
        _q('What should you evaluate about your daily activities?', ['Nothing, all activity is equally valuable', 'Their actual profit contribution', 'Only how tiring they are', 'How long they take, regardless of value'], 1, 'Understanding which activities actually generate profit reveals where your time is genuinely well spent.'),
        _q('What is an example of the trap this lesson describes?', ['A business with no customers at all', 'Constant activity and long hours with persistently insufficient cash', 'A business that closes early every day', 'A business with too much idle cash'], 1, 'This is the classic "broke while busy" pattern the lesson is addressing directly.'),
        _q('What two factors does this lesson say the real issue usually involves?', ['Luck and location only', 'Cash timing and time allocation', 'Weather and competition', 'Government policy and taxes'], 1, 'These two factors are identified as the real underlying drivers behind the busy-but-broke pattern.'),
        _q('What is the overall purpose of this opening lesson?', ['To suggest working harder solves everything', 'To reframe the "broke while busy" problem as a timing and allocation issue worth understanding', 'To discourage all business activity', 'To recommend abandoning the business'], 1, 'The lesson sets up the real problem so the rest of the course can address it concretely.'),
      ]),
    _lesson('c21', 2, 'Understanding Your Cash Timing Gap', 5, [
      'Cash flow problems often stem from a timing gap: money goes out (restocking, rent, wages) before the corresponding money comes back in (sales, settlements). Even a genuinely profitable business can feel cash-poor if this gap isn\'t understood and planned for.',
      'Map your own timing gap: when do your biggest expenses typically hit, and when does your cash from sales/settlement typically arrive? Seeing this side by side on paper often reveals exactly why certain weeks feel tight even when overall monthly numbers look fine.',
    ], concepts: [KeyConcept('The Timing Gap', 'Even a profitable business can feel cash-poor if expenses land before the matching income arrives — map this gap to understand it.')],
      steps: ['Write down when your biggest regular expenses typically hit during the month.', 'Write down when your typical sales/settlement cash actually arrives.'],
      takeaways: ['A timing gap between expenses going out and income coming in causes cash-flow stress, even in profitable businesses.', 'Mapping this gap on paper reveals why specific weeks feel tighter than others.', 'Understanding the gap is necessary before you can plan around it.'],
      quiz: [
        _q('What is a "cash timing gap"?', ['A gap in your knowledge of accounting', 'The delay between money going out and the matching money coming back in', 'A type of loan', 'A government tax category'], 1, 'This gap between outflow and inflow timing is a core driver of cash-flow stress.'),
        _q('Can a profitable business still feel cash-poor?', ['No, profit guarantees cash availability always', 'Yes, if there is a timing gap between expenses and income', 'Profitable businesses never experience this', 'Only unprofitable businesses feel cash-poor'], 1, 'Profit on paper doesn\'t guarantee cash is available exactly when needed due to timing mismatches.'),
        _q('What is suggested as a practical exercise in this lesson?', ['Ignoring your cash flow entirely', 'Mapping when expenses hit versus when income arrives', 'Only tracking annual totals', 'Avoiding any financial tracking'], 1, 'Visually mapping the timing gap reveals exactly where and why cash tightness occurs.'),
        _q('What can mapping the gap reveal?', ['Nothing useful', 'Why certain weeks feel tight even when monthly numbers look fine', 'Your competitor\'s cash flow', 'Government tax rates'], 1, 'Seeing the timing side by side clarifies the specific source of periodic cash stress.'),
        _q('What examples of expenses are mentioned as potentially hitting early?', ['Only personal luxury spending', 'Restocking, rent, and wages', 'Only annual taxes', 'Nothing specific is mentioned'], 1, 'These common, often front-loaded expenses are typical contributors to the timing gap.'),
        _q('Why is understanding the gap necessary before planning?', ['It isn\'t necessary at all', 'You need to know the shape of the problem before you can plan around it effectively', 'Planning works fine without any understanding', 'Understanding has no practical use'], 1, 'A clear picture of the gap is the foundation for the planning strategies covered in later lessons.'),
        _q('What can happen if the timing gap is not understood or planned for?', ['Nothing, businesses adapt automatically', 'The business can feel cash-poor despite being genuinely profitable', 'Profit automatically increases', 'The gap resolves itself over time'], 1, 'An unaddressed timing gap creates real, avoidable cash-flow stress even when overall numbers are healthy.'),
        _q('What is the overall goal of this lesson?', ['To avoid tracking cash flow', 'To help you identify and map your own specific cash timing gap', 'To recommend ignoring expenses entirely', 'To suggest profit doesn\'t matter'], 1, 'The lesson builds the diagnostic understanding needed before addressing the cash-flow problem directly.'),
      ]),
    _lesson('c21', 3, 'Smoothing Cash Flow With a Buffer', 5, [
      'The most direct fix for a timing gap is a cash buffer — a reserve set aside specifically to cover the gap between expenses going out and income coming in, so a tight week doesn\'t become a crisis. This is related to, but distinct from, the general emergency savings covered elsewhere; this buffer is specifically sized to your typical timing gap.',
      'Size your buffer based on your actual mapped gap from the previous lesson — if expenses typically precede income by about a week and a half, your buffer should comfortably cover that specific window, not an arbitrary round number.',
    ], concepts: [KeyConcept('Size the Buffer to the Actual Gap', 'A cash buffer works best when sized to your specific, mapped timing gap — not a random or arbitrary amount.')],
      steps: ['Estimate the size of your specific cash timing gap in days or weeks.', 'Calculate roughly how much buffer cash would comfortably cover that gap.'],
      takeaways: ['A cash buffer specifically sized to your timing gap smooths out tight weeks.', 'This buffer is distinct from general emergency savings — it targets your specific timing pattern.', 'Size the buffer based on your actual mapped gap, not an arbitrary number.'],
      quiz: [
        _q('What is the most direct fix for a cash timing gap?', ['Ignoring the gap entirely', 'A cash buffer sized to cover the gap', 'Taking out a loan every time', 'Reducing all sales activity'], 1, 'A properly sized buffer directly addresses the specific timing mismatch causing cash stress.'),
        _q('How should the buffer be sized?', ['Randomly, any amount works', 'Based on your actual mapped timing gap', 'Always at the maximum amount possible', 'It should not be sized at all'], 1, 'Sizing it to your specific, real gap makes the buffer genuinely effective rather than arbitrary.'),
        _q('Is this buffer the same as general emergency savings?', ['Yes, identical in every way', 'No, it is related but distinct, targeting your specific timing pattern', 'Emergency savings and buffers are unrelated concepts', 'Buffers are irrelevant to emergency planning'], 1, 'While related, this buffer specifically addresses the timing gap rather than general unexpected emergencies.'),
        _q('What happens without a properly sized buffer during a timing gap?', ['Nothing, gaps resolve themselves', 'A tight week can become a genuine cash crisis', 'Profit automatically increases', 'The business becomes more stable automatically'], 1, 'Without a buffer, the natural timing gap can escalate into real operational stress.'),
        _q('What information from the previous lesson is used to size the buffer?', ['Nothing from before', 'The mapped timing gap between expenses and income', 'Your competitor\'s buffer size', 'Random guesswork'], 1, 'The mapping exercise directly informs how large a buffer is actually needed.'),
        _q('What is an example gap size mentioned in this lesson?', ['A full year', 'About a week and a half', 'A single day only', 'No example is given'], 1, 'This illustrative example shows how a specific, mapped gap translates into a buffer target.'),
        _q('What does "smoothing" cash flow mean in this context?', ['Eliminating all expenses', 'Using a buffer to prevent the timing gap from creating a crisis', 'Increasing sales dramatically', 'Ignoring cash flow entirely'], 1, 'Smoothing refers to using the buffer to bridge the gap so operations continue without disruption.'),
        _q('What is the overall goal of this lesson?', ['To discourage any cash reserves', 'To build a cash buffer specifically sized to smooth your mapped timing gap', 'To recommend borrowing instead of saving', 'To eliminate the need for cash flow understanding'], 1, 'The lesson provides a concrete, targeted solution building directly on the previous lesson\'s diagnosis.'),
      ]),
    _lesson('c21', 4, 'Managing Your Time Around Value, Not Just Activity', 5, [
      'Not all business hours are equally valuable. Some activities directly drive revenue (serving customers during peak hours), while others feel busy but contribute little (excessive time spent on low-value tasks that could be simplified, delegated, or cut). Auditing where your time actually goes reveals opportunities to redirect effort toward what matters most.',
      'This doesn\'t mean cutting corners on real service quality — it means being honest about which parts of your day are genuinely moving the business forward versus which parts are just filling time out of habit.',
    ], concepts: [KeyConcept('Audit Time Against Value', 'Not all hours are equal — a time audit reveals which activities genuinely drive revenue and which just fill the day.')],
      steps: ['Track your time for one full day, noting what you did each hour.', 'Mark each activity as high-value (drives revenue) or low-value (fills time without clear benefit).'],
      takeaways: ['Not all business hours are equally valuable to revenue generation.', 'A simple time audit reveals which activities genuinely move the business forward.', 'The goal is redirecting effort toward high-value activity, not cutting service quality.'],
      quiz: [
        _q('Are all business hours equally valuable to revenue?', ['Yes, every hour is identical in value', 'No, some activities drive revenue far more than others', 'Value has nothing to do with time spent', 'Only morning hours have any value'], 1, 'Different activities contribute very differently to actual revenue generation.'),
        _q('What is an example of a high-value activity?', ['Excessive idle time', 'Serving customers during peak hours', 'Unrelated low-value tasks', 'Random unproductive activity'], 1, 'Direct customer-facing activity during busy periods typically drives the most revenue.'),
        _q('What does a time audit help reveal?', ['Nothing useful', 'Which activities genuinely move the business forward versus which just fill time', 'Only your competitor\'s schedule', 'The weather forecast'], 1, 'Honest tracking exposes where effort is genuinely productive versus habitually spent.'),
        _q('What is the recommended practical exercise in this lesson?', ['Ignoring your daily schedule', 'Tracking your time for a day and marking activities as high or low value', 'Working even longer hours without reflection', 'Avoiding all customer interaction'], 1, 'This concrete exercise makes the abstract idea of "value per hour" tangible and actionable.'),
        _q('Does this lesson recommend cutting corners on service quality?', ['Yes, always cut corners for efficiency', 'No, it means redirecting effort honestly, not cutting real service quality', 'Service quality is irrelevant to time management', 'Cutting corners is the main point'], 1, 'The focus is on honest redirection of effort, not sacrificing the quality that actually serves customers well.'),
        _q('What might low-value time include?', ['Peak-hour customer service', 'Tasks that could be simplified, delegated, or cut', 'High-priority business decisions', 'Nothing, all time is equally valuable'], 1, 'Low-value tasks are often ones that feel busy but don\'t meaningfully move the business forward.'),
        _q('Why is honesty important in this time audit?', ['Honesty is unnecessary here', 'To accurately distinguish genuinely productive time from habitual busywork', 'Dishonesty produces better results', 'It has no bearing on the outcome'], 1, 'An honest assessment is what makes the audit actually useful for redirecting effort effectively.'),
        _q('What is the overall goal of this lesson?', ['To eliminate all business activity', 'To help you redirect time toward genuinely high-value activity through honest self-audit', 'To recommend working fewer hours regardless of value', 'To ignore time management entirely'], 1, 'The lesson connects time management directly to the course\'s theme of turning activity into real profit.'),
      ]),
    _lesson('c21', 5, 'Bringing Time and Cash Together Into One Routine', 5, [
      'The final piece is combining cash timing awareness and time-value awareness into a simple, regular routine: review your cash buffer status and your time allocation together, weekly or monthly, so both stay aligned as your business changes.',
      'As your business grows or shifts (new products, sub-agents, more tools from earlier courses), both your timing gap and your time allocation will likely shift too — revisiting this routine regularly, rather than setting it once, keeps you ahead of the "broke while busy" trap permanently rather than solving it once and drifting back into it.',
    ], concepts: [KeyConcept('Review Both Together, Regularly', 'Cash timing and time-value awareness should be reviewed together on a regular cadence, since both shift as your business changes.')],
      steps: ['Set a regular (weekly or monthly) reminder to review both your cash buffer status and your time allocation together.', 'Note any changes in your business (new products, tools, sub-agents) that might shift your timing gap or time value.'],
      takeaways: ['Combine cash timing and time-value awareness into one regular review routine.', 'Both will shift as your business grows or changes, requiring ongoing attention.', 'Regular review keeps you ahead of the "broke while busy" trap rather than solving it once and drifting back.'],
      quiz: [
        _q('What should be combined into one regular routine, according to this final lesson?', ['Only cash buffer review', 'Cash timing awareness and time-value awareness together', 'Only time tracking', 'Neither needs regular review'], 1, 'Bringing both together in one routine keeps your understanding of the business current and aligned.'),
        _q('How often is this combined review suggested?', ['Once and never again', 'Weekly or monthly', 'Only once a year', 'Every few years'], 1, 'A regular, frequent cadence keeps you responsive to how the business is actually changing.'),
        _q('Why might your timing gap or time allocation shift over time?', ['They never shift once established', 'As the business grows or changes (new products, tools, sub-agents)', 'Only if you stop working entirely', 'Shifts are impossible in any business'], 1, 'Business growth and change naturally affect both cash timing patterns and where time is best spent.'),
        _q('What is the risk of solving this problem only once?', ['No risk, one-time fixes are permanent', 'Drifting back into the "broke while busy" trap as circumstances change', 'The business automatically improves forever', 'Nothing changes regardless of review'], 1, 'Without ongoing review, changing circumstances can quietly reintroduce the same original problem.'),
        _q('What does regular review help you do?', ['Nothing useful', 'Stay ahead of the trap rather than solving it once and drifting back', 'Avoid ever changing your business', 'Ignore both cash and time entirely'], 1, 'Ongoing attention keeps your systems aligned with your actual, evolving business reality.'),
        _q('What earlier course topics are referenced as potential sources of change?', ['Nothing from earlier courses', 'New products, sub-agents, and tools from earlier courses', 'Only government regulation changes', 'Weather pattern changes'], 1, 'Growth elements covered elsewhere in this course library directly tie back into this ongoing review need.'),
        _q('What is the overall philosophy of this final lesson?', ['Set your systems once and never revisit them', 'Ongoing, combined review of cash and time keeps you consistently ahead of the "broke while busy" trap', 'Cash and time management are unrelated topics', 'Only cash matters, time is irrelevant'], 1, 'The lesson closes the course by emphasizing sustained, combined attention rather than a one-time fix.'),
        _q('What is the overall closing message of this course?', ['Busyness alone guarantees business success', 'Understanding and regularly managing both cash timing and time value together prevents being broke while busy', 'Cash flow and time management should be handled completely separately', 'This problem cannot be solved through planning'], 1, 'The course closes by tying together its two core themes into one sustainable, ongoing practice.'),
      ]),
  ],
);

final Course _course22 = Course(
  id: 'c22', title: 'Seasonal Demand Planning',
  description: 'Stocking up around holidays, school resumption, and salary days instead of getting caught flat-footed.',
  category: 'Business Skills', difficulty: Difficulty.intermediate,
  icon: Icons.calendar_month_rounded, durationMinutes: 130, order: 22,
  lessons: [
    _lesson('c22', 1, 'Recognizing Your Business\'s Seasonal Patterns', 5, [
      'Nearly every small business has predictable demand cycles, even if the owner hasn\'t consciously mapped them out — salary days drive spending spikes, school resumption periods drive specific purchases, festive seasons (Christmas, Eid, New Year) drive both spending and travel-related demand.',
      'The first step is simply noticing and writing down your own patterns from memory and any records you have — which weeks or months have historically been busiest, and which have been noticeably slower. This isn\'t guesswork forever; it becomes more accurate as you track it deliberately going forward.',
    ], concepts: [KeyConcept('Patterns Exist Whether You\'ve Mapped Them or Not', 'Every business has demand cycles — the question is whether you\'re planning around them or getting surprised by them.')],
      steps: ['Write down which months or periods have historically felt busiest for your business.', 'Write down which periods have historically felt slowest.'],
      takeaways: ['Nearly every business has predictable seasonal demand patterns.', 'Salary days, school resumption, and festive seasons are common demand drivers.', 'Start by writing down your own historical patterns from memory and records.'],
      quiz: [
        _q('Do small businesses typically have predictable demand cycles?', ['No, demand is always completely random', 'Yes, nearly every business has some predictable patterns', 'Only large businesses have seasonal patterns', 'Seasonal patterns don\'t exist in Nigeria'], 1, 'Most businesses experience recognizable ups and downs tied to recurring events or periods.'),
        _q('What are common demand drivers mentioned in this lesson?', ['Random chance only', 'Salary days, school resumption, and festive seasons', 'Only weather changes', 'Nothing specific drives demand'], 1, 'These recurring events reliably shift customer spending and buying patterns.'),
        _q('What is the first step to recognizing your own seasonal patterns?', ['Ignoring the topic entirely', 'Writing down your historical busy and slow periods', 'Immediately buying more stock', 'Hiring a consultant first'], 1, 'Simple reflection and documentation is the accessible starting point for most small operators.'),
        _q('Is this initial pattern recognition perfectly accurate right away?', ['Yes, always perfectly accurate immediately', 'No, but it becomes more accurate with deliberate tracking over time', 'Accuracy is irrelevant to this exercise', 'It should be ignored since it starts inaccurate'], 1, 'Starting with memory and rough records is fine — accuracy improves as you track deliberately going forward.'),
        _q('What is an example of a festive season demand driver?', ['A random Tuesday', 'Christmas, Eid, or New Year', 'An ordinary weekday', 'A government meeting'], 1, 'Major festive periods commonly drive spending spikes for many types of small businesses.'),
        _q('Why does salary day affect demand for many businesses?', ['Salary days have no effect', 'Customers often have more available cash and spend more', 'Salary days reduce all spending', 'It only affects large corporations'], 1, 'Increased available cash around salary periods often translates into higher customer spending.'),
        _q('What should you use to identify your patterns beyond memory?', ['Nothing else is useful', 'Any records you have available', 'Only rumors from competitors', 'Government statistics unrelated to your business'], 1, 'Combining memory with whatever records exist gives a more complete initial picture of your patterns.'),
        _q('What is the overall purpose of this opening lesson?', ['To discourage planning around demand', 'To help you start recognizing and documenting your own business\'s seasonal patterns', 'To suggest seasonal patterns don\'t matter', 'To recommend ignoring salary days and holidays'], 1, 'The lesson establishes the foundational awareness needed for the planning covered in later lessons.'),
      ]),
    _lesson('c22', 2, 'Planning Stock and Capital Around Peak Periods', 5, [
      'Once you know your peak periods, plan your stock and capital ahead of time rather than reactively. If a specific week reliably sees double the usual demand, you need double the usual float or inventory ready before that week starts, not scrambling once the queue has already formed.',
      'This requires planning your cash flow around the peak too — you may need to build up extra capital in the weeks leading up to a known peak period specifically to fund the larger stock/float you\'ll need, rather than hoping you\'ll have enough on hand when the moment arrives.',
    ], concepts: [KeyConcept('Prepare Before the Peak, Not During It', 'Known peak periods need stock and capital lined up in advance — scrambling once the queue has formed is too late.')],
      steps: ['Pick your next known peak period and estimate how much extra stock/float you\'ll need.', 'Plan when you\'ll build up the extra capital needed, working backward from the peak date.'],
      takeaways: ['Plan stock and capital ahead of known peak periods, not reactively.', 'Known peaks require proportionally more float or inventory ready in advance.', 'Build up extra capital in the weeks leading up to a peak, planned backward from the date.'],
      quiz: [
        _q('When should you plan stock and capital for a known peak period?', ['Reactively, once the queue has formed', 'Ahead of time, before the peak starts', 'Only after the peak has passed', 'Planning is unnecessary for peaks'], 1, 'Proactive preparation avoids the scramble and lost sales that come from reacting too late.'),
        _q('If a peak period sees double the usual demand, what should you prepare?', ['The same amount as usual', 'Proportionally more stock or float, roughly matching the expected demand increase', 'Less than usual to save money', 'Nothing extra is needed'], 1, 'Matching your preparation to the expected demand increase prevents running short during the actual peak.'),
        _q('What does planning cash flow around a peak involve?', ['Nothing extra beyond normal operations', 'Building up extra capital in the weeks leading up to the peak', 'Spending all available cash immediately', 'Ignoring capital needs entirely'], 1, 'Extra capital needs to be deliberately accumulated in advance to fund the larger peak-period stock or float.'),
        _q('What is the risk of not preparing ahead for a known peak?', ['No risk, peaks handle themselves', 'Running short on stock or float exactly when demand is highest', 'Automatically higher profit', 'Reduced customer interest'], 1, 'Being unprepared for a predictable peak directly costs you the extra sales that period could have generated.'),
        _q('What should guide how much extra capital to build up before a peak?', ['Random guessing', 'The estimated extra stock/float needed for that specific peak', 'Your competitor\'s capital level', 'No estimation is needed'], 1, 'A reasoned estimate based on expected demand increase guides how much extra capital to prepare.'),
        _q('What is an example of scrambling reactively, which this lesson warns against?', ['Preparing stock weeks in advance', 'Only realizing you need more stock once the queue has already formed', 'Planning capital needs backward from the peak date', 'Estimating demand increase ahead of time'], 1, 'Reactive scrambling during an active queue is exactly the late, stressful response this lesson aims to prevent.'),
        _q('What planning approach is suggested for building capital before a peak?', ['No specific approach needed', 'Working backward from the peak date to plan when capital should be ready', 'Waiting until the peak day itself', 'Ignoring the timeline entirely'], 1, 'Planning backward from the known peak date ensures capital is actually ready in time.'),
        _q('What is the overall goal of this lesson?', ['To discourage stocking up for peaks', 'To help you proactively plan stock and capital ahead of known peak periods', 'To suggest peaks cannot be planned for', 'To recommend ignoring demand patterns entirely'], 1, 'The lesson turns the pattern recognition from the previous lesson into concrete, actionable preparation.'),
      ]),
    _lesson('c22', 3, 'Preparing for Slow Periods Too', 5, [
      'Just as peaks need extra preparation, slow periods need their own plan — reduced float/stock to avoid tying up unnecessary capital, and awareness that revenue during these weeks will genuinely be lower, so personal and business spending should adjust accordingly rather than assuming every week looks like a peak week.',
      'Slow periods are also a good time for activities that don\'t require heavy customer traffic — catching up on bookkeeping, reviewing your pricing and vendor terms, or planning for the next peak. Using slow time productively turns an otherwise frustrating quiet stretch into useful preparation time.',
    ], concepts: [KeyConcept('Slow Periods Need a Plan Too', 'Reduced stock/float and adjusted spending expectations during slow periods prevent unnecessary capital being tied up.')],
      steps: ['Identify your next known slow period and plan a reduced stock/float level for it.', 'Pick one productive task (bookkeeping catch-up, pricing review) to do during your next slow period.'],
      takeaways: ['Slow periods need their own plan, not just peak periods.', 'Reduce float/stock during slow periods to avoid tying up unnecessary capital.', 'Use slow periods productively for tasks like bookkeeping review or planning ahead.'],
      quiz: [
        _q('Do slow periods need their own specific plan?', ['No, only peaks need planning', 'Yes, slow periods need their own plan too', 'Slow periods never actually occur', 'Planning is only for large businesses'], 1, 'Slow periods require deliberate adjustment just as much as peak periods do, though in the opposite direction.'),
        _q('What should happen to float/stock levels during a known slow period?', ['They should increase significantly', 'They should be reduced to avoid tying up unnecessary capital', 'They should stay exactly the same as peak levels', 'Stock levels are irrelevant during slow periods'], 1, 'Reducing stock during predictably slower demand avoids unnecessarily locking up capital.'),
        _q('What should adjust during slow periods, beyond stock levels?', ['Nothing else needs adjustment', 'Personal and business spending expectations', 'Only your marketing budget', 'Your vendor accounts entirely'], 1, 'Spending should realistically reflect the genuinely lower revenue expected during these periods.'),
        _q('What is a productive use of time during slow periods?', ['Ignoring the business entirely', 'Catching up on bookkeeping, reviewing pricing, or planning for the next peak', 'Increasing stock unnecessarily', 'Avoiding all business-related tasks'], 1, 'Low-traffic time is well spent on tasks that don\'t require heavy customer interaction.'),
        _q('What mistake does this lesson warn against?', ['Reducing stock during slow periods', 'Assuming every week looks like a peak week', 'Catching up on bookkeeping during slow times', 'Planning for future peaks during slow periods'], 1, 'Treating a slow period as if it were a peak leads to overspending and unnecessary tied-up capital.'),
        _q('How can slow periods be reframed, according to this lesson?', ['As purely frustrating and useless', 'As useful preparation time for productive, non-customer-facing tasks', 'As a sign the business has failed', 'As identical to peak periods'], 1, 'A positive reframe turns quiet stretches into valuable time for tasks that support the business long-term.'),
        _q('What is an example of a task suited to slow periods?', ['Handling a large customer queue', 'Reviewing vendor terms', 'Managing peak-hour cash float', 'Serving high volumes of walk-in customers'], 1, 'Lower-traffic administrative and planning tasks fit naturally into quieter business periods.'),
        _q('What is the overall message of this lesson?', ['Slow periods should be ignored entirely', 'Plan deliberately for slow periods too, both financially and productively', 'Only peak periods matter for planning', 'Slow periods always indicate business failure'], 1, 'The lesson balances the earlier peak-focused planning with equally deliberate slow-period planning.'),
      ]),
    _lesson('c22', 4, 'Adjusting Pricing and Offers Seasonally', 5, [
      'Some businesses can thoughtfully adjust pricing or promotions around seasonal patterns — a small peak-period premium where demand genuinely supports it, or a slow-period promotion to stimulate otherwise quiet demand. This requires care: peak-period price gouging can damage trust, while poorly timed discounts can erode margin without actually driving meaningful extra volume.',
      'Test seasonal adjustments cautiously and track the results using your bookkeeping habits from earlier lessons — did a slow-period promotion actually generate enough extra volume to be worthwhile, or did it just discount sales that would have happened anyway at full price?',
    ], concepts: [KeyConcept('Test and Measure Seasonal Pricing Changes', 'Any seasonal pricing adjustment should be tested cautiously and measured against your bookkeeping records, not assumed to work.')],
      steps: ['Consider whether any seasonal pricing or promotion adjustment makes sense for your business.', 'If you try one, plan how you\'ll measure whether it actually drove meaningful extra volume.'],
      takeaways: ['Seasonal pricing adjustments can work but require care to avoid damaging trust or margin.', 'Peak-period price gouging risks customer trust; poorly timed discounts can erode margin without real benefit.', 'Test any seasonal pricing change cautiously and measure results using your bookkeeping records.'],
      quiz: [
        _q('Can seasonal pricing adjustments be beneficial?', ['No, pricing should never change', 'Yes, when done thoughtfully and tested carefully', 'Only large businesses can adjust pricing', 'Seasonal pricing is illegal'], 1, 'Thoughtful, well-tested seasonal adjustments can genuinely benefit a business when done carefully.'),
        _q('What is a risk of peak-period price gouging?', ['No risk at all', 'Damaging customer trust', 'Guaranteed increased loyalty', 'Automatic higher long-term profit'], 1, 'Exploiting peak demand with excessive pricing can seriously damage the trust customers have in you.'),
        _q('What is a risk of a poorly timed slow-period discount?', ['No risk at all', 'Eroding margin without actually driving meaningful extra volume', 'Guaranteed increased sales volume', 'Improved customer trust automatically'], 1, 'A discount that doesn\'t genuinely stimulate new demand just reduces margin on sales that would have happened anyway.'),
        _q('What should be used to measure whether a seasonal pricing change worked?', ['Guesswork', 'Your bookkeeping records from earlier lessons', 'Random assumption', 'Ignoring the results entirely'], 1, 'Concrete records let you objectively assess whether the change actually achieved its intended effect.'),
        _q('What should guide any seasonal pricing test?', ['Aggressive, permanent changes with no testing', 'Careful, cautious testing with measured results', 'Random pricing changes with no plan', 'Copying a competitor exactly without thought'], 1, 'A careful, measured approach avoids the risks of both gouging and unprofitable discounting.'),
        _q('What question should a slow-period promotion honestly answer?', ['Nothing needs to be evaluated', 'Did it generate genuinely new volume, or just discount sales that would have happened anyway?', 'Was it the cheapest possible discount?', 'Did competitors notice the promotion?'], 1, 'This honest evaluation determines whether the promotion actually created real additional value.'),
        _q('What connects this lesson to earlier course content?', ['Nothing connects them', 'The bookkeeping habit used to measure whether a pricing change actually worked', 'Sub-agent network management', 'Loan repayment habits'], 1, 'The measurement approach here relies directly on the recordkeeping habits built in earlier lessons.'),
        _q('What is the overall message of this lesson?', ['Never adjust pricing seasonally', 'Adjust seasonal pricing thoughtfully and measure results carefully rather than assuming it works', 'Always discount heavily during slow periods', 'Pricing should be identical year-round with no exceptions'], 1, 'The lesson provides a careful, evidence-based approach to seasonal pricing decisions.'),
      ]),
    _lesson('c22', 5, 'Building a Year-Round Seasonal Calendar', 5, [
      'Bringing everything together: build a simple year-round calendar marking your known peaks, known slow periods, and the lead time needed to prepare for each. This turns seasonal planning from an annual scramble into a predictable, repeatable rhythm you refine every year.',
      'Review and update this calendar annually — patterns can shift as your business, location, or customer base changes, and each year\'s actual results (tracked through your bookkeeping) refine your predictions for the following year, making your planning progressively more accurate over time.',
    ], concepts: [KeyConcept('A Living Yearly Calendar', 'A seasonal calendar, reviewed and refined annually with real results, becomes progressively more accurate and valuable over time.')],
      steps: ['Build a simple calendar marking your known peaks, slow periods, and prep lead times.', 'Set a yearly reminder to review and refine this calendar based on that year\'s actual results.'],
      takeaways: ['Build a simple year-round calendar of known peaks, slow periods, and prep lead times.', 'This turns seasonal planning into a predictable, repeatable rhythm.', 'Review and refine the calendar annually as patterns shift and results accumulate.'],
      quiz: [
        _q('What is suggested as the final, combining step of this course?', ['Ignoring seasonal patterns going forward', 'Building a simple year-round seasonal calendar', 'Avoiding any further planning', 'Relying purely on memory each year'], 1, 'A written calendar consolidates everything learned into a practical, ongoing planning tool.'),
        _q('What should the calendar mark?', ['Nothing specific', 'Known peaks, slow periods, and the lead time needed to prepare for each', 'Only holidays unrelated to your business', 'Random dates with no pattern'], 1, 'These three elements give you a complete, actionable seasonal planning reference.'),
        _q('What does this calendar turn seasonal planning into?', ['An annual scramble', 'A predictable, repeatable rhythm', 'A one-time task never revisited', 'An impossible, unpredictable challenge'], 1, 'A structured calendar replaces reactive scrambling with proactive, repeatable preparation.'),
        _q('How often should the calendar be reviewed and updated?', ['Never, once created it is final', 'Annually', 'Every single day', 'Only if the business fails'], 1, 'Yearly review keeps the calendar accurate as real patterns and business circumstances evolve.'),
        _q('What can cause seasonal patterns to shift over time?', ['Nothing, patterns are permanently fixed', 'Changes in your business, location, or customer base', 'Only random chance with no cause', 'Patterns never actually change'], 1, 'Real changes in your business context can shift what counts as a peak or slow period.'),
        _q('What helps refine the calendar\'s accuracy each year?', ['Ignoring past results entirely', 'That year\'s actual results, tracked through bookkeeping', 'Random guessing each year anew', 'Copying a competitor\'s calendar exactly'], 1, 'Real, tracked results from each year progressively sharpen the accuracy of future predictions.'),
        _q('What happens to planning accuracy as this calendar is refined over multiple years?', ['It becomes less accurate over time', 'It becomes progressively more accurate', 'Accuracy stays exactly the same regardless of refinement', 'Refinement has no effect on accuracy'], 1, 'Continuous refinement based on real results steadily improves the calendar\'s predictive value.'),
        _q('What is the overall closing message of this course?', ['Seasonal planning is a one-time task', 'A living, annually refined seasonal calendar turns demand planning into a sustainable, improving practice', 'Seasonal patterns should be ignored once identified', 'Only peak periods deserve ongoing attention'], 1, 'The course closes by tying together pattern recognition, peak/slow planning, and pricing into one ongoing practice.'),
      ]),
  ],
);

final Course _course23 = Course(
  id: 'c23', title: 'Fraud & Scam Prevention for Agents',
  description: 'Protecting yourself from fake alerts, chargebacks, and con customers targeting agent businesses specifically.',
  category: 'Business Skills', difficulty: Difficulty.intermediate,
  icon: Icons.security_rounded, durationMinutes: 130, order: 23,
  lessons: [
    _lesson('c23', 1, 'Why Agents Are Common Fraud Targets', 5, [
      'Agent businesses — POS, airtime, data resellers — handle cash and process transactions constantly under time pressure, which makes them attractive targets for scammers who exploit exactly that pressure. Understanding that you are a deliberate target, not just an occasional unlucky victim, changes how seriously you take prevention.',
      'Common scam categories include fake payment alerts (a fraudulent SMS or app notification designed to look like a real payment confirmation), social engineering (a scammer building false trust before asking for something), and outright card/PIN fraud. Each requires a different specific defense, covered across this course.',
    ], concepts: [KeyConcept('You Are a Deliberate Target', 'Agents handling constant cash and transactions under time pressure are specifically targeted by scammers, not just occasionally unlucky.')],
      steps: ['Reflect on whether you\'ve personally encountered any of the scam categories mentioned before.', 'Commit to treating fraud prevention as an ongoing priority, not a one-time concern.'],
      takeaways: ['Agent businesses are deliberately targeted by scammers due to cash handling and time pressure.', 'Common scam categories include fake payment alerts, social engineering, and card/PIN fraud.', 'Each fraud type requires a specific, tailored defense.'],
      quiz: [
        _q('Why are agent businesses commonly targeted by scammers?', ['They are never targeted', 'They handle constant cash and transactions under time pressure', 'Agents have no money at all', 'Scammers only target large corporations'], 1, 'The combination of cash handling and time pressure makes agents an attractive target for exploitation.'),
        _q('What is a "fake payment alert"?', ['A real bank notification', 'A fraudulent SMS or app notification designed to look like a real payment confirmation', 'A type of loan', 'A government tax notice'], 1, 'These fake alerts try to trick agents into believing a payment was made when it wasn\'t.'),
        _q('What is "social engineering" in this context?', ['A type of construction work', 'A scammer building false trust before asking for something', 'A government program', 'A legitimate business partnership'], 1, 'Social engineering exploits trust and human psychology rather than technical vulnerabilities.'),
        _q('Should agents view themselves as deliberate targets or just occasionally unlucky?', ['Occasionally unlucky victims only', 'Deliberate targets, which changes how seriously prevention is taken', 'Fraud is not a real concern for agents', 'Only large businesses are real targets'], 1, 'Recognizing deliberate targeting motivates taking prevention seriously as an ongoing priority.'),
        _q('Do all fraud types require the same defense?', ['Yes, one defense covers everything', 'No, each type requires a specific, tailored defense', 'Defense is unnecessary regardless of type', 'Only card fraud requires any defense'], 1, 'Different scam categories exploit different vulnerabilities and need correspondingly different countermeasures.'),
        _q('What category involves outright unauthorized card or PIN use?', ['Social engineering', 'Card/PIN fraud', 'Fake payment alerts', 'Seasonal demand planning'], 1, 'This is a distinct, direct fraud category involving unauthorized card or PIN access.'),
        _q('What mindset does this lesson recommend adopting?', ['Complacency about fraud risk', 'Treating fraud prevention as an ongoing priority', 'Ignoring fraud entirely since it is rare', 'Assuming fraud only happens to others'], 1, 'An ongoing, serious approach to prevention is recommended given the deliberate targeting agents face.'),
        _q('What is the overall purpose of this opening lesson?', ['To discourage running an agent business', 'To establish why agents are targeted and introduce the main fraud categories covered in this course', 'To suggest fraud prevention is unnecessary', 'To recommend avoiding all customer transactions'], 1, 'The lesson sets the stage for the specific prevention strategies covered in the rest of the course.'),
      ]),
    _lesson('c23', 2, 'Spotting Fake Payment Alerts', 5, [
      'Fake payment alert scams typically involve a scammer showing you a screenshot or fake SMS claiming a payment was made, pressuring you to hand over cash or goods before you\'ve verified the money actually landed in your account. The pressure and urgency are deliberate — scammers want you to act before you check.',
      'The defense is simple and non-negotiable: always verify directly in your own banking app or vendor dashboard, never trust a screenshot, SMS, or verbal claim from the customer alone. If verification takes a moment, let it take a moment — a legitimate customer will understand; a scammer will often get impatient or leave.',
    ], concepts: [KeyConcept('Verify in Your Own System, Never Theirs', 'Never trust a customer\'s screenshot or SMS as proof of payment — always check your own banking app or dashboard directly.')],
      steps: ['Practice your verification routine: checking your own app/dashboard before releasing goods or cash.', 'Notice how a scammer might react to being asked to wait for verification, versus a real customer.'],
      takeaways: ['Fake payment alerts use urgency and pressure to get you to act before verifying.', 'Always verify payment in your own banking app or dashboard, never trust the customer\'s claim alone.', 'A scammer often reacts with impatience to a request to simply wait for verification.'],
      quiz: [
        _q('What do fake payment alert scams typically involve?', ['A verified bank transaction', 'A fake screenshot or SMS claiming payment was made', 'A legitimate payment confirmation', 'A government notice'], 1, 'Scammers fabricate evidence of payment to trick agents into releasing goods or cash prematurely.'),
        _q('What is the deliberate goal of pressure and urgency in this scam?', ['To help the agent verify faster', 'To get the agent to act before checking', 'To build genuine trust over time', 'To comply with banking regulations'], 1, 'Urgency is a deliberate tactic to bypass the agent\'s normal verification process.'),
        _q('Where should payment verification always happen?', ['In the customer\'s screenshot', 'In your own banking app or vendor dashboard', 'Based on the customer\'s verbal claim alone', 'Nowhere, verification is unnecessary'], 1, 'Your own systems are the only reliable source of truth for whether a payment actually arrived.'),
        _q('Should you trust an SMS shown by the customer as proof of payment?', ['Yes, always trust it', 'No, always verify independently in your own system', 'Only trust it if it looks official', 'SMS screenshots are always accurate'], 1, 'SMS and screenshots can be easily faked, so independent verification is essential.'),
        _q('How might a scammer react to being asked to wait for verification?', ['They calmly and happily wait', 'They often become impatient or leave', 'They immediately pay double', 'They report you to authorities'], 1, 'Impatience with a reasonable verification request is itself a warning sign of a scam attempt.'),
        _q('How should a legitimate customer typically react to a verification wait?', ['With impatience and anger', 'With understanding, since it is a reasonable request', 'By leaving immediately', 'By becoming aggressive'], 1, 'Genuine customers generally understand and accept a brief, reasonable verification delay.'),
        _q('What is the core defense against fake payment alerts?', ['Trusting customer claims to save time', 'Always verifying directly in your own system before releasing anything', 'Ignoring all payment confirmations', 'Accepting screenshots as sufficient proof'], 1, 'Independent verification is the single most important defense against this specific scam type.'),
        _q('What is the overall message of this lesson?', ['Trust customer-provided proof of payment', 'Always verify payments independently, regardless of pressure or urgency', 'Fake payment alerts are not a real threat', 'Verification wastes valuable time unnecessarily'], 1, 'The lesson provides a clear, actionable defense against one of the most common agent-targeted scams.'),
      ]),
    _lesson('c23', 3, 'Recognizing Social Engineering Attempts', 5, [
      'Social engineering scams build trust gradually — a "customer" who visits repeatedly, becomes friendly, perhaps buys small amounts legitimately several times, before eventually asking for a larger favor: extending credit, bypassing a normal verification step, or handling an unusual transaction "just this once."',
      'The defense here is maintaining consistent process regardless of relationship warmth. Being friendly with regular customers is good business, but your core verification and transaction rules should apply the same way to everyone, every time — a scammer specifically exploits the exception you\'d make for someone who seems trustworthy.',
    ], concepts: [KeyConcept('Consistent Process, Regardless of Relationship', 'Social engineering exploits the exceptions you\'d make for someone who seems trustworthy — apply your core rules to everyone, every time.')],
      steps: ['Reflect on whether you\'ve ever made a process exception for a "trusted" regular customer.', 'Commit to keeping core verification steps consistent for every customer, regardless of familiarity.'],
      takeaways: ['Social engineering builds trust gradually before requesting a larger, rule-bending favor.', 'The defense is maintaining consistent process regardless of relationship warmth.', 'Scammers specifically exploit the exceptions made for people who seem trustworthy.'],
      quiz: [
        _q('How do social engineering scams typically build?', ['Immediately, with no relationship building', 'Gradually, building trust before asking for a larger favor', 'Through official government channels', 'Through anonymous, one-time interactions only'], 1, 'This scam type relies on patiently building apparent trust before exploiting it.'),
        _q('What kind of favor might a social engineering scammer eventually request?', ['A completely unrelated topic', 'Extending credit or bypassing normal verification "just this once"', 'A public compliment', 'Nothing specific is ever requested'], 1, 'The eventual ask typically involves bending a normal safeguard based on the built-up trust.'),
        _q('What is the recommended defense against social engineering?', ['Being cold to all customers', 'Maintaining consistent process regardless of relationship warmth', 'Making exceptions for friendly regulars', 'Ignoring all repeat customers'], 1, 'Applying your core rules uniformly removes the specific vulnerability this scam type exploits.'),
        _q('Is being friendly with regular customers discouraged?', ['Yes, friendliness should be avoided entirely', 'No, friendliness is good business, but process should stay consistent', 'Friendliness always leads to fraud', 'Regular customers should be treated coldly'], 1, 'Warmth and consistent process aren\'t mutually exclusive — you can be friendly while still applying the same rules.'),
        _q('What specifically do scammers exploit in this scam type?', ['Random chance', 'The exception you\'d make for someone who seems trustworthy', 'Government regulation gaps', 'Technical system failures'], 1, 'The core vulnerability is the natural tendency to relax rules for someone who has built apparent trust.'),
        _q('What is an example of a rule-bending request in this scam?', ['Paying full price on time', 'Bypassing a normal verification step "just this once"', 'Following standard procedure exactly', 'Declining a transaction entirely'], 1, 'This kind of specific, one-time exception request is a hallmark of social engineering.'),
        _q('What should you reflect on, according to this lesson\'s practical step?', ['Nothing in particular', 'Whether you\'ve ever made a process exception for a trusted regular', 'Your favorite customer\'s name', 'Unrelated business topics'], 1, 'Honest self-reflection helps identify past vulnerabilities and reinforce future consistency.'),
        _q('What is the overall message of this lesson?', ['Trust built over time should always be rewarded with exceptions', 'Apply consistent verification rules to everyone, regardless of built-up trust or friendliness', 'Social engineering is not a real threat to agents', 'Avoid all repeat customer relationships'], 1, 'The lesson defends against a scam type that specifically exploits relationship-based trust.'),
      ]),
    _lesson('c23', 4, 'Handling Card and PIN Fraud Attempts', 5, [
      'Card and PIN fraud involves someone attempting to use a card that isn\'t theirs, or trying to manipulate the PIN entry process. Warning signs include a customer who seems nervous, reads a PIN from a written note rather than recalling it, or insists on entering the PIN in an unusual or obscured way.',
      'Your standing rules — customer enters their own PIN always, watch for nervous or scripted behavior, and don\'t hesitate to decline a transaction that feels wrong even without concrete proof — protect you here. Trusting your instinct alongside these concrete rules is a legitimate part of fraud prevention, not overreaction.',
    ], concepts: [KeyConcept('Instinct Plus Rules, Together', 'Concrete rules (customer enters their own PIN) combined with trusting your instinct when something feels wrong form a strong defense.')],
      steps: ['Review your personal PIN-entry rule and confirm you apply it without exception.', 'Practice mentally rehearsing how you\'d decline a transaction that feels wrong, even without concrete proof.'],
      takeaways: ['Nervousness, scripted PIN entry, or unusual insistence on PIN handling are fraud warning signs.', 'Customers should always enter their own PIN, without exception.', 'Trusting your instinct to decline a transaction that feels wrong is legitimate, not overreaction.'],
      quiz: [
        _q('What does card and PIN fraud typically involve?', ['A customer using their own card normally', 'Someone attempting to use a card that isn\'t theirs, or manipulating PIN entry', 'A legitimate bank transaction', 'A government-issued payment'], 1, 'This fraud type centers on unauthorized card use or attempts to bypass proper PIN verification.'),
        _q('What is a warning sign related to PIN entry?', ['Confidently entering a memorized PIN', 'Reading a PIN from a written note', 'Declining to use a card at all', 'Using a card normally without issue'], 1, 'Needing to read a PIN from a note, rather than recalling it, is a common fraud indicator.'),
        _q('What is the standing rule for who enters the PIN?', ['The agent should enter it for speed', 'The customer should always enter their own PIN', 'Either person can enter it', 'PINs should never be used at all'], 1, 'Customer-entered PINs are a core, non-negotiable fraud safeguard.'),
        _q('Is it acceptable to decline a transaction based on instinct alone, without concrete proof?', ['No, only concrete proof justifies declining', 'Yes, trusting instinct alongside concrete rules is legitimate fraud prevention', 'Declining transactions is never acceptable', 'Instinct should always be ignored'], 1, 'Instinct, combined with established rules, is a valid and important part of protecting yourself from fraud.'),
        _q('What is an example of unusual PIN-handling behavior to watch for?', ['Standard, normal PIN entry', 'Insisting on entering the PIN in an unusual or obscured way', 'Declining to make a purchase', 'Asking a clarifying question about a product'], 1, 'Unusual insistence around how the PIN is entered can signal an attempt to manipulate the process.'),
        _q('What combination does this lesson recommend for fraud defense?', ['Rules alone, ignoring instinct entirely', 'Concrete rules combined with trusting your instinct', 'Instinct alone, ignoring all rules', 'Neither rules nor instinct matter'], 1, 'Both structured rules and personal instinct work together as an effective combined defense.'),
        _q('What should you do if something about a transaction feels wrong, even without proof?', ['Proceed anyway to avoid awkwardness', 'Don\'t hesitate to decline the transaction', 'Ignore your instinct entirely', 'Always complete the transaction regardless'], 1, 'The lesson explicitly validates declining a transaction based on genuine unease, even without hard proof.'),
        _q('What is the overall goal of this lesson?', ['To eliminate the need for any fraud awareness', 'To equip you with concrete warning signs and the confidence to act on instinct alongside your rules', 'To discourage using card transactions at all', 'To suggest fraud prevention is unnecessary here'], 1, 'The lesson combines specific warning signs with permission to trust your judgment in ambiguous situations.'),
      ]),
    _lesson('c23', 5, 'Building an Ongoing Fraud-Awareness Habit', 5, [
      'Fraud tactics evolve over time, so a set of rules learned once isn\'t enough forever — staying aware of new scam patterns (through conversations with other agents, provider warnings, or news) keeps your defenses current rather than static and eventually outdated.',
      'Combine this awareness with the documentation habits from earlier lessons (transaction logs, confirmation discipline) — good records not only help you avoid fraud in the moment, they also protect you if you need to dispute a reversal or prove a transaction was handled correctly after the fact.',
    ], concepts: [KeyConcept('Fraud Tactics Evolve — So Should Your Awareness', 'Static, one-time-learned rules become outdated as scam tactics evolve — ongoing awareness keeps your defenses current.')],
      steps: ['Identify one source (other agents, provider updates, news) you\'ll use to stay current on new scam tactics.', 'Confirm your documentation habits from earlier lessons are solid enough to support you if fraud does occur.'],
      takeaways: ['Fraud tactics evolve, so ongoing awareness matters more than a fixed, one-time set of rules.', 'Stay current through conversations with other agents, provider warnings, or news.', 'Combine awareness with solid documentation habits for the strongest overall protection.'],
      quiz: [
        _q('Do fraud tactics stay the same over time?', ['Yes, they never change', 'No, they evolve over time', 'Fraud tactics are entirely random with no pattern', 'Only technology changes, not tactics'], 1, 'Scammers adapt their methods, making a fixed, unchanging set of defenses eventually insufficient.'),
        _q('What is suggested to stay current on new scam patterns?', ['Ignoring the topic once initial rules are learned', 'Conversations with other agents, provider warnings, or news', 'Assuming your original training covers everything forever', 'Avoiding any further learning on this topic'], 1, 'These ongoing information sources help keep your fraud awareness current and relevant.'),
        _q('What earlier course habits combine well with fraud awareness?', ['Nothing from earlier courses applies', 'Transaction logs and confirmation discipline', 'Sub-agent network management only', 'Seasonal demand planning only'], 1, 'Documentation habits directly support both prevention and after-the-fact protection if fraud occurs.'),
        _q('What benefit do good records provide beyond in-the-moment fraud prevention?', ['No additional benefit', 'They help you dispute a reversal or prove a transaction was handled correctly', 'They have no relevance to fraud at all', 'They only matter for tax purposes'], 1, 'Solid documentation supports you both during prevention and in any later dispute process.'),
        _q('Why is a "learned once" set of rules insufficient long-term?', ['Rules never need updating once learned', 'Because fraud tactics evolve and static rules become outdated', 'Learning fraud prevention once is always sufficient', 'This statement is inaccurate'], 1, 'Ongoing vigilance is necessary because scammers continuously develop new approaches over time.'),
        _q('What is the overall combined defense this lesson recommends?', ['Rules alone, learned once and never revisited', 'Ongoing awareness combined with solid documentation habits', 'Documentation alone, without any awareness', 'Neither awareness nor documentation matter'], 1, 'The strongest protection comes from combining continuously updated awareness with consistent record-keeping.'),
        _q('What is a practical source mentioned for staying updated on scams?', ['Random unrelated topics', 'Other agents and provider warnings', 'Ignoring all outside information', 'Personal assumption alone'], 1, 'Peer agents and official provider communications are practical, relevant sources for staying current.'),
        _q('What is the overall closing message of this course?', ['Fraud prevention is a one-time task', 'Ongoing awareness and solid documentation together provide the strongest, most sustainable protection against fraud', 'Only initial training matters for fraud prevention', 'Fraud tactics never change over time'], 1, 'The course closes by connecting all its lessons into one ongoing, evolving practice rather than a fixed checklist.'),
      ]),
  ],
);

final Course _course24 = Course(
  id: 'c24', title: 'Setting Prices That Actually Make Profit',
  description: 'Beyond the calculator — the psychology and strategy of pricing so your numbers actually protect your margin.',
  category: 'Business Skills', difficulty: Difficulty.intermediate,
  icon: Icons.price_change_rounded, durationMinutes: 130, order: 24,
  lessons: [
    _lesson('c24', 1, 'Why "Charging What Feels Fair" Often Loses Money', 5, [
      'Many small business owners set prices based on gut feeling — what seems fair, what they think customers will accept, what a competitor charges — without actually calculating whether that price covers costs and leaves a genuine profit. This can feel reasonable in the moment while quietly losing money on every sale.',
      'Pricing based on feeling ignores a hard truth: your costs are specific numbers, not feelings, and your price needs to cover them with room left over. A price that "feels fair" but doesn\'t clear your actual costs is a slow, invisible way to lose money while staying busy.',
    ], concepts: [KeyConcept('Costs Are Numbers, Not Feelings', 'A price that "feels fair" is worthless if it doesn\'t mathematically clear your actual costs with room for profit.')],
      steps: ['Pick one product or service and honestly check: does your current price cover all associated costs?', 'Reflect on whether any of your prices were set purely on gut feeling.'],
      takeaways: ['Pricing based purely on feeling can quietly lose money while feeling reasonable.', 'Costs are specific numbers your price needs to cover, not something to estimate by feel.', 'A price that "feels fair" but doesn\'t clear costs is a slow way to lose money.'],
      quiz: [
        _q('What is a common but risky way small business owners set prices?', ['Careful cost calculation', 'Gut feeling about what seems fair', 'Detailed competitor cost analysis', 'Government-mandated pricing'], 1, 'Feeling-based pricing skips the actual math needed to ensure a price is genuinely profitable.'),
        _q('What can feeling-based pricing quietly cause?', ['Guaranteed higher profit', 'Losing money on every sale while feeling reasonable', 'No effect on profitability', 'Automatic price optimization'], 1, 'A price that feels fair but doesn\'t cover real costs can drain profit without being obvious in the moment.'),
        _q('Are costs subjective or objective, according to this lesson?', ['Subjective, based on feeling', 'Objective, specific numbers that must be covered', 'Costs don\'t need to be considered', 'Costs are irrelevant to pricing'], 1, 'Costs are concrete figures your price needs to mathematically clear, regardless of how the price "feels."'),
        _q('What is the risk of a price that "feels fair" but doesn\'t clear costs?', ['No risk at all', 'A slow, invisible way to lose money while staying busy', 'Guaranteed business growth', 'Automatic profit increase'], 1, 'This kind of pricing mistake can persist unnoticed while eroding the business\'s actual financial health.'),
        _q('What should pricing actually be based on, according to this lesson?', ['Pure gut feeling', 'Real costs, with a calculated margin on top', 'Random guessing', 'Only what feels comfortable to charge'], 1, 'Sound pricing starts from real cost figures, not subjective impressions of fairness.'),
        _q('What practical check is suggested in this lesson?', ['Ignoring your current prices entirely', 'Checking whether your current price actually covers all associated costs', 'Raising all prices immediately without analysis', 'Copying a competitor\'s price exactly'], 1, 'A direct check against real costs reveals whether your current pricing is actually sound.'),
        _q('What is the danger of pricing that "feels reasonable"?', ['It is always accurate', 'It can mask an underlying loss on every sale', 'It guarantees profitability', 'There is no danger at all'], 1, 'Subjective comfort with a price says nothing about whether it\'s actually mathematically profitable.'),
        _q('What is the overall purpose of this opening lesson?', ['To discourage setting any prices', 'To highlight the risk of feeling-based pricing and set up the need for calculated pricing', 'To suggest costs don\'t matter', 'To recommend copying competitors exactly'], 1, 'The lesson establishes why the more rigorous approach covered in later lessons actually matters.'),
      ]),
    _lesson('c24', 2, 'Calculating Your True Cost Before Setting Price', 5, [
      'Your true cost includes more than the obvious purchase price of what you\'re reselling — it includes your time, any transaction fees, transport or delivery costs, and a fair share of your fixed overhead (rent, data, float opportunity cost) spread across your sales volume.',
      'Missing any of these hidden costs means your price looks profitable on paper while actually barely covering (or failing to cover) your real total cost. Building a complete cost picture, even roughly, is the foundation every good price sits on top of.',
    ], concepts: [KeyConcept('True Cost Includes the Hidden Pieces', 'Beyond the obvious purchase price, true cost includes time, fees, transport, and a fair share of overhead — missing these means underpricing without realizing it.')],
      steps: ['List every cost component for one product/service, including the easy-to-forget ones (time, fees, overhead share).', 'Add these up to find your true total cost per unit or per transaction.'],
      takeaways: ['True cost includes purchase price plus time, fees, transport, and a share of fixed overhead.', 'Missing hidden costs means your price may look profitable while actually barely covering real cost.', 'A complete cost picture is the necessary foundation for any good pricing decision.'],
      quiz: [
        _q('What does "true cost" include beyond the obvious purchase price?', ['Nothing else matters', 'Time, transaction fees, transport, and a share of fixed overhead', 'Only competitor pricing', 'Only your personal preference'], 1, 'A complete cost picture requires accounting for all these often-overlooked components.'),
        _q('What can happen if hidden costs are missed in pricing?', ['Pricing automatically improves', 'A price that looks profitable on paper while barely covering real total cost', 'No effect on the business', 'Costs become irrelevant'], 1, 'Overlooked costs can make an apparently profitable price actually break even or lose money.'),
        _q('What is an example of an easily forgotten cost component?', ['The obvious purchase price', 'A fair share of fixed overhead like rent or data costs', 'The final selling price', 'The customer\'s name'], 1, 'Overhead costs are often spread across sales but easy to forget when calculating a single item\'s true cost.'),
        _q('What is suggested as a practical first step in this lesson?', ['Ignoring cost calculation entirely', 'Listing every cost component, including easy-to-forget ones', 'Setting prices purely by feeling', 'Copying a competitor\'s price directly'], 1, 'A thorough listing exercise ensures no important cost component is accidentally overlooked.'),
        _q('Why does time count as a cost component?', ['Time has no economic value', 'Your time spent has real value that should be reflected in pricing', 'Only physical goods count as costs', 'Time is irrelevant to small businesses'], 1, 'Your time is a genuine resource with value, and pricing should account for the effort involved.'),
        _q('What foundation does a complete cost picture provide?', ['No foundation, it is unnecessary', 'The necessary basis for any good pricing decision', 'A distraction from real business priorities', 'Something only large businesses need'], 1, 'Accurate cost understanding is the essential starting point for setting a genuinely profitable price.'),
        _q('What happens if fixed overhead isn\'t factored into per-unit pricing?', ['Pricing becomes more accurate', 'The price may fail to cover the real cost of running the business overall', 'Overhead costs disappear automatically', 'This has no bearing on profitability'], 1, 'Overhead needs to be recovered through pricing across your sales volume, or it silently erodes profit.'),
        _q('What is the overall goal of this lesson?', ['To avoid calculating costs at all', 'To build a complete, accurate picture of true cost as the foundation for pricing', 'To recommend pricing purely by competitor comparison', 'To suggest cost calculation is optional'], 1, 'The lesson equips you to build the accurate cost foundation that good pricing decisions require.'),
      ]),
    _lesson('c24', 3, 'Choosing a Pricing Strategy That Fits Your Business', 5, [
      'With true cost understood, you can choose a pricing strategy deliberately: cost-plus pricing (a fixed margin added to true cost, simple and reliable), value-based pricing (charging based on the value/convenience the customer receives, which can be higher than pure cost-plus in the right situation), or competitive pricing (matching or slightly undercutting competitors, useful but risky if it ignores your own true cost).',
      'Most small agent businesses do well starting with cost-plus pricing as a floor — never pricing below what covers true cost — and layering in value-based thinking where genuine convenience or service quality justifies a premium, rather than racing competitors to the bottom on price alone.',
    ], concepts: [KeyConcept('Cost-Plus as a Floor, Value as an Opportunity', 'Use cost-plus pricing as your non-negotiable floor, then layer in value-based premiums where genuine convenience justifies it.')],
      steps: ['Decide on your baseline cost-plus margin percentage for your core services.', 'Identify one area where you provide genuine extra value/convenience that could justify a small premium.'],
      takeaways: ['Cost-plus pricing (margin added to true cost) is simple and reliable as a floor.', 'Value-based pricing can justify charging more where genuine convenience or service quality is provided.', 'Competitive pricing (matching competitors) is risky if it ignores your own true cost floor.'],
      quiz: [
        _q('What is cost-plus pricing?', ['Pricing based purely on competitor rates', 'A fixed margin added to your true cost', 'Random price selection', 'Pricing that ignores cost entirely'], 1, 'This straightforward method ensures every price covers cost plus a defined profit margin.'),
        _q('What is value-based pricing?', ['Pricing based only on your cost', 'Charging based on the value or convenience the customer receives', 'Copying a competitor exactly', 'Pricing randomly without logic'], 1, 'This approach can justify a higher price where the customer genuinely values the convenience or service provided.'),
        _q('What is a risk of purely competitive pricing?', ['No risk at all', 'It can ignore your own true cost, risking unprofitable pricing', 'It always guarantees higher profit', 'It has no relationship to true cost'], 1, 'Matching competitors without regard to your own costs can lead to prices that don\'t actually cover your expenses.'),
        _q('What is recommended as a pricing floor for most small agent businesses?', ['No floor is necessary', 'Cost-plus pricing, never pricing below true cost', 'Whatever a competitor charges, regardless of your own costs', 'Random pricing with no baseline'], 1, 'Ensuring cost-plus coverage as a non-negotiable floor protects your margin regardless of other strategy layers.'),
        _q('When can value-based pricing justify a premium?', ['Never, value is irrelevant to pricing', 'Where genuine convenience or service quality is provided', 'Only for large corporations', 'Only when costs are unusually low'], 1, 'Real extra value delivered to the customer is a legitimate basis for pricing above a simple cost-plus baseline.'),
        _q('What does "racing competitors to the bottom" risk?', ['Guaranteed higher profit', 'Pricing that fails to cover true cost in pursuit of matching low competitor prices', 'Improved business sustainability', 'No real risk at all'], 1, 'Chasing the lowest price in the market can push pricing below what\'s actually sustainable for your business.'),
        _q('What combined approach does this lesson recommend?', ['Pure competitive pricing only', 'Cost-plus as a floor, layered with value-based premiums where justified', 'Random pricing with no strategy', 'Ignoring all pricing strategy entirely'], 1, 'Combining a safe cost-plus floor with opportunistic value-based premiums balances safety and opportunity.'),
        _q('What is the overall goal of this lesson?', ['To recommend a single rigid pricing formula', 'To help you deliberately choose and combine pricing strategies that fit your specific business', 'To discourage any pricing strategy at all', 'To suggest pricing should be entirely random'], 1, 'The lesson equips you to make an informed, deliberate choice among pricing strategies rather than defaulting to guesswork.'),
      ]),
    _lesson('c24', 4, 'Communicating Price Without Apologizing for It', 5, [
      'How you communicate a price affects whether customers accept it smoothly or push back. Stating a price confidently and clearly, without over-explaining or apologizing, signals that the price is simply what it is — over-justifying or seeming uncertain can actually invite more negotiation and pushback than a calm, confident statement.',
      'If a customer does push back, having your true-cost reasoning ready (even if you don\'t share every number) lets you hold your price with genuine confidence rather than caving immediately out of social discomfort, which is a common way agents quietly erode their own margins over time.',
    ], concepts: [KeyConcept('Confident Statement, Not Apology', 'Stating a price calmly and clearly invites less pushback than an apologetic or over-explained one.')],
      steps: ['Practice stating your price for a common service in one clear, confident sentence, without over-explaining.', 'Prepare your true-cost reasoning mentally so you can hold your price if a customer pushes back.'],
      takeaways: ['How you communicate a price affects whether customers push back or accept it smoothly.', 'Stating a price confidently and clearly, without over-justifying, tends to invite less pushback.', 'Having your true-cost reasoning ready lets you hold your price with genuine confidence.'],
      quiz: [
        _q('What can affect whether a customer pushes back on a price?', ['Nothing, price communication has no effect', 'How confidently and clearly the price is communicated', 'Only the exact dollar amount, regardless of delivery', 'The customer\'s mood alone'], 1, 'Delivery and confidence in stating a price genuinely influence how it\'s received.'),
        _q('What tends to invite more negotiation and pushback?', ['A calm, confident price statement', 'Over-explaining or seeming uncertain about the price', 'Stating the price clearly once', 'Having reasoning ready but unstated'], 1, 'Apologetic or over-justified pricing can signal uncertainty, inviting customers to push for a lower price.'),
        _q('What is recommended when stating a price?', ['Apologizing extensively for the cost', 'Stating it confidently and clearly without over-explaining', 'Avoiding stating the price at all', 'Constantly second-guessing yourself aloud'], 1, 'A calm, direct statement signals that the price is simply the price, reducing unnecessary pushback.'),
        _q('What helps you hold your price if a customer pushes back?', ['Nothing can help in this situation', 'Having your true-cost reasoning ready, even if unshared', 'Immediately caving to any pressure', 'Avoiding the conversation entirely'], 1, 'Internal confidence from understanding your true costs supports holding firm respectfully.'),
        _q('What is a common way agents quietly erode their own margins?', ['Holding prices firmly and confidently', 'Caving immediately to pushback out of social discomfort', 'Calculating true costs carefully', 'Communicating prices clearly'], 1, 'Discomfort-driven concessions, repeated over many transactions, can significantly erode overall margin.'),
        _q('Do you need to share every cost detail with a pushing-back customer?', ['Yes, always share every number', 'No, having the reasoning ready internally is enough to hold the price confidently', 'Sharing costs is required by law', 'Cost details are irrelevant to this conversation'], 1, 'Internal confidence from your own cost understanding, not necessarily full disclosure, is what supports holding the price.'),
        _q('What is a practical exercise suggested in this lesson?', ['Avoiding price conversations entirely', 'Practicing stating a price in one clear, confident sentence', 'Over-explaining every price extensively', 'Randomizing your prices'], 1, 'Practicing concise, confident delivery builds the skill needed for real customer interactions.'),
        _q('What is the overall message of this lesson?', ['Prices should always be apologized for', 'Confident, clear price communication, backed by true-cost reasoning, protects your margin', 'Price communication has no real impact', 'Always cave to customer pushback immediately'], 1, 'The lesson connects pricing calculation to the practical skill of actually holding that price in conversation.'),
      ]),
    _lesson('c24', 5, 'Reviewing and Adjusting Prices Over Time', 5, [
      'Prices shouldn\'t be set once and forgotten. Costs change (vendor rates shift, rent increases), and your own value proposition may improve (better service, more reliability) — periodically reviewing whether your prices still reflect your true costs and value keeps your margin healthy over time.',
      'When you do need to raise a price, communicate the change clearly and, where relevant, connect it to a real reason (rising costs, improved service) rather than leaving customers to guess — most reasonable customers accept a clearly explained, modest price change far better than a silent, unexplained one.',
    ], concepts: [KeyConcept('Prices Need Periodic Review, Not a Set-and-Forget Approach', 'Costs and value both change over time — periodic price review keeps your margin healthy rather than quietly eroding.')],
      steps: ['Set a periodic reminder (e.g. every few months) to review whether your prices still reflect true costs.', 'If a price increase is needed, plan how you\'ll clearly communicate the reason to customers.'],
      takeaways: ['Prices shouldn\'t be set once and forgotten — costs and value both change over time.', 'Periodic price review keeps your margin healthy as circumstances shift.', 'Clearly communicated price increases, tied to a real reason, are generally well accepted by reasonable customers.'],
      quiz: [
        _q('Should prices be set once and never revisited?', ['Yes, prices should never change', 'No, prices should be reviewed periodically as costs and value change', 'Only competitors should adjust prices', 'Price review is unnecessary for small businesses'], 1, 'Ongoing review ensures pricing stays aligned with actual costs and value over time.'),
        _q('What can change over time that affects whether a price still makes sense?', ['Nothing ever changes', 'Vendor rates, rent, and your own value proposition', 'Only the weather', 'Government holidays'], 1, 'These real, evolving factors mean a price that made sense before may need adjustment later.'),
        _q('What should accompany a price increase, according to this lesson?', ['No communication at all', 'A clear explanation connected to a real reason', 'An apology with no explanation', 'Silence, letting customers guess'], 1, 'Clear, reasoned communication helps customers understand and accept a price change more readily.'),
        _q('How do reasonable customers typically respond to a clearly explained, modest price increase?', ['With immediate rejection regardless of explanation', 'Generally accepting it better than an unexplained, silent change', 'They never notice price changes', 'They always leave immediately'], 1, 'Transparency and reasoning tend to improve customer acceptance of a necessary price adjustment.'),
        _q('What is an example of a real reason for a price increase?', ['Random preference with no basis', 'Rising costs or improved service quality', 'Wanting more money with no justification', 'Copying a competitor\'s unrelated price change'], 1, 'Genuine, communicable reasons like rising costs give customers a legitimate basis for understanding the change.'),
        _q('What happens if pricing is never reviewed as costs rise?', ['Margin stays perfectly healthy automatically', 'Margin can quietly erode as costs increase while price stays flat', 'Nothing changes regarding profitability', 'Costs automatically adjust themselves'], 1, 'Without review, rising costs against a static price gradually shrink your actual profit margin.'),
        _q('What is suggested as a practical review cadence?', ['Never', 'Periodically, such as every few months', 'Only once in the business\'s entire lifetime', 'Daily, which is excessive'], 1, 'A periodic, manageable cadence keeps pricing current without being an overwhelming constant task.'),
        _q('What is the overall closing message of this course?', ['Set a price once and never think about it again', 'Deliberate cost-based pricing, confident communication, and periodic review together protect your margin over time', 'Pricing has no real connection to business health', 'Prices should always match competitors exactly'], 1, 'The course closes by tying together cost calculation, strategy, communication, and ongoing review into one complete pricing practice.'),
      ]),
  ],
);

final Course _course25 = Course(
  id: 'c25', title: 'Building Customer Loyalty & Repeat Business',
  description: 'Turning one-time buyers into regulars — the habits that make customers choose you again without thinking twice.',
  category: 'Business Skills', difficulty: Difficulty.beginner,
  icon: Icons.favorite_rounded, durationMinutes: 130, order: 25,
  lessons: [
    _lesson('c25', 1, 'Why Repeat Customers Are More Valuable Than New Ones', 5, [
      'Acquiring a new customer costs effort — location, visibility, first impressions all have to work before someone even considers using you. A returning customer has already cleared all of that; they know where you are, trust you enough to come back, and typically transact faster and with less friction than a first-time customer.',
      'A business built primarily on constant new-customer acquisition, with few repeat customers, is working much harder than it needs to for the same revenue. Loyalty isn\'t just a nice feeling — it\'s a genuine efficiency advantage that compounds over time as your regular customer base grows.',
    ], concepts: [KeyConcept('Repeat Customers Are Cheaper to Serve', 'A returning customer has already cleared the trust and awareness hurdles that make acquiring a new customer costly and effortful.')],
      steps: ['Estimate roughly what share of your current customers are repeat versus one-time.', 'Reflect on how a business with more repeat customers would feel different day to day.'],
      takeaways: ['Acquiring a new customer requires effort a returning customer has already cleared.', 'Repeat customers transact faster and with less friction than first-time ones.', 'A business heavy on repeat customers works more efficiently for the same revenue than one constantly chasing new ones.'],
      quiz: [
        _q('What does a returning customer already have that a new customer doesn\'t?', ['Nothing meaningful', 'Established trust and awareness of your business', 'A discount code', 'A different payment method'], 1, 'Repeat customers have already cleared the awareness and trust hurdles new customers still face.'),
        _q('Why do repeat customers often transact faster?', ['They are always in a rush', 'They already know and trust the process', 'They pay less than new customers', 'There is no real difference in speed'], 1, 'Familiarity and established trust reduce the friction typically present in a first-time transaction.'),
        _q('What is a downside of a business relying mainly on constant new-customer acquisition?', ['No downside, this is ideal', 'It works harder than necessary for the same revenue', 'It automatically has higher profit', 'It never needs to focus on service quality'], 1, 'Constantly chasing new customers is more effortful than building and retaining a loyal repeat base.'),
        _q('What compounding advantage does loyalty provide over time?', ['No advantage, loyalty has no real effect', 'A genuine efficiency advantage as the repeat customer base grows', 'It only benefits large corporations', 'Loyalty reduces business efficiency'], 1, 'A growing base of loyal repeat customers steadily reduces the relative effort needed to sustain revenue.'),
        _q('What practical exercise is suggested in this lesson?', ['Ignoring your customer composition', 'Estimating what share of customers are repeat versus one-time', 'Assuming all customers are identical', 'Avoiding any customer analysis'], 1, 'Understanding your current repeat-versus-new customer split is a useful starting point for this course.'),
        _q('Is loyalty described as just a nice feeling?', ['Yes, purely emotional with no practical value', 'No, it is a genuine efficiency advantage', 'Loyalty has no real business value', 'Loyalty only matters for large brands'], 1, 'The lesson frames loyalty as a concrete, practical business advantage, not just a pleasant sentiment.'),
        _q('What effort does a first-time customer still need to go through that a repeat customer doesn\'t?', ['No effort is ever required from new customers', 'Location discovery, visibility, and forming a first impression', 'Repeat customers face more effort than new ones', 'There is no difference between the two'], 1, 'New customers must first discover, trust, and choose you before a transaction even happens.'),
        _q('What is the overall purpose of this opening lesson?', ['To discourage acquiring any new customers', 'To establish why repeat customers are genuinely more valuable and efficient to serve', 'To suggest customer loyalty doesn\'t matter', 'To recommend ignoring customer relationships entirely'], 1, 'The lesson sets up the case for why the loyalty-building strategies in the rest of the course are worth the effort.'),
      ]),
    _lesson('c25', 2, 'Small Consistency Beats Big Gestures', 5, [
      'Loyalty is built less by occasional grand gestures and more by consistent, reliable small things done every time: being where customers expect you to be, treating each transaction with the same quality regardless of how busy you are, and remembering regulars in small ways (a name, a usual preference).',
      'A customer who can reliably predict a good experience with you, every single time, builds trust faster than one who occasionally gets something special but can\'t count on consistent quality. Reliability is the unglamorous foundation loyalty is actually built on.',
    ], concepts: [KeyConcept('Reliability Over Grand Gestures', 'Consistent, predictable good service every time builds loyalty faster than occasional special treatment with inconsistent quality.')],
      steps: ['Identify one small, consistent thing you could do for every customer, every time, starting now.', 'Reflect on whether your service quality varies noticeably based on how busy you are.'],
      takeaways: ['Loyalty is built more by consistent small things than occasional big gestures.', 'Being reliably present and consistent in quality builds trust faster than sporadic special treatment.', 'Reliability, though unglamorous, is the real foundation loyalty is built on.'],
      quiz: [
        _q('What builds loyalty more effectively, according to this lesson?', ['Occasional grand gestures', 'Consistent, reliable small things done every time', 'Random unpredictable treatment', 'Ignoring most customer interactions'], 1, 'Predictable, consistent good service builds trust more reliably than sporadic special treatment.'),
        _q('What is an example of a small consistent loyalty-building habit?', ['Randomly closing early sometimes', 'Remembering regulars in small ways, like their name or usual preference', 'Treating every customer differently based on mood', 'Ignoring repeat customers entirely'], 1, 'Small personal touches, done consistently, meaningfully strengthen customer relationships over time.'),
        _q('What should stay consistent regardless of how busy you are?', ['Nothing needs to stay consistent', 'The quality of each transaction', 'Only your prices', 'Your location, but not your service'], 1, 'Maintaining consistent quality even under pressure is central to building genuine reliability.'),
        _q('What does a customer who can reliably predict a good experience develop?', ['No particular loyalty', 'Trust that builds faster than sporadic special treatment', 'Distrust in your business', 'Indifference toward your service'], 1, 'Predictability itself is a trust-building factor, independent of how impressive any single interaction is.'),
        _q('How is reliability described in this lesson?', ['As unimportant compared to occasional big gestures', 'As the unglamorous foundation loyalty is actually built on', 'As irrelevant to customer relationships', 'As something only large businesses need'], 1, 'The lesson frames consistent reliability as the true, if unexciting, basis of customer loyalty.'),
        _q('What practical step is suggested regarding service quality?', ['Ignoring service consistency entirely', 'Reflecting on whether quality varies based on business volume', 'Only focusing on your busiest hours', 'Avoiding any self-assessment'], 1, 'Honest reflection on quality consistency helps identify where reliability might be slipping.'),
        _q('What is contrasted with "consistent small things" in this lesson?', ['Reliable daily service', 'Occasional grand gestures', 'Nothing is contrasted', 'Consistent pricing'], 1, 'The lesson specifically contrasts steady, small consistency against sporadic, larger gestures.'),
        _q('What is the overall message of this lesson?', ['Big, occasional gestures are the best way to build loyalty', 'Small, consistent reliability builds loyalty more effectively than sporadic special treatment', 'Loyalty cannot be intentionally built', 'Service quality should vary based on how busy you are'], 1, 'The lesson establishes the practical, everyday foundation loyalty actually rests on.'),
      ]),
    _lesson('c25', 3, 'Creating Small Moments of Recognition', 5, [
      'Beyond baseline consistency, small moments of genuine recognition — greeting a regular by name, remembering they usually buy a specific data plan, asking how something they mentioned last time turned out — make customers feel seen as individuals rather than processed as transactions.',
      'This doesn\'t require a formal system for most small operators; simple attentiveness and memory go a long way. For a larger customer base where memory alone becomes unreliable, even a simple notebook noting regulars\' names and preferences can support this kind of recognition consistently.',
    ], concepts: [KeyConcept('Recognition Makes Customers Feel Seen', 'Small personal touches — a name, a remembered preference — turn a transaction into a relationship.')],
      steps: ['Start noting the names and preferences of your top 5 regular customers, even informally.', 'Practice one small recognition gesture (using a name, asking a follow-up question) with your next regular customer.'],
      takeaways: ['Small moments of recognition make customers feel seen as individuals, not just transactions.', 'Simple attentiveness and memory are usually enough for most small operators.', 'A simple notebook can support recognition consistently as your regular customer base grows.'],
      quiz: [
        _q('What do small moments of recognition accomplish?', ['Nothing meaningful', 'They make customers feel seen as individuals rather than processed as transactions', 'They slow down business operations unnecessarily', 'They have no effect on customer relationships'], 1, 'Personal recognition transforms a routine transaction into a more meaningful relationship interaction.'),
        _q('What is an example of a recognition gesture mentioned?', ['Ignoring the customer\'s name', 'Greeting a regular by name or remembering their usual order', 'Treating every customer identically with no personalization', 'Avoiding conversation with regulars'], 1, 'These small, specific gestures show genuine attentiveness to a customer as an individual.'),
        _q('Does this require a formal system for most small operators?', ['Yes, always a complex formal system', 'No, simple attentiveness and memory are usually enough', 'Recognition is impossible without technology', 'Only large businesses can practice recognition'], 1, 'For most small operators, genuine attention and memory alone are sufficient for meaningful recognition.'),
        _q('What is suggested for a larger customer base where memory becomes unreliable?', ['Giving up on recognition entirely', 'A simple notebook noting regulars\' names and preferences', 'An expensive CRM system is required', 'Recognition should be abandoned at scale'], 1, 'A basic notebook is a lightweight, practical tool for supporting recognition as your customer base grows.'),
        _q('What is an example of a recognition-building question?', ['A completely unrelated question', 'Asking how something they mentioned last time turned out', 'Ignoring previous conversations entirely', 'Only discussing prices'], 1, 'Following up on previous conversations shows genuine attentiveness and memory of the individual customer.'),
        _q('What effect does feeling "seen" have on a customer, according to this lesson?', ['No effect on the relationship', 'It strengthens their connection to your business beyond a simple transaction', 'It makes them less likely to return', 'It has only a negative effect'], 1, 'Feeling genuinely recognized deepens a customer\'s relationship with your business.'),
        _q('What practical step is suggested regarding your top regular customers?', ['Ignoring their preferences entirely', 'Starting to note their names and preferences, even informally', 'Treating them identically to first-time customers', 'Avoiding any personalization'], 1, 'Beginning to track this information, even simply, supports consistent recognition going forward.'),
        _q('What is the overall goal of this lesson?', ['To discourage personal attentiveness to customers', 'To build small, genuine moments of recognition that deepen customer relationships', 'To recommend formal, complex CRM systems for all businesses', 'To suggest recognition is unimportant'], 1, 'The lesson builds directly on the previous lesson\'s consistency theme with specific, actionable recognition practices.'),
      ]),
    _lesson('c25', 4, 'Handling Loyalty Through Genuinely Useful Extras', 5, [
      'Where it makes sense for your business, small genuine extras — a loyalty-based small discount after a certain number of visits, being first to know about a new service you\'re offering, or simply prioritizing a known regular during a busy queue — can reinforce loyalty, as long as they feel like genuine appreciation rather than a manipulative gimmick.',
      'Keep any loyalty extras simple and sustainable — a complicated point system nobody understands or a reward you can\'t consistently afford undermines trust rather than building it. Simple, honest, and consistently delivered beats elaborate and unreliable every time.',
    ], concepts: [KeyConcept('Simple and Sustainable Beats Elaborate', 'A loyalty extra you can consistently deliver builds more trust than a complicated system that eventually breaks down.')],
      steps: ['Consider whether a simple loyalty extra (discount after X visits, priority service) makes sense for your business.', 'If you introduce one, keep it simple enough that you can sustain it consistently.'],
      takeaways: ['Genuine, simple loyalty extras can reinforce customer loyalty when they feel like real appreciation.', 'Avoid complicated or unsustainable reward systems — they undermine trust rather than build it.', 'Simple, honest, and consistently delivered extras beat elaborate but unreliable ones.'],
      quiz: [
        _q('What is an example of a genuine loyalty extra mentioned?', ['A random, inconsistent reward', 'A small discount after a certain number of visits', 'An elaborate, complicated point system', 'Ignoring regular customers entirely'], 1, 'Simple, clear rewards like a milestone discount are practical and easy to deliver consistently.'),
        _q('What should loyalty extras feel like to customers?', ['A manipulative gimmick', 'Genuine appreciation', 'An unrelated inconvenience', 'A confusing obligation'], 1, 'Extras should come across as sincere appreciation, not as a transparent manipulation tactic.'),
        _q('What is a risk of a complicated loyalty point system?', ['No risk at all', 'Nobody understands it, undermining rather than building trust', 'It always increases customer satisfaction', 'Complexity always improves loyalty programs'], 1, 'Overly complex systems can confuse and frustrate customers rather than genuinely rewarding them.'),
        _q('What is a risk of a reward you can\'t consistently afford?', ['No risk, inconsistency is fine', 'It undermines trust when the reward becomes unreliable', 'It always strengthens customer loyalty', 'Affordability is irrelevant to loyalty programs'], 1, 'An unsustainable reward that disappears or becomes inconsistent damages the trust it was meant to build.'),
        _q('What combination does this lesson recommend for loyalty extras?', ['Elaborate and unreliable', 'Simple, honest, and consistently delivered', 'Complicated but occasionally generous', 'Random and unpredictable'], 1, 'Simplicity and consistency together create a sustainable, trust-building loyalty approach.'),
        _q('What is an example of a non-discount loyalty extra?', ['Ignoring the customer', 'Prioritizing a known regular during a busy queue', 'Charging regulars more than new customers', 'Refusing service to first-time customers'], 1, 'Small service-based gestures, like queue priority, can be a meaningful loyalty extra beyond pure discounts.'),
        _q('What should guide whether to introduce a loyalty extra at all?', ['Copying a competitor regardless of fit', 'Whether it genuinely makes sense and is sustainable for your specific business', 'Introducing every possible extra regardless of feasibility', 'Ignoring sustainability entirely'], 1, 'Any loyalty extra should be evaluated for genuine fit and long-term sustainability before implementation.'),
        _q('What is the overall message of this lesson?', ['Loyalty extras should always be elaborate to impress customers', 'Simple, sustainable, and genuine loyalty extras reinforce trust; complicated or unreliable ones undermine it', 'Loyalty extras are never worth implementing', 'Complexity is always better for customer engagement'], 1, 'The lesson provides balanced guidance on using loyalty extras effectively without overcomplicating or overpromising.'),
      ]),
    _lesson('c25', 5, 'Building Loyalty Into Your Daily Routine', 5, [
      'Bringing this course together: loyalty isn\'t a separate initiative bolted onto your business — it\'s consistency, recognition, and genuine care woven into how you already operate every day, alongside the operational habits (float management, bookkeeping) covered in earlier courses.',
      'Review periodically how your repeat-customer base is trending — is it growing, shrinking, or flat? This simple check, similar to your other periodic business reviews, tells you honestly whether your loyalty-building efforts are actually working or need adjustment.',
    ], concepts: [KeyConcept('Loyalty Is Woven Into Daily Operations, Not Bolted On', 'Consistency, recognition, and genuine care work best as part of how you already operate, not as a separate program.')],
      steps: ['Reflect on how consistency, recognition, and genuine extras already fit (or don\'t) into your daily routine.', 'Set a periodic check on whether your repeat-customer base is trending up, down, or flat.'],
      takeaways: ['Loyalty is best woven into daily operations, not treated as a separate bolted-on initiative.', 'It combines naturally with other operational habits like float management and bookkeeping.', 'Periodically reviewing your repeat-customer trend tells you honestly whether loyalty efforts are working.'],
      quiz: [
        _q('Should loyalty be treated as a separate initiative bolted onto the business?', ['Yes, it should be entirely separate', 'No, it should be woven into how you already operate daily', 'Loyalty has nothing to do with daily operations', 'Loyalty only matters as a formal program'], 1, 'Genuine loyalty comes from everyday consistency and care, not a disconnected add-on program.'),
        _q('What does loyalty combine naturally with, according to this lesson?', ['Nothing else in the business', 'Other operational habits like float management and bookkeeping', 'Only marketing campaigns', 'Government compliance requirements only'], 1, 'Loyalty-building fits naturally alongside the other daily business habits covered throughout this course library.'),
        _q('What is suggested as a periodic check?', ['Ignoring your customer base composition', 'Whether your repeat-customer base is trending up, down, or flat', 'Only your total daily revenue', 'Your competitor\'s customer count'], 1, 'This trend check honestly reflects whether your loyalty-building efforts are actually working over time.'),
        _q('What does tracking this trend tell you?', ['Nothing useful', 'Whether your loyalty efforts are actually working or need adjustment', 'Only your total sales for the day', 'Information unrelated to loyalty'], 1, 'This honest, ongoing check connects your efforts to real, measurable outcomes.'),
        _q('What three themes from this course are described as woven into daily operations?', ['Discounts, ads, and social media', 'Consistency, recognition, and genuine care', 'Loans, taxes, and registration', 'Pricing, negotiation, and fraud prevention'], 1, 'These three themes, covered across the course, are what genuinely build loyalty day to day.'),
        _q('How does this periodic loyalty review compare to other business reviews mentioned in this course library?', ['It is completely unrelated to other reviews', 'It is similar in spirit to other periodic business reviews covered elsewhere', 'Loyalty should never be reviewed', 'It replaces all other business reviews'], 1, 'This check fits the same review-and-adjust pattern used for bookkeeping, pricing, and other business habits.'),
        _q('What happens if loyalty-building efforts are never reviewed?', ['Nothing changes, review is unnecessary', 'You lose the ability to honestly know if the efforts are working', 'Loyalty automatically improves without review', 'Reviewing has no bearing on loyalty outcomes'], 1, 'Without review, you can\'t objectively tell whether your loyalty efforts are actually succeeding.'),
        _q('What is the overall closing message of this course?', ['Loyalty is a separate, optional add-on program', 'Weaving consistency, recognition, and genuine care into daily operations builds real, trackable loyalty over time', 'Loyalty cannot be measured or reviewed', 'Repeat customers are no more valuable than new ones'], 1, 'The course closes by tying loyalty-building into the same sustainable, everyday-habit philosophy used throughout this course library.'),
      ]),
  ],
);

final Course _course26 = Course(
  id: 'c26', title: 'Social Media for Small Business',
  description: 'WhatsApp Business, Instagram, and Facebook basics for non-marketers running a small local business.',
  category: 'Business Skills', difficulty: Difficulty.beginner,
  icon: Icons.share_rounded, durationMinutes: 130, order: 26,
  lessons: [
    _lesson('c26', 1, 'Why Social Media Matters Even for a Local Stand', 5, [
      'A physical location gets you customers who happen to pass by; a social media presence gets you found by people actively searching, gets you remembered by past customers who see your posts later, and lets you announce things (new services, hours, promotions) without waiting for someone to walk past your stand.',
      'This doesn\'t require becoming a marketing expert or posting constantly. Even a simple, consistently maintained presence — a WhatsApp Business profile, an occasional Instagram or Facebook post — extends your reach meaningfully beyond your physical foot traffic.',
    ], concepts: [KeyConcept('Extends Reach Beyond Foot Traffic', 'Social media lets people find and remember you beyond who happens to physically pass your location.')],
      steps: ['Check whether you currently have any social media presence for your business.', 'Decide which one platform makes the most sense to start with, given your customers.'],
      takeaways: ['Social media extends your reach beyond who physically passes your location.', 'It helps you get found, get remembered, and announce things without relying purely on foot traffic.', 'A simple, consistent presence is enough — you don\'t need to be a marketing expert.'],
      quiz: [
        _q('What does a physical location alone provide in terms of customers?', ['Every possible customer', 'Customers who happen to pass by', 'No customers at all', 'Only customers who search online'], 1, 'A physical stand alone is limited to whoever happens to walk past it.'),
        _q('What does social media presence add beyond foot traffic?', ['Nothing additional', 'Being found by active searchers and remembered by past customers', 'It replaces the need for a physical location entirely', 'It only helps large businesses'], 1, 'Social media extends reach to people actively searching or remembering you after the fact.'),
        _q('Do you need to become a marketing expert to benefit from social media?', ['Yes, expertise is required', 'No, even a simple, consistent presence helps meaningfully', 'Social media provides no benefit without expertise', 'Only professional marketers can use social media effectively'], 1, 'A simple, consistently maintained presence is enough to extend reach meaningfully.'),
        _q('What is an example of a simple social media presence mentioned?', ['A complex, professionally managed ad campaign', 'A WhatsApp Business profile with occasional posts', 'A full-time marketing team', 'An expensive website'], 1, 'These accessible, low-effort options are realistic starting points for a small business owner.'),
        _q('What can social media let you announce without waiting for foot traffic?', ['Nothing useful', 'New services, hours, or promotions', 'Only personal updates unrelated to business', 'Government announcements'], 1, 'Direct announcements to your existing audience don\'t depend on someone physically passing your stand.'),
        _q('What is suggested as a practical first step in this lesson?', ['Ignoring social media entirely', 'Checking your current presence and deciding which platform to start with', 'Signing up for every platform simultaneously', 'Hiring a marketing agency immediately'], 1, 'Starting with an honest assessment and a focused platform choice keeps the effort manageable.'),
        _q('What benefit comes from being "remembered" through social media?', ['No benefit at all', 'Past customers seeing your posts later, prompting a return visit', 'It guarantees immediate sales', 'It replaces the need for good service'], 1, 'Ongoing visibility keeps your business top of mind for people who\'ve interacted with you before.'),
        _q('What is the overall purpose of this opening lesson?', ['To discourage using social media', 'To establish why even a simple social media presence extends a small business\'s reach meaningfully', 'To suggest social media is only for large brands', 'To recommend ignoring foot traffic entirely'], 1, 'The lesson sets up why the practical, low-effort approach covered in the rest of the course is worthwhile.'),
      ]),
    _lesson('c26', 2, 'Setting Up WhatsApp Business Effectively', 5, [
      'WhatsApp Business is often the most natural starting point for small operators, since many customers already use WhatsApp regularly. Set up a proper business profile — business name, category, hours, location — rather than using a personal number with no context, which makes your business look more established and trustworthy.',
      'Use WhatsApp Business features like quick replies (pre-written answers to common questions) and a catalog (if you sell specific products) to make customer interactions faster and more professional, without needing to type the same responses repeatedly throughout the day.',
    ], concepts: [KeyConcept('A Proper Business Profile Signals Legitimacy', 'A complete WhatsApp Business profile (name, category, hours, location) looks more established than a bare personal number.')],
      steps: ['Set up or complete your WhatsApp Business profile with name, category, hours, and location.', 'Create 2-3 quick reply templates for your most commonly asked questions.'],
      takeaways: ['WhatsApp Business is a natural starting point since many customers already use it.', 'A complete business profile makes your business look more established and trustworthy.', 'Quick replies and a catalog make customer interactions faster and more professional.'],
      quiz: [
        _q('Why is WhatsApp Business often a good starting point for small operators?', ['It is rarely used by customers', 'Many customers already use WhatsApp regularly', 'It requires expensive setup', 'It only works for large businesses'], 1, 'Meeting customers where they already are makes adoption and usage naturally easier.'),
        _q('What should a proper business profile include?', ['Nothing specific', 'Business name, category, hours, and location', 'Only a phone number with no other details', 'Personal photos unrelated to the business'], 1, 'A complete profile provides the context that makes a business look established and trustworthy.'),
        _q('What is a downside of using a personal number with no business context?', ['No downside at all', 'It can make the business look less established and trustworthy', 'It automatically increases sales', 'It is required by WhatsApp policy'], 1, 'A bare personal number lacks the professional signals a complete business profile provides.'),
        _q('What are "quick replies" in WhatsApp Business?', ['A type of payment method', 'Pre-written answers to common questions', 'A marketing advertisement format', 'A customer complaint system'], 1, 'Quick replies speed up responses to frequently asked questions without retyping them each time.'),
        _q('What is a "catalog" feature used for?', ['Storing personal photos', 'Displaying specific products you sell', 'Recording customer complaints', 'Tracking your vendor accounts'], 1, 'A catalog gives customers an organized view of products or services you offer directly within WhatsApp.'),
        _q('What benefit does using quick replies provide?', ['No benefit', 'Faster, more professional customer interactions', 'It makes responses less personal in a negative way', 'It is required for all WhatsApp accounts'], 1, 'Pre-written responses save time while maintaining consistent, professional communication.'),
        _q('What is the practical first step suggested in this lesson?', ['Ignoring your WhatsApp presence entirely', 'Setting up or completing your WhatsApp Business profile', 'Switching to a different platform entirely', 'Deleting your WhatsApp account'], 1, 'Completing the profile setup is the foundational first action this lesson recommends.'),
        _q('What is the overall goal of this lesson?', ['To discourage using WhatsApp for business', 'To help you set up an effective, professional WhatsApp Business presence', 'To suggest WhatsApp Business has no practical features', 'To recommend avoiding customer communication tools'], 1, 'The lesson provides concrete, actionable steps for making the most of this accessible starting platform.'),
      ]),
    _lesson('c26', 3, 'Posting Content That Actually Gets Noticed', 5, [
      'Effective small business posts are usually simple: photos of your actual stand/products (real, not stock images), announcements of specific things (new service, extended hours for a holiday), and occasional glimpses of you as a real person running the business — people connect with people, not faceless brands.',
      'Consistency in posting matters more than frequency or polish. A simple photo posted regularly beats an elaborate post made once and never followed up — algorithms and audience memory both favor businesses that show up consistently, even modestly, over ones that appear sporadically no matter how good any single post is.',
    ], concepts: [KeyConcept('Consistency Beats Polish', 'A simple, regular post beats an elaborate one-off — both algorithms and audience memory favor consistent presence.')],
      steps: ['Take one simple, real photo of your stand or products to post this week.', 'Set a realistic posting frequency you can actually sustain (e.g. twice a week).'],
      takeaways: ['Effective posts are usually simple: real photos, specific announcements, glimpses of you as a person.', 'Consistency in posting matters more than frequency or polish.', 'People connect with real people running a business, not faceless, overly polished brands.'],
      quiz: [
        _q('What kind of photos are recommended for small business posts?', ['Stock images unrelated to your business', 'Real photos of your actual stand or products', 'No photos at all', 'Only professionally staged studio photos'], 1, 'Authentic, real photos build a more genuine connection than generic stock imagery.'),
        _q('What is an example of an effective announcement post?', ['A vague, unclear message', 'Extended hours for a holiday or a new service', 'A post with no specific information', 'An unrelated personal update'], 1, 'Specific, useful announcements give followers a clear reason to pay attention.'),
        _q('Why include occasional glimpses of yourself as the business owner?', ['It has no benefit', 'People connect with real people, not faceless brands', 'It is required by social media platforms', 'It reduces trust in the business'], 1, 'Personal connection helps build a more genuine, trusted relationship with your audience.'),
        _q('What matters more than posting frequency or polish, according to this lesson?', ['Nothing matters more than polish', 'Consistency', 'Using only professional equipment', 'Posting as rarely as possible'], 1, 'Regular, dependable posting outperforms occasional elaborate posts in building audience connection.'),
        _q('What is a downside of an elaborate post made once and never followed up?', ['No downside at all', 'It underperforms compared to simple, consistent posting', 'It always outperforms regular posting', 'Elaborate posts guarantee the best results'], 1, 'A single impressive post doesn\'t build the ongoing presence that consistent posting achieves.'),
        _q('What do both algorithms and audience memory favor?', ['Sporadic, inconsistent posting', 'Consistent, even modest, presence', 'Only expensive, professional content', 'Businesses that never post'], 1, 'Regular presence tends to be rewarded by both platform algorithms and audience recall.'),
        _q('What is a practical step suggested in this lesson?', ['Avoiding photos of your business entirely', 'Taking one simple, real photo to post this week', 'Hiring a professional photographer immediately', 'Posting elaborate content only once'], 1, 'Starting with a simple, achievable action builds the habit this lesson recommends.'),
        _q('What is the overall message of this lesson?', ['Only elaborate, polished content is worth posting', 'Simple, real, and consistent posting outperforms occasional elaborate content', 'Posting content has no real business value', 'Avoid showing yourself as the business owner'], 1, 'The lesson emphasizes accessible, sustainable content practices over unrealistic polish or perfection.'),
      ]),
    _lesson('c26', 4, 'Responding to Customers Online Professionally', 5, [
      'How you respond to messages, comments, and occasional complaints online shapes your reputation as much as your in-person service does — and unlike an in-person interaction, an online response is often visible to other potential customers too, making the stakes slightly different.',
      'Respond promptly where possible, stay calm and professional even with a negative comment (the same de-escalation principles from handling difficult customers in person apply here), and avoid public arguments — if a situation needs more detail or gets heated, move it to a private message rather than playing it out publicly.',
    ], concepts: [KeyConcept('Public Responses Have a Public Audience', 'Unlike in-person service, online responses are visible to other potential customers watching how you handle things.')],
      steps: ['Decide on a realistic response time goal for messages and comments.', 'Prepare a calm, professional template response for handling a negative comment.'],
      takeaways: ['Online responses are visible to other potential customers, not just the person you\'re responding to.', 'Stay calm and professional, applying the same de-escalation principles used with in-person difficult customers.', 'Move heated or detailed situations to a private message rather than playing them out publicly.'],
      quiz: [
        _q('What makes online responses different from in-person interactions?', ['They are identical in every way', 'Online responses are often visible to other potential customers too', 'Online responses have no real impact', 'Only the direct recipient ever sees an online response'], 1, 'Public visibility means an online response shapes perception beyond just the individual you\'re responding to.'),
        _q('What principle from earlier courses applies to handling negative comments online?', ['None, this is an entirely separate skill', 'The same de-escalation principles used with in-person difficult customers', 'Aggression works better online than in person', 'Ignoring all negative comments entirely'], 1, 'The calm, listening-first approach to difficult moments applies just as much in the online context.'),
        _q('What should you do if a situation gets heated or needs more detail?', ['Continue arguing publicly', 'Move it to a private message', 'Delete the comment without response', 'Respond with hostility publicly'], 1, 'Taking detailed or heated exchanges private avoids a damaging public back-and-forth.'),
        _q('What is recommended regarding response time?', ['Never respond to any messages', 'Respond promptly where realistically possible', 'Wait as long as possible before responding', 'Response time is irrelevant to reputation'], 1, 'Timely responses reflect positively on your business\'s attentiveness and professionalism.'),
        _q('What should your tone be, even with a negative comment?', ['Defensive and aggressive', 'Calm and professional', 'Dismissive and cold', 'Silent, with no response at all'], 1, 'Maintaining composure publicly protects your reputation even in a difficult interaction.'),
        _q('Why are public arguments discouraged?', ['They always resolve issues effectively', 'They can damage your reputation in front of other potential customers watching', 'Public arguments have no visibility to others', 'They are required for good customer service'], 1, 'Visible conflict can harm how other potential customers perceive your business, beyond the immediate dispute.'),
        _q('What is a practical step suggested in this lesson?', ['Ignoring all future negative comments', 'Preparing a calm, professional template for handling negative comments', 'Avoiding all online customer interaction', 'Responding aggressively to build a reputation'], 1, 'Having a prepared, calm approach ready helps you respond consistently well under real pressure.'),
        _q('What is the overall goal of this lesson?', ['To discourage online customer interaction entirely', 'To help you respond to online customers professionally, given the public visibility involved', 'To suggest online responses don\'t matter for reputation', 'To recommend ignoring negative feedback'], 1, 'The lesson extends the course\'s difficult-customer principles specifically into the public, visible online context.'),
      ]),
    _lesson('c26', 5, 'Building a Sustainable Social Media Routine', 5, [
      'Like the other habits covered throughout this course library, social media works best as a small, consistent routine rather than an occasional burst of effort — set aside a specific, small amount of time (even 10-15 minutes) at a regular point in your week to post and respond to messages.',
      'Periodically review what\'s actually working — which types of posts get more engagement, whether messages are converting into actual visits or sales — and adjust your simple routine accordingly, rather than posting the same way indefinitely without ever checking if it\'s effective.',
    ], concepts: [KeyConcept('A Small, Consistent Routine Beats Sporadic Bursts', 'A brief, regular time block for social media sustains the habit far better than occasional intense effort.')],
      steps: ['Set aside a specific 10-15 minute time block, weekly, dedicated to social media.', 'Periodically check which types of posts get the most engagement and adjust accordingly.'],
      takeaways: ['Social media works best as a small, consistent routine, not an occasional burst of effort.', 'A specific, small dedicated time block sustains the habit more reliably than sporadic effort.', 'Periodically review what\'s working and adjust your routine accordingly.'],
      quiz: [
        _q('What approach to social media does this final lesson recommend?', ['Occasional bursts of intense effort', 'A small, consistent routine', 'Ignoring social media most of the time', 'Posting only once a year'], 1, 'A steady, manageable routine is more sustainable and effective than sporadic intense effort.'),
        _q('What time commitment is suggested for this routine?', ['Several hours daily', 'Even 10-15 minutes at a regular point in your week', 'No time at all is needed', 'A full day each week'], 1, 'A modest, specific time block makes the habit realistic to sustain long-term.'),
        _q('What should you periodically review?', ['Nothing, just keep posting the same way forever', 'Which types of posts get more engagement and whether messages convert to visits/sales', 'Only your competitor\'s social media', 'Random, unrelated metrics'], 1, 'Reviewing real engagement and conversion data helps you refine your approach over time.'),
        _q('What should you do based on this periodic review?', ['Nothing, ignore the results', 'Adjust your simple routine accordingly', 'Abandon social media entirely regardless of results', 'Only change platforms, never content'], 1, 'Using real feedback to adjust your approach keeps your routine effective rather than static and unexamined.'),
        _q('How does this course\'s approach to social media compare to other habits covered in this course library?', ['It is entirely different and unrelated', 'It follows the same small, consistent, reviewable routine philosophy', 'Social media requires an entirely different mindset', 'This course contradicts the others'], 1, 'The lesson explicitly ties this approach to the same sustainable-habit philosophy used throughout the course library.'),
        _q('What happens if you post the same way indefinitely without ever checking effectiveness?', ['Results automatically improve over time', 'You miss the chance to refine and improve based on real feedback', 'This is the ideal, most effective approach', 'Nothing changes either way'], 1, 'Without review, you lose the opportunity to learn what\'s actually working and improve accordingly.'),
        _q('What is the risk of an occasional burst-of-effort approach to social media?', ['No risk, bursts work best', 'Difficulty sustaining the habit and building consistent presence', 'It always outperforms a steady routine', 'Bursts require less effort overall'], 1, 'Sporadic effort is harder to sustain and builds a less consistent, less trusted presence over time.'),
        _q('What is the overall closing message of this course?', ['Social media requires constant, exhausting effort to work', 'A small, consistent, periodically reviewed routine makes social media sustainable and genuinely effective', 'Social media should be abandoned if not immediately successful', 'Reviewing engagement is unnecessary'], 1, 'The course closes by tying together setup, content, response handling, and routine into one sustainable practice.'),
      ]),
  ],
);

final Course _course27 = Course(
  id: 'c27', title: 'Emergency Fund & Business Risk',
  description: 'Preparing for slow months, theft, equipment failure, and other real risks that can hit any small business.',
  category: 'Business Skills', difficulty: Difficulty.beginner,
  icon: Icons.shield_rounded, durationMinutes: 130, order: 27,
  lessons: [
    _lesson('c27', 1, 'Why Every Business Needs an Emergency Fund', 5, [
      'Every business, regardless of how well it\'s run, faces real risks: a slow month with unexpectedly low revenue, theft or fraud, equipment breaking down, a personal emergency that pulls you away from the business temporarily. Without a financial cushion, any one of these can turn into a genuine crisis rather than a manageable setback.',
      'An emergency fund isn\'t about pessimism — it\'s about realism. The businesses that survive their first genuinely bad month, theft incident, or equipment failure are usually the ones that had prepared a cushion in advance, not the ones that got lucky and never faced a real setback.',
    ], concepts: [KeyConcept('A Cushion Turns Crisis Into Setback', 'An emergency fund is what separates a manageable setback from a genuine business-ending crisis.')],
      steps: ['Reflect honestly: could your business currently absorb a genuinely bad month or a major equipment failure?', 'List the top 2-3 specific risks most relevant to your particular business.'],
      takeaways: ['Every business faces real risks: slow months, theft, equipment failure, personal emergencies.', 'Without a financial cushion, any of these can become a genuine crisis rather than a manageable setback.', 'Building an emergency fund is realism, not pessimism.'],
      quiz: [
        _q('Do well-run businesses face real risks like theft or equipment failure?', ['No, well-run businesses are immune to risk', 'Yes, every business faces these real risks regardless of how well it\'s run', 'Only poorly run businesses face risk', 'Risk only affects large businesses'], 1, 'No amount of good management eliminates the possibility of genuine, unpredictable setbacks.'),
        _q('What can happen without a financial cushion when a risk materializes?', ['Nothing changes for the business', 'A manageable setback can turn into a genuine crisis', 'The business automatically becomes more resilient', 'Risks have no real financial impact'], 1, 'Without a cushion, an otherwise survivable setback can escalate into something far more damaging.'),
        _q('What distinguishes businesses that survive a bad month or setback?', ['Pure luck alone', 'Usually having prepared a cushion in advance', 'Avoiding all risk entirely, which is impossible', 'Ignoring the possibility of setbacks'], 1, 'Preparation, not luck, is generally what allows a business to absorb and recover from a real setback.'),
        _q('How is building an emergency fund framed in this lesson?', ['As unnecessary pessimism', 'As realism about genuine, likely risks', 'As something only large businesses need', 'As a waste of capital'], 1, 'The lesson frames this preparation as a realistic, practical response to real business risks, not excessive worry.'),
        _q('What is an example of a risk mentioned that isn\'t purely financial?', ['A slow sales month', 'A personal emergency pulling you away from the business temporarily', 'Equipment failure', 'Theft or fraud'], 1, 'Personal emergencies are a genuine, non-financial risk that can still significantly disrupt a business.'),
        _q('What practical exercise is suggested in this lesson?', ['Ignoring risk assessment entirely', 'Reflecting honestly on whether your business could absorb a bad month or major failure', 'Assuming your business is immune to all risk', 'Avoiding any planning for setbacks'], 1, 'Honest self-assessment is the starting point for understanding your actual emergency fund needs.'),
        _q('What kinds of risks should you specifically identify for your business?', ['Generic risks unrelated to your situation', 'The top 2-3 specific risks most relevant to your particular business', 'Only risks faced by large corporations', 'No specific risks need identification'], 1, 'Tailoring your risk awareness to your specific business situation makes preparation more relevant and effective.'),
        _q('What is the overall purpose of this opening lesson?', ['To discourage running a business due to risk', 'To establish why an emergency fund is a realistic, necessary preparation for genuine business risks', 'To suggest risk doesn\'t apply to small businesses', 'To recommend ignoring financial planning entirely'], 1, 'The lesson sets up the practical case for the emergency fund building covered in the rest of the course.'),
      ]),
    _lesson('c27', 2, 'How Much Emergency Fund Is Actually Enough', 5, [
      'A common guideline is to build toward covering your essential fixed business costs (rent, minimum float, basic supplies) for a defined period — often a starting target of one to three months — rather than an arbitrary round number that doesn\'t relate to your actual expenses.',
      'Start smaller if a full target feels overwhelming — even covering two weeks of essential costs is meaningfully better than having no cushion at all, and you can build toward the larger target incrementally using the same allocation habits from the saving and reinvesting course.',
    ], concepts: [KeyConcept('Target Essential Costs, Not a Round Number', 'Size your emergency fund around your actual essential fixed costs for a defined period, not an arbitrary figure.')],
      steps: ['Calculate your essential fixed business costs (rent, minimum float, basic supplies) for one month.', 'Set an initial emergency fund target — even two weeks of essential costs is a reasonable starting point.'],
      takeaways: ['Size your emergency fund around essential fixed costs for a defined period (often one to three months as a target).', 'Starting smaller (even two weeks) is far better than having no cushion at all.', 'Build toward the larger target incrementally using the allocation habits from earlier saving/reinvesting lessons.'],
      quiz: [
        _q('What should your emergency fund target be based on?', ['A random round number', 'Your essential fixed business costs for a defined period', 'Your competitor\'s savings amount', 'Nothing specific, any amount works equally'], 1, 'Grounding the target in real, essential costs makes the fund genuinely useful when needed.'),
        _q('What is a commonly cited starting target range?', ['One to three months of essential costs', 'Ten years of total revenue', 'A single day\'s revenue', 'No target is ever suggested'], 1, 'This range gives a practical, achievable initial goal for most small businesses.'),
        _q('What costs should be included in this calculation?', ['All discretionary personal spending', 'Rent, minimum float, and basic supplies', 'Only luxury expenses', 'Nothing specific needs to be included'], 1, 'Essential, non-negotiable business costs form the basis of a meaningful emergency fund target.'),
        _q('Is it necessary to reach the full target immediately?', ['Yes, anything less is worthless', 'No, starting smaller (even two weeks) is meaningfully better than nothing', 'Emergency funds must be built instantly', 'Partial progress has no value'], 1, 'Even a modest starting cushion provides real protection compared to having no fund at all.'),
        _q('What earlier course habit helps build toward the larger target?', ['Negotiation skills', 'The allocation habits from the saving and reinvesting course', 'Social media posting routines', 'Fraud prevention rules'], 1, 'The systematic saving approach from an earlier lesson directly supports building this fund incrementally.'),
        _q('Why is an arbitrary round number discouraged as a target?', ['Round numbers are always ideal', 'Because it doesn\'t relate to your actual essential expenses', 'Arbitrary numbers are easier to calculate', 'This approach is actually recommended'], 1, 'A target tied to real costs ensures the fund is actually sufficient to cover genuine needs when used.'),
        _q('What is an example of a reasonable initial, smaller target?', ['One full year of costs', 'Two weeks of essential costs', 'No target at all', 'A single day\'s revenue'], 1, 'This modest example shows a realistic, non-overwhelming starting point for building the fund.'),
        _q('What is the overall goal of this lesson?', ['To discourage building an emergency fund', 'To help you set a realistic, cost-based emergency fund target and build toward it incrementally', 'To suggest emergency funds should be enormous or nothing', 'To recommend an arbitrary savings goal'], 1, 'The lesson makes the emergency fund concept concrete and achievable rather than abstract or overwhelming.'),
      ]),
    _lesson('c27', 3, 'Protecting Against Theft and Equipment Failure', 5, [
      'Beyond a cash cushion, specific risks benefit from specific preventive steps: securing cash and equipment properly (not leaving float unattended, basic physical security for your stand), and understanding your equipment provider\'s replacement or repair process before you need it, not during a crisis.',
      'For higher-value equipment (a POS machine, for instance), check whether insurance or a provider replacement program is available and worth the cost — a modest ongoing cost that protects against a large, sudden loss is often worthwhile, though this depends on your specific situation and the terms offered.',
    ], concepts: [KeyConcept('Prevention Plus Prepared Response', 'Specific risks (theft, equipment failure) benefit from specific preventive steps and knowing your response process in advance.')],
      steps: ['Review your current physical security practices for cash and equipment.', 'Find out what your equipment provider\'s replacement/repair process actually involves, before you need it.'],
      takeaways: ['Specific risks like theft and equipment failure benefit from specific preventive steps.', 'Know your equipment provider\'s replacement or repair process in advance, not during a crisis.', 'Consider whether insurance or a replacement program is worthwhile for higher-value equipment.'],
      quiz: [
        _q('What is recommended beyond just having a cash cushion?', ['Nothing else is needed', 'Specific preventive steps tailored to specific risks like theft and equipment failure', 'Ignoring all other risk mitigation', 'Relying purely on luck'], 1, 'Targeted prevention complements a general cash cushion for comprehensive risk management.'),
        _q('What is an example of basic physical security mentioned?', ['Leaving float unattended', 'Not leaving float unattended and having basic security for your stand', 'Ignoring cash security entirely', 'Displaying all cash openly'], 1, 'Simple, practical security habits directly reduce theft risk.'),
        _q('When should you learn your equipment provider\'s replacement/repair process?', ['Only during an active crisis', 'In advance, before you need it', 'This information is never necessary', 'Only after equipment has already failed'], 1, 'Understanding the process ahead of time lets you respond quickly and correctly when equipment actually fails.'),
        _q('What should you consider for higher-value equipment like a POS machine?', ['Ignoring any protection options', 'Whether insurance or a provider replacement program is worthwhile', 'Avoiding all higher-value equipment', 'Assuming replacement is always free'], 1, 'Evaluating available protection options helps guard against a large, sudden loss from equipment failure.'),
        _q('What is the potential benefit of a modest ongoing insurance/protection cost?', ['No benefit at all', 'Protection against a large, sudden loss', 'It always exceeds its value', 'It replaces the need for an emergency fund entirely'], 1, 'A manageable ongoing cost can meaningfully reduce your exposure to a much larger, unexpected loss.'),
        _q('Does this lesson say insurance is always worthwhile?', ['Yes, always without exception', 'No, it depends on your specific situation and the terms offered', 'Insurance should never be considered', 'This depends purely on random chance'], 1, 'The lesson recommends evaluating options thoughtfully rather than assuming a one-size-fits-all answer.'),
        _q('What is a practical step suggested in this lesson?', ['Ignoring your current security practices', 'Reviewing your current physical security practices for cash and equipment', 'Assuming theft never happens to small businesses', 'Avoiding equipment providers entirely'], 1, 'An honest review of current practices helps identify gaps worth addressing proactively.'),
        _q('What is the overall goal of this lesson?', ['To discourage owning valuable equipment', 'To pair general emergency preparation with specific, targeted prevention for theft and equipment risk', 'To suggest theft and equipment failure are unavoidable regardless of preparation', 'To recommend ignoring provider relationships'], 1, 'The lesson adds targeted, practical prevention alongside the general financial cushion covered earlier.'),
      ]),
    _lesson('c27', 4, 'Building a Simple Risk Response Plan', 5, [
      'Beyond prevention and a cash cushion, having a simple written plan for how you\'d respond to your top identified risks removes the need to figure everything out under stress — if theft happens, who do you contact first? If your main equipment fails, what\'s your backup plan to keep serving customers while it\'s repaired or replaced?',
      'This doesn\'t need to be elaborate — a few sentences per risk, covering your first three actions, is enough to genuinely help you respond faster and more clearly during an actual crisis than improvising from scratch in a stressful moment.',
    ], concepts: [KeyConcept('A Simple Written Plan Beats Improvising Under Stress', 'A few prepared sentences per risk lets you respond faster and more clearly than figuring it out during an actual crisis.')],
      steps: ['Write a simple 3-step response plan for your top identified risk.', 'Identify your backup plan for continuing to serve customers if your main equipment fails.'],
      takeaways: ['A simple written response plan removes the need to figure everything out under stress.', 'A few sentences per top risk, covering your first three actions, is enough to be genuinely useful.', 'This preparation helps you respond faster and more clearly than improvising during an actual crisis.'],
      quiz: [
        _q('What is recommended beyond prevention and a cash cushion?', ['Nothing further is needed', 'A simple written response plan for your top identified risks', 'Ignoring risk response entirely', 'Relying purely on improvisation'], 1, 'A prepared response plan complements prevention and financial cushioning for comprehensive risk readiness.'),
        _q('What should a risk response plan help you avoid?', ['Nothing in particular', 'Figuring everything out under stress during an actual crisis', 'Preventing risks from occurring at all', 'Building an emergency fund'], 1, 'Having a plan ready removes the burden of improvising a response during an already stressful situation.'),
        _q('How elaborate does this plan need to be?', ['Extremely detailed and lengthy', 'A few sentences per risk, covering your first three actions', 'No writing is necessary at all', 'A formal legal document'], 1, 'A simple, concise plan is sufficient to provide genuine value during a real crisis.'),
        _q('What is an example question a theft response plan might answer?', ['What is your favorite color?', 'Who do you contact first?', 'What is the weather forecast?', 'What time do you usually close?'], 1, 'Knowing your immediate first steps, like who to contact, speeds up your actual crisis response.'),
        _q('What is an example question an equipment failure plan might answer?', ['How much does the equipment cost originally?', 'What is your backup plan to keep serving customers while it\'s repaired?', 'What color is the equipment?', 'Who manufactured the equipment?'], 1, 'A backup plan for continuing operations minimizes business disruption during equipment downtime.'),
        _q('What benefit does having this plan provide during an actual crisis?', ['No benefit at all', 'Responding faster and more clearly than improvising from scratch', 'It guarantees the risk never happens', 'It eliminates the need for an emergency fund'], 1, 'Preparation genuinely improves the speed and clarity of your response when a real risk materializes.'),
        _q('What is a practical step suggested in this lesson?', ['Avoiding any written planning', 'Writing a simple 3-step response plan for your top identified risk', 'Memorizing an elaborate crisis manual', 'Ignoring backup planning for equipment failure'], 1, 'A focused, simple written exercise makes this preparation concrete and achievable.'),
        _q('What is the overall goal of this lesson?', ['To discourage any advance risk planning', 'To help you build simple, practical response plans for your top identified risks', 'To suggest risk response should always be improvised', 'To recommend ignoring backup planning entirely'], 1, 'The lesson adds practical response readiness to the prevention and financial cushioning covered earlier in the course.'),
      ]),
    _lesson('c27', 5, 'Reviewing Your Risk Preparation Over Time', 5, [
      'As your business grows and changes — more equipment, more capital at risk, new locations or services — your risk exposure changes too, and your emergency fund target and response plans should be revisited periodically rather than set once when the business looked very different.',
      'Treat this review as part of your other periodic business check-ins (alongside bookkeeping, pricing, and saving reviews covered elsewhere) — a combined, holistic review keeps your business genuinely resilient as it evolves, rather than leaving your risk preparation stuck at an earlier, smaller stage of the business.',
    ], concepts: [KeyConcept('Risk Exposure Changes as the Business Grows', 'Your emergency fund target and response plans should evolve alongside your business, not stay fixed at an earlier stage.')],
      steps: ['Add a risk-preparation check to your existing periodic business review routine.', 'Reflect on whether your current emergency fund target still matches your business\'s actual size and risk exposure.'],
      takeaways: ['Risk exposure changes as your business grows — more equipment, capital, locations, or services.', 'Emergency fund targets and response plans should be revisited periodically, not set once.', 'Combine this review with your other periodic business check-ins for a holistic, resilient approach.'],
      quiz: [
        _q('Does risk exposure stay the same as a business grows?', ['Yes, risk exposure never changes', 'No, it changes as the business grows and adds equipment, capital, or services', 'Only revenue changes, not risk', 'Growth eliminates all risk'], 1, 'A larger, more complex business typically has correspondingly different and often greater risk exposure.'),
        _q('Should emergency fund targets and response plans be set once and left alone?', ['Yes, set once permanently', 'No, they should be revisited periodically as the business evolves', 'These should never be created at all', 'Only response plans need revisiting, not funds'], 1, 'Periodic review keeps your preparation aligned with your business\'s actual, current situation.'),
        _q('What is suggested for combining this review?', ['Keeping it entirely separate from other reviews', 'Combining it with other periodic business check-ins like bookkeeping and pricing reviews', 'Avoiding any structured review process', 'Only reviewing risk once a decade'], 1, 'A combined, holistic review approach is more sustainable and comprehensive than isolated, separate reviews.'),
        _q('What can happen if risk preparation is never revisited as the business grows?', ['Preparation automatically stays adequate', 'It can remain stuck at an earlier, smaller stage of the business, becoming insufficient', 'Nothing changes regardless of business growth', 'Risk preparation becomes unnecessary over time'], 1, 'Outdated preparation, based on an earlier smaller version of the business, can fail to protect the current, larger operation.'),
        _q('What examples of business growth are mentioned as affecting risk exposure?', ['None are mentioned', 'More equipment, more capital at risk, new locations or services', 'Only changes in personal life', 'Weather pattern changes'], 1, 'These concrete growth factors directly and meaningfully change a business\'s risk profile over time.'),
        _q('What does a combined, holistic review approach achieve?', ['No particular benefit', 'Keeping the business genuinely resilient as it evolves', 'It complicates business management unnecessarily', 'It replaces the need for any risk preparation'], 1, 'Integrating risk review with other periodic checks builds sustained resilience as the business changes.'),
        _q('What practical step is suggested in this lesson?', ['Ignoring your current emergency fund target', 'Reflecting on whether your current target still matches your business\'s actual situation', 'Assuming your original target is always correct', 'Avoiding any further risk assessment'], 1, 'Honest reassessment ensures your preparation genuinely reflects your business\'s current, real risk exposure.'),
        _q('What is the overall closing message of this course?', ['Emergency preparation is a one-time task', 'Building and periodically reviewing your emergency fund and risk response plans keeps your business resilient as it grows', 'Risk preparation becomes unnecessary once established', 'Business growth has no bearing on risk management'], 1, 'The course closes by tying emergency fund building, prevention, response planning, and ongoing review into one sustainable practice.'),
      ]),
  ],
);

final Course _course28 = Course(
  id: 'c28', title: 'Registering Your Business (CAC & Beyond)',
  description: 'Formalizing from an informal setup to a registered business — what it actually involves and when it makes sense.',
  category: 'Business Skills', difficulty: Difficulty.intermediate,
  icon: Icons.assignment_turned_in_rounded, durationMinutes: 130, order: 28,
  lessons: [
    _lesson('c28', 1, 'Understanding What Registration Actually Means', 5, [
      'Registering a business with the Corporate Affairs Commission (CAC) in Nigeria creates a formal legal identity for it, separate from you personally in certain respects, and gives you an official registration number that other institutions (banks, bigger clients, some government processes) recognize and require.',
      'This is a distinct step from the general awareness covered in the earlier taxes and compliance course — this course goes deeper into the actual registration process itself: what structures are available, what the process involves, and how to decide when the timing is right for your specific business.',
    ], concepts: [KeyConcept('Registration Creates a Formal Legal Identity', 'CAC registration gives your business an official identity and registration number, separate from you personally.')],
      steps: ['Recall what you learned about registration basics from the earlier taxes and compliance course.', 'Note your current thinking on whether your business is ready to formally register.'],
      takeaways: ['CAC registration creates a formal legal identity for your business, recognized by banks and other institutions.', 'This course goes deeper into the actual registration process than the earlier general compliance overview.', 'Understanding the process helps you decide confidently when the timing is right for you.'],
      quiz: [
        _q('What does CAC registration create for a business?', ['Nothing meaningful', 'A formal legal identity, separate from the owner in certain respects', 'A physical business location', 'A guaranteed loan approval'], 1, 'Registration establishes the business as a recognized legal entity, distinct in certain respects from the individual owner.'),
        _q('What do banks and bigger clients often require related to registration?', ['Nothing specific', 'An official registration number', 'A personal recommendation letter only', 'Proof of business failure'], 1, 'A recognized registration number is often a prerequisite for these institutional relationships.'),
        _q('How does this course relate to the earlier taxes and compliance course?', ['It is completely unrelated', 'It goes deeper into the actual registration process specifically', 'It replaces the need for that earlier course', 'It contradicts what was taught there'], 1, 'This course builds on the general awareness from before with specific, practical registration guidance.'),
        _q('What will this course help you understand, according to this lesson?', ['Nothing new', 'Available structures, the actual process, and how to time your registration decision', 'Only tax rates', 'Only marketing strategies'], 1, 'The course provides practical, actionable guidance beyond the general awareness covered earlier.'),
        _q('Is the business, once registered, treated as entirely separate from the owner in every respect?', ['Yes, completely and totally separate in every way', 'It is separate "in certain respects" as described in this lesson', 'No separation occurs at all', 'Registration has no legal effect'], 1, 'The lesson specifically frames this as separation "in certain respects," not absolute, complete separation.'),
        _q('What institutions commonly recognize and require business registration?', ['None, registration is never required', 'Banks, bigger clients, and some government processes', 'Only informal community groups', 'Social media platforms'], 1, 'These institutions commonly rely on formal registration as part of their own requirements or trust processes.'),
        _q('What is suggested as a practical first step in this lesson?', ['Ignoring your registration readiness', 'Reflecting on your current thinking about whether your business is ready to register', 'Registering immediately without any reflection', 'Avoiding the topic entirely'], 1, 'Honest reflection on your current situation sets up the more detailed guidance in later lessons.'),
        _q('What is the overall purpose of this opening lesson?', ['To discourage business registration', 'To clarify what registration actually means and set up the deeper guidance in this course', 'To suggest registration has no practical benefit', 'To recommend avoiding formal business structures entirely'], 1, 'The lesson establishes the foundational understanding needed before diving into structures and process specifics.'),
      ]),
    _lesson('c28', 2, 'Choosing the Right Business Structure', 5, [
      'Common structures for small businesses registering in Nigeria include Business Name registration (simplest, suited to sole proprietors and small partnerships, less formal ongoing requirements) and Limited Liability Company (more formal, provides personal liability protection, generally more suited to larger or higher-risk operations).',
      'For most small agent businesses just starting to formalize, Business Name registration is often the practical starting point — simpler, faster, and less costly — with the option to later upgrade to a Limited Liability Company structure as the business grows and the added protection and formality becomes more valuable relative to its cost.',
    ], concepts: [KeyConcept('Business Name First, Limited Liability Later If Needed', 'Business Name registration is often the practical starting structure for small operators, with room to upgrade as the business grows.')],
      steps: ['Research the current specific requirements and costs for Business Name registration.', 'Reflect on whether your current business size and risk level suggest Business Name is right, or whether Limited Liability is worth considering.'],
      takeaways: ['Business Name registration is simpler and suited to sole proprietors and small partnerships.', 'Limited Liability Company registration is more formal and provides personal liability protection.', 'Business Name is often the practical starting point, with room to upgrade later as the business grows.'],
      quiz: [
        _q('What is Business Name registration generally suited to?', ['Only large corporations', 'Sole proprietors and small partnerships', 'Government agencies only', 'Foreign businesses exclusively'], 1, 'This simpler structure fits the needs of most small, individually-run or small-partnership businesses.'),
        _q('What does a Limited Liability Company structure provide?', ['No additional benefit over Business Name', 'Personal liability protection, with more formal requirements', 'Automatic tax exemption', 'Guaranteed government contracts'], 1, 'This more formal structure offers legal protection separating personal assets from business liabilities.'),
        _q('Which structure is often the practical starting point for small agent businesses?', ['Limited Liability Company always', 'Business Name registration', 'Neither structure is ever necessary', 'A foreign business registration'], 1, 'Business Name registration is typically simpler, faster, and less costly, fitting most small operators\' initial needs.'),
        _q('Can a business upgrade from Business Name to Limited Liability later?', ['No, the choice is permanent', 'Yes, as the business grows and the added protection becomes more valuable', 'Upgrading is illegal', 'Only foreign businesses can upgrade'], 1, 'This flexibility allows businesses to start simple and formalize further as circumstances justify it.'),
        _q('What generally makes Limited Liability more suited to larger or higher-risk operations?', ['Nothing in particular', 'The added protection and formality becomes more valuable relative to its cost', 'It is always required regardless of size', 'It offers no real advantage at any scale'], 1, 'As stakes and complexity grow, the added protection of this structure becomes proportionally more worthwhile.'),
        _q('What is a practical first step suggested in this lesson?', ['Ignoring structure options entirely', 'Researching current specific requirements and costs for Business Name registration', 'Registering as a Limited Liability Company regardless of fit', 'Avoiding any research on the topic'], 1, 'Concrete research on actual requirements helps you make an informed, practical registration decision.'),
        _q('What should guide the choice between these two structures?', ['Random preference with no basis', 'Your current business size and risk level', 'Only what a competitor has chosen', 'Government mandate with no choice involved'], 1, 'A thoughtful assessment of your specific situation determines which structure genuinely fits your business.'),
        _q('What is the overall goal of this lesson?', ['To recommend avoiding all business structures', 'To help you understand and choose between Business Name and Limited Liability structures appropriately', 'To suggest only one structure exists', 'To discourage ever upgrading your business structure'], 1, 'The lesson equips you to make an informed structural choice suited to your business\'s actual current situation.'),
      ]),
    _lesson('c28', 3, 'What the Registration Process Actually Involves', 5, [
      'The CAC registration process generally involves choosing and reserving a business name, completing the relevant application (increasingly done online through CAC\'s portal), providing required identification and details, and paying the applicable fee — the exact steps and current fees are worth confirming directly with CAC\'s official resources since these details can change.',
      'Processing time varies, so plan for the registration to take some real time rather than assuming it will be instant, especially if you\'re racing against a specific deadline (like a big client requiring registration before a contract). Starting the process well ahead of any hard deadline avoids unnecessary pressure.',
    ], concepts: [KeyConcept('Plan for Real Processing Time', 'Registration isn\'t instant — start well ahead of any hard deadline (like a client requirement) rather than racing against it.')],
      steps: ['Visit CAC\'s official resources to confirm the current specific steps and fees for your chosen structure.', 'If you have any deadline driving your registration timing, start the process well ahead of it.'],
      takeaways: ['The registration process involves name reservation, application, identification/details, and a fee.', 'Confirm exact current steps and fees directly with CAC\'s official resources, since details can change.', 'Processing takes real time — start well ahead of any hard deadline rather than assuming instant completion.'],
      quiz: [
        _q('What are general steps in the CAC registration process?', ['No specific steps exist', 'Name reservation, application, providing identification/details, and paying a fee', 'Only a verbal request is needed', 'Registration requires no documentation at all'], 1, 'These are the general components of the formal registration process for a business.'),
        _q('Where should you confirm current exact steps and fees?', ['From informal rumors', 'Directly with CAC\'s official resources', 'From an unrelated government agency', 'These never need confirming'], 1, 'Official sources provide the most accurate, current information, since specific details can change over time.'),
        _q('Is the registration process instant?', ['Yes, always completed immediately', 'No, processing time varies and takes real time', 'Registration never actually completes', 'Processing time is always exactly one day'], 1, 'Realistic planning requires accounting for genuine processing time rather than assuming instant completion.'),
        _q('What should you do if you have a hard deadline driving your registration timing?', ['Wait until the last moment to start', 'Start the process well ahead of the deadline', 'Skip registration entirely to save time', 'Assume the deadline is flexible regardless'], 1, 'Starting early avoids unnecessary, avoidable pressure from real processing time requirements.'),
        _q('What is an example of a deadline that might drive registration timing?', ['A random personal preference', 'A big client requiring registration before a contract', 'The weather forecast', 'A social media trend'], 1, 'Business relationships requiring formal registration are a common, practical source of registration deadlines.'),
        _q('Why might registration details like fees change over time?', ['They never change under any circumstances', 'Regulatory processes and fees can be updated periodically', 'Change is impossible for government processes', 'Only foreign businesses experience changes'], 1, 'Regulatory details can be updated, making direct confirmation with official sources important for accuracy.'),
        _q('What is increasingly the method for completing the application?', ['Only in-person paper forms', 'Online through CAC\'s portal', 'Only through informal intermediaries', 'Registration cannot be completed at all'], 1, 'Online processes have become an increasingly common way to complete registration applications.'),
        _q('What is the overall goal of this lesson?', ['To discourage business registration due to complexity', 'To give a realistic, practical overview of what the registration process actually involves and how to plan for it', 'To suggest registration requires no planning at all', 'To recommend avoiding official CAC resources'], 1, 'The lesson provides practical, realistic expectations for navigating the actual registration process.'),
      ]),
    _lesson('c28', 4, 'What Changes After You\'re Registered', 5, [
      'Once registered, a few practical things typically change: you can open a proper business bank account under your registered name, you become eligible for certain loans and formal business relationships that required registration, and you take on certain ongoing responsibilities (potential annual filing requirements, maintaining accurate records tied to your registered status).',
      'Registration is a genuine milestone, but it\'s the start of new, ongoing responsibilities, not a one-time task you complete and forget. Understanding this upfront avoids the surprise of unexpected annual requirements down the line, connecting back to the compliance habits covered in the earlier taxes and compliance course.',
    ], concepts: [KeyConcept('Registration Is a Start, Not a Finish Line', 'Registration unlocks new opportunities but also brings ongoing responsibilities — it\'s a beginning, not a one-time completed task.')],
      steps: ['Research what ongoing filing or compliance requirements apply to your chosen registration structure.', 'Connect this back to your compliance review habit from the earlier taxes and compliance course.'],
      takeaways: ['Registration unlocks a proper business bank account, loan eligibility, and formal business relationships.', 'It also brings ongoing responsibilities, like potential annual filing requirements.', 'Registration is the start of new responsibilities, not a one-time task to complete and forget.'],
      quiz: [
        _q('What does registration typically unlock regarding banking?', ['Nothing changes about banking', 'The ability to open a proper business bank account under your registered name', 'Automatic account closure', 'Only personal banking remains possible'], 1, 'A registered business name allows opening a formal business bank account, distinct from a personal one.'),
        _q('What ongoing responsibility might come with registration?', ['No ongoing responsibilities at all', 'Potential annual filing requirements', 'Immediate business closure', 'Automatic tax exemption'], 1, 'Registered businesses often have ongoing compliance obligations, like periodic filings, to maintain their status.'),
        _q('Is registration a one-time task you complete and forget?', ['Yes, completely one-time with no follow-up', 'No, it is the start of new, ongoing responsibilities', 'Registration has no ongoing implications', 'This varies randomly by business'], 1, 'Registration brings ongoing obligations that need continued attention, not a single completed action.'),
        _q('What earlier course connects to the ongoing responsibilities mentioned here?', ['Social media for small business', 'The taxes and compliance course', 'Negotiation skills', 'Fraud prevention'], 1, 'The ongoing compliance habits from that earlier course directly apply to maintaining registered status.'),
        _q('What formal relationships become accessible after registration?', ['None become accessible', 'Certain loans and formal business relationships that required registration', 'Only informal community deals', 'Relationships become harder to form'], 1, 'Registration often opens doors to formal financial and business relationships previously unavailable.'),
        _q('What is the risk of not understanding registration\'s ongoing nature upfront?', ['No risk, ongoing requirements are obvious', 'Being surprised by unexpected annual requirements down the line', 'Registration automatically prevents any surprises', 'This understanding is irrelevant to success'], 1, 'Awareness of ongoing obligations upfront prevents unwelcome surprises after registration is complete.'),
        _q('What is a practical step suggested in this lesson?', ['Ignoring ongoing compliance requirements', 'Researching what ongoing filing or compliance requirements apply to your structure', 'Assuming no further action is ever needed post-registration', 'Avoiding any connection to earlier compliance habits'], 1, 'Understanding your specific ongoing requirements helps you maintain your registered status properly.'),
        _q('What is the overall message of this lesson?', ['Registration ends all business obligations', 'Registration is a genuine milestone that begins new, ongoing responsibilities worth understanding upfront', 'Registration has no practical effect on the business', 'Ongoing requirements never apply to small businesses'], 1, 'The lesson honestly frames registration as a meaningful but ongoing commitment, not a finish line.'),
      ]),
    _lesson('c28', 5, 'Deciding When the Time Is Right for You', 5, [
      'Bringing this course together: the right time to register is genuinely specific to your situation — signs it may be time include needing a formal bank account for growing revenue, a client or opportunity specifically requiring registration, or simply reaching a scale where informal operation feels increasingly risky or limiting.',
      'There\'s no universally "too early" or "too late" — what matters is making a deliberate, informed decision based on your actual business situation, using everything covered in this course, rather than either rushing prematurely or avoiding the topic indefinitely out of unfamiliarity.',
    ], concepts: [KeyConcept('The Right Time Is Specific to You', 'There\'s no universal "right time" to register — the decision should be deliberate and informed, based on your actual business situation.')],
      steps: ['Review the signs mentioned in this lesson and honestly assess how many currently apply to your business.', 'Make a deliberate decision (register now, register soon, or wait, with a specific reason) rather than leaving it unresolved indefinitely.'],
      takeaways: ['The right time to register is specific to your individual business situation.', 'Signs it may be time include growing revenue needs, client requirements, or outgrowing informal operation.', 'The goal is a deliberate, informed decision, not rushing prematurely or avoiding the topic indefinitely.'],
      quiz: [
        _q('Is there a universal "right time" to register that applies to every business?', ['Yes, exactly six months after starting', 'No, the right time is genuinely specific to each business\'s situation', 'Every business should register immediately on day one', 'Registration timing is entirely irrelevant'], 1, 'This decision depends on individual circumstances rather than a fixed, universal timeline.'),
        _q('What is a sign it may be time to register?', ['Having no customers at all', 'Needing a formal bank account for growing revenue', 'Wanting to remain informal forever regardless of growth', 'A random, unrelated event'], 1, 'Growing formal banking needs are a practical, concrete signal that registration may be worthwhile.'),
        _q('What is another sign mentioned that it may be time to register?', ['Avoiding all client relationships', 'A client or opportunity specifically requiring registration', 'Decreasing revenue with no growth', 'Losing interest in the business entirely'], 1, 'An external requirement from a valuable opportunity is a direct, practical trigger for registering.'),
        _q('What does this lesson recommend regarding the registration decision?', ['Rushing into it immediately regardless of fit', 'Making a deliberate, informed decision based on your actual situation', 'Avoiding the decision indefinitely out of unfamiliarity', 'Letting someone else decide for you randomly'], 1, 'The lesson emphasizes thoughtful, informed decision-making over either extreme of rushing or indefinite avoidance.'),
        _q('What is the risk of avoiding this decision indefinitely?', ['No risk, avoidance is always fine', 'Missing opportunities or facing increasing risk as the business grows informally', 'Registration becomes impossible after a certain point', 'Avoidance always improves the business'], 1, 'Indefinite avoidance can eventually limit growth opportunities or increase risk as the business scales.'),
        _q('What should the registration decision be based on?', ['Random guessing', 'Everything covered in this course, applied to your actual business situation', 'Only what a competitor has done', 'Ignoring all course content entirely'], 1, 'The course equips you to make this decision thoughtfully, using the structure, process, and timing guidance covered.'),
        _q('What is a sign of "outgrowing" informal operation, per this lesson?', ['Feeling registration is increasingly risky to avoid at your current scale', 'Never reaching any meaningful business scale', 'Deciding to shrink the business intentionally', 'Avoiding all growth entirely'], 1, 'A growing sense that informal operation is limiting or risky at your current scale is itself a meaningful signal.'),
        _q('What is the overall closing message of this course?', ['Registration timing is irrelevant and doesn\'t matter', 'Deciding when to register should be a deliberate, informed choice based on your specific business situation', 'Every business should register on the exact same schedule', 'Avoiding registration indefinitely is always the safest choice'], 1, 'The course closes by empowering a confident, informed registration decision rather than defaulting to confusion or avoidance.'),
      ]),
  ],
);

final List<Course> kCourses = [
  _course1,
  _course2,
  _course3,
  _course4,
  _course5,
  _course6,
  _course7,
  _course8,
  _course9,
  _course10,
  _course11,
  _course12,
  _course13,
  _course14,
  _course15,
  _course16,
  _course17,
  _course18,
  _course19,
  _course20,
  _course21,
  _course22,
  _course23,
  _course24,
  _course25,
  _course26,
  _course27,
  _course28,
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


