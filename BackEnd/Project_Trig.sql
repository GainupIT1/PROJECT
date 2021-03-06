USE [PROJECTS]
GO
/****** Object:  DdlTrigger [DDL_Trigger]    Script Date: 31/07/2021 9:26:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Trigger [DDL_Trigger] On Database For Create_Table, Drop_table, 
Alter_Table, Create_Procedure, Alter_Procedure, Create_function, Alter_Function, 
Create_Trigger, Alter_trigger, Create_View, Alter_View 
as
Begin
	INsert into MIS.dbo.Event_Log (EventType, ObjectName, Definition, DbName) 
	Select EVENTDATA().value ('(/EVENT_INSTANCE/EventType)[1]', 'Varchar (255)'),
	EVENTDATA().value ('(/EVENT_INSTANCE/ObjectName)[1]', 'Varchar (255)'), 
	EVENTDATA().value ('(/EVENT_INSTANCE/TSQLCommand)[1]', 'NVarchar(max)'),
	EVENTDATA().value ('(/EVENT_INSTANCE/DatabaseName)[1]', 'NVarchar(max)')
End

GO
ENABLE TRIGGER [DDL_Trigger] ON DATABASE
GO
