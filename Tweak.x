#import <Cephei/HBPreferences.h>

HBPreferences *preferences;
BOOL enabled;
NSString* urlString;

%hook DCDAvatarView
-(void)setURLString:(id)arg1 {
	if(enabled && urlString != nil) {
		%orig(urlString);
	} else {
		%orig;
	}
}
-(void)setURLString:(id)arg1 cornerRadius:(CGFloat)arg2 {
	if(enabled && urlString != nil) {
		%orig(urlString, arg2);
	} else {
		%orig;
	}

}
-(void)setURLString:(id)arg1 success:(id)arg2 failure:(id)arg3 {
	if(enabled && urlString != nil) {
		%orig(urlString, arg2, arg3);
	} else {
		%orig;
	}
}
%end


%hook RCTImageSource
-(id)initWithURLRequest:(id)arg1 size:(CGSize)arg2 scale:(CGFloat)arg3 {
	// This is to ensure that we are only changing avatars, and not discord's own UI.
	if(enabled && urlString != nil) {
		if(arg2.height == 0 && arg2.width == 0) {
			return %orig([[NSURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]], arg2, arg3);
		}
	}
	return %orig;
}
%end

%ctor {
	preferences = [[HBPreferences alloc] initWithIdentifier:@"com.fiore.awataraprefs"];
	[preferences registerBool:&enabled default:NO forKey:@"kEnabled"];
	[preferences registerObject:&urlString default:@"" forKey:@"kUrl"];
}