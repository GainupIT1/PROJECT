USE [PROJECTS]
GO
/****** Object:  StoredProcedure [dbo].[Find]    Script Date: 31/07/2021 9:22:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PRoc [dbo].[Find] @ObjName Varchar(100)
as
Begin
	select * From SYS.all_objects Where NAme like '%' + @ObjName + '%';
End

GO
/****** Object:  StoredProcedure [dbo].[Project_Grn_Delete_Status]    Script Date: 31/07/2021 9:22:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Project_Grn_Delete_Status] @RowID Varchar(20)                
As                
Begin                
Declare @SQL As NVarchar(Max);                
Set @SQL = N'Delete From Project_Material_Status Where Grn_ID = #' + @RowID  + '#';      
Set @SQL =cast(REPLACE(@SQL ,'#',CHAR(39)) as nvarchar(MAX));                    
EXEC SP_EXECUTESQL @SQL;                    
--Print @SQL;                    
End       

GO
/****** Object:  StoredProcedure [dbo].[Project_Grn_Insert_Status]    Script Date: 31/07/2021 9:22:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Project_Grn_Insert_Status] @RowID Varchar(20)                
As                
Begin                
Declare @SQL As NVarchar(Max);                
Set @SQL = N'Insert into Project_Material_Status(OrdeR_ID, Proj_Type_ID, Proj_Activity_ID, Item_ID, Color_Id, SizE_Id, Grn_Qty, Grn_ID, Grn_Detail_Id, Grn_Ocn_DEtail_ID,  PO_Detail_ID)      
Select OrdeR_ID, Proj_Type_ID, Proj_Activity_ID, Item_ID, Color_Id, SizE_Id, Grn_Qty, Rowid Grn_ID, Grn_Detail_Id, Grn_Ocn_DEtail_ID,  PO_Detail_ID
from Project_Grn_DEtails_Fn()      
Where Rowid  = #' + @RowID  + '#';      
Set @SQL =cast(REPLACE(@SQL ,'#',CHAR(39)) as nvarchar(MAX));                    
EXEC SP_EXECUTESQL @SQL;                    
--Print @SQL;                    
End       

GO
