---
created: ""
updated: 2025-04-11T18:23
tags:
  - PAM
  - report
---
# Description

Retrieves lastest version upgrade event

```
SELECT TOP 1 [VersionNumber]
    ,[Upgraded]
FROM [tbVersion]
ORDER BY [Upgraded] DESC
```