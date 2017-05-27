# Luxe Concierge App


## User Story from Andrew


User usecase:  A user has their family coming over but their aparmtent is a complete mess.  Additionally they have to pick up their laundry at the same time. 
 
Solution:  User login into Luxe App and through Luxes message text component texts:  “I am heading out could i get someone to clean to my apartment at 3:00, sparkey is location under doormat”.
 
 
### End User Side -- Flow of this looks like so:
 
User has signs in with native login, or more likely their gmail or facebook to obtain Oauth token(mostly like since it is a native app users will not log out often if and the token will keep on refreshing to be valid)
 
 
If existing token is valid, then they are good to go. 
 
From the home screen would navigate to concierge text message and would send message to the concierge “I am heading out could i get someone to clean to my apartment at 3:00, spare key is location under doormat”.(thinking this would be powered by the twilio api, but regular is messaging native to app is fine for now if easier)
 
Concierge would text back “sure sending someone now”. 
 
There would be a calendar feature that would look at the day the text was sent to and place the task to that calendar date and associate with a calendar that could be opened in the app.
 
for example:
Apt Cleaning on May 26 at 3:00.
 
Also be a place to say the concierge tasks you required as well as the charges associated with it(extra feature but one necessary in the future.
 
___________________________________________________________________________
 
Focus on end user sidefor now, but here is the where the admin/conceierge side would come in
 
 
Concierge/apartment side(would focus on building end user side now) - Could be a web app ui or native ui -  Have a list of different conergie based texts from different tenants requesting different services.  Would manually reply back for availibility of services(would figure out a way to automate this in the future).
