# Chat AI – Google Gemini Powered Assistant (SwiftUI)

Chat AI is an iOS application built with SwiftUI that leverages Google Gemini to provide users with relevant and detailed information across a wide range of topics.

## Features
- SwiftUI-based application for modern, responsive UI
- Integration with Google Gemini API for intelligent data retrieval
- Efficient and fast responses for daily inquiries or in-depth research

## Prerequisites
Before running the application, you will need to obtain an API key from Google AI Gemini.

### Steps to Get the API Key
1. Go to the [Google AI Studio](https://aistudio.google.com/app/apikey).
2. Sign in with your Google account.
3. Generate an API key under the **Gemini API** section.
4. Copy the generated API key.

### Adding the API Key to the App
Once you have the API key, follow these steps to add it to the app:

1. Open the project in Xcode.
2. In the Project Navigator, locate the file named `Info.plist` in your app's main folder.
3. Add the following entry to your `Info.plist` file:

    ```xml
    <key>Api_Key</key>
    <string>YOUR_API_KEY_HERE</string>
    ```

   Replace `YOUR_API_KEY_HERE` with the API key you copied from Google AI Studio.

4. Save the file and build the project.

## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/chat-ai.git
    ```

2. Open the project in Xcode:
    ```bash
    cd chat-ai
    open ChatAI.xcodeproj
    ```

3. Add your Google Gemini API key as described in the [Adding the API Key to the App](#adding-the-api-key-to-the-app) section.

4. Run the project on a simulator or device.
