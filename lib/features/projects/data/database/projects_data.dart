import '../models/project_link.dart';
import '../models/project_model.dart';
import '../../../../data/images.dart';
import 'package:flutter/material.dart';
import '../../../../core/enums/project_type.dart';

final List<ProjectModel> projects = [
  ProjectModel(
    index: "01",
    desktopSpan: 12,
    tabletSpan: 12,
    category: 'DASHBOARD',
    color: const Color(0xFF5EEAD4),
    name: 'American Soft Dashboard',
    cover: Images.americanSoftCover,
    projectType: ProjectType.company,
    images: Images.americanSoftImages,
    tags: const ['Cubit', 'Dio', 'GetIt', 'Flavors'],
    summary:
        'Internal operations dashboard for appliance maintenance: requests, dispatch, centers, technicians and service finances, shipped as three Android apps.',
    links: [
      ProjectLink.googlePlay(
        'https://play.google.com/store/apps/details?id=com.americangroup.dashboardAdmin',
        label: 'Admin',
      ),
      ProjectLink.googlePlay(
        'https://play.google.com/store/apps/details?id=com.americangroup.dashboard',
        label: 'Technical',
      ),
      ProjectLink.googlePlay(
        'https://play.google.com/store/apps/details?id=com.americangroup.dashboardCenter',
        label: 'Center',
      ),
    ],
  ),
  ProjectModel(
    index: "02",
    name: 'Surrah',
    color: const Color(0xFFA78BFA),
    cover: Images.surrahCover,
    images: Images.surrahImages,
    category: 'OFFLINE FINANCE',
    projectType: ProjectType.personal,
    tags: const ['Cubit', 'Hive', 'Hydrated BLoC'],
    summary:
        'Local personal finance tracker: income and expenses, custom categories, a balance dashboard and period reports. Arabic and English, stored on the device with Hive.',
    links: [
      ProjectLink.github('https://github.com/Hany-Hagar/surrah-app'),
      ProjectLink.googlePlay(
        'https://play.google.com/store/apps/details?id=com.surrah.app&pcampaignid=web_share',
      ),
    ],
  ),
  ProjectModel(
    index: "03",
    color: const Color(0xFFFB7185),
    name: 'StbtrFx Economic Calendar',
    cover: Images.stbtrfxCover,
    images: Images.stbtrfxImages,
    category: 'FOREX APP FEATURE',
    projectType: ProjectType.freelance,
    tags: const ['Cubit', 'Dio', 'GoRouter', 'Share links'],
    summary:
        'Bilingual economic calendar inside the StbtrFx Forex app: paginated events, period, impact and country filters, notification toggles and shareable event links.',
    links: [
      ProjectLink.googlePlay(
        'https://play.google.com/store/apps/details?id=com.code_plus.stbtrfx&pcampaignid=web_share',
      ),
    ],
  ),
  ProjectModel(
    index: "04",
    name: 'Al Reef Water',
    color: const Color(0xFF60A5FA),
    category: 'ORDERING APP',
    cover: Images.alReefCover,
    images: Images.alReefImages,
    projectType: ProjectType.freelance,
    tags: const ['Firestore', 'Firebase Auth', 'Cubit'],
    summary:
        'Bilingual water storefront: three offer categories, favourites, cart, delivery addresses with map search and order history, backed by Firebase.',
    links: [
      ProjectLink.googlePlay(
        'https://play.google.com/store/apps/details?id=com.code_plus.al_reef_water',
      ),
    ],
  ),
  ProjectModel(
    index: "05",
    category: 'ADMIN APP',
    name: 'Al Reef Dashboard',
    color: const Color(0xFF3DDC97),
    projectType: ProjectType.freelance,
    cover: Images.alReefDashboardCover,
    images: Images.alReefDashboardImages,
    tags: const ['Firestore', 'Cubit', 'Admin'],
    summary:
        'Admin app for the Al Reef store: promotional banners, product offers by audience, and incoming delivery orders with status badges.',
  ),
  ProjectModel(
    index: "06",
    tabletSpan: 12,
    desktopSpan: 12,
    category: 'MARKETPLACE',
    name: 'Twins Gomla Market',
    cover: Images.twinsGomlaCover,
    images: Images.twinsGomlaImages,
    color: const Color(0xFFF5B25A),
    projectType: ProjectType.freelance,
    tags: const ['Firestore', 'Storage'],
    summary:
        'Excel bulk product import with automatic category creation and duplicate prevention, using Firestore batch writes and parallel image handling.',
    links: [
      ProjectLink.googlePlay(
        'https://play.google.com/store/apps/details?id=com.orderappcomany.orderapp',
      ),
    ],
  ),
];