### HEART Framework
https://docs.google.com/presentation/d/11u46yTzRJhSvrs6AHRiwhF-a4mc-1TlPi3zeUTaKIhY/edit#slide=id.gc8216bd24_20_0

### NPS:
The Net Promoter Score data is collected when the user fills out the survey question when prompted. When the user creates their account, a counter is added that tracks the amount of logins. When the user accumulates a set number of logins a pop up will appear which will ask them “How likely are you to recommend PoliSEE to a friend or colleague?” That data along with their satisfaction score is documented and stored under the ratings collections in Firestore Database.

### Adoption:
Adoption is measured in the events page in the Analytics Dashboard. We can see the amount of signups in events which allows us to collect metrics for Adoption.

### Daily Active Users:
We are measuring Daily Active Users (DAU) using Firebase's built-in analytics tools. Firebase Analytics provides an "Active Users" metric, which automatically tracks the number of unique users who engage with the app each day. This includes users who open the app or trigger specific events within a 24-hour period.

### Retention:
The Firebase SDK automatically logs events such as app opens and session starts, which are then used to calculate retention metrics (e.g., day 1, day 7, day 30). Additionally, you can set up custom events for more detailed insights, with all data viewable in the Firebase Analytics dashboard.


### Search Rate:
This was essentially the click-through rate for our golden path. On Flutterflow, the toggle is flipped in the settings to automatically track when users go to the Search page and the Candidate page. We can divide the latter by the former to get what percentage of users search and find who they're looking for once they land on the Search page.

### Was This Article Useful Responses:
