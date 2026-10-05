
SELECT 
	  tsi.[ItemValue] as [Is Privileged]
	  ,tsi.[SecretID]
      ,[SecretName]
      ,tst.[SecretTypeName] as [Secret Template]
	  ,tf.[FolderPath]
	  ,CASE
			WHEN [LastHeartBeatStatus] = 0 THEN 'Failed'
			WHEN [LastHeartBeatStatus] = 1 THEN 'Success'
			WHEN [LastHeartBeatStatus] = 2 THEN 'Disabled'
			WHEN [LastHeartBeatStatus] = 3 THEN 'Disabled'
			WHEN [LastHeartBeatStatus] = 4 THEN 'UnableToConnect'
			WHEN [LastHeartBeatStatus] = 5 THEN 'UnknownError'
			WHEN [LastHeartBeatStatus] = 6 THEN 'IncompatibleHost'
			WHEN [LastHeartBeatStatus] = 7 THEN 'AccountLockedOut'
			WHEN [LastHeartBeatStatus] = 8 THEN 'DnsMismatch'
			WHEN [LastHeartBeatStatus] = 9 THEN 'UnableToValidateServerPublicKey'
			WHEN [LastHeartBeatStatus] = 10 THEN 'Processing'
			WHEN [LastHeartBeatStatus] = 11 THEN 'ArgumentError'
			WHEN [LastHeartBeatStatus] = 12 THEN 'AccessDenied'
			ELSE 'Failed Unknown' 
		END as 'Heartbeat Status'
      , Case
			When ts.AutoChangeOnExpiration = 1 then 'True'
			Else 'False'
		End AS 'Password Auto Change Enabled'
	 ,[LastSuccessfulPasswordChangeDate]
	  ,tsp.[SecretPolicyName] as [Secret Policy]
	  ,[CheckOutEnabled]
	  ,[RequireViewComment] as [Require Comment]
      ,[RequireApprovalForAccessForOwnersAndApprovers] as [Require Approval]
      ,[IsSessionRecordingEnabled] as [Session Record]
	  ,[IsMultiFactorAuthenticationRequired] as [MFA]
  FROM [tbSecretField] tsf with(nolock)
  left join [tbSecretItem] tsi with(nolock) on tsf.[SecretFieldID]=tsi.[SecretFieldID]
  left join [tbSecret] ts with(nolock) on tsi.[SecretID]=ts.[SecretID]
  left join [tbSecretType] tst with(nolock) on tst.[SecretTypeID]=ts.[SecretTypeID]
  left join [tbFolder] tf with(nolock) on ts.[FolderId] = tf.[FolderID]
  left join [tbSecretPolicy] tsp with(nolock) on ts.[SecretPolicyId] = tsp.[SecretPolicyId]
  where [SecretFieldName]='Privileged'
		and ts.[Active]=1
		and tsi.[ItemValue]= 'Yes'

		
