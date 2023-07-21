# Note Taking App Notuwa

This is a note-taking app built using Flutter, which allows users to create and update notes along with attaching photos. The app provides options for user registration or Google sign-in to access its features.

## Features

- **User Registration:** Users can create their accounts within the app using email and password for authentication.

- **Google Sign-In:** Alternatively, users can choose to sign in using their Google accounts for quick access and ease of use.

- **Create Notes:** Once authenticated, users can create new notes by providing a title, content, and optionally, attach a photo from their device's gallery or take a new photo using the camera.

- **Update/Delete Notes:** Users have the ability to edit their existing notes, change titles, content

## Requirements

To run this app locally or deploy it on a device, you will need the following:

- **Flutter:** The app is built using Flutter, so you should have the Flutter SDK installed on your system. For instructions on installing Flutter, visit the official Flutter website: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)

- **Android Studio:** To run the app on Android and iOS devices respectively, you will need Android Studio set up on your machine.

## Getting Started

##### **Clone the repository** to your local machine:
#
```bash 
git clone https://github.com/Sushil787/Notuwa.git
```
##### install/update pacakge
#
``` bash 
flutter pub get
```
##### 

## Configuration

Before running the app, you need to configure Firebase for authentication and database storage. Follow these steps to set up Firebase:

1. Go to the Firebase Console [https://console.firebase.google.com/](https://console.firebase.google.com/) and create a new project.

2. In the Firebase project settings, locate and copy the `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) files provided by Firebase.

3. Place the `google-services.json` file in the `android/app/` directory and the `GoogleService-Info.plist` file in the `ios/Runner/` directory.

4. Enable Email/Password and Google Sign-in methods in the Firebase Authentication settings.

5. Enable Firestore database in the Firebase Database settings.

## Folder Structure

The app's codebase is organized as follows:


##### flutter run
#
``` bash 
flutter run
```


## Contributing

Contributions to the project are welcome! If you find any issues or want to add new features, feel free to submit a pull request.

## License

This project is licensed under the MIT License.

## Contact

If you have any questions or need further assistance, feel free to contact the project maintainers at `xushilgyawali@gmail.com`.




