# Bubble Startup Documentation

## Project Name

AQUA BUBBLE MONITORING


## Project Description

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 12.2.10.

Bubble is a social media website which allows users, who sign-up for free profiles, to connect with their friends, new and old, online. It allows users to share pictures, videos and posts as well as joining groups and exchanging their thoughts in those group or on their profile. Functionalities of this website were created by three previous cohort. The second cohort, which specialized in java Full stack GCP, was in charge of creating more functionalities to improve users satisfaction and perfect their interactions. The third cohort focused on adding extra MVPs and user stories.

Enter the 4th generation of Bubble. This latest generation implements SRE practices, including defining SLOs, monitoring metrics, and building a CI/CD pipeline. In addition to hosting and tetsing the previously made Bubble application, the SRE batch streamlined the app to be available for constant monitoring and updating. This generation also involved a twist in which another team (Team Magma) disrupted the Aqua Bubble Monitoring app. This readme details the technologies used in order for Team Aqua to diagnose issues with their application and restore it back to health.


## Installation

* Java
   * Install [Java](https://www.java.com/en/download/manual.jsp)
* Jenkins
  * Install [Docker](http://docker.com)
  * Install Jenkins in Docker
     > docker run -d -p 8080:8080 -p 50000:50000 jenkins/jenkins
  * Install admin
     > docker exec -t -i (image name) cat/var/jenkins/home/secrets/initialAdminPassword
  * Install suggested plugins
* Angular 4
  * Install [NodeJS](https://nodejs.org/en/)
  * Install the CLI using the npm package manager:
     > npm install -g @angular/cli@12
* AWS RDS
   * Fleshhhhhh ~~~~ this out please.
   * Postgres Pod configiuration
      >
* EC2/EKS cluster
   * Create a
      >

## Development server
Preparing terminal environment
  * Run `npm install`
  * Run `ng update`
  * Run `npm update`
  * Proceed to Navigate to Angular instructions

Navigate to the Angular Application
Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The app will automatically reload if you change any of the source files.

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via a platform of your choice. To use this command, you need to first add a package that implements end-to-end testing capabilities.

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI Overview and Command Reference](https://angular.io/cli) page.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change. 
