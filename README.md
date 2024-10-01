# Meow Facts 🐱

Meow Facts is a small mobile application that provides random facts about cats. This app is built using the MVC architecture and uses a REST API to fetch cat facts. The primary goal is to provide users with interesting cat facts, with the option to refresh for a new fact by pressing a button.


## 🚀 Features
- Display random cat facts.
- Refresh fact with a single button click.
- Minimalistic and user-friendly interface.

## 🛠 Technologies and Architecture
- **Programming Language**: Swift
- **Architecture**: MVC (Model-View-Controller)
- **REST API**: Uses the public [Cat Facts API](https://catfact.ninja/fact) for fetching data.
- **Dependency Injection**: Using protocols for dependency injection.
- **UIKit**: For building the user interface.

## 📲 Installation and Running
To run the project locally, follow these steps:

1. Clone the repository:
```bash
    git clone https://github.com/your-username/Meow-Facts.git
```
2. Navigate to the project folder:
```bash
    cd Meow-Facts
``` 
3. Open the project in Xcode:
```bash
    open Meow-Facts.xcodeproj
```
4. Run the project using a simulator or a connected device.

## 🔑 Configuration

The project uses the Cat Facts API. There’s no need to configure an API key, as the service is open for use.

## 📂 Project Structure

The project is organized as follows:

Models: Contains CatFact.swift, which describes the cat fact data model.
Views: MainView.swift — responsible for UI components, such as labels and buttons.
ViewControllers: MainViewController.swift — the main controller managing the cat facts screen.
Services: CatFactsService.swift and CatFactsServiceProtocol.swift — for API communication and fetching facts.

## ⚙️ Dependencies

The project does not use third-party libraries, only URLSession for networking and the standard Swift and UIKit frameworks.

## 💡 How It Works

CatFactsService sends a network request to the Cat Facts API.
MainViewController calls the fetchCatFact() method from the service and updates the view.
MainView displays the fetched cat fact and includes a button to get a new one.

## 👨‍💻 Author

Nikita Smoliar


Thank you for checking out Meow Facts! I hope you enjoy discovering fun cat facts as much as I enjoyed building this app! 😊


