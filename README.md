# Care Bridge

## About
This app was created with the idea of allowing seniors who don't like technology, but might need a little bit of help, to continue living on their own.  A simple to use interface would be created for seniors while a caregiver would be able to add/subtract services while being able to manage what those services were capable of doing.

### Technology used
* Ruby on Rails
* Bootstrap
* CSS & HTML
* Kroger API
* LINE messenging app API

## Challenges
From the beginning the plan was to focus on the senior side of things but we soon realized the main user journey to focus on was the caregiver.  We wanted to be able to have different categories of services, like groceries for example, and then the caregiver would be able to choose a provider that was in their area.  Unfortuantely because of time and available API's we weren't able to do this even though we had it setup to do initially.

LINE also didn't prove to be straight foward because the unique username that each user has is not how LINE identfies users.

Another challenge was tweaking Devise to allow us to create a User after already logged in.

## Solutions
For the Grocery API we were able to access Kroger's API.  It took a bit of time to work out but with the API we could search for products and add them to a list of items that could be added or subtracted from the list of items for the senior to choose from.  After ordering items a notice would be sent to the cargiver via LINE.

To allow users to connect LINE with our user we had them take a pic of a QR code.  After they received a message they would then send a message back with their Care Bridge username.  We then parsed out their Care Bridge ID and LINE id to connect them.  

## Final Thoughts
Overall for two weeks we accomplished a lot.  If given more time I would have liked to provide the user an array of options for each service instead of just limiting it to the one each.
