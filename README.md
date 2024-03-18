## SieveTo

Collection of custom Sieve scripts and contact lists used to filter mail into different folders and labels. Leverages contact groups to easily modify sorting rules from any device without having to make updates to the script itself.

| Pros | Cons |
| :------------: | :------------: |
|<li>Low/no code</li><li>One filter to rule them all</li><li>Easy to add contacts to adjust sorting rules</li><li>Unknown senders appear directly in main inbox</li>|<li>Cannot use wildcards</li><li>Contact emails must be explicit</li>|

## Usage

1. Import contact lists. The default contact groups are ```SieveTo_{category}``` but can be modified to use an existing contact group by changing the *Categories* column in the contact list csv file.

2. Add the Sieve scripts as new filters and edit the configuration as needed.

3. Create folders and/or labels matching the configuration. Default structure can be found [here](https://github.com/cr4shed/sieve-to/blob/main/structure.md "here").

## Sieve Documentation

[Proton Mail Guide](https://proton.me/support/sieve-advanced-custom-filters)

[Sieve Documentation](https://datatracker.ietf.org/doc/html/rfc5228 "Sieve Documentation")

[External Lists Extension](https://datatracker.ietf.org/doc/html/rfc6134 "Extlists Sieve extension")