### Name: Position of Search Bar on Search Page
- US4: Golden Path
- Metric: Retention 
- Hypothesis: By changing the position of the search bar within the search page, it will help direct the user to the next step in the golden path and make the interface more user-friendly.
- Experiment: We will show half of our users the original position of the search bar and the other half will see the updated version. We will measure the amount of users using the search bar once logged in to see which position is the most effective. We can do this through Firebase’s built in A/B  testing and Remote Config features.
- Variations: ![image](https://github.com/user-attachments/assets/0b1c4f03-c134-4cfc-a3df-d587732acea0)
  ![image](https://github.com/user-attachments/assets/062b51a5-5e9e-4c6a-bf90-854292216ce6)




  
---
### Name: Background Color of Search Page
- US4: Golden Path
- Metric: Adoption
- Hypothesis: Changing the app’s background color from white to yellow will make the news feed feel more politically neutral and visually engaging, leading to longer session durations and more articles read per visit.
- Experiment: Using Firebase Remote Config and A/B Testing tools, we will create two variants of the app:

Control Group (50% of users): Default white background.

Variant Group (50% of users): Yellow background (#FFF8D0 or a similar warm neutral tone).
- Variations: ![image](https://github.com/user-attachments/assets/aa60d4a5-ac06-4805-915f-0907a83ee1ce)
This is how the standard yellow background would look.

![image](https://github.com/user-attachments/assets/2bd9ed7c-f7bf-4a57-aa05-25a8a7755f01)
---
### Name: Font on the Candidate Page
- US4: Golden Path
- Metric: Retention
- Hypothesis: Changing the font from Karma to Roboto will make the page easier to read and more user-friendly, leading to them coming back to the app for longer.
- Experiment: Because of our small audience to begin with, we will show half of the users the font in Roboto and half of them will stay with Karma. We will use Firebases built-in Remote Config and A/B Testing capabilities to update the font chosen by the app for half of our users. We will only show it to half of our users so that we can directly compare them. If we made the change for all of our users, it would not be clear if the font was affecting retention or if some other contemporaneous change was. We will measure the retension rates on Firebase for members of both groups and compare if either has significantly higher retention rates. We will wait two weeks to make sure that any effects of this change are not due to novelty bias before comparing.
- Variations: On one version, the screen will be Karma
![image](https://github.com/user-attachments/assets/9d573bad-3583-4c79-abb7-ee1817c18557)
- And in the other, it will be Roboto
![image](https://github.com/user-attachments/assets/b834e66e-a65f-4604-b53f-0773da7c686e)

---
### Name: Position of the Textfield on the Candidate Page
- US4: Golden Path
- Metric: Engagement
- Hypothesis: Placing the summary text before the main content will allow users to better understand the key points right away, leading to increased engagement with the rest of the page. Conversely, placing the summary at the end will encourage users to explore the main content first, potentially leading to deeper interaction with the content itself.
- Experiment: We will show half of the users the summary text at the beginning of the page, directly before the main content. The other half will see the summary text at the end of the page, after they’ve interacted with the content. We will measure user engagement, such as time spent on the page and the number of interactions with the main content, to determine which layout leads to more meaningful engagement. Firebase’s A/B Testing and Remote Config features will be used to implement this experiment.

- Variations:
  - Variation 1 (Summary Before Content): <img width="372" alt="before" src="https://github.com/user-attachments/assets/b58cd030-9a37-43cb-a5e8-65cd6af2fe51" />
  - Variation 2 (Summary After Content): <img width="366" alt="after" src="https://github.com/user-attachments/assets/e094311d-858c-4512-9c58-4e4aa7e7eef0" />

---
### Name: Presence of Logo on Candidate Page
- US6: Metrics Collection for User Engagement and Product Optimization
- Metric: Retention
- Hypothesis: We hypothesize that including the PoliSEE logo on the Candidate Page will increase user retention. The presence of the logo may enhance brand recognition, create a more polished and trustworthy experience, and encourage users to explore more pages within the app. Conversely, a lack of branding might make the page feel disconnected, leading to lower engagement and fewer return visits.
- Experiment: Because our audience is relatively small, we will divide users into two groups: one that sees the Candidate Page with the PoliSEE logo and one that sees it without. Using Firebase’s Remote Config and A/B Testing tools, we will ensure an even split between the two versions. This controlled approach allows us to isolate the impact of the logo on retention without interference from other potential changes. We will track return visits using Firebase Analytics and compare retention rates between the two groups. The experiment will run for two weeks to account for any short-term novelty effects before drawing conclusions.
- Variations: With and without the PoliSEE logo
<img width="341" alt="Image" src="https://github.com/user-attachments/assets/0ed36567-9fe3-4c31-acf2-19bb30459364" />
<img width="343" alt="Image" src="https://github.com/user-attachments/assets/c87832a2-f103-4dea-9913-aa27f751a81a" />
---
