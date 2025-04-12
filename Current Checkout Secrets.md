---
created: ""
updated: 2025-04-12T00:35
tags:
  - PAM
  - report
---
# Description

Show Current Checked out secrets

```
select 
	ts.SecretId, 
	ts.SecretName as [Secret Name], 
	tf.FolderPath as [Folder Path],
	tu.UserName as [Check Out Username],
	ts.CheckOutTime as [Check Out Time], 
	ts.CheckOutEndTime as [Check Out End Time],
	[Current Date] = CAST(CURRENT_TIMESTAMP AS DATETIME)
 FROM tbSecret ts
 right join tbUser tu on ts.CheckOutUserId=tu.UserId
 right join tbFolder tf on ts.FolderId=tf.FolderID
 where CheckOutEnabled='TRUE' 
 and CheckOutEndTime >= CAST(CURRENT_TIMESTAMP AS DATETIME)
```
