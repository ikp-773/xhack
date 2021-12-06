
![](https://img.shields.io/github/languages/top/ikp-773/xhack?style=for-the-badge) 
![](https://img.shields.io/github/languages/code-size/ikp-773/xhack?color=orange&style=for-the-badge) 

X-Hack is an app with basic user interface where the participants can select the category, submit a query, and receive a response and the domain experts can respond to the queries by the participants.

[![](https://img.shields.io/badge/APK-X-Hack-brightgreen?color=purple&style=for-the-badge)]( http://bit.ly/Cov-Ahead)

## Team members
1. Aswathy Sujith
2. Archana Vijayakumar
3. [Abhijith Kp](https://github.com/ikp-773)

## Team Name
  Team Kim 
  
## Product Pitch

[Link to Presentation](https://drive.google.com/file/d/1h-pcRTT2yqy5AO16gD28DRCjZUR0dgCm/view?usp=sharing)

## How it Works ?
Google Firebase is used as the backend. Firestore as the database for storing both participants and domain experts data. Firebase authentication to authenticate users using email and password.

This application is for both participants and domain experts.You can choose your role when you are signing in. 

For participants, it takes you to the page where they can choose one from the given problem statements. They can ask queries regarding the selected problem after choosing the problem statement to which the domain experts can respond.

For domain experts, once they sign up, they can navigate to their corresponding hackathon and the domain in which they are expertised. From there they can respond to the queries posted by the participants.


## Libraries used
 - get: ^4.5.1
 - firebase_core: ^1.10.2
 - firebase_storage: ^10.2.0
 - firebase_auth: ^3.3.0
 - cloud_firestore: ^3.1.1

## How to configure

#### 1. [Flutter Environment Setup](https://flutter.dev/docs/get-started/install)

#### 2. Clone the repo

```sh
$ git clone https://github.com/ikp-773/xhack.git
$ cd xhack/
```

#### 3. Setup the firebase app

1. You'll need to create a Firebase instance. Follow the instructions at https://console.firebase.google.com.
2. Once your Firebase instance is created, you'll need to enable Google authentication.

* Go to the Firebase Console for your new instance.
* Click "Authentication" in the left-hand menu
* Click the "sign-in method" tab
* Click "Google" and enable it
* Click "Email/Password" and enable it

3. Enable the Firebase Database
* Go to the Firebase Console
* Click "Firestore Database" in the left-hand menu
* Click the "Create Database" button
* It will prompt you to set up, rules, for the sake of simplicity, let us choose test mode, for now.
* On the next screen select any of the locations you prefer.

4. In the Firebase console, in the settings of your Android app, add your SHA-1 key by clicking "Add Fingerprint".

5. Download google-services.json and place `google-services.json` into `/android/app/`.

## How to Run

1. `flutter pub get`
2. `flutter run`
