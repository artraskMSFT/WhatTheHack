
ALTER PROC [Integration].[CreateLineageKey] @TableName [sysname]--,@NewCutoffTime [datetime2](7) 
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @DataLoadStartedWhen datetime2(7) = SYSDATETIME();
	DECLARE @NewCutoffTime datetime2(7)


    INSERT Integration.Lineage
        ([Data Load Started], [Table Name], [Data Load Completed],
         [Was Successful], [Source System Cutoff Time])
    --VALUES
    --    (@DataLoadStartedWhen, @TableName, NULL,
    --     0, @NewCutoffTime);

	SELECT @DataLoadStartedWhen
			, @TableName
			, NULL
			, 0
			, [Load_Date]
    FROM Integration.[Load_Control]; 


END;
