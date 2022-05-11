# CalculatorApp

Calculator App made with **Flutter** for the Web-Based Mobile Application course at Petra Christian University made by Calvert Tanudihardjo, **NRP:** C14190033

## Setup
Run this command on this repository directory
```power-shell
flutter build appbundle --target-platform android-arm,android-arm64
```

## Preview

### Main Page
The calculator is available in **Dark** and **Light** mode. The UI is inspired from [julvikramsupandi](https://github.com/julvikramsupandi/flutter-ui-calculator-neumorphism).
<p float="left">
  <img src="https://user-images.githubusercontent.com/56993480/164977697-43e097e4-aaea-4f46-9980-4b1ce9bcc601.jpg" width="272" />
  <img src="https://user-images.githubusercontent.com/56993480/164977701-a4a380a0-1af4-4a1b-b5a4-ab11c324c0e5.jpg" width="272" /> 
</p>

### Error Checking 
An error message will be displayed using [Snackbar](https://docs.flutter.dev/cookbook/design/snackbars) at the bottom of the screen.
<p float="left">
  <img src="https://user-images.githubusercontent.com/56993480/164977990-1f562a4f-ad26-43c8-afc8-b87c5762775a.jpg" width="272" />
  <img src="https://user-images.githubusercontent.com/56993480/164977991-e578c457-4970-416b-9980-7ab9f9416fef.jpg" width="272" /> 
</p>

### Result Page
The result page will appear when the user presses the '=' button to display the calculation results inputted by the user. Expression are calculated with the [math_expressions](https://pub.dev/packages/math_expressions) library.
<p float="left">
  <img src="https://user-images.githubusercontent.com/56993480/164977841-fbf93874-aa99-41f0-a62e-93cb7c9406b7.jpg" width="272" />
  <img src="https://user-images.githubusercontent.com/56993480/164977843-8ec3e652-1638-4c3b-8de6-f564d2a7c130.jpg" width="272" /> 
</p>

### History Page (old)
The results of calculations inputted by user will be stored in the form of **Map<String, String>** and displayed on the History page.
<p float="left">
  <img src="https://user-images.githubusercontent.com/56993480/164978323-31bdc454-a71a-480a-9aa3-fe792a041c7d.jpg" width="272" />
  <img src="https://user-images.githubusercontent.com/56993480/164977854-0559a396-7050-4040-87f3-ca1b787bd366.jpg" width="272" />
  <img src="https://user-images.githubusercontent.com/56993480/164977857-b4d6dca1-f280-4c01-aafd-9e01fb880a8e.jpg" width="272" /> 
</p>

### History Page (updated)
User can delete one of the calculation results by swiping to the right on the specified calculation result, then an Alert Dialog will appear to confirm. If the user chooses to delete, a SnackBar will appear at the bottom of the screen as confirmation.
<p float="left">
  <img src="https://user-images.githubusercontent.com/56993480/167846858-da2a27cf-ca8a-4a2a-89db-20a521a31a4e.png" width="272" />
  <img src="https://user-images.githubusercontent.com/56993480/167847327-fc878e2e-2827-4f8f-8205-ef8f4cf94689.png" width="272" />
  <img src="https://user-images.githubusercontent.com/56993480/167847568-841793b3-a018-4abc-a08a-6715535ed3bc.png" width="272" /> 
</p>
