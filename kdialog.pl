#kdialog Notifications, by noquierouser http://noquierouser.uni.cx/ <noquierouser[at]gmail.com>
#Version 1.0.2 (whoa!)
#Based on Sound Pack code by Storm Dragon http://www.stormdragon.us/
#For usage with TTYtter http://www.floodgap.com/software/ttytter/ (duh!)
#Published under the Floodgap Free Software License: http://www.floodgap.com/software/ffsl/

use Switch;

sub notifier_kdialog
{
	my $class = shift;
	my $text = shift;
	my $ref = shift;
	my $title_append;
	my $sn;
	my $popup_timeout = 10;

        if (!defined($class)) {
	  #Initialize and tell me that it actually happened
	  print $stdout "kdialog Notifications is up and running, man.\n";
	  return 1;
        }

	#If it's a DM, it will show me the user who sent it in the title
	if ($class eq "DM") {
	  $sn = $ref->{'sender'}->{'screen_name'};
	}
	else {
	  $sn = $ref->{'user'}->{'screen_name'};
	}

	#This is just for cosmetic effects... or to know what's showing up.
	switch ($class){
	  case("DM") { $title_append = "DM from $sn"; }
	  case("reply") { $title_append = "Reply from $sn"; }
	  case("search") { $title_append = "$sn said (Search Results)"; }
	  else { $title_append = "$sn said"; }
	}

	#If it's a DM, it will timeout after a minute
	if ($class eq "DM") {
	  $popup_timeout = 60;
	}
	
	#I could have used the original system sentence used in Sound Pack,
	#but I red somewhere that it could have been used to "rm -rf" into my system.
	#So I got scared and I used this. Yup, I'm such a coward.
	
	#Testing in fluxbox I found out that kdialog is centered in the screen. That is a bug.
	#Now, I don't know how is this going to react in other Window Managers, so I'm just
	#filtering if fluxbox is running or not. I need to find a way to know which WM is
	#running in a lesser crude manner, avoiding further dependencies.
	my $exists = `pidof fluxbox`; #Or maybe use `wmctrl -m` and scrape the results?
	if (!$exists) {
		#In KDE4 (and I assume KDE3) this should locate itself where kdialog's popups are used to show.
		system 'kdialog', '--title', "TTYtter: $title_append", '--passivepopup', $text, $popup_timeout;
	}
	else {
		#This places the popup in the top right corner (-0, +15), mimicking KDE4 popups position.
		system 'kdialog', '--title', "TTYtter: $title_append", '--passivepopup', $text, $popup_timeout, '--geometry', '-0+15';
	}
        return 1;
}
        1;
