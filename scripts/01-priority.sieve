require ["include", "environment", "variables", "relational", "comparator-i;ascii-numeric", "spamtest", "extlists", "fileinto", "regex", "reject"];

######################## Configuration ########################

# Note: Personal filter requires a contact group named "Personal".

# Rejection message.
set "rejection_message" "Please do not contact me.";

# Destination folders or labels.
set "dmarc_label" "DMARC";
set "direct_label" "Direct";
set "security_label" "Security";
set "personal_label" "Personal";

# Security regex. Matches any of the below (case insensitive):
# - Variations of "sign in", "log in", "two step", "two factor".
# - Exactly "2fa", "security", "password", "email", "auth", "support".
set "security_regex" "(((log|sign)[\s-]?(in|on))|((two[\s-]?(step|factor))|2fa)|security|password|email|auth|support)";

######################## /Configuration ########################

# Custom rejection message for senders in the "Spam" list.
# Note: Proton documentation seems to be mistaken, this does not check the "Block" list.
if header :list "from" ":incomingdefaults:spam"
{
  	reject "${rejection_message}";

	# Do not run other sieves.
	stop;
}

# Check for direct emails that are not forwarded from an alias.
if allof (header :list "Delivered-To" ":addrbook:myself", not exists "X-Simplelogin-Type")
{ 
  	fileinto "${direct_label}";
}

# Check for emails that may be security related.
if header :regex "subject" "${security_regex}"
{
  	fileinto "${security_label}";

	# Do not run other sieves.
	stop;
}

# Check for emails that may be security related.
if header :contains "from" "DMARC"
{
  	fileinto "${dmarc_label}";

	# Do not run other sieves.
	stop;
}

# Check for mail from close personal contacts.
if header :list "from" ":addrbook:personal?label=Personal"
{
  	fileinto "${personal_label}";

	# Do not run other sieves.
	stop;
}