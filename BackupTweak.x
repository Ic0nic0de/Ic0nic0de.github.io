#define settingsPath [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Preferences/com.ic0nic0de.tripletaplockprefs.plist"]
//#define settingsPath @"/var/mobile/Library/Preferences/com.johnnywaity.timeunlockxiprefs.plist"

//--Class--//
@interface SpringBoard : NSObject
-(void)_simulateLockButtonPress;
@end

//--Vars--//
UITapGestureRecognizer * tapGesture;

%hook SBHomeScreenView
-(void)setFrame:(CGRect)arg1 {
  //first let the method set the frame
%orig;


    //check if the gesture exists first
  if(tapGesture == nil) {
      //if it doesnt, create one
    tapGesture = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lockDevice)] autorelease];
      //set the number of taps
    tapGesture.numberOfTapsRequired = 3;
      //add to the view
    [self addGestureRecognizer:tapGesture];
  }
}
//add a new method to the class
%new
-(void)lockDevice {
  NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:settingsPath];
  //Get Prefs
  bool enabled = [[prefs objectForKey:@"enabled"] boolValue];
  //Load Prefs
  if(!enabled){
}
  [(SpringBoard *)[%c(SpringBoard) sharedApplication] _simulateLockButtonPress];
}
%end
