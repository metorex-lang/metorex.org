---
title: "dates/time_zone_parsing.rb"
slug: dates-time-zone-parsing
description: "The metorex example program dates/time_zone_parsing.rb and its output."
---

`tests/_examples/dates/time_zone_parsing.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/dates/time_zone_parsing.rb){target=_blank rel=noopener}.

```metorex
require "time"

# A zone of -0000, UTC or Z reads as UTC, while +0000 names a local zone at
# UTC. An RFC 2822 date writes a time in UTC with the zone -0000.
p Time.rfc2822("Thu, 01 Jan 1970 00:00:00 -0000").utc?
p Time.rfc2822("Thu, 01 Jan 1970 00:00:00 +0000").utc?
p Time.xmlschema("2000-01-01T00:00:00Z").utc?
p Time.parse("2000-01-01 00:00:00 UTC").utc?
p Time.httpdate("Thu, 01 Jan 1970 00:00:00 GMT").utc?
p Time.at(0).utc.rfc2822
p Time.at(0).getlocal("+05:30").rfc822
```

Output:

```
true
false
true
true
true
"Thu, 01 Jan 1970 00:00:00 -0000"
"Thu, 01 Jan 1970 05:30:00 +0530"
```
