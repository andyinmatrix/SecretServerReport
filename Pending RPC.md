---
created: ""
updated: 2025-04-12T00:21
tags:
  - PAM
  - report
---
# Description

Show the RPC pending secrets.

```
select 
	secretid,
	SecretName,
	tf.FolderPath,
	PasswordChangeStatus = 'Pending',
	PasswordChangeStatusLastChanged
from tbSecret ts
right join tbFolder tf on ts.FolderId=tf.FolderID
where PasswordChangeStatus=2
```
