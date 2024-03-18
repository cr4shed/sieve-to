require ["include", "environment", "variables", "relational", "spamtest", "extlists", "fileinto", "comparator-i;ascii-numeric", "vnd.proton.expire"];

######################## Configuration ########################

# Note: All filters require contact groups.

# Destination folders or labels.
set "social_label" "Social";
set "finance_label" "Finance";
set "newsletter_label" "Newsletter";
set "entertainment_label" "Entertainment";

######################## /Configuration ########################

# Check if sender is in the social contact group.
if header :list "from" ":addrbook:personal?label=SieveTo_Social"
{
  fileinto "${social_label}";
}

# Check if sender is in the entertainment contact group.
if header :list "from" ":addrbook:personal?label=SieveTo_Entertainment"
{
	fileinto "${entertainment_label}";
}

# Check if sender is in the finance contact group.
if header :list "from" ":addrbook:personal?label=SieveTo_Finance"
{
	fileinto "${finance_label}";
}

# Check if mail is a newsletter or advertisement.
if exists "list-unsubscribe"
{
  	fileinto "${newsletter_label}";
  	
	# Delete after 30 days.
	expire "day" "30";
}