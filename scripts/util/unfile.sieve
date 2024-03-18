require ["include", "environment", "variables", "relational", "comparator-i;ascii-numeric", "spamtest", "extlists", "fileinto"];

# Note: This is a utility script to be run when necessary and is not meant to be an active sieve.
# Empty trash BEFORE running script on existing mail or it will be placed back into inbox.

# Generated: Do not run this script on spam messages
if allof (environment :matches "vnd.proton.spam-threshold" "*",
spamtest :value "ge" :comparator "i;ascii-numeric" "${1}")
{
    return;
}

# Do not touch sent mail.
if not header :list "from" ":addrbook:myself"
{
	# File (or refile) into main inbox.
  	fileinto "Inbox";

	# Do not run any other filters.
	stop;
}
