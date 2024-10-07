SpaceNow

SpaceNow is a IOS application built with Swift and SwiftUI, providing users with the latest space-related news and articles. The app integrates with the SpaceFlight News API to deliver real-time updates on space exploration, rocket launches, scientific discoveries, and more.

Features

	•	Latest Space News: Stay up to date with real-time articles and updates on space-related events.
	•	Smooth User Interface: Built with SwiftUI, offering a modern and responsive user experience.
	•	Error Handling: Implemented robust error-handling mechanisms for API requests.
	•	MVVM Architecture: Uses the Model-View-ViewModel (MVVM) pattern for better code organization and separation of concerns.

Tech Stack

	•	Language: Swift
	•	UI Framework: SwiftUI
	•	Architecture: MVVM (Model-View-ViewModel)
	•	API Integration: SpaceFlight News API
	•	Error Handling: Custom error boundaries and fallback UI

How It Works

	1.	MVVM Architecture:
	•	Model: Represents the data (news articles) fetched from the SpaceFlight News API.
	•	ViewModel: Handles the business logic, processes the data from the model, and provides it to the view.
	•	View: Displays the UI and updates dynamically based on data changes from the ViewModel.
	2.	Fetching News Articles:
	•	SpaceNow makes API requests to the SpaceFlight News API to fetch space-related articles.
	•	The app retrieves the article titles, descriptions, images, and publication dates and displays them in a user-friendly layout.
	3.	Displaying the News:
	•	Articles are presented in a clean, scrollable format with support for mobile responsiveness through SwiftUI’s declarative design.
	4.	Error Handling:
	•	SpaceNow includes error handling that ensures the app gracefully displays error messages when API calls fail.

Contributions

We welcome contributions! If you want to add a new feature or improve the code, feel free to open a pull request.

License

This project is licensed under the MIT License. See the LICENSE file for more details.

This version is now more aligned with your development setup. Let me know if you’d like any further changes!
