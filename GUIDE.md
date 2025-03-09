# Guide to Building and Running the Recipe Generator iOS App

This guide will walk you through the process of setting up, building, and running the Recipe Generator iOS app using Xcode.

## Prerequisites

- A Mac computer running macOS Monterey (12.0) or later
- Xcode 14.0 or later (download from the Mac App Store)
- An Apple ID (for testing on a physical device)

## Step 1: Set Up Xcode

1. Install Xcode from the Mac App Store if you haven't already.
2. Open Xcode and sign in with your Apple ID (Xcode > Preferences > Accounts).

## Step 2: Create a New Xcode Project

Since we've created our app using Swift Package Manager, we need to create an Xcode project to build and run it on iOS:

1. Open Xcode.
2. Choose "Create a new Xcode project".
3. Select "iOS" as the platform and "App" as the template, then click "Next".
4. Enter "RecipeGenerator" as the Product Name.
5. Choose "SwiftUI" for the Interface.
6. Choose "Swift" for the Language.
7. Select your Team (or create a personal team with your Apple ID).
8. Choose a location to save the project and click "Create".

## Step 3: Import the Swift Package Manager Code

1. Delete the default files created by Xcode (except for Info.plist and the project files).
2. Copy all the files from our Swift Package Manager project into the Xcode project.
3. Make sure to organize the files into groups that match our directory structure.

## Step 4: Configure the Project

1. Select the project in the Project Navigator.
2. Select the "RecipeGenerator" target.
3. In the "General" tab, set the Deployment Target to iOS 15.0 or later.
4. Set the App Icons and Launch Screen.

## Step 5: Build and Run the App

1. Select a simulator from the scheme dropdown (e.g., iPhone 14).
2. Click the "Run" button (or press Cmd+R).
3. The app should build and launch in the simulator.

## Step 6: Testing on a Physical Device

To test on a physical iOS device:

1. Connect your iOS device to your Mac.
2. Select your device from the scheme dropdown.
3. You may need to trust the developer certificate on your device.
4. Click the "Run" button to build and install the app on your device.

## Troubleshooting

If you encounter any issues:

1. Check the console output in Xcode for error messages.
2. Make sure all files are properly included in the target.
3. Clean the build folder (Product > Clean Build Folder) and try building again.
4. Restart Xcode if necessary.

## Next Steps for Your MVP

Now that you have a basic working app, consider these next steps:

1. **Improve the UI**: Add custom icons, better images, and a more polished design.
2. **Add More Recipes**: Expand the sample recipes or connect to a recipe API.
3. **Implement User Preferences**: Allow users to filter recipes by dietary restrictions.
4. **Add Search Functionality**: Let users search for recipes by name or ingredients.
5. **Implement Recipe Sharing**: Allow users to share recipes with friends.

## Preparing for App Store Submission

When you're ready to submit your app to the App Store:

1. Create app icons in all required sizes.
2. Take screenshots for the App Store listing.
3. Write a compelling app description.
4. Set up App Store Connect for your app.
5. Archive your app (Product > Archive) and submit it for review.

Good luck with your Recipe Generator app! 