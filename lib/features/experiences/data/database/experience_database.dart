import '../models/experience_model.dart';
import '../models/experience_project.dart';

const experiences = [
  ExperienceModel(
    organization: 'American Soft',
    title: 'Flutter Developer',
    period: '2026 – Present',
    description:
        'Dashboards with separate Admin, Technical and Center flavors.',
    highlights: [
      'Modules for orders, employees, centers, products, brands, invoices, treasury, wallets and financial reports.',
      'REST integration with Dio, Cubit and repositories, GetIt dependency injection.',
      'Role-based access, secure token handling, pagination, filtering and centralized error handling.',
      'Firebase Cloud Messaging, biometric authentication, PDF reporting, Google ML Kit translation, Shorebird OTA patches.',
    ],
    technologies: ['Cubit', 'Dio', 'GetIt', 'FCM', 'ML Kit', 'Shorebird'],
  ),
  ExperienceModel(
    organization: 'Freelance',
    title: 'Flutter Developer',
    period: '4 projects',
    description: 'Customer, admin, marketplace and Forex projects.',
    projects: [
      ExperienceProject(
        name: 'Al Reef Water',
        description: 'Bilingual customer storefront: offers, favourites, cart, addresses and orders.',
      ),
      ExperienceProject(
        name: 'Al Reef Dashboard',
        description:
            'Admin app for banners, product offers and incoming orders.',
      ),
      ExperienceProject(
        name: 'StbtrFx Economic Calendar',
        description: 'Forex app feature: filters, notification toggles and shareable event links.',
      ),
      ExperienceProject(
        name: 'Twins Gomla Market',
        description:
            'Excel bulk import, automatic categories, duplicate prevention.',
      ),
    ],
    technologies: ['Firestore', 'Storage', 'Batch writes', 'REST APIs'],
  ),
  ExperienceModel(
    organization: 'Thebes Academy',
    title: 'B.Sc. Computer Science',
    period: '2021 – 2025',
    description: 'Arabic (Native) · English (Professional)',
  ),
];
