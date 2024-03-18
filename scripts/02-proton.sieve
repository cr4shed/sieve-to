require ["include", "environment", "variables", "relational", "comparator-i;ascii-numeric", "spamtest", "fileinto"];

######################## Configuration ########################

# Destination folders or labels.
set "proton_label" "Proton";

######################## /Configuration ########################

# Check for emails from Proton.
if address :is "from" ["no-reply@news.proton.me", "no-reply@notify.proton.me" , "no-reply@offers.proton.me", "no-reply@mail.proton.me", "no-reply@referrals.proton.me"]
{
  	fileinto "${proton_label}";

	# Do not run other sieves.
	stop;
}