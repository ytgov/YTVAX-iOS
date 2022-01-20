# Yukon Vaccination Verifier - iOS

#### The official mobile app from the Government of Yukon to verify vaccination status. This app will scan the QR code on proof of vaccination credentials to verify someone's COVID-19 vaccination status.

## Table of Contents

- [Project Resources](#markdown-header-project-resources)
- [Architecture](#markdown-header-architecture)
  - [Folder Structure](#markdown-header-folder-structure)
  - [Libraries](#markdown-header-libraries)
- [Configuration](#markdown-header-configuration)
  - [Build Configurations](#markdown-header-build-configurations)
  - [Environment Variables](#markdownpheader-environment-variables)
  - [APIs](#markdown-header-apis)
  - [Schemes](#markdown-header-schemes)
  - [Running the Code](#markdown-header-running-the-code)
- [Deployment](#markdown-header-deployment)
  - [Versioning](#markdown-header-versioning)
  - [Internal](#markdown-header-internal)
  - [External](#markdown-header-external)
- [Contributors](#markdown-header-contributors)

## Project Resources
---

- [JIRA Board](https://freshworks.atlassian.net/)
- [Designs](https://www.figma.com/)
- [Project Overview](https://sites.google.com/freshworks.io/project-hub/projects)
- [App Store](https://apps.apple.com/ml/app/yukon-vaccination-verifier/id1591117176)

## Architecture
---

Language: __Swift__

Design pattern: __MVVM__

-  Design pattern used for app: MVVM
  - The default iOS navigation system is used. The View controllers are embedded in the Navigation controller. Business logic is present in a dependency named BCVaccineValidator. View models associated with View controllers separate the UI from business logic. 
  - Does it differ from standard architecture? No.
  - Include UML diagram if needed. NA

Concurrency: __Grand Central Dispatch__

### Folder Structure
They are structured module-wise. Some shared resources like Extensions, Utilities, etc. are grouped under the Shared folder.

### Libraries

- [iOSVaccineValidator](https://github.com/bcgov/iOSVaccineValidator): The app's business logic is defined in this SDK. It validates the scanned QR and returns the appropriate result.

## Configuration
---

### Build Configurations

Build configurations used in the app

- DEV
  - App points to development endpoints and uses development configuration.
- TST
  - App points to testing endpoints and uses testing configuration.
- STG
  - App points to staging endpoints and uses staging configuration.
- ADHOC
  - App points to the configured endpoints and uses appropriate configuration. Used to share internal testing builds.
- PROD
  - App points to production endpoints and uses production configuration. Primarily used for App Store builds.

### Environment Variables

- DEV, TST, STG, ADHOC and PROD

### APIs

- No external services were used

### Schemes

- YukonVaccinationVerifierDEV, YukonVaccinationVerifierTST, YukonVaccinationVerifierSTG, YukonVaccinationVerifierADHOC, and YukonVaccinationVerifierPROD  

### Running the Code

- The project is compatible with Xcode 9.3 and above. During the initial source checkout, the dependencies need to be installed by using the 'pod install' terminal command. For more info on the pod, please check https://cocoapods.org 

## Deployment
---

### Versioning

It is based on Semantic Versioning. In version name 1.2.3, 1 stands for major change, 2 stands for a minor change, and 3 stands for patch fix.

### Internal

How is the app deployed and where?

Builds are generated manually, distributed via App Store. CI/CD implementation is in progress.

### External

How is the app deployed and where?

Builds generated manually, distributed via App Store.

## Contributors
---

List of past and present contributors. Mohamed Afsar, Mohamed Fawzy
