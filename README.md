# Whois:

</br>

```ruby
Compiler    : Delphi10 Seattle, 10.1 Berlin, 10.2 Tokyo, 10.3 Rio, 10.4 Sydney, 11 Alexandria, 12 Athens
Components  : None
Discription : Check Whois and Geolocation from Domain Host
Last Update : 08/2025
License     : Freeware
```

</br>

WHOIS (pronounced as the phrase "who is") is a query and response [protocol](https://en.wikipedia.org/wiki/Communication_protocol) that is used for querying databases that store an Internet resource's registered users or assignees. These resources include domain names, IP address blocks and [autonomous systems](https://en.wikipedia.org/wiki/Autonomous_system_(Internet)), but it is also used for a wider range of other information. The protocol stores and delivers database content in a human-readable format. The current iteration of the WHOIS protocol was drafted by the Internet Society, and is documented in [RFC 3912](https://en.wikipedia.org/wiki/Request_for_Comments).

### This is an example of how Whois information can be output in a Delphi application.
### Accept the Whois license with "Agree" before executing

</br>

![Whois](https://github.com/user-attachments/assets/9a1b3e4f-8957-40ef-b642-a639a6dc1643)

</br>

Whois is also the name of the command-line utility on most [UNIX](https://en.wikipedia.org/wiki/Unix) systems used to make WHOIS protocol queries. In addition, WHOIS has a sister protocol called Referral Whois ([RWhois](https://en.wikipedia.org/wiki/WHOIS#Referral_Whois)).

WHOIS lookups were traditionally performed with a [command line interface](https://en.wikipedia.org/wiki/Command-line_interface) application, but now many alternative web-based tools exist.

A WHOIS database consists of a set of text records for each resource. These text records consists of various items of information about the resource itself, and any associated information of assignees, registrants, administrative information, such as creation and expiration dates.

Two data models exist for storing resource information in a WHOIS database, the thick and the thin model.

</br>

### Regional Internet Registries:
WHOIS servers operated by [regional Internet registries](https://en.wikipedia.org/wiki/Regional_Internet_registry) (RIR) can be queried directly to determine the [Internet service provider](https://en.wikipedia.org/wiki/Internet_service_provider) responsible for a particular resource.

</br>

![Regional_Internet_Registries_world_map](https://github.com/user-attachments/assets/8bb584dd-5718-4d57-bb5f-e52d2161a06c)

</br>


</br>

The records of each of these registries are cross-referenced, so that a query to [ARIN](https://en.wikipedia.org/wiki/American_Registry_for_Internet_Numbers) for a record which belongs to [RIPE](https://en.wikipedia.org/wiki/RIPE) will return a placeholder pointing to the RIPE WHOIS server. This lets the WHOIS user making the query know that the detailed information resides on the RIPE server. In addition to the RIRs servers, commercial services exist, such as the [Routing Assets Database](https://en.wikipedia.org/wiki/Routing_Assets_Database) used by some large networks (e.g., large Internet providers that acquired other ISPs in several RIR areas).

### Server discovery:
There is currently no widely extended way for determining the responsible WHOIS server for a DNS domain, though a number of methods are in common use for [top-level domains](https://en.wikipedia.org/wiki/Top-level_domain) (TLDs). Some registries use [DNS SRV](https://en.wikipedia.org/wiki/SRV_record) records (defined in RFC 2782) to allow clients to discover the address of the WHOIS server. Some WHOIS lookups require searching the procuring domain registrar to display domain owner details.

### Query examples:
Normally the contact information of the resources assignee is returned. However, some registrars offer private registration, in which case the contact information of the registrar is shown instead.

Some registry operators are wholesalers, meaning that they typically provide domain name services to a large number of retail registrars, who in turn offer them to consumers. For private registration, only the identity of the wholesale registrar may be returned. In this case, the identity of the individual as well as the retail registrar may be hidden.

IP : 8.8.8.8  
URL : www.google.com

</br>

```
Connecting to whois.iana.org...

domain:       GOOGLE

organisation: Charleston Road Registry Inc.
address:      1600 Amphitheatre Parkway
address:      Mountain View CA 94043
address:      United States of America (the)

contact:      administrative
name:         TLD Admin
organisation: Google Inc.
address:      111 8th Avenue
address:      New York NY 10011
address:      United States of America (the)
phone:        +1 404 978 8419
fax-no:       +1 650 492 5631
e-mail:       iana-contact@google.com

contact:      technical
name:         TLD Engineering
organisation: Google Inc.
address:      76 Ninth Avenue, 4th Floor
address:      New York NY 10011
address:      United States of America (the)
phone:        +1 404 978 8419
fax-no:       +1 650 492 5631
e-mail:       crr-tech@google.com

nserver:      NS-TLD1.CHARLESTONROADREGISTRY.COM 2001:4860:4802:32:0:0:0:69 216.239.32.105
nserver:      NS-TLD2.CHARLESTONROADREGISTRY.COM 2001:4860:4802:34:0:0:0:69 216.239.34.105
nserver:      NS-TLD3.CHARLESTONROADREGISTRY.COM 2001:4860:4802:36:0:0:0:69 216.239.36.105
nserver:      NS-TLD4.CHARLESTONROADREGISTRY.COM 2001:4860:4802:38:0:0:0:69 216.239.38.105
nserver:      NS-TLD5.CHARLESTONROADREGISTRY.COM 2001:4860:4805:0:0:0:0:69 216.239.60.105
ds-rdata:     6125 8 2 80f8b78d23107153578bad3800e9543500474e5c30c29698b40a3db23ed9da9f

whois:        

status:       ACTIVE
remarks:      Registration information: https://www.registry.google

created:      2014-09-04
changed:      2025-04-11
source:       IANA


Connecting to GOOGLE...

  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed

  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0


100   304  100   304    0     0   1780      0 --:--:-- --:--:-- --:--:--  1798
{
  "ip": "8.8.8.8",
  "hostname": "dns.google",
  "city": "Mountain View",
  "region": "California",
  "country": "US",
  "loc": "37.4056,-122.0775",
  "org": "AS15169 Google LLC",
  "postal": "94043",
  "timezone": "America/Los_Angeles",
  "readme": "https://ipinfo.io/missingauth",
  "anycast": true
}
```

</br>

### Download Whois:
Whois performs the registration record for the domain name or IP address that you specify.  
Usage: whois [-v] domainname [whois.server]  
Domainname can be either a DNS name (e.g. www.sysinternals.com) or IP address (e.g. 66.193.254.46).

### Runs on:
* Client: Windows Vista and higher
* Server: Windows Server 2008 and higher
* Nano Server: 2016 and higher

By Mark Russinovich  
Published: December 11, 2019  

Whois v1.21 : https://learn.microsoft.com/en-us/sysinternals/downloads/whois

