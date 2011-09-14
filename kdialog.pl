#kdialog Notifications, by noquierouser http://noquierouser.uni.cx/ <noquierouser[at]gmail.com>
#Based on Sound Pack code by Storm Dragon http://www.stormdragon.us/
#For usage with TTYtter http://www.floodgap.com/software/ttytter/ (duh!)
#Published under the Floodgap Free Software License: http://www.floodgap.com/software/ffsl/

use Switch;

sub notifier_kdialog
{
	my $class = shift;
	my $text = shift;
	my $ref = shift;
	my $title_prefix;
	my $popup_timeout = 10;

        if (!defined($class)) {
	  #Initialize and tell me that it actually happened
	  print $stdout "kdialog Notifications is up and running, man.\n";
	  return 1;
        }

	#This is just for cosmetic effects... or to know what's showing up.
	switch ($class){
	  case("dm") { $title_prefix = "DM from"; }
	  case("reply") { $title_prefix = "Reply from"; }
	  case("search") { $title_prefix = "Search Results -"; }
	  else { $title_prefix = ""; }
	}

	#If it's a DM, it will timeout after a minute
	if ($class eq "dm") {
	  $popup_timeout = 60;
	}
	
	#I could have used the original system sentence used in Sound Pack,
	#but I red somewhere that it could have been used to "rm -rf" into my system.
	#So I got scared and I used this. Yup, I'm such a coward.
	system 'kdialog', '--title', "$title_prefix $ref->{'user'}->{'screen_name'} - TTYtter", '--passivepopup', $text, $popup_timeout;
        return 1;
}
        1;