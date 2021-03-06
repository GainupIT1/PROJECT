USE [PROJECTS]
GO
/****** Object:  UserDefinedFunction [dbo].[Get_Accounts_YearCode]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Function [dbo].[Get_Accounts_YearCode] (@Date Datetime) Returns Varchar (10)   
as  
Begin  
 Declare @Res as Varchar (10);  
 Select @Res = (Case when Month(@Date) < 4 then cast((Year(@Date) - 1) as Varchar (4)) + '-' + Cast(Year(@Date) as Varchar (4)) else  
 Cast(Year(@Date) as Varchar (4)) + '-' + cast((Year(@Date) + 1) as Varchar (4)) end)   
 Return @Res;  
End
GO
/****** Object:  UserDefinedFunction [dbo].[Get_All_Columns_in_table]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 Create Function [dbo].[Get_All_Columns_in_table]  (@TblName Varchar (50)) returns Varchar (8000)  
as  
Begin  
 Declare @Res Varchar (8000);  
 Declare @ColName Varchar (50);  
 Declare C1 Cursor For Select Name From Sys.columns Where object_id = Object_ID (@TblName) order by column_id;  
 Open C1;  
 Fetch Next From C1 into @ColName;  
 While @@FETCH_STATUS = 0  
  Begin  
   if @Res is NUll  
    Begin  
     Set @Res = @ColName;  
    End  
   else  
    Begin  
     Set @Res = @Res + ', ' + @ColName;  
    ENd  
   Fetch Next From C1 into @ColName;  
  End  
 Close C1;  
 Deallocate C1;  
 return @Res;  
End

GO
/****** Object:  UserDefinedFunction [dbo].[Get_Max_Garments_Testing_Po]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Get_Max_Garments_Testing_Po] (@Date Datetime) returns Varchar (15)
as
Begin
	Declare @Res Varchar (15);
	Declare @Prefix Varchar (15);
	Declare @VRowID as Bigint;
	Declare @FRowID as Bigint;
	Select Top 1 @Prefix = Prefix From Serial_No_Condition Where Effect_From <= @Date and Mode = 'MANDAYS' order by Effect_From Desc;
	Select @VRowID = Isnull(Max(replace(ENo, @Prefix, '')), 0) + 1 From Mandays_Entry_Master where ENo like @Prefix +'%'
	
		Begin
			Set @Res = @Prefix + Replace(SPACE(5-Len(@VRowID)), ' ', '0') + Cast(@VRowID as Varchar(5));
		End
	
	return @Res;
End

GO
/****** Object:  UserDefinedFunction [dbo].[Get_Max_Project_GRN]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Get_Max_Project_GRN] (@Date Datetime) returns Varchar (15)
as
Begin
	Declare @Res Varchar (15);
	Declare @Prefix Varchar (15);
	Declare @VRowID as Bigint;
	Declare @FRowID as Bigint;
	Select Top 1 @Prefix = Prefix from Serial_No_Condition Where Effect_From <= @Date and Mode = 'GRN' order by Effect_From Desc;
	Select @VRowID = Isnull(Max(replace(GRNNo, @Prefix, '')), 0) + 1 From Project_GRN_Master where GRNNo like @Prefix +'%'
	Select @FRowID = 0
	if (@VRowID > @FRowID)
		Begin
			Set @Res = @Prefix + Replace(SPACE(5-Len(@VRowID)), ' ', '0') + Cast(@VRowID as Varchar(5));
		End
	else
		Begin
			Set @Res = @Prefix + Replace(SPACE(5-Len(@FRowID)), ' ', '0') + Cast(@FRowID as Varchar(5));
		ENd
	return @Res;
End



GO
/****** Object:  UserDefinedFunction [dbo].[Get_Max_Project_GRN_Invoicing]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Get_Max_Project_GRN_Invoicing] (@Date Datetime) returns Varchar (15)
as
Begin
	Declare @Res Varchar (15);
	Declare @Prefix Varchar (15);
	Declare @VRowID as Bigint;
	Declare @FRowID as Bigint;
	Select Top 1 @Prefix = Prefix From Serial_No_Condition Where Effect_From <= @Date and Mode = 'GRN INVOICE' order by Effect_From Desc;
	Select @VRowID = Isnull(Max(replace(Entry_No, @Prefix, '')), 0) + 1 From Project_GRN_Invoicing_Master where Entry_No like @Prefix +'%'	
	Select @FRowID=0;
	if (@VRowID > @FRowID)
		Begin
			Set @Res = @Prefix + Replace(SPACE(5-Len(@VRowID)), ' ', '0') + Cast(@VRowID as Varchar(5));
		End
	else
		Begin
			Set @Res = @Prefix + Replace(SPACE(5-Len(@FRowID)), ' ', '0') + Cast(@FRowID as Varchar(5));
		ENd
	return @Res;
End



GO
/****** Object:  UserDefinedFunction [dbo].[Get_Max_Project_PO]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Get_Max_Project_PO] (@Date Datetime) returns Varchar (15)
as
Begin
	Declare @Res Varchar (15);
	Declare @Prefix Varchar (15);
	Declare @VRowID as Bigint;
	Declare @FRowID as Bigint;
	Select Top 1 @Prefix = Prefix from Serial_No_Condition Where Effect_From <= @Date and Mode = 'PO' order by Effect_From Desc;
	Select @VRowID = Isnull(Max(replace(pono, @Prefix, '')), 0) + 1 From Project_po_Master where pono like @Prefix +'%'
	Select @FRowID = 0
	if (@VRowID > @FRowID)
		Begin
			Set @Res = @Prefix + Replace(SPACE(5-Len(@VRowID)), ' ', '0') + Cast(@VRowID as Varchar(5));
		End
	else
		Begin
			Set @Res = @Prefix + Replace(SPACE(5-Len(@FRowID)), ' ', '0') + Cast(@FRowID as Varchar(5));
		ENd
	return @Res;
End


GO
/****** Object:  UserDefinedFunction [dbo].[Get_Max_Project_Po_Indent]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Get_Max_Project_Po_Indent] (@Date Datetime) returns Varchar (15)
as
Begin
	Declare @Res Varchar (15);
	Declare @Prefix Varchar (15);
	Declare @VRowID as Bigint;
	Declare @FRowID as Bigint;
	Select Top 1 @Prefix = Prefix from Serial_No_Condition Where Effect_From <= @Date and Mode = 'INDENT' order by Effect_From Desc;
	Select @VRowID = Isnull(Max(replace(pono, @Prefix, '')), 0) + 1 From Project_po_Indent_Master where pono like @Prefix +'%'
	Select @FRowID = 0
	if (@VRowID > @FRowID)
		Begin
			Set @Res = @Prefix + Replace(SPACE(5-Len(@VRowID)), ' ', '0') + Cast(@VRowID as Varchar(5));
		End
	else
		Begin
			Set @Res = @Prefix + Replace(SPACE(5-Len(@FRowID)), ' ', '0') + Cast(@FRowID as Varchar(5));
		ENd
	return @Res;
End

GO
/****** Object:  UserDefinedFunction [dbo].[Get_Max_Project_Return]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Get_Max_Project_Return] (@Date Datetime) returns Varchar (15)
as
Begin
	Declare @Res Varchar (15);
	Declare @Prefix Varchar (15);
	Declare @VRowID as Bigint;
	Declare @FRowID as Bigint;
	Select Top 1 @Prefix = Prefix from Serial_No_Condition Where Effect_From <= @Date and Mode = 'RETURN' order by Effect_From Desc;
	Select @VRowID = Isnull(Max(replace(RETNo, @Prefix, '')), 0) + 1 From Project_REturn_Master where RETNo like @Prefix +'%'
	Select @FRowID = 0
	if (@VRowID > @FRowID)
		Begin
			Set @Res = @Prefix + Replace(SPACE(5-Len(@VRowID)), ' ', '0') + Cast(@VRowID as Varchar(5));
		End
	else
		Begin
			Set @Res = @Prefix + Replace(SPACE(5-Len(@FRowID)), ' ', '0') + Cast(@FRowID as Varchar(5));
		ENd
	return @Res;
End

GO
/****** Object:  UserDefinedFunction [dbo].[Buyer_all_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Buyer_all_Fn]() returns table return  
SElect PArty LedgeR_NAme, Code LedgeR_Code,  Address, IsNull(Country_Code, 1) Country_Code FRom Accounts.Dbo.Debtors(2, Dbo.Get_Accounts_YearCode(getdate()))  
Where PArty like '%Gainup%'
and PArty Not like '%ZZZ%' or PArty like 'GAINUP%'

GO
/****** Object:  UserDefinedFunction [dbo].[Project_Order_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Project_Order_Fn]() Returns Table Return
Select A.Order_No, A.Order_Date, C.Name Proj_Name, E.Name Proj_Terms,   
F.LedgeR_NAme PArty, G.Name Employee, D.Name Proj_ACtivity_Name, B.RefNo, B.Estimate_Date, B.Complete_Date, B.Qty, B.Allow_Per, B.Conv_Qty, B.Rate, B.Amount, 
A.Remarks, A.Total_Qty, A.Total_Conv_Qty, A.Total_Amount, A.Approval_Flag, A.Cancel_Order, A.Company_Code, A.Complete_Order, a.Year_Code, A.EmplNo, A.PArty_Code, 
B.Proj_Activity_ID , A.Proj_Type_ID, A.Terms_ID, A.Rowid, B.Rowid DtlID, B.SNo, H.Image1, B.Image_REq, B.UOm_ID , I.UOM, D.Order_By_Slno  
from Project_ORdeR_MASter A
Inner Join Project_ORdeR_Details B On A.Rowid = B.MAsteR_ID 
Inner Join Project_Name_Master C On A.Proj_Type_ID = C.Rowid 
Inner Join Project_Activity_NAme_Master D On B.Proj_Activity_ID = D.Rowid 
LEft Join Project_Terms_Master E On A.Terms_ID = E.Rowid 
LEft Join Buyer_All_Fn() F On A.PArty_Code = F.Ledger_COde
LEft Join Vaahini_Erp_Gainup.Dbo.EmployeeMas G On A.EmplNo = G.Emplno
LEft Join Vaahini_Gainup_Photo.Dbo.Project_Order_Image H On A.Rowid = H.MAster_ID and H.Sno = B.sno
LEft Join UOM_MASTER I On B.Uom_ID = I.UOmID


GO
/****** Object:  UserDefinedFunction [dbo].[Project_Bom_Activity_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[Project_Bom_Activity_Fn]() Returns Table Return                          
Select Order_No, Order_Date, Proj_Name, Party, Employee,  Proj_ACtivity_Name,      Sum(Qty) Qty, Sum(Conv_Qty) Conv_Qty,            
 Sum(Amount) Amount, Proj_Activity_ID , RowID Order_ID,  Proj_Type_ID,           
Party_Code, EmplNo, Order_By_Slno
 From Project_Order_Fn()    
Where Proj_Type_ID is Not Null    
Group by  Order_No, Order_Date, Proj_Name, Party, Employee,  Proj_ACtivity_Name, Proj_Activity_ID , RowID ,  Proj_Type_ID,           
Party_Code, EmplNo, Order_By_Slno



GO
/****** Object:  UserDefinedFunction [dbo].[Supplier_all_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Supplier_all_Fn]() returns table return        
SElect PArty LedgeR_NAme, Code LedgeR_Code, Address, IsNull(Country_Code, 1) Country_Code, Ledger_email, Phone LedgeR_Phone         
FRom Accounts.Dbo.dEbtors_Creditors(1, '2020-2021')   
Where PArty not like '%ZZZ%'  


GO
/****** Object:  UserDefinedFunction [dbo].[Project_Return_DEtails_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Project_Return_DEtails_Fn]()Returns table return       
Select B.RetNo, B.RetDate, D.LedgeR_NAme Supplier, 
 C.Proj_ACtivity_Name, C.Proj_Name,
E.Item, F.Color, G.Size ,B1.Ret_Qty Ret_Qty, B1.Pur_Rate Pur_Rate, B1.Item_ID, B1.Color_ID, B1.Size_ID, B.Supplier_Code, 
B.RowID , b.Net_Amount, B.Gross_Amount, B.Tax_Amount, d.Country_Code, b.Remarks, A1.Order_ID, A1.Proj_Activity_ID, A1.Proj_Type_ID, A1.Grn_OCn_DEtail_ID, 
B.Rowid Ret_ID, B1.RowID Ret_Detail_ID, A1.RowID Ret_Ocn_Detail_Id , B1.Grs_Rate, B1.Tax_Per, B1.Grs_Amount Grs_Amount_Dtl, B1.Tax_Amount Tax_Amount_Dtl, B1.Pur_Amount Pur_Amount_Dtl, B1.Slno, A1.SlNo_Dtl 
From  Project_Return_MAster B 
InneR Join Project_Return_Details B1 On B.RowID = B1.Master_ID
Inner Join Project_Return_Ocn_DEtails A1 On B.Rowid = A1.Master_ID and B1.MAster_ID = A1.Master_ID and B1.slno = A1.Slno_Dtl
Inner Join (sElect Distinct Proj_ACtivity_Name, Proj_Name, Proj_Activity_ID, Proj_Type_ID, Rowid  from Project_Order_Fn()) C On A1.Order_ID = C.Rowid
and A1.Proj_Activity_ID = C.Proj_Activity_ID and A1.Proj_Type_ID = C.Proj_Type_ID 
LEft Join Supplier_All_Fn() D On B.Supplier_Code = D.LedgeR_Code       
LEft Join Item E On B1.Item_ID = E.ItemID 
LEft Join color F On B1.Color_ID = F.ColorID
LEft Join Size G On B1.Size_ID = G.SizeID

GO
/****** Object:  UserDefinedFunction [dbo].[Project_Return_Item_DEtails_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Function [dbo].[Project_Return_Item_DEtails_Fn]()Returns table return       
Select B.REtNo, B.REtDate, D.LedgeR_NAme Supplier,
E.Item, F.Color, G.Size ,  (B1.REt_Qty) REt_Qty, B1.Pur_Rate Pur_Rate, B1.Item_ID, B1.Color_ID, B1.Size_ID, B.Supplier_Code, 
B.RowID , b.Net_Amount, B.Gross_Amount, B.Tax_Amount, d.Country_Code, b.Remarks, 
B.Rowid Grn_ID, B1.RowID Grn_Detail_ID, B1.Grs_Rate, B1.Tax_Per, B1.Grs_Amount Grs_Amount_Dtl, B1.Tax_Amount Tax_Amount_Dtl, B1.Pur_Amount Pur_Amount_Dtl, B1.Slno
From  Project_Return_MAster B 
InneR Join Project_Return_Details B1 On B.RowID = B1.Master_ID
LEft Join Supplier_All_Fn() D On B.Supplier_Code = D.LedgeR_Code       
LEft Join Item E On B1.Item_ID = E.ItemID 
LEft Join color F On B1.Color_ID = F.ColorID
LEft Join Size G On B1.Size_ID = G.SizeID

GO
/****** Object:  UserDefinedFunction [dbo].[Project_Bom_Item_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[Project_Bom_Item_Fn]() Returns Table Return                          
Select Order_No, Party, Employee, Proj_Activity_Name, Proj_Name,
Sum(Qty) Qty, Sum(Conv_Qty) Conv_Qty,            
Sum(Amount) Amount, Proj_Activity_ID, RowID Order_ID, Order_Date,
Party_Code, EmplNo, Proj_Type_ID, Complete_Order, Cancel_Order, Uom, Uom_ID     From Project_Order_Fn()    
Where Proj_Activity_Name is Not Null    
Group by Order_No, Proj_Activity_Name, Proj_Type_ID, Proj_Name, Proj_Activity_ID, RowID, Party, Employee, Order_Date, Party_Code, EmplNo, Complete_Order, Cancel_Order, Uom, Uom_ID  

GO
/****** Object:  UserDefinedFunction [dbo].[Project_Grn_DEtails_Fn_all]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Project_Grn_DEtails_Fn_all]()Returns table return       
Select B.GRNNo, B.GRNDate, D.LedgeR_NAme Supplier, B.INvoice_No, b.GP_NO, B.GP_Date, B.DC_No , B.DC_Date , 
B.Invoice_Date ,  C.Proj_ACtivity_Name, C.Proj_Name,
E.Item, F.Color, G.Size , A11.PO_Qty , A1.Qty Grn_Qty, B1.Pur_Rate Pur_Rate, B1.Item_ID, B1.Color_ID, B1.Size_ID, B.Supplier_Code, 
B.RowID , b.Net_Amount, B.Gross_Amount, B.Tax_Amount, d.Country_Code, b.Remarks, A1.Order_ID, A1.Proj_Activity_ID, A1.Proj_Type_ID, A1.PO_Detail_ID, 
B.Rowid Grn_ID, B1.RowID Grn_Detail_ID, A1.RowID Grn_Ocn_Detail_Id , B1.Grs_Rate, B1.Tax_Per, B1.Grs_Amount Grs_Amount_Dtl, B1.Tax_Amount Tax_Amount_Dtl, B1.Pur_Amount Pur_Amount_Dtl, B1.Slno, A1.SlNo_Dtl,  C.Order_No 
From  Project_Grn_MAster B 
InneR Join Project_GRN_Details B1 On B.RowID = B1.Master_ID
Inner Join Project_GRN_OCN_DEtails A1 On B.Rowid = A1.Master_ID and B1.MAster_ID = A1.Master_ID and B1.slno = A1.Slno_Dtl
Inner Join (sElect Distinct OrdeR_NO, Proj_ACtivity_Name, Proj_Name, Proj_Activity_ID, Proj_Type_ID, Rowid  from Project_Order_Fn()) C On A1.Order_ID = C.Rowid
and A1.Proj_Activity_ID = C.Proj_Activity_ID and A1.Proj_Type_ID = C.Proj_Type_ID and A1.Order_ID = C.Rowid 
LEft Join (Select Rowid, (Sum(ORdeR_Qty) - Sum(Cancel_Qty)) PO_Qty FRom  Project_Po_Details GRoup by Rowid) A11 On A1.PO_Detail_ID = A11.RowID 
LEft Join Supplier_All_Fn() D On B.Supplier_Code = D.LedgeR_Code       
LEft Join Item E On B1.Item_ID = E.ItemID 
LEft Join color F On B1.Color_ID = F.ColorID
LEft Join Size G On B1.Size_ID = G.SizeID

GO
/****** Object:  UserDefinedFunction [dbo].[Project_Planning_Material_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[Project_Planning_Material_Fn]() Returns table return
Select A.Order_No, B.Entry_No,  B.Effect_From, A.Proj_Name Proj_Type, A.Proj_ACtivity_NAme, A.Party, A.Employee, Conv_Qty BOM_Qty, Qty  , B.OrdeR_ID, B.Proj_ACtivity_ID, B.Proj_Type_ID, A.Order_Date , B.REmarks, A.Party_Code, A.Amount, 
C.Profit, C.Profit_Ind, C.Profit_Exp, C.DB_Ind, C.DB_Exp, B.RowID ,Qty Total_Qty,
B1.SNo, E.Item, F.Color, G.Size, B1.Item_ID, B1.Color_ID, B1.Size_ID, B1.Uom_ID, B1.Req_Qty, B1.Loss_Perc, B1.Loss_Qty, B1.Tot_Qty, Isnull(G1.GRn_Qty,0) GRn_Qty , B1.Grs_Rate, B1.Tax_Per, B1.Other_Rate, B1.Pur_Rate, B1.Grs_Amount, B1.Tax_Amount, 
B1.Other_Amount, B1.Pur_Amount, 
B1.Approval_Flag Flag, B1.Approval_Time, B1.Access_Type, H.UOM, H1.UOM CONS_UOM, B1.Cons_UOm_Id, B1.Unit, B1.Cons , H2.UOM Uom_mas, B.UOm_ID UOM_ID_Mas, B.Unit Unit_Mas,  B1.Master_ID PlanMasID, B1.Rowid PlanDtlID, A.Order_By_Slno,
(Cast(B1.Item_ID as Varchar(20)) + '-' + Cast(B1.Color_ID as Varchar(20)) + '-' + Cast(B1.Size_ID as Varchar(20))) DESCR, 
H3.UOM PO_UOM, B1.TOT_QTY_CONV, B1.GRS_RATE_CONV, B1.Other_Rate_Conv, B1.Pur_Rate_Conv, B1.Conv_Val, B1.CAlc_Type, B1.App_Pur_Rate_Conv, B1.UomId_Po, 
(Case When B1.Tax_Per = 0 Then B1.App_Pur_Rate_Conv Else Cast(B1.App_Pur_Rate_Conv / CASt((B1.Tax_Per / 100) +1 as Numeric(22,4)) as Numeric(22,4)) End) App_Grs_Rate_Conv, 
E.Calc ,
E.Testing
From Project_Bom_Activity_Fn() A 
Inner Join PRoject_Planning_Master B On A.ORder_ID = B.Order_ID and A.Proj_ACtivity_ID = B.Proj_ACtivity_ID 
Inner Join Project_PLanning_Material_Details B1 On B.Rowid = B1.MAster_ID 
Left Join Project_Planning_Summary_Details C On B.RowID = C.Master_ID 
Left Join Project_Order_Master D On A.Order_No = D.Order_No  
Left Join Item E On B1.Item_ID = E.ItemID 
Left Join Color F On B1.Color_ID = F.ColorID 
Left Join Size G On B1.Size_ID = G.SizeID  
Left Join UOM_MASTER H On B1.Uom_ID = H.UOMID 
Left Join UOM_MASTER H1 On B1.Cons_Uom_ID = H1.UOMID 
Left Join UOM_MASTER H2 On B.Uom_ID = H2.UOMID 
Left Join UOM_MASTER H3 On B1.UomId_Po = H3.UOMID 
LEft Join (Select Proj_ACtivity_Name, Proj_Name, Order_No, Sum(GRn_Qty) GRn_Qty, Proj_Activity_ID, Proj_Type_ID, Order_ID, Item_ID, Color_ID, Size_ID   from Project_Grn_DEtails_Fn_all()
GRoup by Proj_ACtivity_Name, Proj_Name, Order_No,  Proj_Activity_ID, Proj_Type_ID, Order_ID, Item_ID, Color_ID, Size_ID  
)G1 On A.Order_ID = G1.Order_ID and A.Proj_Activity_ID = G1.Proj_Activity_ID and A.Proj_Type_ID = G1.Proj_Type_ID 
and B1.Item_ID = G1.Item_ID and B1.Color_ID = G1.Color_ID and B1.Size_ID = G1.Size_ID 


GO
/****** Object:  UserDefinedFunction [dbo].[PRoject_Grn_ItemWise_Rate_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[PRoject_Grn_ItemWise_Rate_Fn]() Returns Table Return                            
Select A.Type, E.LEdgeR_NAme Supplier, A.GRNNo, A.GRNDate, A.GP_No, A.GP_Date, B.Item, C.Color, D.Size, Sum(A.Qty) GRN_Qty,                             
Min(A.Plan_Rate) Plan_Rate, Min(A.PO_Rate) Bud_Net_Rate , A.PO_Rate PO_Rate, A.Grn_Rate Grn_Rate,                       
Min(A.Freight_Rate) Freight_Rate, Min(A.Tax_Rate) Tax_Rate, Min(A.Other_Rate) Other_Rate,                       
A.Supplier_Code, A.Item_ID, A.Color_ID, A.Size_ID, A.RowID, A.DtlID from (                            
Select 'MATERIAL' Type,  B.GRNNo, GRNDate, B.GP_No, B.GP_Date, A.Item_ID, A.Color_ID, A.Size_ID, C.PO_Detail_ID, D.Order_ID , E.Order_No,
IsNull(F.Gross_Rate, A.Grs_Rate) Plan_Rate, IsNull(F.Net_Rate, A.Grs_Rate) Bud_Net_Rate , C.Qty, D.Rate  PO_Rate,
A.Grs_Rate Grn_Rate, IsNull(F.Freight_Rate,0) Freight_Rate, IsNull(F.Tax_Rate, 0) Tax_Rate, IsNull(F.Other_Rate, 0) Other_Rate, A.Pur_Amount, B.Supplier_Code, B.RowID, A.RowID DtlID   
FRom Project_GRN_Details A
LEft join Project_GRN_Master B On A.Master_ID = B.RowID                             
Left Join (Select PO_Detail_ID, Sum(Qty) Qty, Master_ID, SlNo_Dtl Detail_ID From Project_GRN_OCN_DEtails                            
Group by PO_Detail_ID, Master_ID, SlNo_Dtl) C On B.RowID = C.Master_ID and A.Slno = C.Detail_ID
LEft JOin Project_PO_Details D On C.PO_Detail_ID = D.RowID                             
LEft Join Project_Order_Master E On E.RowID = D.Order_ID
Left Join(                            
Select OrdeR_ID, Item_ID, Color_ID, Size_ID, 
Min(App_Grs_Rate_Conv) Gross_Rate, Min(Tax_Per) Tax_per, Min(Tax_Per) Tax_Rate1, CAst((Min(App_Grs_Rate_Conv) * Min(Tax_Per))/100 as Numeric(15,4)) Tax_Rate, Min(Other_Rate) Freight_Rate, 0 Other_Rate, Min(App_Pur_Rate_Conv) Net_Rate
FRom Project_Planning_Material_Fn() 
GRoup by OrdeR_ID, Item_ID, Color_ID, Size_ID
)F On D.Order_ID = F.OrdeR_ID and D.Item_id = F.Item_ID and D.Color_id = F.Color_ID and D.Size_ID = F.SIZE_ID
)A                            
LEft Join Item B On A.Item_ID = B.itemid
LEfT Join Color C On A.Color_ID = C.colorid
LEft Join Size D On A.Size_ID = D.sizeid
LEfT Join Supplier_All_Fn() E On A.Supplier_Code = E.LEdgeR_code
Group by A.Type, E.LEdgeR_NAme , A.GRNNo, A.GRNDate, A.GP_No, A.GP_Date, B.Item, C.Color, D.Size,
A.Supplier_Code, A.Item_ID, A.Color_ID, A.Size_ID, A.RowID, A.PO_Rate, A.Grn_Rate, A.DtlID 

GO
/****** Object:  UserDefinedFunction [dbo].[Project_Grn_Invoicing_Pending]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Project_Grn_Invoicing_Pending] (@Company_Code int, @Year_Code Varchar (10)) returns table return         
Select A.Mode, A.Supplier_Code, A.Supplier, A.GRN_MasterID, A.GRNNo, A.GRNDate, A.Item_ID, A.item, A.Color_ID, A.color, A.Size_ID, A.Size, A.GRN_Qty, A.Grs_Rate Rate,  
A.Bill_Qty, A.Balance_Qty, A.Loss_Perc, A.Acc_Qty, A.Acc_Qty1, A.Total_Rate, IsNull(B.Bud_Net_Rate, 0)  Bud_Rate, A.DtlID, IsNull(B.Plan_Rate, 0) Plan_Rate,  
IsNull(Freight_Rate, 0) Freight_Rate, IsNull(Tax_Rate, 0) Tax_Rate, IsNull(Other_Rate, 0) Other_Rate, Return_Qty     
from (  
Select 'MATERIAL' as Mode, S2.Supplier_Code, L1.Ledger_Name Supplier, S2.RowID GRN_MasterID, S2.GRNNo, S2.GRNDate,         
S1.Item_ID, I1.item, S1.Color_ID, C1.color, S1.Size_ID, S4.Size,         
(S1.GRN_Qty - Isnull(S11.Return_Qty,0)) Grn_Qty, S1.Grs_Rate, 0 Bill_Qty, (S1.GRN_Qty - Isnull(S11.Return_Qty,0)) Balance_Qty, 0 Loss_Perc, 
(S1.GRN_Qty - Isnull(S11.Return_Qty,0))  Acc_Qty, Isnull(S11.Return_Qty,0) Return_Qty,    
(S1.GRN_Qty - Isnull(S11.Return_Qty,0)) Acc_Qty1, S1.Grs_Rate Total_Rate, S1.RowID DtlID          
From Project_GRN_Details S1         
Inner join Project_GRN_Master S2 on S1.Master_ID = S2.RowID        
Inner Join Supplier_All_Fn() L1 On S2.Supplier_Code = L1.LEdgeR_Code and L1.Ledger_Code <= 900000          
LEft Join (sElect Master_ID, SlNo_Dtl, Sum(Return_Qty) Return_Qty from Project_GRN_OCN_DEtails Group by Master_ID, SlNo_Dtl) S11 On S1.Master_ID = S11.Master_ID and S1.Slno = S11.SlNo_Dtl 
Left Join item I1 on S1.Item_ID = I1.itemid         
Left join Color C1 on S1.Color_ID = C1.colorid        
Left join (Select Grn_MasterID, Mode From Project_GRN_Invoicing_Details_OCN Where Mode = 'MATERIAL') S3 on S2.RowID = S3.Grn_MasterID        
Left join size S4 on S1.Size_ID = S4.sizeid         
Where S3.Grn_MasterID is NUll and  Isnull(S2.Acc_Enable,'T') = 'T'    
)A Left Join Project_Grn_ItemWise_Rate_Fn() B On A.GRN_MasterID = B.RowID and A.Mode = B.Type and A.ITem_ID = B.ITem_ID   
And A.Color_ID = B.Color_ID and A.Size_ID = B.Size_ID   
--and A.Rate = B.Grn_Rate  
and A.DtlID = B.DtlID  



GO
/****** Object:  UserDefinedFunction [dbo].[Project_Planning_Process_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[Project_Planning_Process_Fn]() Returns table return
Select A.Order_No, B.Entry_No,  B.Effect_From, A.Proj_Name Proj_Type, A.Proj_ACtivity_NAme, A.Party, A.Employee, Conv_Qty BOM_Qty, Qty  , B.Total_Qty, B.OrdeR_ID, B.Proj_ACtivity_ID, B.Proj_Type_ID, A.Order_Date , B.REmarks, A.Party_Code, A.Amount, 
C.Profit, C.Profit_Ind, C.Profit_Exp, C.DB_Ind, C.DB_Exp, B.RowID ,
B1.SNo, E.PROCESS, B1.Proc_ID, B1.Tot_Qty, B1.Grs_Rate, B1.Tax_Per, B1.Other_Rate, B1.Pur_Rate, B1.Grs_Amount, B1.Tax_Amount, B1.Other_Amount, B1.Pur_Amount, B1.Approval_Flag Flag, B1.Approval_Time,
B1.rowid PlanDtlID, B1.MAster_ID PlanMasID
From Project_Bom_Activity_Fn() A 
Inner Join PRoject_Planning_Master B On A.ORder_ID = B.Order_ID and A.Proj_ACtivity_ID = B.Proj_ACtivity_ID 
Inner Join Project_PLanning_Process_Details B1 On B.Rowid = B1.MAster_ID 
Left Join Project_Planning_Summary_Details C On B.RowID = C.Master_ID 
Left Join Project_Order_Master D On A.Order_No = D.Order_No  
Left Join Process E On B1.Proc_ID = E.PROCESSID 

GO
/****** Object:  UserDefinedFunction [dbo].[Project_Planning_Comm_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[Project_Planning_Comm_Fn]() Returns table return
Select A.Order_No, B.Entry_No,  B.Effect_From, A.Proj_Name Proj_Type, A.Proj_ACtivity_NAme, A.Party, A.Employee, Conv_Qty BOM_Qty, Qty  , B.Total_Qty, B.OrdeR_ID, B.Proj_ACtivity_ID, B.Proj_Type_ID, A.Order_Date , B.REmarks, A.Party_Code, 
A.Amount, C.Profit, C.Profit_Ind, C.Profit_Exp, C.DB_Ind, C.DB_Exp, B.RowID ,
B1.SNo, E.Commercial Comm, B1.Comm_ID, B1.Tot_Qty, B1.Grs_Rate, B1.Tax_Per, B1.Other_Rate, B1.Pur_Rate, B1.Grs_Amount, B1.Tax_Amount, B1.Other_Amount, B1.Pur_Amount, B1.Approval_Flag Flag, B1.Approval_Time, 
B1.Rowid PlanDtlID, B1.Master_ID PlanMasID
From Project_Bom_Activity_Fn() A 
Inner Join PRoject_Planning_Master B On A.ORder_ID = B.Order_ID and A.Proj_ACtivity_ID = B.Proj_ACtivity_ID 
Inner Join Project_PLanning_Comm_Details B1 On B.Rowid = B1.MAster_ID 
Left Join Project_Planning_Summary_Details C On B.RowID = C.Master_ID 
Left Join Project_Order_Master D On A.Order_No = D.Order_No  
Left Join COMMERCIALMAS E On B1.Comm_ID = E.CommercialID  

GO
/****** Object:  UserDefinedFunction [dbo].[Grid_Data_Po]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Grid_Data_Po]()Returns table return
Select '' Buyer, B.LEdgeR_NAme supplier, '' Order_No, A.PONo, A.PoDate, 
Item, Color, Size, Sum(Order_Qty)-Sum(Isnull(Cancel_Qty,0)) Po_Qty, 0 Rate, Item_Id, Color_Id, Size_Id, 0 Order_ID From(
Select A.Supplier_Code, A.PONo, A.PoDate, B.Item_id, B.Color_id, B.Size_ID, B.Order_ID, B.Order_Qty, B.Cancel_Qty, B.Rate 
from Project_PO_Master  A
Left Join Project_Po_Details B on A.RowID = B.Master_ID
)A
Left Join Supplier_All_Fn() B on A.Supplier_Code = B.Ledger_Code
Left Join Item C on A.Item_id = C.Itemid
Left Join Color D on A.Color_id = D.colorid
Left Join Size E on A.Size_ID = E.sizeid
Group By B.LEdgeR_NAme, A.PONo, A.PoDate, Item, Color, Size, Item_Id, Color_Id, Size_Id


GO
/****** Object:  UserDefinedFunction [dbo].[Project_Grn_Invoicing_Debit_Details]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Project_Grn_Invoicing_Debit_Details] (@Company_Code int, @Year_Code Varchar (10)) returns table return    
Select S1.RowID, S1.Supplier_Code, S1.Entry_No, S1.Entry_Date, L1.Ledger_Name Supplier, S1.Bill_Net,    
S1.Invoice_No, S1.Invoice_Date, S1.Approved_Debit, S1.Rate_Debit, S1.Qty_Debit,0 Rej_Debit, E1.VCode    
From PRoject_GRN_Invoicing_Master S1    
Left Join Supplier_All_Fn() L1 on S1.Supplier_Code = L1.Ledger_Code    
left join Accounts.Dbo.ERP_Accounts_Socks_Combo E1 On S1.Supplier_Code = E1.SupplierID and S1.Invoice_No = E1.InvNo     
and S1.Invoice_Date = E1.Invdate and E1.Mode = 'P' Where S1.Approved_Debit > 0 and E1.Vcode is Null 


GO
/****** Object:  UserDefinedFunction [dbo].[Grid_Data_Grn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  Function [dbo].[Grid_Data_Grn]()Returns table return    
Select PONo, PODate, GRNNo, GRNDate, Item_Id, Color_Id, Size_ID, 0 Order_Id, Sum(Isnull(Qty,0))Qty, Sum(Isnull(Rej_Qty,0))Rej_Qty, Rejection, Supplier_Code, Gp_DAte  From(    
Select F.PONo, F.PoDate, A.GRNNo, A.GRNDate, B.Item_ID, B.Color_ID, B.Size_ID, C.Order_ID,     
Sum(C.Qty)Qty, Sum(C.Return_Qty)  Rej_Qty,     
'' Rejection, A.Supplier_Code, A.GP_Date      from Project_GRN_Master A    
Left Join Project_GRN_DEtails B on A.Rowid = B.Master_ID    
Left Join Project_GRN_OCN_DEtails C on A.Rowid = C.Master_ID And B.Master_ID = C.Master_ID And B.Slno = C.SlNo_Dtl 
Left Join (Select A.RowID, B.PONo, B.PoDate from Project_Po_Details A Left Join Project_PO_Master B on A.Master_ID = B.Rowid)F on C.PO_Detail_ID = F.RowID    
Group By F.PONo, F.PoDate, A.GRNNo, A.GRNDate, B.Item_ID, B.Color_ID, B.Size_ID, C.Order_ID,     
A.Supplier_Code,A.GP_Date        
)A 
Group By PONo, PODate, GRNNo, GRNDate, Item_Id, Color_Id, Size_ID, Rejection, Supplier_Code, Gp_DAte


GO
/****** Object:  UserDefinedFunction [dbo].[Grid_Data_Inv]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Grid_Data_Inv]()Returns table return
Select  D.GRNNo GRNNO, 
A.Entry_Date, A.Entry_No, A.Invoice_No, A.Invoice_Date, B.Item_ID, B.Color_ID, B.Size_ID, B.Bill_Qty, B.Bill_Rate 
from Project_GRN_Invoicing_Master A
Left Join Project_GRN_Invoicing_Details  B on A.Rowid = B.Master_ID
Left Join Project_GRN_Invoicing_Details_OCN C on A.RowID = C.Master_ID And B.Master_Id = C.Master_Id And B.Slno = C.Slno
Left Join Project_GRN_Master D on C.GRN_MasterID = D.RowID and C.Mode = 'MATERIAL'

GO
/****** Object:  UserDefinedFunction [dbo].[Grid_Po_Grn_Inv_New]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Function [dbo].[Grid_Po_Grn_Inv_New](@DTFrom Datetime, @DTTo Datetime)Returns table return
Select A.supplier, A.PONo, A.PoDate, Item, Color, Size, Po_Qty, B.GRNNo, B.GRNDate, B.Qty, B.Rej_Qty, B.Rejection Rej_Reas, C.Entry_No, C.Entry_Date, C.Invoice_No, C.Invoice_Date, C.Bill_Qty, C.Bill_Rate, 
A.Item_Id, A.Color_Id, A.Size_Id, 0 Order_ID  from Grid_Data_Po()A
Left Join Grid_Data_Grn()B on A.PONo = B.PONo And A.Item_ID = B.Item_ID And A.Color_Id = B.Color_ID And A.Size_Id = B.Size_ID 
Left Join Grid_Data_Inv()C on B.GRNNo = C.GrnNo And C.Item_ID = B.Item_ID And C.Color_Id = B.Color_ID And C.Size_Id = B.Size_ID 
Where A.PoDate between @DTFrom And @DTTo

GO
/****** Object:  UserDefinedFunction [dbo].[Grid_Data_Po_Summary]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Grid_Data_Po_Summary]()Returns table return  
Select B.Ledger_Name supplier, A.PONo, A.PoDate, A.Required_Date Req_Date,  A.Commit_Date, A.Ack_Date,   
Case When Ack_Date is null Then 'N' Else 'Y' End Mail,  
Item, Color, Size, Sum(Order_Qty)-Sum(Isnull(Cancel_Qty,0)) Po_Qty, Item_Id, Color_Id, Size_Id, B.Ledger_Code From(  
Select A.Supplier_Code, A.PONo, A.PoDate, Required_Date, A.Commit_Date, Ack_Date, B.Item_id, B.Color_id, B.Size_ID, B.Order_ID, B.Order_Qty, B.Cancel_Qty, B.Rate   
from Project_PO_Master A  
Left Join Project_PO_Details B on A.RowID = B.Master_ID  
Where A.Approval_Flag='T'  
)A  
Left Join Supplier_All_Fn() B on A.Supplier_Code = B.Ledger_Code  
Left Join Item C on A.Item_id = C.Itemid  
Left Join Color D on A.Color_id = D.colorid  
Left Join Size E on A.Size_ID = E.sizeid  
Group By B.Ledger_Name, A.PONo, A.PoDate, A.Required_Date, Ack_Date, A.Commit_Date, Item, Color, Size, Item_Id, Color_Id, Size_Id, B.LEdger_Code  
Having (Sum(Order_Qty)-Sum(Isnull(Cancel_Qty,0)))>0

GO
/****** Object:  UserDefinedFunction [dbo].[Budget_Approval_Project]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Budget_Approval_Project]() Returns Table Return                                                   
Select  Order_No, StyleID, O_SlNo, SequenceID, Access_Type, ProcessID, Process, Item_ID ItemID, Item,Color_ID ColorID, Color, Size_ID SizeID, Size, 
(Quantity) Quantity, Rate, (Amount) Amount, App_Qty, App_Rate, App_Amount,  0 PlanDtlID,  0 PlanMasID
From (                                                
Select Order_No, Proj_Type_ID StyleID, 0 O_SlNo, 0 SequenceID, 'Raw Materials' Access_Type, Item_ID ProcessID,                                                    
'Purchase' Process, Item_ID Item_ID, (Case When Item_Id = 6 then Item Else Item  + ' (' + PO_UOM + ')' End) Item, Color_ID, Color, Size_ID, Size Size, 
Tot_Qty_Conv Quantity, Cast((Case When Flag = 'T' Then App_Pur_Rate_Conv  Else Pur_Rate_Conv  End) as Numeric(22,4)) Rate, 
Cast((Case When Flag = 'T' Then (Tot_Qty_Conv * App_Pur_Rate_Conv) Else Pur_Amount  End) as Numeric(22,2)) Amount,                                                    
(Case When Flag = 'T' Then Tot_Qty_Conv Else 0.000 End) App_Qty,                                                     
(Case When Flag = 'T' Then App_Pur_Rate_Conv  Else 0.000 End) App_Rate, 
(Case When Flag = 'T' Then Cast((Tot_Qty_Conv * App_Pur_Rate_Conv) as Numeric(22,2)) Else 0.00 End) App_Amount, PlanDtlID, PlanMasID                                                    
From  Projects.Dbo.Project_Planning_Material_Fn()    
Union                                                    
Select Order_No, Proj_Type_ID StyleID, 4 O_SlNo, 0 SequenceID, 'Process' Access_Type, Proc_ID ProcessID,                                                    
Process Process, Proc_ID ItemID, Process Item, 0 ColorID, '' Color, 0 SizeID, '' Size, Tot_Qty Quantity, Pur_Rate Rate, Pur_Amount Amount,                                                    
(Case When Flag = 'T' Then Tot_Qty Else 0.000 End) App_Qty,                                                     
(Case When Flag = 'T' Then Pur_Rate Else 0.00 End) App_Rate, (Case When Flag = 'T' Then Pur_Amount Else 0.00 End) App_Amount, PlanDtlID,  PlanMasID                                                    
From Projects.Dbo.Project_Planning_Process_Fn()
Union                                      
Select Order_No, Proj_Type_ID StyleID, 7 O_SlNo, 500 SequenceID, 'Commercial' Access_Type, Comm_ID ProcessID,                                                    
'Commercial' Process, Comm_ID ItemID, Comm Item, 0 ColorID, '' Color, 0 SizeID, '' Size, Tot_Qty Quantity, PUr_Rate Rate, Pur_Amount Amount,                                    
(Case When Flag = 'T' Then Tot_Qty Else 0.000 End) App_Qty,                      
(Case When Flag = 'T' Then PUr_Rate  Else 0.00 End) App_Rate, (Case When Flag = 'T' Then Pur_Amount  Else 0.00 End) App_Amount, PlanDtlID, PlanMasID                                          
From Projects.Dbo.Project_Planning_Comm_Fn() 
) A Where Quantity >0 


GO
/****** Object:  UserDefinedFunction [dbo].[Budget_Approval_Summary_Project_New]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Function [dbo].[Budget_Approval_Summary_Project_New]()Returns table return  
select Top 1000000 Order_No, O_Slno, Access_Type, Cast(Sum(isnull(App_Amount,0))as Numeric(25,2))App_Amount   
from Budget_Approval_Project()   
Group By Order_No, Access_Type, O_Slno Order By O_Slno

GO
/****** Object:  UserDefinedFunction [dbo].[Basic_Order_Details_Project_New]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Basic_Order_Details_Project_New]() Returns Table Return    
Select Order_Date, BuyerID, Buyer, Merch_Name, Order_No, Ref_No, StyleID, Style, Max(Ship_Date) Ship_Date, Sum(Ord_Qty) Ord_Qty, Currency, 
Cast((Sum(Value_In_Rs) / Sum(Ord_Qty)) as Numeric(25,2)) Unit_Price, Ex_Rate, Cast((Sum(Value_In_Cur) / Sum(Ord_Qty)) as Numeric(25,4)) Unit_Price_INR, 
Sum(Value_In_Rs) Value_In_Rs , Buyer_LookUp, Despatch_Closed, Sum(Value_In_Cur) Value_In_Cur
From (
Select Order_Date, Party_Code BuyerID, Party Buyer, Employee Merch_Name, Order_No,     
'' Ref_No, 0 StyleID, '' Style, (Complete_Date) Ship_Date, (Qty) Ord_Qty,    
'INR' Currency, 1 Ex_Rate, Cast(Cast(Cast((Rate) as Numeric(20,3)) * 1 as Numeric(20,2)) * (Qty) as Numeric(27,2)) Value_In_Rs, 
(Qty * Cast((Rate) as Numeric(20,4))) Value_In_Cur,
Party Buyer_LookUp, 'N' Despatch_Closed    
From Project_Order_Fn()    
--Where ORder_no like '%2145'
) A
Group by Order_Date, BuyerID, Buyer, Merch_Name, Order_No, Ref_No, StyleID, Style, Currency, Ex_Rate, Buyer_LookUp, Despatch_Closed

GO
/****** Object:  UserDefinedFunction [dbo].[Grid_Data_Grn_Summary]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Grid_Data_Grn_Summary]()Returns table return
Select PONo, PODate, Max(GRNDate)GRNDate, Item_Id, Color_Id, Size_ID, Sum(Isnull(Qty,0))Qty, Sum(Isnull(Rej_Qty,0))Rej_Qty 
From(
Select F.PONo, F.PoDate, A.GRNNo, A.GRNDate, B.Item_ID, B.Color_ID, B.Size_ID, C.Order_ID, 
Sum(C.Qty)Qty, Sum(C.Return_Qty)Rej_Qty, 
'' Rejection  from Project_GRN_Master A
Left Join Project_GRN_Details B on A.Rowid = B.Master_ID
Left Join Project_GRN_OCN_DEtails C on A.Rowid = C.Master_ID And B.Master_ID = C.Master_ID And B.Slno = C.SlNo_Dtl  
Left Join (Select A.RowID, B.PONo, B.PoDate from Project_PO_Details A Left Join Project_PO_Master B on A.Master_ID = B.Rowid)F on C.PO_Detail_ID = F.RowID
Group By F.PONo, F.PoDate, A.GRNNo, A.GRNDate, B.Item_ID, B.Color_ID, B.Size_ID, C.Order_ID
)A
Group By PONo, PODate, Item_Id, Color_Id, Size_ID



GO
/****** Object:  UserDefinedFunction [dbo].[Grid_Data_Summary]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[Grid_Data_Summary](@FromDate Datetime, @ToDate Datetime)returns table return  
Select A.Supplier, 'Purchase' Po_Type, 
A.PoNo, A.PoDate, A.Req_Date, A.Commit_Date, A.Ack_Date, A.Mail, A.Item, A.Color, A.Size, A.Po_Qty, B.GRNDate, Isnull(B.Qty,0) Grn_Qty, 
Isnull(B.Rej_Qty,0) Rej_Qty, 
(Case When Substring(A.PONo,0,8)!='GUP-VSD' Then (Case When (A.Po_Qty-Isnull(B.Qty,0)) < 0 Then 0 Else (A.Po_Qty-Isnull(B.Qty,0)) End) Else 
(Case When (((Case When Isnull(B.Qty,0)=0 Then A.Po_Qty Else (A.Po_Qty-(A.Po_Qty*(C.Loss_Perc/100))) End)-Isnull(B.Qty,0))) < 0 Then 0 
Else((Case When Isnull(B.Qty,0)=0 Then A.Po_Qty Else (A.Po_Qty-(A.Po_Qty*(C.Loss_Perc/100))) End)-Isnull(B.Qty,0)) End) End )Pen_Qty, 
A.Item_Id, A.Color_Id, A.Size_Id   
from Grid_Data_Po_Summary()A  
Left Join Grid_Data_Grn_Summary()B on A.PONo = B.PONo And A.Item_ID = B.Item_ID And A.Color_Id = B.Color_ID And A.Size_Id = B.Size_ID  
Left Join Color C on A.Color_Id = C.colorid
Where A.PoDate between @FromDate And @ToDate

GO
/****** Object:  UserDefinedFunction [dbo].[Budget_Approval_Project_ID]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Budget_Approval_Project_ID]() Returns Table Return                                                   
Select  Order_No, StyleID, O_SlNo, SequenceID, Access_Type, ProcessID, Process, Item_ID ItemID, Item,Color_ID ColorID, Color, Size_ID SizeID, Size, 
(Quantity) Quantity, Rate, (Amount) Amount, App_Qty, App_Rate, App_Amount,  PlanDtlID,  PlanMasID
From (                                                
Select Order_No, Proj_Type_ID StyleID, 0 O_SlNo, 0 SequenceID, 'Raw Materials' Access_Type, Item_ID ProcessID,                                                    
'Purchase' Process, Item_ID Item_ID, Item + ' (' + PO_UOM + ')' Item , Color_ID, Color, Size_ID, Size  Size, 
Tot_Qty_Conv Quantity, Cast((Case When Flag = 'T' Then App_Pur_Rate_Conv  Else Pur_Rate_Conv  End) as Numeric(22,4)) Rate, 
Cast((Case When Flag = 'T' Then (Tot_Qty_Conv * App_Pur_Rate_Conv) Else Pur_Amount  End) as Numeric(22,2)) Amount,                                                    
(Case When Flag = 'T' Then Tot_Qty_Conv Else 0.000 End) App_Qty,                                                     
(Case When Flag = 'T' Then App_Pur_Rate_Conv  Else 0.000 End) App_Rate, 
(Case When Flag = 'T' Then Cast((Tot_Qty_Conv * App_Pur_Rate_Conv) as Numeric(22,2)) Else 0.00 End) App_Amount, PlanDtlID, PlanMasID                                                    
From  Projects.Dbo.Project_Planning_Material_Fn()    
Union                                                    
Select Order_No, Proj_Type_ID StyleID, 4 O_SlNo, 0 SequenceID, 'Process' Access_Type, Proc_ID ProcessID,                                                    
Process Process, Proc_ID ItemID, Process Item, 0 ColorID, '' Color, 0 SizeID, '' Size, Tot_Qty Quantity, Pur_Rate Rate, Pur_Amount Amount,                                                    
(Case When Flag = 'T' Then Tot_Qty Else 0.000 End) App_Qty,                                                     
(Case When Flag = 'T' Then Pur_Rate Else 0.00 End) App_Rate, (Case When Flag = 'T' Then Pur_Amount Else 0.00 End) App_Amount, PlanDtlID,  PlanMasID                                                    
From Projects.Dbo.Project_Planning_Process_Fn()
Union                                      
Select Order_No, Proj_Type_ID StyleID, 7 O_SlNo, 500 SequenceID, 'Commercial' Access_Type, Comm_ID ProcessID,                                                    
'Commercial' Process, Comm_ID ItemID, Comm Item, 0 ColorID, '' Color, 0 SizeID, '' Size, Tot_Qty Quantity, PUr_Rate Rate, Pur_Amount Amount,                                    
(Case When Flag = 'T' Then Tot_Qty Else 0.000 End) App_Qty,                      
(Case When Flag = 'T' Then PUr_Rate  Else 0.00 End) App_Rate, (Case When Flag = 'T' Then Pur_Amount  Else 0.00 End) App_Amount, PlanDtlID, PlanMasID                                          
From Projects.Dbo.Project_Planning_Comm_Fn() 
) A Where Quantity >0 



GO
/****** Object:  UserDefinedFunction [dbo].[Grid_Data_Po_Summary_Orderwise]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Grid_Data_Po_Summary_Orderwise]()Returns table return  
Select B.Ledger_Name supplier, A.PONo, A.PoDate, Item, Color, Size, Sum(Order_Qty)-Sum(Isnull(Cancel_Qty,0)) Po_Qty, Order_Id, Item_Id, Color_Id, Size_Id, B.Ledger_Code From(  
Select A.Supplier_Code, A.PONo, A.PoDate, Required_Date, A.Commit_Date, Ack_Date, B.Item_id, B.Color_id, B.Size_ID, B.Order_ID, B.Order_Qty, B.Cancel_Qty, B.Rate   
from Project_PO_Master A  
Left Join Project_PO_Details B on A.RowID = B.Master_ID  
Where A.Approval_Flag='T'  
)A  
Left Join Supplier_All_Fn() B on A.Supplier_Code = B.Ledger_Code  
Left Join Item C on A.Item_id = C.Itemid  
Left Join Color D on A.Color_id = D.colorid  
Left Join Size E on A.Size_ID = E.sizeid  
Group By B.Ledger_Name, A.PONo, A.PoDate, Order_Id, Item, Color, Size, Item_Id, Color_Id, Size_Id, B.LEdger_Code  
Having (Sum(Order_Qty)-Sum(Isnull(Cancel_Qty,0)))>0


GO
/****** Object:  UserDefinedFunction [dbo].[Grid_Data_Grn_Summary_Orderwise]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Grid_Data_Grn_Summary_Orderwise]()Returns table return
Select PONo, PODate, Max(GRNDate)GRNDate, Order_ID, Item_Id, Color_Id, Size_ID, Sum(Isnull(Qty,0))Qty, Sum(Isnull(Rej_Qty,0))Rej_Qty 
From(
Select F.PONo, F.PoDate, A.GRNNo, A.GRNDate, B.Item_ID, B.Color_ID, B.Size_ID, C.Order_ID, 
Sum(C.Qty)Qty, Sum(C.Return_Qty)Rej_Qty, 
'' Rejection  from Project_GRN_Master A
Left Join Project_GRN_Details B on A.Rowid = B.Master_ID
Left Join Project_GRN_OCN_DEtails C on A.Rowid = C.Master_ID And B.Master_ID = C.Master_ID And B.Slno = C.SlNo_Dtl 
Left Join (Select A.RowID, B.PONo, B.PoDate from Project_PO_Details A Left Join Project_PO_Master B on A.Master_ID = B.Rowid)F on C.PO_Detail_ID = F.RowID
Group By F.PONo, F.PoDate, A.GRNNo, A.GRNDate, B.Item_ID, B.Color_ID, B.Size_ID, C.Order_ID
)A
Group By PONo, PODate, Order_ID, Item_Id, Color_Id, Size_ID

GO
/****** Object:  UserDefinedFunction [dbo].[Grid_Data_Summary_Orderwise]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  function [dbo].[Grid_Data_Summary_Orderwise](@FromDate Datetime, @ToDate Datetime)returns table return    
Select Distinct Top 100000000 Buyer, Merch, OCN, PoNo, Supplier, Item, Color, Size, Po_Qty, Grn_Qty, Rej_Qty, Pen_Qty,   
PoDate, GRNDate, (Case When Pen_Qty>0 Then Datediff(D,PoDate,getdate()) Else Datediff(D,PoDate,GRNDate) End) Lead_Days,   
Po_Type,  Getdate() Yarn_Arrival_Date, Order_Id, Item_Id, Color_Id, Size_Id From(  
Select  E.Ledger_Name Buyer, E1.Name Merch, D.Order_No OCN,  A.PoNo, A.Supplier,  A.Item, A.Color, A.Size, A.Po_Qty,   
Isnull(B.Qty,0) Grn_Qty, Isnull(B.Rej_Qty,0) Rej_Qty,   
(Case When Substring(A.PONo,0,8)!='GUP-VSD' Then (Case When (A.Po_Qty-Isnull(B.Qty,0)) < 0 Then 0 Else (A.Po_Qty-Isnull(B.Qty,0)) End) Else   
(Case When (((Case When Isnull(B.Qty,0)=0 Then A.Po_Qty Else (A.Po_Qty-(A.Po_Qty*(C.Loss_Perc/100))) End)-Isnull(B.Qty,0))) < 0 Then 0   
Else((Case When Isnull(B.Qty,0)=0 Then A.Po_Qty Else (A.Po_Qty-(A.Po_Qty*(C.Loss_Perc/100))) End)-Isnull(B.Qty,0)) End) End )Pen_Qty,   
A.PoDate, B.GRNDate,  'Purchase' Po_Type,  A.Order_Id, A.Item_Id, A.Color_Id, A.Size_Id     
from Grid_Data_Po_Summary_Orderwise()A    
Left Join Grid_Data_Grn_Summary_Orderwise()B on A.PONo = B.PONo And A.Order_Id = B.Order_Id And A.Item_ID = B.Item_ID And A.Color_Id = B.Color_ID And A.Size_Id = B.Size_ID    
Left Join Color C on A.Color_Id = C.colorid  
Left Join Project_ORdeR_MASter D on A.Order_Id = D.Rowid  
Left Join VAAHINI_ERP_GAINUP.Dbo.EmployeeMas  E1 on D.Emplno = E1.EmplNo
Left Join Buyer_All_Fn()E on D.Party_Code = E.Ledger_Code  
Where A.PoDate between @FromDate And @ToDate
)A  
Order By PoDate  

GO
/****** Object:  UserDefinedFunction [dbo].[Project_View_Plan_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Project_View_Plan_Fn]() Returns Table Return                      
Select  A.Order_No, A.PArty, A.Party_Code, A.Employee, A.Order_ID, A.Item_ID Item_ID, A.Item, A.Color_ID, A.Color,        
A.Size_ID, A.Size, Min(A.App_Pur_Rate_Conv) Rate, Min(A.Tax_Per) Tax_Per, Min(A.App_Grs_Rate_Conv) Grs_Rate, Sum(A.Tot_Qty_Conv) Bom_Plan,        
A.Flag, Min(A.Other_Rate_Conv) Freight_Rate, A.PO_Uom Uom, A.UomId_Po UOM_ID, A.UOM_ID_Mas, A.Uom_mas, A.Proj_Type, A.Proj_ACtivity_NAme, A.Proj_ACtivity_ID, a.Proj_Type_ID , A.Order_By_Slno
From Project_Planning_Material_Fn()  A
Where A.Flag = 'T'  and A.Tot_Qty_Conv >0           
Group by A.Order_No, A.PArty, A.Party_Code, A.Order_ID, A.Item_ID ,                       
A.Item, A.Item_ID , A.Color , A.Size_ID, A.Size, A.Employee, A.Flag, A.Color_ID,A.PO_Uom, A.UomId_Po, A.UOM_ID_Mas, A.Uom_mas, A.Proj_Type, A.Proj_ACtivity_NAme, A.Proj_ACtivity_ID, a.Proj_Type_ID , Order_By_Slno

GO
/****** Object:  UserDefinedFunction [dbo].[Project_GRN_Pending_Ocn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Project_GRN_Pending_Ocn] () returns table return                               
Select S2.Supplier_Code, F1.Proj_ACtivity_NAme, F1.Proj_Type, S1.Proj_Activity_ID, S1.Proj_Type_ID, S1.Item_id, F1.item,  S1.Color_id, F1.Color, S1.Size_ID, F1.size,                               
Sum(Order_Qty_Conv) PO_Qty,                               
Isnull(Sum(S5.Grn_Qty), 0) Inward_Qty,  ((Sum(Order_Qty_Conv) - Isnull(Sum(S5.GRN_Qty), 0)) - IsNull(Sum(Cancel_Qty_Conv),0)) + Isnull(Sum(S5.Return_Qty), 0) Bal_Qty,                      
Isnull(Sum(S5.Return_Qty), 0) Return_Qty, '' ITem_Type, S2.PONo,                   
S1.Grs_Rate_Conv Grs_Rate, S1.Rate_Conv Pur_RAte, F1.Order_ID, F1.Order_No, S1.RowID Po_DETAIL_ID  From Project_PO_Details S1                               
Inner join Project_PO_Master s2 on S1.Master_ID = s2.RowID  and S2.Approval_Flag = 'T'              
left JOin Project_View_Plan_Fn() F1 On S1.Proj_Activity_ID = F1.Proj_Activity_ID  and S1.Proj_Type_ID = F1.Proj_Type_ID
and S1.ITem_ID = F1.ITem_ID and S1.Color_Id = F1.Color_ID and S1.Size_ID = F1.Size_ID and S1.ORdER_Id = F1.ORdeR_ID
Left join (Select S2.Order_ID, S1.Item_ID, S2.PO_Detail_ID, S1.Color_ID, S1.Size_ID, S1.Pur_Rate, Sum(S2.Qty) GRN_Qty, Sum(S2.Return_Qty) Return_Qty  From Project_GRN_DEtails S1
Inner join Project_GRN_OCN_DEtails S2 ON S1.Master_ID = S2.Master_ID and S1.Slno = S2.SlNo_Dtl Group by S1.Item_ID, S2.PO_Detail_ID, S1.Color_ID, S1.Size_ID, S1.Pur_Rate, S2.Order_ID) S5 on S1.Item_id 
= S5.Item_ID and S1.Color_id = S5.Color_ID and                               
S1.Size_ID = S5.Size_ID  and S1.RowID = S5.PO_Detail_ID  and S1.Rate_Conv = S5.Pur_RAte and S1.RowID = S5.PO_Detail_ID 
Where F1.Item Is Not null
Group by S1.Item_id, S2.Supplier_Code, F1.item,  S1.Color_id, F1.Color, S1.Size_ID, F1.size, S1.Grs_Rate_Conv, S1.Proj_Activity_ID , S1.Proj_Type_ID,S1.Rate_Conv, F1.Proj_ACtivity_NAme, F1.Proj_Type , F1.Order_ID, F1.Order_No, S1.RowID, S2.PONo




GO
/****** Object:  UserDefinedFunction [dbo].[Grid_Data_Grn_Pending_Ocn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Function [dbo].[Grid_Data_Grn_Pending_Ocn]()Returns table return
Select Po_Type, Merch, Buyer, Supplier, A.Order_No, Item, Color, Size, Pen_Qty, Stock_Req from 
(Select 'Purchase' Po_Type, E.Name Merch, D.LedgeR_NAme Buyer, B.LedgeR_NAme Supplier, C.Order_No, Item, Color, Size, Sum(Bal_Qty)Pen_Qty, Sum(Bal_Qty)Stock_Req 
from Project_GRN_Pending_Ocn () A 
LEft Join Supplier_all_Fn() b On A.Supplier_Code = B.LedgeR_Code 
LEft join Project_ORdeR_MASter C On A.Order_ID = C.Rowid 
LEft Join Buyer_all_Fn() D On C.PArty_Code = D.LedgeR_Code 
LEft Join VAAHINI_ERP_GAINUP.Dbo.Employeemas E On C.EmplNo = E.Emplno 
Where Bal_Qty > 0  
Group By E.Name, D.LedgeR_NAme, B.LedgeR_NAme, C.Order_No, Item, Color, Size
)A

GO
/****** Object:  UserDefinedFunction [dbo].[Project_PO_Pending_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Project_PO_Pending_Fn]() Returns Table Return                  
Select Order_No, PArty, Party_Code, Order_ID, Item_ID, Item, Color_ID, Color, Size_ID, Size, BOM_Qty_Plan, Bom_Qty, Ordered_Qty, PO_pending,                  
PO_Qty, Rate, Amount, Cl_Qty, Cast(Getdate() as Date)  TA_Plan_Date, 1000 Enable_Days,                   
(Case When IsNull(Enable_Days,1000) >= 0 Then PO_Qty Else PO_Qty End) PO_Qty2,  PO_Qty PO_Qty1,                  
Grs_Rate, Tax_Per, Freight_Rate, Proj_Type, Proj_Activity_Name, Proj_Type_ID, Proj_ACtivity_ID,
(PO_Qty * GrS_Rate) Grs_Amount, cast(((PO_Qty * GrS_Rate) * Tax_Per)/100 as Numeric(22,2)) Tax_Amount, CAsT((PO_Qty * Freight_Rate) as Numeric(22,2)) Freight_Amount,                   
Cast(((PO_Qty * GrS_Rate) +  cast(((PO_Qty * GrS_Rate) * Tax_Per)/100 as Numeric(22,2)) + (PO_Qty * Freight_Rate)) as Numeric(22,2)) Pur_Amount, Uom, UomID,                 
Grs_Rate_FC, Freight_Rate_FC, Pur_Rate_FC ,              
(PO_Qty * GrS_Rate_FC) Grs_Amount_Fc, cast(((PO_Qty * GrS_Rate_Fc) * Tax_Per)/100 as Numeric(22,2)) Tax_Amount_Fc, CAsT((PO_Qty * Freight_Rate_Fc) as Numeric(22,2)) Freight_Amount_Fc,                     
Cast(((PO_Qty * GrS_Rate_Fc) +  cast(((PO_Qty * GrS_Rate_Fc) * Tax_Per)/100 as Numeric(22,2)) + (PO_Qty * Freight_Rate_Fc)) as Numeric(22,2)) Pur_Amount_Fc, App_Sup_Ex_Rate, Order_By_Slno 
From (                      
Select A.Order_No, A.PArty, A.Party_Code, A.Order_ID, A.Item_ID, A.Item, A.Color_ID, A.Color, A.Size_ID, A.Size, A.Bom_Plan BOM_Qty_Plan, (A.Bom_Plan) Bom_Qty,                  
Isnull(P.Tot_Ord_Qty,0)  Ordered_Qty, (A.Bom_Plan - Isnull(P.Tot_Ord_Qty,0) + IsNull(R1.Return_Qty ,0)) PO_pending, (A.Bom_Plan - Isnull(P.Tot_Ord_Qty,0)+ IsNull(R1.Return_Qty ,0)) PO_Qty, A.Rate, CAst((A.Bom_Plan - Isnull(P.Tot_Ord_Qty,0) + IsNull(R1.Return_Qty ,0)) * A.Rate as Numeric(22,2)) Amount,
IsNull(P.Cancel_Qty,0) Cl_Qty,   IsNull(R1.Return_Qty ,0) Ret_Qty,
Getdate() TA_Plan_Date, 0 Enable_Days, A.GRs_Rate, A.Tax_Per, A.Freight_rate,                  
A.Proj_ACtivity_ID, A.Proj_Type_ID, A.Uom, A.UOM_ID UomID , A.Grs_Rate Grs_Rate_FC, A.Freight_Rate Freight_Rate_FC, A.Rate Pur_Rate_FC, 1 App_Sup_Ex_Rate, A.Proj_Type,  A.Proj_ACtivity_NAme, A.Order_By_Slno 
From Project_View_Plan_Fn() A                                          
Inner Join Project_ORdeR_MASter A1 On A.Order_ID = A1.Rowid and IsNull(Complete_Order, 'N') = 'N'         
Left Join (Select OrdeR_Id, Proj_Type_ID, Proj_Activity_ID , ITem_ID, Color_ID, SizE_ID, Sum(ORdER_Qty)ORdER_Qty, IsNull(Sum(Cancel_Qty),0) Cancel_Qty, Sum(ORdER_Qty - Cancel_Qty) Tot_Ord_Qty 
From Project_Po_Details Group by Proj_Type_ID, Proj_Activity_ID ,OrdeR_Id, ITem_ID, Color_ID, SizE_ID) P                   
On A.Order_ID = P.Order_ID and A.Item_ID = P.Item_id and A.Color_ID = P.Color_id and A.Size_ID = P.Size_ID and A.Proj_Activity_Id = P.Proj_Activity_Id and A.Proj_Type_ID = P.Proj_Type_ID
Left Join (
Select A.OrdeR_Id, A.Proj_Type_ID, A.Proj_Activity_ID , ITem_ID, Color_ID, SizE_ID, Sum(Return_Qty)Return_Qty 
From Project_Po_Details A Inner Join Project_GRN_OCN_DEtails B On A.RowID = B.PO_Detail_ID Where Isnull(Return_Qty,0) > 0 Group by A.Proj_Type_ID, A.Proj_Activity_ID , A.OrdeR_Id, ITem_ID, Color_ID, SizE_ID)R1
On A.Order_ID = R1.Order_ID and A.Item_ID = R1.Item_id and A.Color_ID = R1.Color_id and A.Size_ID = R1.Size_ID and A.Proj_Activity_Id = R1.Proj_Activity_Id and A.Proj_Type_ID = R1.Proj_Type_ID
LEft Join Project_Po_Item_Close P1 On A.Proj_ACtivity_ID = P1.Proj_Activity_ID and A.Proj_Type_ID = P1.Proj_Type_ID and A.Order_ID = P1.Order_ID and A.Item_ID = P1.Item_id and A.Color_ID = P1.Color_id and A.Size_ID = P1.Size_ID and  P1.Mode = 'Material'  

Where P1.ORder_ID is Null  and Item not like '%MAN%DAYS%'    
)A  Where Bom_Qty >0  

GO
/****** Object:  UserDefinedFunction [dbo].[Grid_Po_Pending_Details_Material]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Grid_Po_Pending_Details_Material]()Returns table return      
Select Plan_Type, Buyer, Ocn, Item, Color, Size, Rate, Bom_Qty, Po_Pending, Uom,  Item_ID, Color_ID, Size_Id
 From(      
Select 'Purchase' Plan_Type, PArty Buyer, Order_No Ocn, Item, Color, Size, Rate, Uom, Sum(Bom_Qty)Bom_Qty, Sum(Po_Qty)Po_Pending, Item_ID, Color_ID, Size_Id      
from Project_PO_Pending_Fn()     
Group By PArty, Order_No, Item, Color, Size, Rate, Item_ID, Color_ID, Size_Id , Uom     
)A      
Where Po_Pending>0


GO
/****** Object:  UserDefinedFunction [dbo].[Budget_Approval_Summary_Project]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Budget_Approval_Summary_Project]()Returns table return  
select Top 1000000 Order_No, ItemID O_Slno, ITem Access_Type, Sum(Quantity) Quantity, Sum(App_Qty) App_Quantity, Cast(Sum(isnull(App_Amount,0))as Numeric(25,2))App_Amount   
from Budget_Approval_Project()   
Group By Order_No, ITemID , Item Order By ITem, ItemID

GO
/****** Object:  UserDefinedFunction [dbo].[Project_Grn_Invoicing_dEtails_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create function [dbo].[Project_Grn_Invoicing_dEtails_Fn]() returns table return
Select S11.Entry_No, S11.Entry_Date, L1.Ledger_Name SUpplier, S11.Invoice_No, S11.Invoice_Date, S11.Supplier_Code, S1.RowID Code, S11.Remarks, S11.Tax_Calc_Mode, S11.RO_Amt, S1.Slno Sl, S1.Item_ID, I1.Item, S1.Color_ID, C1.Color, S1.Size_ID, S2.Size, S1.GRN_Qty, S1.Rate, S1.PO_Amount, S1.Budget_NRate Budget_Rate, S1.Budget_Tax, S1.Budget_Freight, S1.Budget_Others, S1.Bill_Qty, S1.Bill_Rate, S1.Bill_Amount, S1.Freight_BTax Freight, S1.OCharges_BTax Others, S1.Tax_Per, S1.Tax_Amount, S1.Freight_ATax Freight1, S1.OCharges_ATax Others1, S1.Bill_Gross, S1.Bill_NRate, S1.Loss_Perc, S1.Qty_Deb, S1.Rate_Deb, S1.Acc_Qty, S1.Total_Rate, S1.Total_Bud_Cost Total_Rate1  
From Project_GRN_Invoicing_Details S1 Left Join Item I1 On S1.Item_ID = I1.itemid Left Join Color C1 On S1.Color_ID = C1.colorid Left Join Size S2 On S1.Size_ID = S2.Sizeid 
Left Join  Project_GRN_Invoicing_Master  S11 On S1.MASter_ID = S11.Rowid 
LEft Join Supplier_all_Fn() L1 On S11.Supplier_Code = L1.LedgeR_Code 

GO
/****** Object:  UserDefinedFunction [dbo].[Project_PO_Master_Details_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Project_PO_Master_Details_Fn]() Returns Table Return      
select A.Rowid, B.Rowid Detail_ID, A.PoNo, A.PoDate, A.Indent_NO, C.LEdger_Name Supplier, A.Supplier_COde, A.REquired_Date, A.Buyer_Code, A.Approval_Flag,
A.Ack_Date, A.Commit_Date, A.MailId, A.Grs_Amount Tot_Grs_Amount, A.Tax_Amount Tot_Tax_Amount, A.Freight_Amount Tot_Freight_Amount, A.Net_Amount Tot_Net_Amount,
B.Order_ID, B.Item_id, B.Color_id, B.Size_ID, B.Order_Qty, B.Rate Pur_Rate, B.Amount Pur_Amount , B.Cancel_Qty, B.Remarks, B.Grs_Rate, B.Tax_Per, 
B.Freight_Rate, B.Grs_Amount Grs_Amount_Dtl, B.Tax_Amount Tax_Amount_Dtl, B.Freight_Amount Freight_Amount_Dtl, A.Approval_Time, A.Approval_System, A.Remarks Remarks_Mas,
C.Address, C.LedgeR_Phone, C.Country_Code, B.UomID1, B.Conv_Val,  B.Proj_Activity_ID, B.Proj_Type_ID,   
B.Order_Qty_Conv, B.Rate_Conv, B.Cancel_Qty_Conv, B.Grs_Rate_Conv, B.Freight_Rate_Conv, B.FREI_TAX_MODE, B.PO_QTY_CONV, B.Tax_Rate, B.Tax_Rate_Conv, B.RO_Amt, D.UOM Uom1, A.Approval_Flag1 Approval_Flag_PO1, A.Indent_Date
from Project_PO_Master A Inner Join Project_Po_Details B On A.RowID = B.Master_ID       
Left Join Supplier_All_Fn() c On A.Supplier_Code = C.LedgeR_Code     
LEft Join UOM_MASTER D On B.UomID1 = D.UOMID

GO
/****** Object:  UserDefinedFunction [dbo].[Project_PO_Details_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Project_PO_Details_Fn]() Returns Table Return              
select A.Rowid, A.Detail_ID, A.PoNo, A.PoDate, A.Indent_NO, A.Supplier, A.Supplier_COde, A.REquired_Date,  A.Buyer_Code, A.Approval_Flag Approval_Flag_PO, A.Ack_Date,               
A.Commit_Date, A.MailId, A.Tot_Grs_Amount, A.Tot_Tax_Amount, A.Tot_Freight_Amount, A.Tot_Net_Amount, A.Order_ID, A.Item_id, A.Color_id, A.Size_ID, A.Order_Qty,               
A.Pur_Rate, A.Pur_Amount - A.RO_Amt Pur_Amount, A.Cancel_Qty, A.Remarks, A.Grs_Rate, A.Tax_Per, A.Freight_Rate, A.Grs_Amount_Dtl, A.Tax_Amount_Dtl, A.Freight_Amount_Dtl,               
A.Approval_Time Approval_Time_PO, A.Approval_System Approval_System_PO,               
B.Order_No, B.PArty, B.Party_Code, B.Item, B.Color,  B.Size, B.Rate, B.Tax_Per Tax_Per_Bud, B.Freight_Rate Freight_Rate_Bud, B.Grs_Rate Grs_Rate_Bud,               
B.Bom_Plan, B.Flag Approval_Flag_Bud, A.Remarks_Mas, A.Address, A.LedgeR_Phone, A.Country_Code, B.Uom, B.UOM_ID, A.UomID1, A.Conv_Val,
A.Order_Qty_Conv, A.Rate_Conv, A.Cancel_Qty_Conv, A.Grs_Rate_Conv, A.Freight_Rate_Conv, A.FREI_TAX_MODE, A.PO_QTY_CONV, A.Tax_Rate, A.Tax_Rate_Conv, A.RO_Amt, A.Uom1, B.Proj_ACtivity_NAme, A.Approval_Flag_PO1 , B.Proj_Type, A.Indent_Date  ,  A.Proj_Activity_ID, A.Proj_Type_ID 
From Project_PO_Master_Details_Fn() A               
LEft Join [Project_View_Plan_Fn]() B On A.Order_ID = B.Order_ID and A.Proj_ACtivity_ID = B.Proj_Activity_ID and A.Proj_TypE_ID = B.Proj_Type_ID
and A.Item_ID = B.Item_ID and A.Color_ID = B.Color_ID and A.SIze_ID = B.Size_Id              

GO
/****** Object:  UserDefinedFunction [dbo].[Project_Po_Print_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Project_Po_Print_Fn](@Code Bigint) returns table return          
Select A.Rowid, PoNo, PoDate, Indent_NO, Indent_Date, Supplier, Supplier_COde, REquired_Date,  Approval_Flag_PO, Ack_Date, Commit_Date, MailId, Tot_Grs_Amount, Tot_Tax_Amount, Tot_Freight_Amount, Tot_Net_Amount, Approval_Time_PO, Approval_System_PO,   
Remarks_Mas, Getdate() PrintOutDate,  Address, LedgeR_Phone, Uom1,  Country_Code,       
Order_Qty, Pur_Rate, Cancel_Qty, Grs_Rate, Tax_Per, Freight_Rate, Grs_Amount_Dtl, Tax_Amount_Dtl, Freight_Amount_Dtl, Pur_Amount, Item, Color, Size, Rate, Description, Conv_Val from (          
Select Distinct Rowid, PoNo, PoDate, Indent_NO, Indent_Date , Supplier, Supplier_COde, REquired_Date,  Approval_Flag_PO, Ack_Date, Commit_Date, MailId, Tot_Grs_Amount, Tot_Tax_Amount, Tot_Freight_Amount, Tot_Net_Amount, Approval_Time_PO, Approval_System_PO,  Remarks_Mas, Getdate() PrintOutDate,  Address, LedgeR_Phone, Country_Code  from Project_PO_Details_Fn() Where  RowID = @Code          
)A Inner join (          
Select Rowid, Sum(ORder_Qty_Conv) Order_Qty, Rate_Conv Pur_Rate, Sum(Cancel_Qty_Conv) Cancel_Qty, Grs_Rate_Conv Grs_Rate, Tax_Per, Freight_Rate_Conv Freight_Rate, Sum(Grs_Amount_Dtl) Grs_Amount_Dtl, Sum(Tax_Amount_Dtl) Tax_Amount_Dtl, Sum(Freight_Amount_Dtl) Freight_Amount_Dtl,           
Sum(Pur_Amount) Pur_Amount, Avg(Ro_Amt) Ro_Amt, Item, Color, Size, Rate_Conv Rate, Item + ' - ' + Color + ' - ' + Size Description, Conv_Val, Uom1  from Project_PO_Details_Fn() 
Where RowID = @Code           
Group by Rate_Conv, Grs_Rate_Conv, Tax_Per, Freight_Rate_Conv, Item, Color, Size, Rowid, Conv_Val, Uom1          
)B On A.Rowid = B.Rowid        


GO
/****** Object:  UserDefinedFunction [dbo].[Project_PO_Pending_Fn_View]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Project_PO_Pending_Fn_View]() Returns Table Return                  
Select Order_No, PArty, Party_Code, Order_ID, Item_ID, Item, Color_ID, Color, Size_ID, Size, BOM_Qty_Plan, Bom_Qty, Ordered_Qty, PO_pending,                  
PO_Qty, Rate, Amount, Cl_Qty, Cast(Getdate() as Date)  TA_Plan_Date, 1000 Enable_Days,                   
(Case When IsNull(Enable_Days,1000) >= 0 Then PO_Qty Else PO_Qty End) PO_Qty2,  PO_Qty PO_Qty1,                  
Grs_Rate, Tax_Per, Freight_Rate, Proj_Type, Proj_Activity_Name, Proj_Type_ID, Proj_ACtivity_ID,
(PO_Qty * GrS_Rate) Grs_Amount, cast(((PO_Qty * GrS_Rate) * Tax_Per)/100 as Numeric(22,2)) Tax_Amount, CAsT((PO_Qty * Freight_Rate) as Numeric(22,2)) Freight_Amount,                   
Cast(((PO_Qty * GrS_Rate) +  cast(((PO_Qty * GrS_Rate) * Tax_Per)/100 as Numeric(22,2)) + (PO_Qty * Freight_Rate)) as Numeric(22,2)) Pur_Amount, Uom, UomID,                 
Grs_Rate_FC, Freight_Rate_FC, Pur_Rate_FC ,              
(PO_Qty * GrS_Rate_FC) Grs_Amount_Fc, cast(((PO_Qty * GrS_Rate_Fc) * Tax_Per)/100 as Numeric(22,2)) Tax_Amount_Fc, CAsT((PO_Qty * Freight_Rate_Fc) as Numeric(22,2)) Freight_Amount_Fc,                     
Cast(((PO_Qty * GrS_Rate_Fc) +  cast(((PO_Qty * GrS_Rate_Fc) * Tax_Per)/100 as Numeric(22,2)) + (PO_Qty * Freight_Rate_Fc)) as Numeric(22,2)) Pur_Amount_Fc, App_Sup_Ex_Rate 
From (                      
Select A.Order_No, A.PArty, A.Party_Code, A.Order_ID, A.Item_ID, A.Item, A.Color_ID, A.Color, A.Size_ID, A.Size, A.Bom_Plan BOM_Qty_Plan, (A.Bom_Plan) Bom_Qty,                  
Isnull(P.Tot_Ord_Qty,0)  Ordered_Qty, (A.Bom_Plan - Isnull(P.Tot_Ord_Qty,0)) PO_pending, (A.Bom_Plan - Isnull(P.Tot_Ord_Qty,0)) PO_Qty, A.Rate, CAst((A.Bom_Plan - Isnull(P.Tot_Ord_Qty,0)) * A.Rate as Numeric(22,2)) Amount,
IsNull(P.Cancel_Qty,0) Cl_Qty,                   
Getdate() TA_Plan_Date, 0 Enable_Days, A.GRs_Rate, A.Tax_Per, A.Freight_rate,                  
A.Proj_ACtivity_ID, A.Proj_Type_ID, A.Uom, A.UOM_ID UomID , A.Grs_Rate Grs_Rate_FC, A.Freight_Rate Freight_Rate_FC, A.Rate Pur_Rate_FC, 1 App_Sup_Ex_Rate, A.Proj_Type,  A.Proj_ACtivity_NAme 
From Project_View_Plan_Fn() A                                          
Inner Join Project_ORdeR_MASter A1 On A.Order_ID = A1.Rowid
Left Join (Select OrdeR_Id, Proj_Type_ID, Proj_Activity_ID , ITem_ID, Color_ID, SizE_ID, Sum(ORdER_Qty)ORdER_Qty, IsNull(Sum(Cancel_Qty),0) Cancel_Qty, Sum(ORdER_Qty - Cancel_Qty) Tot_Ord_Qty                   
From Project_Po_Details Group by Proj_Type_ID, Proj_Activity_ID ,OrdeR_Id, ITem_ID, Color_ID,                   
SizE_ID) P                   
On A.Order_ID = P.Order_ID and A.Item_ID = P.Item_id and A.Color_ID = P.Color_id and A.Size_ID = P.Size_ID and A.Proj_Activity_Id = P.Proj_Activity_Id and A.Proj_Type_ID = P.Proj_Type_ID
LEft Join Project_Po_Item_Close P1 On A.Proj_ACtivity_ID = P1.Proj_Activity_ID and A.Proj_Type_ID = P1.Proj_Type_ID and A.Order_ID = P1.Order_ID and A.Item_ID = P1.Item_id and A.Color_ID = P1.Color_id and A.Size_ID = P1.Size_ID and  P1.Mode = 'Material'  

    
Where P1.ORder_ID is Null      
)A  Where Bom_Qty >0  



GO
/****** Object:  UserDefinedFunction [dbo].[Project_PO_Qty_GRid_View_Order_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Project_PO_Qty_GRid_View_Order_Fn]() returns Table return          
SELECT B.MASteR_ID, B.ORdeR_ID, A.PArty, A.PArty_Code, A.ORdeR_NO, 0 SL, A.Proj_ACtivity_Name, A.Proj_Type , A.Proj_Activity_ID, A.Proj_Type_ID, A.ITEM, A.COLOR, A.SIZE, A.UOM, '' UOM1, B.CONV_VAL, A.Bom_Qty BOM_ORG, A.ORdered_Qty ORDERED_ORG,           
(A.PO_Pending + B.Order_Qty) BAL_ORG, (A.PO_Pending + B.Order_Qty) PO_QTY_ORG, B.APP_GRS_ORG, B.APP_TAX_ORG, B.APP_FREI_ORG, B.APP_PUR_RATE_ORG,           
(Case When B.CAlc_Type = '*' Then CAst(((B.Order_Qty) * B.CONV_VAL) as Numeric(22,3)) Else CAst(((B.Order_Qty) / B.CONV_VAL) as Numeric(22,3)) End) PO_QTY_ORG_CONV,       
B.APP_GRS_ORG_CONV, B.APP_FREI_ORG_CONV, B.APP_PUR_RATE_ORG_CONV,           
(Case When B.CAlc_Type = '*' Then Cast((A.Bom_Qty * B.Conv_Val) as Numeric(22,3)) Else Cast((A.Bom_Qty / B.Conv_Val) as Numeric(22,3)) End) BOM,       
(Case When B.CAlc_Type = '*' Then Cast((A.Ordered_Qty * B.Conv_Val) as Numeric(22,3)) Else Cast((A.Ordered_Qty / B.Conv_Val) as Numeric(22,3)) End) ORDERED,       
(CaSe When B.Calc_Type = '*' Then (Cast((A.Bom_Qty * B.Conv_Val) as Numeric(22,3)) - Cast((A.Ordered_Qty * B.Conv_Val) as Numeric(22,3))) + B.ORder_Qty_Conv Else      
(Cast((A.Bom_Qty / B.Conv_Val) as Numeric(22,3)) - Cast((A.Ordered_Qty / B.Conv_Val) as Numeric(22,3))) + B.ORder_Qty_Conv End) BAL,           
B.ORder_Qty_Conv PO_QTY, B.APP_GRS, B.APP_TAX, B.APP_FREI, B.APP_PUR_RATE, B.Grs_Rate_Conv GRS_RATE, B.Tax_Per TAX_PER, B.Tax_Rate_Conv TAX_RATE,           
B.Freight_Rate_Conv FREIGHT_RATE, B.FREI_TAX_MODE, B.Rate_Conv PUR_RATE, B.Grs_Amount GRS_AMT, B.Tax_Amount TAX_AMT, B.Freight_Amount FREI_AMT,           
0 RO_AMT, B.Amount PUR_AMT, B.ORder_Qty PO_QTY_CONV, B.GrS_Rate GRS_RATE_CONV, B.Tax_Rate TAX_RATE_CONV, B.Freight_Rate FREI_RATE_CONV, B.Rate PUR_RATE_CONV,           
CAst(A.PRoj_Type_ID as Varchar(20)) + '-' + Cast(A.Proj_Activity_ID as Varchar(20)) + '-' + Cast(A.ITEM_ID as Varchar(20)) + '-' + Cast(A.COLOR_ID as Varchar(20)) + '-' + Cast(A.SIZE_ID as Varchar(20)) DESCRIPTION ,            
A.UOMID, A.ITEM_ID, A.COLOR_ID, A.SIZE_ID, B.UOMID1, B.REMARKS From          
(Select A.ORdER_NO, A.Proj_activity_Name, A.Proj_Type, A.Proj_Activity_ID, A.Proj_Type_ID, A.ORdER_ID, A.PArty, A.PArty_code,A.ITEM, A.COLOR, A.SIZE, A.UOM, Sum(A.Bom_Qty) Bom_Qty, Sum(A.ORdered_Qty) ORdered_Qty, Sum(A.PO_Pending) PO_Pending , A.UOMID, A.
ITEM_ID, A.COLOR_ID, A.SIZE_ID          
From Project_PO_Pending_Fn_View() A          
Group by A.Proj_Activity_ID, A.Proj_Type_ID,  A.ITEM, A.COLOR, A.SIZE, A.UOM, A.UOMID, A.ITEM_ID, A.COLOR_ID, A.SIZE_ID, A.ORdER_ID, A.ORdER_NO, A.PArty, A.PArty_code, A.Proj_Activity_Name, A.Proj_Type          
) A          
Inner Join           
(Select B.MASteR_ID,    B.ORdER_ID, B.CONV_VAL, Sum(B.Order_Qty) Order_Qty, B.APP_GRS_ORG, B.APP_TAX_ORG, B.APP_FREI_ORG, B.APP_PUR_RATE_ORG, B.APP_GRS_ORG_CONV,           
B.APP_FREI_ORG_CONV, B.APP_PUR_RATE_ORG_CONV, Sum(B.ORder_Qty_Conv) ORder_Qty_Conv , B.APP_GRS, B.APP_TAX, B.APP_FREI, B.APP_PUR_RATE, B.Grs_Rate_Conv ,           
B.Tax_Per , B.Tax_Rate_Conv , B.Freight_Rate_Conv , B.FREI_TAX_MODE, B.Rate_Conv, Sum(B.Grs_Amount) Grs_Amount, Sum(B.Tax_Amount) Tax_Amount, Sum(B.Freight_Amount) Freight_Amount,           
Sum(B.Amount) Amount  , B.GrS_Rate, B.Tax_Rate, B.Freight_Rate, B.Rate, B.Proj_Activity_ID, B.Proj_Type_ID , B.ITEM_ID, B.COLOR_ID, B.SIZE_ID, B.Remarks, B.UOmID1, B.Calc_Type From Project_PO_Details B          
Group by B.MASteR_ID, B.ORdeR_ID, B.CONV_VAL, B.APP_GRS_ORG, B.APP_TAX_ORG, B.APP_FREI_ORG, B.APP_PUR_RATE_ORG, B.APP_GRS_ORG_CONV,           
B.APP_FREI_ORG_CONV, B.APP_PUR_RATE_ORG_CONV, B.APP_GRS, B.APP_TAX, B.APP_FREI, B.APP_PUR_RATE, B.Grs_Rate_Conv ,           
B.Tax_Per , B.Tax_Rate_Conv , B.Freight_Rate_Conv , B.FREI_TAX_MODE, B.Rate_Conv,            
B.GrS_Rate, B.Tax_Rate, B.Freight_Rate, B.Rate, B.Proj_Activity_ID, B.Proj_Type_ID, B.ITEM_ID, B.COLOR_ID, B.SIZE_ID, B.Remarks, B.UOmID1, B.Calc_Type) B    
On A.ITem_ID = B.ITem_ID and A.Color_Id = B.Color_ID and A.SizE_Id= B.Size_ID           
and A.Proj_Type_ID = B.Proj_Type_ID and A.Proj_Activity_Id = B.Proj_Activity_ID and A.ORdER_Id = B.ORdeR_Id          



GO
/****** Object:  UserDefinedFunction [dbo].[Project_PO_Qty_GRid_View_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Project_PO_Qty_GRid_View_Fn]() returns Table return                          
SELECT B.MASteR_ID, 0 SL,A.Proj_ACtivity_id, A.Proj_Type_ID, A.PRoj_Activity_Name, A.Proj_Type, A.ITEM, A.COLOR, A.SIZE, A.UOM, B.UOM1, B.CONV_VAL, A.BOM_ORG, A.ORDERED_ORG,                           
A.BAL_ORG, B.Order_Qty PO_QTY_ORG, B.APP_GRS_ORG, B.APP_TAX_ORG, B.APP_FREI_ORG, B.APP_PUR_RATE_ORG, A.PO_QTY_ORG_CONV,          
B.APP_GRS_ORG_CONV, B.APP_FREI_ORG_CONV, B.APP_PUR_RATE_ORG_CONV, A.BOM BOM,  A.ORDERED ORDERED, A.BAL BAL, B.ORder_Qty_Conv PO_QTY, B.APP_GRS, B.APP_TAX, B.APP_FREI, B.APP_PUR_RATE, B.Grs_Rate_Conv GRS_RATE, B.Tax_Per TAX_PER, B.Tax_Rate_Conv TAX_RATE,  
B.Freight_Rate_Conv FREIGHT_RATE, B.FREI_TAX_MODE, B.RO_RATE, B.Rate_Conv PUR_RATE, B.Grs_Amount GRS_AMT, B.Tax_Amount TAX_AMT, B.Freight_Amount FREI_AMT,                           
B.RO_AMT RO_AMT, B.Amount PUR_AMT, B.ORder_Qty PO_QTY_CONV, B.GrS_Rate GRS_RATE_CONV, B.Tax_Rate TAX_RATE_CONV, B.Freight_Rate FREI_RATE_CONV, B.Rate PUR_RATE_CONV,                           
A.OrdeR_NO + '-' + CAst(A.Proj_Type_ID as Varchar(20)) + '-' + Cast(A.Proj_ACtivity_id as Varchar(20)) + '-' + Cast(A.ITEM_ID as Varchar(20)) + '-' + Cast(A.COLOR_ID as Varchar(20)) + '-' + Cast(A.SIZE_ID as Varchar(20)) DESCRIPTION ,                     
A.UOMID, A.ITEM_ID, A.COLOR_ID, A.SIZE_ID, B.UOMID1, B.REMARKS, B.Grs_Amt_Inr, B.Tax_Amt_Inr,B.Frei_Amt_Inr, B.Pur_Amt_Inr, B.App_Sup_Ex_Rate,B.Calc_Type, A.OrdeR_NO, A.ORdeR_ID   From                          
(Select  A.MAstER_ID, A.Proj_ACtivity_id, A.Proj_Type_ID, A.PRoj_Activity_Name, A.Proj_Type, A.ITEM, A.COLOR, A.SIZE, A.UOM, Sum(PO_QTY_ORG_CONV) PO_QTY_ORG_CONV, Sum(BOM_ORG) BOM_ORG, Sum(ORDERED_ORG) ORDERED_ORG, Sum(BAL_ORG) BAL_ORG, Sum(BOM) BOM, Sum(

ORDERED)ORDERED, Sum(BAL) BAL, Sum(A.BOM) Bom_Qty, 
Sum(A.ORDERED) ORdered_Qty, Sum(A.BAL) PO_Pending , A.UOMID, A.ITEM_ID, A.COLOR_ID, A.SIZE_ID, A.ORdeR_NO , A.ORdeR_ID    
From Project_PO_Qty_GRid_View_Order_Fn() A                          
Group by  A.MAstER_ID, A.Proj_ACtivity_id, A.Proj_Type_ID, A.PRoj_Activity_Name, A.Proj_Type , A.ITEM, A.COLOR, A.SIZE, A.UOM, A.UOMID, A.ITEM_ID, A.COLOR_ID, A.SIZE_ID, A.ORdeR_NO, A.ORdeR_ID    
) A                          
Inner Join                           
(Select B.MASteR_ID, B.CONV_VAL, Sum(B.Order_Qty) Order_Qty, B.APP_GRS_ORG, B.APP_TAX_ORG, B.APP_FREI_ORG, B.APP_PUR_RATE_ORG, B.APP_GRS_ORG_CONV,                           
B.APP_FREI_ORG_CONV, B.APP_PUR_RATE_ORG_CONV, Sum(B.ORder_Qty_Conv) ORder_Qty_Conv , B.APP_GRS, B.APP_TAX, B.APP_FREI, B.APP_PUR_RATE, B.Grs_Rate_Conv ,                           
B.Tax_Per , B.Tax_Rate_Conv , B.Freight_Rate_Conv , B.FREI_TAX_MODE, B.RO_RATE, B.Rate_Conv, Sum(B.Grs_Amount) Grs_Amount, Sum(B.Tax_Amount) Tax_Amount, Sum(B.Freight_Amount) Freight_Amount, Avg(B.Ro_Amt) Ro_Amt,                          
Sum(B.Amount) Amount  , B.GrS_Rate, B.Tax_Rate, B.Freight_Rate, B.Rate,  B.ITEM_ID, B.COLOR_ID, B.SIZE_ID, B.Remarks, B.UOmID1, U.Uom UOM1,                   
Sum(B.Grs_Amt_Inr) Grs_Amt_Inr, Sum(B.Tax_Amt_Inr) Tax_Amt_Inr, Sum(B.Frei_Amt_Inr) Frei_Amt_Inr, Sum(B.Pur_Amt_Inr) Pur_Amt_Inr, Min(App_Sup_Ex_Rate) App_Sup_Ex_Rate , B.Calc_Type, B.ORdER_ID,  B.Proj_Activity_ID, B.Proj_Type_ID From Project_PO_Details B
LEft Join UOM_MASTER U On B.UomID1 = U.UOMID 
Group by B.Proj_Activity_ID, B.Proj_Type_ID,  B.MASteR_ID, B.CONV_VAL, B.APP_GRS_ORG, B.APP_TAX_ORG, B.APP_FREI_ORG, B.APP_PUR_RATE_ORG, B.APP_GRS_ORG_CONV,                           
B.APP_FREI_ORG_CONV, B.APP_PUR_RATE_ORG_CONV, B.APP_GRS, B.APP_TAX, B.APP_FREI, B.APP_PUR_RATE, B.Grs_Rate_Conv , B.RO_RATE,                          
B.Tax_Per , B.Tax_Rate_Conv , B.Freight_Rate_Conv , B.FREI_TAX_MODE, B.Rate_Conv,                            
B.GrS_Rate, B.Tax_Rate, B.Freight_Rate, B.Rate,   B.ITEM_ID, B.COLOR_ID, B.SIZE_ID, B.Remarks, B.UOmID1, U.Uom, B.Calc_Type, B.ORdER_ID) B 
On A.ITem_ID = B.ITem_ID and A.Color_Id = B.Color_ID and A.SizE_Id= B.Size_ID                           
and A.Proj_Type_ID = B.Proj_Type_ID and A.Proj_Activity_ID = B.Proj_Activity_ID  and A.MASteR_ID = B.MASteR_ID              
and A.ORdER_ID = B.ORdER_ID    



GO
/****** Object:  UserDefinedFunction [dbo].[ProjectPO_Pending_Items_All]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[ProjectPO_Pending_Items_All] () returns table return                   
Select Order_No,  Proj_tYpe, Proj_ACtivity_name, Proj_TypE_ID, Proj_Activity_Id, Order_ID, Item_ID, Item, Color_ID, Color, Size_ID, Size, BOM_Qty, Ordered_Qty, PO_Qty, Rate, Amount, PO_Qty1,          
Grs_Rate, Tax_Per, Freight_Rate,  Grs_Amount, Tax_Amount, Freight_Amount, Pur_Amount, PArty, Uom, UomID , Party_Code,    
Grs_Rate_FC, Freight_Rate_FC, Pur_Rate_FC, Grs_Amount_Fc, Tax_Amount_Fc, Freight_Amount_Fc, Pur_Amount_Fc, App_Sup_Ex_Rate,
ROW_NUMBER() Over (Partition by Proj_Type_Id , ORdeR_ID Order by Order_ID, Order_By_Slno, Proj_activity_ID, Proj_type_Id, Item_ID) RNo 
FRom Project_PO_Pending_Fn()   
Where PO_Qty >0

GO
/****** Object:  UserDefinedFunction [dbo].[Project_PO_Indent_Master_Details_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Project_PO_Indent_Master_Details_Fn]() Returns Table Return      
select A.Rowid, B.Rowid Detail_ID, A.PoNo, A.PoDate, A.Indent_NO, C.LEdger_Name Supplier, A.Supplier_COde, A.REquired_Date, A.Buyer_Code, A.Approval_Flag,
A.Ack_Date, A.Commit_Date, A.MailId, A.Grs_Amount Tot_Grs_Amount, A.Tax_Amount Tot_Tax_Amount, A.Freight_Amount Tot_Freight_Amount, A.Net_Amount Tot_Net_Amount,
B.Order_ID, B.Item_id, B.Color_id, B.Size_ID, B.Order_Qty, B.Rate Pur_Rate, B.Amount Pur_Amount , B.Cancel_Qty, B.Remarks, B.Grs_Rate, B.Tax_Per, 
B.Freight_Rate, B.Grs_Amount Grs_Amount_Dtl, B.Tax_Amount Tax_Amount_Dtl, B.Freight_Amount Freight_Amount_Dtl, A.Approval_Time, A.Approval_System, A.Remarks Remarks_Mas,
C.Address, C.LedgeR_Phone, C.Country_Code, B.UomID1, B.Conv_Val,  B.Proj_Activity_ID, B.Proj_Type_ID,   
B.Order_Qty_Conv, B.Rate_Conv, B.Cancel_Qty_Conv, B.Grs_Rate_Conv, B.Freight_Rate_Conv, B.FREI_TAX_MODE, B.PO_QTY_CONV, B.Tax_Rate, B.Tax_Rate_Conv, B.RO_Amt, D.UOM Uom1, A.Approval_Flag1 Approval_Flag_PO1, A.Indent_Date
from Project_PO_Indent_Master A Inner Join Project_Po_Indent_Details B On A.RowID = B.Master_ID       
Left Join Supplier_All_Fn() c On A.Supplier_Code = C.LedgeR_Code     
LEft Join UOM_MASTER D On B.UomID1 = D.UOMID


GO
/****** Object:  UserDefinedFunction [dbo].[Project_PO_Indent_Details_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Project_PO_Indent_Details_Fn]() Returns Table Return              
select A.Rowid, A.Detail_ID, A.PoNo, A.PoDate, A.Indent_NO, A.Supplier, A.Supplier_COde, A.REquired_Date,  A.Buyer_Code, A.Approval_Flag Approval_Flag_PO, A.Ack_Date,               
A.Commit_Date, A.MailId, A.Tot_Grs_Amount, A.Tot_Tax_Amount, A.Tot_Freight_Amount, A.Tot_Net_Amount, A.Order_ID, A.Item_id, A.Color_id, A.Size_ID, A.Order_Qty,               
A.Pur_Rate, A.Pur_Amount - A.RO_Amt Pur_Amount, A.Cancel_Qty, A.Remarks, A.Grs_Rate, A.Tax_Per, A.Freight_Rate, A.Grs_Amount_Dtl, A.Tax_Amount_Dtl, A.Freight_Amount_Dtl,               
A.Approval_Time Approval_Time_PO, A.Approval_System Approval_System_PO,               
B.Order_No, B.PArty, B.Party_Code, B.Item, B.Color,  B.Size, B.Rate, B.Tax_Per Tax_Per_Bud, B.Freight_Rate Freight_Rate_Bud, B.Grs_Rate Grs_Rate_Bud,               
B.Bom_Plan, B.Flag Approval_Flag_Bud, A.Remarks_Mas, A.Address, A.LedgeR_Phone, A.Country_Code, B.Uom, B.UOM_ID, A.UomID1, A.Conv_Val,
A.Order_Qty_Conv, A.Rate_Conv, A.Cancel_Qty_Conv, A.Grs_Rate_Conv, A.Freight_Rate_Conv, A.FREI_TAX_MODE, A.PO_QTY_CONV, A.Tax_Rate, A.Tax_Rate_Conv, A.RO_Amt, A.Uom1, B.Proj_ACtivity_NAme, A.Approval_Flag_PO1 , B.Proj_Type, A.Indent_Date  ,  
A.Proj_Activity_ID, A.Proj_Type_ID 
From Project_PO_Indent_Master_Details_Fn() A               
LEft Join [Project_View_Plan_Fn]() B On A.Order_ID = B.Order_ID and A.Proj_ACtivity_ID = B.Proj_Activity_ID and A.Proj_TypE_ID = B.Proj_Type_ID
and A.Item_ID = B.Item_ID and A.Color_ID = B.Color_ID and A.SIze_ID = B.Size_Id              

GO
/****** Object:  UserDefinedFunction [dbo].[Project_Po_Indent_Print_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Function [dbo].[Project_Po_Indent_Print_Fn](@Code Bigint) returns table return          
Select A.Rowid, PoNo, PoDate, Indent_NO, Indent_Date, Supplier, Supplier_COde, REquired_Date,  Approval_Flag_PO, Ack_Date, Commit_Date, MailId, Tot_Grs_Amount, Tot_Tax_Amount, Tot_Freight_Amount, Tot_Net_Amount, Approval_Time_PO, Approval_System_PO,
Remarks_Mas, Getdate() PrintOutDate,  Address, LedgeR_Phone, Uom1,  Country_Code,
Order_Qty, Pur_Rate, Cancel_Qty, Grs_Rate, Tax_Per, Freight_Rate, Grs_Amount_Dtl, Tax_Amount_Dtl, Freight_Amount_Dtl, Pur_Amount, Item, Color, Size, Rate, Description, Conv_Val from (
Select Distinct Rowid, PoNo, PoDate, Indent_NO, Indent_Date , Supplier, Supplier_COde, REquired_Date,  Approval_Flag_PO, Ack_Date, Commit_Date, MailId, Tot_Grs_Amount, Tot_Tax_Amount, Tot_Freight_Amount, Tot_Net_Amount, Approval_Time_PO, 
Approval_System_PO, Remarks_Mas, Getdate() PrintOutDate,  Address, LedgeR_Phone, Uom1, Country_Code  from Project_PO_Indent_Details_Fn() Where  RowID = @Code
)A Inner join (          
Select Rowid, Sum(ORder_Qty_Conv) Order_Qty, Rate_Conv Pur_Rate, Sum(Cancel_Qty_Conv) Cancel_Qty, Grs_Rate_Conv Grs_Rate, Tax_Per, Freight_Rate_Conv Freight_Rate, Sum(Grs_Amount_Dtl) Grs_Amount_Dtl, Sum(Tax_Amount_Dtl) Tax_Amount_Dtl, Sum(Freight_Amount_Dtl) Freight_Amount_Dtl,           
Sum(Pur_Amount) Pur_Amount, Avg(Ro_Amt) Ro_Amt, Item, Color, Size, Rate_Conv Rate, Item + ' - ' + Color + ' - ' + Size Description, Conv_Val  from Project_PO_Indent_Details_Fn() Where RowID = @Code           
Group by Rate_Conv, Grs_Rate_Conv, Tax_Per, Freight_Rate_Conv, Item, Color, Size, Rowid, Conv_Val          
)B On A.Rowid = B.Rowid        

GO
/****** Object:  UserDefinedFunction [dbo].[Project_PO_Indent_Pending_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  Function [dbo].[Project_PO_Indent_Pending_Fn]() Returns Table Return                  
Select Order_No, PArty, Party_Code, Order_ID, Item_ID, Item, Color_ID, Color, Size_ID, Size, BOM_Qty_Plan, Bom_Qty, Ordered_Qty, PO_pending,                  
PO_Qty, Rate, Amount, Cl_Qty, Cast(Getdate() as Date)  TA_Plan_Date, 1000 Enable_Days,                   
(Case When IsNull(Enable_Days,1000) >= 0 Then PO_Qty Else PO_Qty End) PO_Qty2,  PO_Qty PO_Qty1,                  
Grs_Rate, Tax_Per, Freight_Rate, Proj_Type, Proj_Activity_Name, Proj_Type_ID, Proj_ACtivity_ID,
(PO_Qty * GrS_Rate) Grs_Amount, cast(((PO_Qty * GrS_Rate) * Tax_Per)/100 as Numeric(22,2)) Tax_Amount, CAsT((PO_Qty * Freight_Rate) as Numeric(22,2)) Freight_Amount,                   
Cast(((PO_Qty * GrS_Rate) +  cast(((PO_Qty * GrS_Rate) * Tax_Per)/100 as Numeric(22,2)) + (PO_Qty * Freight_Rate)) as Numeric(22,2)) Pur_Amount, Uom, UomID,                 
Grs_Rate_FC, Freight_Rate_FC, Pur_Rate_FC ,              
(PO_Qty * GrS_Rate_FC) Grs_Amount_Fc, cast(((PO_Qty * GrS_Rate_Fc) * Tax_Per)/100 as Numeric(22,2)) Tax_Amount_Fc, CAsT((PO_Qty * Freight_Rate_Fc) as Numeric(22,2)) Freight_Amount_Fc,                     
Cast(((PO_Qty * GrS_Rate_Fc) +  cast(((PO_Qty * GrS_Rate_Fc) * Tax_Per)/100 as Numeric(22,2)) + (PO_Qty * Freight_Rate_Fc)) as Numeric(22,2)) Pur_Amount_Fc, App_Sup_Ex_Rate, Order_By_Slno 
From (                      
Select A.Order_No, A.PArty, A.Party_Code, A.Order_ID, A.Item_ID, A.Item, A.Color_ID, A.Color, A.Size_ID, A.Size, A.Bom_Plan BOM_Qty_Plan, (A.Bom_Plan) Bom_Qty,                  
Isnull(P.Tot_Ord_Qty,0)  Ordered_Qty, (A.Bom_Plan - Isnull(P.Tot_Ord_Qty,0)) PO_pending, (A.Bom_Plan - Isnull(P.Tot_Ord_Qty,0)) PO_Qty, A.Rate, CAst((A.Bom_Plan - Isnull(P.Tot_Ord_Qty,0)) * A.Rate as Numeric(22,2)) Amount,
IsNull(P.Cancel_Qty,0) Cl_Qty,                   
Getdate() TA_Plan_Date, 0 Enable_Days, A.GRs_Rate, A.Tax_Per, A.Freight_rate,                  
A.Proj_ACtivity_ID, A.Proj_Type_ID, A.Uom, A.UOM_ID UomID , A.Grs_Rate Grs_Rate_FC, A.Freight_Rate Freight_Rate_FC, A.Rate Pur_Rate_FC, 1 App_Sup_Ex_Rate, A.Proj_Type,  A.Proj_ACtivity_NAme, A.Order_By_Slno 
From Project_View_Plan_Fn() A                                          
Inner Join Project_ORdeR_MASter A1 On A.Order_ID = A1.Rowid and IsNull(Complete_Order, 'N') = 'N'         
Left Join (Select OrdeR_Id, Proj_Type_ID, Proj_Activity_ID , ITem_ID, Color_ID, SizE_ID, Sum(ORdER_Qty)ORdER_Qty, IsNull(Sum(Cancel_Qty),0) Cancel_Qty, Sum(ORdER_Qty - Cancel_Qty) Tot_Ord_Qty                   
From Project_Po_Indent_Details Group by Proj_Type_ID, Proj_Activity_ID ,OrdeR_Id, ITem_ID, Color_ID,                   
SizE_ID) P                   
On A.Order_ID = P.Order_ID and A.Item_ID = P.Item_id and A.Color_ID = P.Color_id and A.Size_ID = P.Size_ID and A.Proj_Activity_Id = P.Proj_Activity_Id and A.Proj_Type_ID = P.Proj_Type_ID
LEft Join Project_Po_Item_Close P1 On A.Proj_ACtivity_ID = P1.Proj_Activity_ID and A.Proj_Type_ID = P1.Proj_Type_ID and A.Order_ID = P1.Order_ID and A.Item_ID = P1.Item_id and A.Color_ID = P1.Color_id and A.Size_ID = P1.Size_ID and  P1.Mode = 'Material'  
Where P1.ORder_ID is Null      
)A  Where Bom_Qty >0  

GO
/****** Object:  UserDefinedFunction [dbo].[Project_PO_Indent_Pending_Fn_View]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Project_PO_Indent_Pending_Fn_View]() Returns Table Return                  
Select Order_No, PArty, Party_Code, Order_ID, Item_ID, Item, Color_ID, Color, Size_ID, Size, BOM_Qty_Plan, Bom_Qty, Ordered_Qty, PO_pending,                  
PO_Qty, Rate, Amount, Cl_Qty, Cast(Getdate() as Date)  TA_Plan_Date, 1000 Enable_Days,                   
(Case When IsNull(Enable_Days,1000) >= 0 Then PO_Qty Else PO_Qty End) PO_Qty2,  PO_Qty PO_Qty1,                  
Grs_Rate, Tax_Per, Freight_Rate, Proj_Type, Proj_Activity_Name, Proj_Type_ID, Proj_ACtivity_ID,
(PO_Qty * GrS_Rate) Grs_Amount, cast(((PO_Qty * GrS_Rate) * Tax_Per)/100 as Numeric(22,2)) Tax_Amount, CAsT((PO_Qty * Freight_Rate) as Numeric(22,2)) Freight_Amount,                   
Cast(((PO_Qty * GrS_Rate) +  cast(((PO_Qty * GrS_Rate) * Tax_Per)/100 as Numeric(22,2)) + (PO_Qty * Freight_Rate)) as Numeric(22,2)) Pur_Amount, Uom, UomID,                 
Grs_Rate_FC, Freight_Rate_FC, Pur_Rate_FC ,              
(PO_Qty * GrS_Rate_FC) Grs_Amount_Fc, cast(((PO_Qty * GrS_Rate_Fc) * Tax_Per)/100 as Numeric(22,2)) Tax_Amount_Fc, CAsT((PO_Qty * Freight_Rate_Fc) as Numeric(22,2)) Freight_Amount_Fc,                     
Cast(((PO_Qty * GrS_Rate_Fc) +  cast(((PO_Qty * GrS_Rate_Fc) * Tax_Per)/100 as Numeric(22,2)) + (PO_Qty * Freight_Rate_Fc)) as Numeric(22,2)) Pur_Amount_Fc, App_Sup_Ex_Rate 
From (                      
Select A.Order_No, A.PArty, A.Party_Code, A.Order_ID, A.Item_ID, A.Item, A.Color_ID, A.Color, A.Size_ID, A.Size, A.Bom_Plan BOM_Qty_Plan, (A.Bom_Plan) Bom_Qty,                  
Isnull(P.Tot_Ord_Qty,0)  Ordered_Qty, (A.Bom_Plan - Isnull(P.Tot_Ord_Qty,0)) PO_pending, (A.Bom_Plan - Isnull(P.Tot_Ord_Qty,0)) PO_Qty, A.Rate, CAst((A.Bom_Plan - Isnull(P.Tot_Ord_Qty,0)) * A.Rate as Numeric(22,2)) Amount,
IsNull(P.Cancel_Qty,0) Cl_Qty,                   
Getdate() TA_Plan_Date, 0 Enable_Days, A.GRs_Rate, A.Tax_Per, A.Freight_rate,                  
A.Proj_ACtivity_ID, A.Proj_Type_ID, A.Uom, A.UOM_ID UomID , A.Grs_Rate Grs_Rate_FC, A.Freight_Rate Freight_Rate_FC, A.Rate Pur_Rate_FC, 1 App_Sup_Ex_Rate, A.Proj_Type,  A.Proj_ACtivity_NAme 
From Project_View_Plan_Fn() A                                          
Inner Join Project_ORdeR_MASter A1 On A.Order_ID = A1.Rowid
Left Join (Select OrdeR_Id, Proj_Type_ID, Proj_Activity_ID , ITem_ID, Color_ID, SizE_ID, Sum(ORdER_Qty)ORdER_Qty, IsNull(Sum(Cancel_Qty),0) Cancel_Qty, Sum(ORdER_Qty - Cancel_Qty) Tot_Ord_Qty                   
From Project_Po_Indent_Details Group by Proj_Type_ID, Proj_Activity_ID ,OrdeR_Id, ITem_ID, Color_ID,                   
SizE_ID) P                   
On A.Order_ID = P.Order_ID and A.Item_ID = P.Item_id and A.Color_ID = P.Color_id and A.Size_ID = P.Size_ID and A.Proj_Activity_Id = P.Proj_Activity_Id and A.Proj_Type_ID = P.Proj_Type_ID
LEft Join Project_Po_Item_Close P1 On A.Proj_ACtivity_ID = P1.Proj_Activity_ID and A.Proj_Type_ID = P1.Proj_Type_ID and A.Order_ID = P1.Order_ID and A.Item_ID = P1.Item_id and A.Color_ID = P1.Color_id and A.Size_ID = P1.Size_ID and  P1.Mode = 'Material'  
Where P1.ORder_ID is Null      
)A  Where Bom_Qty >0  


GO
/****** Object:  UserDefinedFunction [dbo].[Project_PO_Indent_Qty_GRid_View_Order_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Project_PO_Indent_Qty_GRid_View_Order_Fn]() returns Table return          
SELECT B.MASteR_ID, B.ORdeR_ID, A.PArty, A.PArty_Code, A.ORdeR_NO, 0 SL, A.Proj_ACtivity_Name, A.Proj_Type , A.Proj_Activity_ID, A.Proj_Type_ID, A.ITEM, A.COLOR, A.SIZE, A.UOM, '' UOM1, B.CONV_VAL, A.Bom_Qty BOM_ORG, A.ORdered_Qty ORDERED_ORG,           
(A.PO_Pending + B.Order_Qty) BAL_ORG, (A.PO_Pending + B.Order_Qty) PO_QTY_ORG, B.APP_GRS_ORG, B.APP_TAX_ORG, B.APP_FREI_ORG, B.APP_PUR_RATE_ORG,           
(Case When B.CAlc_Type = '*' Then CAst(((B.Order_Qty) * B.CONV_VAL) as Numeric(22,3)) Else CAst(((B.Order_Qty) / B.CONV_VAL) as Numeric(22,3)) End) PO_QTY_ORG_CONV,       
B.APP_GRS_ORG_CONV, B.APP_FREI_ORG_CONV, B.APP_PUR_RATE_ORG_CONV,           
(Case When B.CAlc_Type = '*' Then Cast((A.Bom_Qty * B.Conv_Val) as Numeric(22,3)) Else Cast((A.Bom_Qty / B.Conv_Val) as Numeric(22,3)) End) BOM,       
(Case When B.CAlc_Type = '*' Then Cast((A.Ordered_Qty * B.Conv_Val) as Numeric(22,3)) Else Cast((A.Ordered_Qty / B.Conv_Val) as Numeric(22,3)) End) ORDERED,       
(CaSe When B.Calc_Type = '*' Then (Cast((A.Bom_Qty * B.Conv_Val) as Numeric(22,3)) - Cast((A.Ordered_Qty * B.Conv_Val) as Numeric(22,3))) + B.ORder_Qty_Conv Else      
(Cast((A.Bom_Qty / B.Conv_Val) as Numeric(22,3)) - Cast((A.Ordered_Qty / B.Conv_Val) as Numeric(22,3))) + B.ORder_Qty_Conv End) BAL,           
B.ORder_Qty_Conv PO_QTY, B.APP_GRS, B.APP_TAX, B.APP_FREI, B.APP_PUR_RATE, B.Grs_Rate_Conv GRS_RATE, B.Tax_Per TAX_PER, B.Tax_Rate_Conv TAX_RATE,           
B.Freight_Rate_Conv FREIGHT_RATE, B.FREI_TAX_MODE, B.Rate_Conv PUR_RATE, B.Grs_Amount GRS_AMT, B.Tax_Amount TAX_AMT, B.Freight_Amount FREI_AMT,           
0 RO_AMT, B.Amount PUR_AMT, B.ORder_Qty PO_QTY_CONV, B.GrS_Rate GRS_RATE_CONV, B.Tax_Rate TAX_RATE_CONV, B.Freight_Rate FREI_RATE_CONV, B.Rate PUR_RATE_CONV,           
CAst(A.PRoj_Type_ID as Varchar(20)) + '-' + Cast(A.Proj_Activity_ID as Varchar(20)) + '-' + Cast(A.ITEM_ID as Varchar(20)) + '-' + Cast(A.COLOR_ID as Varchar(20)) + '-' + Cast(A.SIZE_ID as Varchar(20)) DESCRIPTION ,            
A.UOMID, A.ITEM_ID, A.COLOR_ID, A.SIZE_ID, B.UOMID1, B.REMARKS From          
(Select A.ORdER_NO, A.Proj_activity_Name, A.Proj_Type, A.Proj_Activity_ID, A.Proj_Type_ID, A.ORdER_ID, A.PArty, A.PArty_code,A.ITEM, A.COLOR, A.SIZE, A.UOM, Sum(A.Bom_Qty) Bom_Qty, Sum(A.ORdered_Qty) ORdered_Qty, Sum(A.PO_Pending) PO_Pending , A.UOMID, A.

ITEM_ID, A.COLOR_ID, A.SIZE_ID          
From Project_PO_Indent_Pending_Fn_View() A          
Group by A.Proj_Activity_ID, A.Proj_Type_ID,  A.ITEM, A.COLOR, A.SIZE, A.UOM, A.UOMID, A.ITEM_ID, A.COLOR_ID, A.SIZE_ID, A.ORdER_ID, A.ORdER_NO, A.PArty, A.PArty_code, A.Proj_Activity_Name, A.Proj_Type          
) A          
Inner Join           
(Select B.MASteR_ID,    B.ORdER_ID, B.CONV_VAL, Sum(B.Order_Qty) Order_Qty, B.APP_GRS_ORG, B.APP_TAX_ORG, B.APP_FREI_ORG, B.APP_PUR_RATE_ORG, B.APP_GRS_ORG_CONV,           
B.APP_FREI_ORG_CONV, B.APP_PUR_RATE_ORG_CONV, Sum(B.ORder_Qty_Conv) ORder_Qty_Conv , B.APP_GRS, B.APP_TAX, B.APP_FREI, B.APP_PUR_RATE, B.Grs_Rate_Conv ,           
B.Tax_Per , B.Tax_Rate_Conv , B.Freight_Rate_Conv , B.FREI_TAX_MODE, B.Rate_Conv, Sum(B.Grs_Amount) Grs_Amount, Sum(B.Tax_Amount) Tax_Amount, Sum(B.Freight_Amount) Freight_Amount,           
Sum(B.Amount) Amount  , B.GrS_Rate, B.Tax_Rate, B.Freight_Rate, B.Rate, B.Proj_Activity_ID, B.Proj_Type_ID , B.ITEM_ID, B.COLOR_ID, B.SIZE_ID, B.Remarks, B.UOmID1, B.Calc_Type From Project_PO_Indent_Details B          
Group by B.MASteR_ID, B.ORdeR_ID, B.CONV_VAL, B.APP_GRS_ORG, B.APP_TAX_ORG, B.APP_FREI_ORG, B.APP_PUR_RATE_ORG, B.APP_GRS_ORG_CONV,           
B.APP_FREI_ORG_CONV, B.APP_PUR_RATE_ORG_CONV, B.APP_GRS, B.APP_TAX, B.APP_FREI, B.APP_PUR_RATE, B.Grs_Rate_Conv ,           
B.Tax_Per , B.Tax_Rate_Conv , B.Freight_Rate_Conv , B.FREI_TAX_MODE, B.Rate_Conv,            
B.GrS_Rate, B.Tax_Rate, B.Freight_Rate, B.Rate, B.Proj_Activity_ID, B.Proj_Type_ID, B.ITEM_ID, B.COLOR_ID, B.SIZE_ID, B.Remarks, B.UOmID1, B.Calc_Type) B    
On A.ITem_ID = B.ITem_ID and A.Color_Id = B.Color_ID and A.SizE_Id= B.Size_ID           
and A.Proj_Type_ID = B.Proj_Type_ID and A.Proj_Activity_Id = B.Proj_Activity_ID and A.ORdER_Id = B.ORdeR_Id          


GO
/****** Object:  UserDefinedFunction [dbo].[Project_PO_Indent_Qty_GRid_View_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Project_PO_Indent_Qty_GRid_View_Fn]() returns Table return                          
SELECT B.MASteR_ID, 0 SL,A.Proj_ACtivity_id, A.Proj_Type_ID, A.PRoj_Activity_Name, A.Proj_Type, A.ITEM, A.COLOR, A.SIZE, A.UOM, B.UOM1, B.CONV_VAL, A.BOM_ORG, A.ORDERED_ORG,                           
A.BAL_ORG, B.Order_Qty PO_QTY_ORG, B.APP_GRS_ORG, B.APP_TAX_ORG, B.APP_FREI_ORG, B.APP_PUR_RATE_ORG, A.PO_QTY_ORG_CONV,          
B.APP_GRS_ORG_CONV, B.APP_FREI_ORG_CONV, B.APP_PUR_RATE_ORG_CONV, A.BOM BOM,  A.ORDERED ORDERED, A.BAL BAL, B.ORder_Qty_Conv PO_QTY, B.APP_GRS, B.APP_TAX, B.APP_FREI, B.APP_PUR_RATE, B.Grs_Rate_Conv GRS_RATE, B.Tax_Per TAX_PER, B.Tax_Rate_Conv TAX_RATE,  

B.Freight_Rate_Conv FREIGHT_RATE, B.FREI_TAX_MODE, B.RO_RATE, B.Rate_Conv PUR_RATE, B.Grs_Amount GRS_AMT, B.Tax_Amount TAX_AMT, B.Freight_Amount FREI_AMT,                           
B.RO_AMT RO_AMT, B.Amount PUR_AMT, B.ORder_Qty PO_QTY_CONV, B.GrS_Rate GRS_RATE_CONV, B.Tax_Rate TAX_RATE_CONV, B.Freight_Rate FREI_RATE_CONV, B.Rate PUR_RATE_CONV,                           
A.OrdeR_NO + '-' + CAst(A.Proj_Type_ID as Varchar(20)) + '-' + Cast(A.Proj_ACtivity_id as Varchar(20)) + '-' + Cast(A.ITEM_ID as Varchar(20)) + '-' + Cast(A.COLOR_ID as Varchar(20)) + '-' + Cast(A.SIZE_ID as Varchar(20)) DESCRIPTION ,                     

A.UOMID, A.ITEM_ID, A.COLOR_ID, A.SIZE_ID, B.UOMID1, B.REMARKS, B.Grs_Amt_Inr, B.Tax_Amt_Inr,B.Frei_Amt_Inr, B.Pur_Amt_Inr, B.App_Sup_Ex_Rate,B.Calc_Type, A.OrdeR_NO, A.ORdeR_ID   From                          
(Select  A.MAstER_ID, A.Proj_ACtivity_id, A.Proj_Type_ID, A.PRoj_Activity_Name, A.Proj_Type, A.ITEM, A.COLOR, A.SIZE, A.UOM, Sum(PO_QTY_ORG_CONV) PO_QTY_ORG_CONV, Sum(BOM_ORG) BOM_ORG, Sum(ORDERED_ORG) ORDERED_ORG, Sum(BAL_ORG) BAL_ORG, Sum(BOM) BOM, Sum(


ORDERED)ORDERED, Sum(BAL) BAL, Sum(A.BOM) Bom_Qty, 
Sum(A.ORDERED) ORdered_Qty, Sum(A.BAL) PO_Pending , A.UOMID, A.ITEM_ID, A.COLOR_ID, A.SIZE_ID, A.ORdeR_NO , A.ORdeR_ID    
From Project_PO_Indent_Qty_GRid_View_Order_Fn() A                          
Group by  A.MAstER_ID, A.Proj_ACtivity_id, A.Proj_Type_ID, A.PRoj_Activity_Name, A.Proj_Type , A.ITEM, A.COLOR, A.SIZE, A.UOM, A.UOMID, A.ITEM_ID, A.COLOR_ID, A.SIZE_ID, A.ORdeR_NO, A.ORdeR_ID    
) A                          
Inner Join                           
(Select B.MASteR_ID, B.CONV_VAL, Sum(B.Order_Qty) Order_Qty, B.APP_GRS_ORG, B.APP_TAX_ORG, B.APP_FREI_ORG, B.APP_PUR_RATE_ORG, B.APP_GRS_ORG_CONV,                           
B.APP_FREI_ORG_CONV, B.APP_PUR_RATE_ORG_CONV, Sum(B.ORder_Qty_Conv) ORder_Qty_Conv , B.APP_GRS, B.APP_TAX, B.APP_FREI, B.APP_PUR_RATE, B.Grs_Rate_Conv ,                           
B.Tax_Per , B.Tax_Rate_Conv , B.Freight_Rate_Conv , B.FREI_TAX_MODE, B.RO_RATE, B.Rate_Conv, Sum(B.Grs_Amount) Grs_Amount, Sum(B.Tax_Amount) Tax_Amount, Sum(B.Freight_Amount) Freight_Amount, Avg(B.Ro_Amt) Ro_Amt,                          
Sum(B.Amount) Amount  , B.GrS_Rate, B.Tax_Rate, B.Freight_Rate, B.Rate,  B.ITEM_ID, B.COLOR_ID, B.SIZE_ID, B.Remarks, B.UOmID1, U.Uom UOM1,                   
Sum(B.Grs_Amt_Inr) Grs_Amt_Inr, Sum(B.Tax_Amt_Inr) Tax_Amt_Inr, Sum(B.Frei_Amt_Inr) Frei_Amt_Inr, Sum(B.Pur_Amt_Inr) Pur_Amt_Inr, Min(App_Sup_Ex_Rate) App_Sup_Ex_Rate , B.Calc_Type, B.ORdER_ID,  B.Proj_Activity_ID, B.Proj_Type_ID From Project_PO_Indent_Details B

LEft Join UOM_MASTER U On B.UomID1 = U.UOMID 
Group by B.Proj_Activity_ID, B.Proj_Type_ID,  B.MASteR_ID, B.CONV_VAL, B.APP_GRS_ORG, B.APP_TAX_ORG, B.APP_FREI_ORG, B.APP_PUR_RATE_ORG, B.APP_GRS_ORG_CONV,                           
B.APP_FREI_ORG_CONV, B.APP_PUR_RATE_ORG_CONV, B.APP_GRS, B.APP_TAX, B.APP_FREI, B.APP_PUR_RATE, B.Grs_Rate_Conv , B.RO_RATE,                          
B.Tax_Per , B.Tax_Rate_Conv , B.Freight_Rate_Conv , B.FREI_TAX_MODE, B.Rate_Conv,                            
B.GrS_Rate, B.Tax_Rate, B.Freight_Rate, B.Rate,   B.ITEM_ID, B.COLOR_ID, B.SIZE_ID, B.Remarks, B.UOmID1, U.Uom, B.Calc_Type, B.ORdER_ID) B 
On A.ITem_ID = B.ITem_ID and A.Color_Id = B.Color_ID and A.SizE_Id= B.Size_ID                           
and A.Proj_Type_ID = B.Proj_Type_ID and A.Proj_Activity_ID = B.Proj_Activity_ID  and A.MASteR_ID = B.MASteR_ID              
and A.ORdER_ID = B.ORdER_ID    
GO
/****** Object:  UserDefinedFunction [dbo].[ProjectPO_Indent_Pending_Items_All]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[ProjectPO_Indent_Pending_Items_All] () returns table return                   
Select Order_No,  Proj_tYpe, Proj_ACtivity_name, Proj_TypE_ID, Proj_Activity_Id, Order_ID, Item_ID, Item, Color_ID, Color, Size_ID, Size, BOM_Qty, Ordered_Qty, PO_Qty, Rate, Amount, PO_Qty1,          
Grs_Rate, Tax_Per, Freight_Rate,  Grs_Amount, Tax_Amount, Freight_Amount, Pur_Amount, PArty, Uom, UomID , Party_Code,    
Grs_Rate_FC, Freight_Rate_FC, Pur_Rate_FC, Grs_Amount_Fc, Tax_Amount_Fc, Freight_Amount_Fc, Pur_Amount_Fc, App_Sup_Ex_Rate,
ROW_NUMBER() Over (Partition by Proj_Type_Id , ORdeR_ID Order by Order_ID, Order_By_Slno, Proj_activity_ID, Proj_type_Id, Item_ID) RNo 
FRom Project_PO_Indent_Pending_Fn()   
Where PO_Qty >0



GO
/****** Object:  UserDefinedFunction [dbo].[Project_Tax_Cal_Debit]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Project_Tax_Cal_Debit]()returns table return        
Select Master_Id, Isnull(Grn_Amount,0)Grn_Amount, Isnull(BIll_Amount,0)BIll_Amount, Isnull(Rate_Debit,0)Rate_Debit, Isnull(Qty_Debit,0)Qty_Debit,        
Isnull(Approved_Debit,0)Approved_Debit, Isnull(Tax,0)Tax,         
((Isnull(Tax,0)/Isnull(BIll_Amount,0))*Isnull(Approved_Debit,0)) Tax_Cal,         
Cast((Isnull(Approved_Debit,0)+((Isnull(Tax,0)/Isnull(BIll_Amount,0))*Isnull(Approved_Debit,0)))as Numeric(25,2))Tax_Dif,      
Mode      
From(        
Select A.Master_Id, Sum(PO_Amount)Grn_Amount, Sum(Bill_Amount)Bill_Amount, Rate_Debit, Qty_Debit,         
Case When (Isnull(B.Approved_Debit,0)>0 Or B.Approval='Y') Then Isnull(B.Approved_Debit,0)        
Else (Rate_Debit+Qty_Debit) End Approved_Debit, Isnull(Tax,0)Tax, 'Project Purchase' Mode      
from Project_GRN_Invoicing_Details A        
Left Join Project_GRN_Invoicing_Master B on A.Master_ID = B.Rowid        
Left Join (
Select Master_Id, Sum(Isnull(Tax_Amount,0))Tax 
From Project_GRN_Invoicing_Details_Tax Where Mode='Y' 
Group By Master_Id
) C on A.Master_ID = C.Master_ID         
Group By A.Master_ID, Rate_Debit, Qty_Debit, Isnull(B.Approved_Debit,0), B.Approval, Isnull(Tax,0)        
)A   

GO
/****** Object:  UserDefinedFunction [dbo].[Project_Invoicing_New_Debit_Details]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Project_Invoicing_New_Debit_Details] () returns table return         
Select S1.RowID, 'Debit' Type, S1.Supplier_Code, S1.Entry_No Inv_Entry_No, S1.Entry_Date Inv_Entry_Date,          
S3.GRNNo Entry_NO, 
S3.GRNDate Entry_Date, Isnull(Tax_Dif,0) Rate_Debit,        
Isnull(Tax_Dif,0)Tax        
From Project_GRN_Invoicing_Master S1         
inner join Project_GRN_Invoicing_Details_OCN S2 on S1.RowID = S2.Master_ID        
left join Project_GRN_Master S3 on S2.GRN_MasterID = S3.RowID        
Left Join Project_Tax_Cal_Debit() T1 on S1.RowID = T1.Master_Id  And T1.Mode = 'Project Purchase'      
Where S1.Approved_Debit > 0 

GO
/****** Object:  UserDefinedFunction [dbo].[Itemwise_Grn_Inv_Details_For_Accounts]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Itemwise_Grn_Inv_Details_For_Accounts]()Returns table return            
Select A.Rowid Grn_Masid,  Grn_Detid, PONo, PoDate, B.Supplier_Code, Ledger_Name, B.Entry_No, B.Invoice_No, B.Invoice_Date,             
GrnNo, GrnDate, A.Item_Id, A.Color_Id, A.Size_Id, Qty, A.Model_Code, A.ITem_Code, 
G.Item, H.Color, I.Size, Rate,  PO_Detail_ID, A.Grs_Rate, A.Tax_Per, A.Uom           
From          
(            
 Select 'MATERIAL' Mode, A.Rowid, B.Rowid Grn_Detid, A.GRNNo, A.GRNDate, F.PONo, F.PoDate, 0 Model_Code, 0 Item_Code, 
 B.Item_ID, B.Color_ID, B.Size_ID,           
 B.Pur_Rate Rate, Sum(B.GRN_Qty)Qty, C.PO_Detail_ID, E.Grs_Rate, E.Tax_Per, '' Uom 
 from Project_GRN_Master A            
 Left Join Project_GRN_Details B on A.Rowid = B.Master_ID            
 Left Join Project_GRN_OCN_DEtails C on A.Rowid = C.Master_ID And B.Master_ID = C.Master_ID --And B.Rowid = C.Detail_ID            
 --Left Join Project_GRN_OCN_Lot_Details D on A.RowID = D.Master_ID And C.RowID = D.OCN_RowID            
 Left Join Project_Po_Details E on C.PO_Detail_ID = E.Rowid            
 Left Join Project_PO_Master F on F.Rowid = E.Master_ID    
 Left Join UOM_MASTER U On 0 = 1
 Group By A.Rowid,A.GRNNo, B.Rowid, A.GRNDate, F.PONo, F.PoDate, B.Item_ID, B.Color_ID, B.Size_ID, B.Pur_Rate, E.Grs_Rate, E.Tax_Per, C.PO_Detail_ID
)A            
Inner Join           
(           
 Select Distinct A.Supplier_Code, Mode, A.Entry_No, A.Entry_Date, A.Invoice_No, A.Invoice_Date, C.GRN_MasterID            
 from Project_GRN_Invoicing_Master A            
 Left Join Project_GRN_Invoicing_Details B on A.Rowid = B.master_Id            
 Left Join Project_GRN_Invoicing_Details_OCN C on A.Rowid = C.master_Id And B.Master_ID = C.Master_ID          
)B on A.Mode = B.Mode And A.Rowid = B.GRN_MasterID           
Left Join Supplier_All_Fn()F on B.Supplier_Code = F.LEdgeR_code   
Left Join Item G on A.Item_ID = G.Itemid 
Left Join Color H on A.Color_ID = H.ColorID 
Left Join Size I on A.Size_ID = I.Sizeid 

GO
/****** Object:  UserDefinedFunction [dbo].[Mandays_Cost_Plan_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Mandays_Cost_Plan_Fn]()Returns table Return
Select Proj_Type Project, Order_No, Item Description, Sum(Pur_Amount) Value, Proj_Type_ID Project_Id, Item_ID ManDays_Id 
From Project_Planning_Material_Fn()A 
Where Testing = 'T' And Flag='T' Group By Proj_Type, Order_No, Proj_Type_ID, Item , Item_ID

GO
/****** Object:  UserDefinedFunction [dbo].[ManDays_Fn_For_Ac]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[ManDays_Fn_For_Ac]()Returns table return
Select S1.Rowid, S1.Eno, S1.Edate, Order_No, S5.Ledger_Name, S1.Supplier_id Ledger_Code, S3.Name, S4.Item, Project_Id, S2.Itemid, Sum(Amount)Amount from ManDays_Entry_Master S1 
Left Join Mandays_Entry_Details S2 on S1.Rowid = S2.Master_Id 
Left Join Project_Name_Master S3 on S2.Project_Id = S3.Rowid 
left Join Item S4 on S2.Itemid = S4.ItemID 
Left Join Supplier_all_Fn()S5 on S1.Supplier_ID = S5.LedgeR_Code 
Where Isnull(S1.Approved,'N')='Y'
Group By S1.Rowid, S1.Eno, S1.Edate, Order_No, S3.Name, S4.Item, Project_Id, S2.Itemid, S5.Ledger_Name, S1.Supplier_id
GO
/****** Object:  UserDefinedFunction [dbo].[Project_Grn_DEtails_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Project_Grn_DEtails_Fn]()Returns table return       
Select B.GRNNo, B.GRNDate, D.LedgeR_NAme Supplier, B.INvoice_No, b.GP_NO, B.GP_Date, B.DC_No , B.DC_Date , 
B.Invoice_Date ,  C.Proj_ACtivity_Name, C.Proj_Name,
E.Item, F.Color, G.Size ,B1.Grn_Qty Grn_Qty, B1.Pur_Rate Pur_Rate, B1.Item_ID, B1.Color_ID, B1.Size_ID, B.Supplier_Code, 
B.RowID , b.Net_Amount, B.Gross_Amount, B.Tax_Amount, d.Country_Code, b.Remarks, A1.Order_ID, A1.Proj_Activity_ID, A1.Proj_Type_ID, A1.PO_Detail_ID, 
B.Rowid Grn_ID, B1.RowID Grn_Detail_ID, A1.RowID Grn_Ocn_Detail_Id , B1.Grs_Rate, B1.Tax_Per, B1.Grs_Amount Grs_Amount_Dtl, B1.Tax_Amount Tax_Amount_Dtl, B1.Pur_Amount Pur_Amount_Dtl, B1.Slno, A1.SlNo_Dtl 
From  Project_Grn_MAster B 
InneR Join Project_GRN_Details B1 On B.RowID = B1.Master_ID
Inner Join Project_GRN_OCN_DEtails A1 On B.Rowid = A1.Master_ID and B1.MAster_ID = A1.Master_ID and B1.slno = A1.Slno_Dtl
Inner Join (sElect Distinct Proj_ACtivity_Name, Proj_Name, Proj_Activity_ID, Proj_Type_ID, Rowid  from Project_Order_Fn()) C On A1.Order_ID = C.Rowid
and A1.Proj_Activity_ID = C.Proj_Activity_ID and A1.Proj_Type_ID = C.Proj_Type_ID 
LEft Join Supplier_All_Fn() D On B.Supplier_Code = D.LedgeR_Code       
LEft Join Item E On B1.Item_ID = E.ItemID 
LEft Join color F On B1.Color_ID = F.ColorID
LEft Join Size G On B1.Size_ID = G.SizeID

GO
/****** Object:  UserDefinedFunction [dbo].[Project_GRN_Pending]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Project_GRN_Pending]() returns table return                               
Select S2.Supplier_Code, S1.Item_id, F1.item,  S1.Color_id, F1.Color, S1.Size_ID, F1.size,                               
Sum(Order_Qty_Conv) PO_Qty,                               
Isnull(Sum(S5.Grn_Qty), 0) Inward_Qty,  ((Sum(Order_Qty_Conv) - Isnull(Sum(S5.GRN_Qty), 0)) - IsNull(Sum(Cancel_Qty_Conv),0)) + Isnull(Sum(S5.Return_Qty), 0) Bal_Qty,                      
Isnull(Sum(S5.Return_Qty), 0) Return_Qty, '' ITem_Type, (((Sum(Order_Qty_Conv) - Isnull(Sum(S5.GRN_Qty), 0)) - IsNull(Sum(Cancel_Qty_Conv),0)) + Isnull(Sum(S5.Return_Qty), 0) * S1.Grs_Rate_Conv) GRs_Amt,
(((Sum(Order_Qty_Conv) - Isnull(Sum(S5.GRN_Qty), 0)) - IsNull(Sum(Cancel_Qty_Conv),0)) + Isnull(Sum(S5.Return_Qty), 0) * S1.Grs_Rate_Conv)  + (((((Sum(Order_Qty_Conv) - Isnull(Sum(S5.GRN_Qty), 0)) - IsNull(Sum(Cancel_Qty_Conv),0)) + Isnull(Sum(S5.Return_Qty), 0) * S1.Grs_Rate_Conv) * Avg(S1.Tax_Per))/100) Tax_Amt,
(((Sum(Order_Qty_Conv) - Isnull(Sum(S5.GRN_Qty), 0)) - IsNull(Sum(Cancel_Qty_Conv),0)) + Isnull(Sum(S5.Return_Qty), 0) * S1.Rate_Conv) Pur_Amt,                   
S1.Grs_Rate_Conv Grs_Rate, S1.Rate_Conv Pur_RAte, CASt(Avg(S1.TAx_Per) as Numeric(10,2)) TAx_Per From Project_PO_Details S1                               
Inner join Project_PO_Master s2 on S1.Master_ID = s2.RowID  and S2.Approval_Flag = 'T'              
left JOin Project_View_Plan_Fn() F1 On S1.Proj_Activity_ID = F1.Proj_Activity_ID  and S1.Proj_Type_ID = F1.Proj_Type_ID
and S1.ITem_ID = F1.ITem_ID and S1.Color_Id = F1.Color_ID and S1.Size_ID = F1.Size_ID and S1.ORdER_Id = F1.ORdeR_ID
Left join (Select S2.Order_ID, S1.Item_ID, S2.PO_Detail_ID, S1.Color_ID, S1.Size_ID, S1.Pur_Rate, Sum(S2.Qty) GRN_Qty, Sum(S2.Return_Qty) Return_Qty  From Project_GRN_DEtails S1
Inner join Project_GRN_OCN_DEtails S2 ON S1.Master_ID = S2.Master_ID and S1.Slno = S2.SlNo_Dtl Group by S1.Item_ID, S2.PO_Detail_ID, S1.Color_ID, S1.Size_ID, S1.Pur_Rate, S2.Order_ID) S5 on S1.Item_id 
= S5.Item_ID and S1.Color_id = S5.Color_ID and                               
S1.Size_ID = S5.Size_ID  and S1.RowID = S5.PO_Detail_ID  and S1.Rate_Conv = S5.Pur_RAte and S1.RowID = S5.PO_Detail_ID 
Where F1.Item Is Not null
Group by S1.Item_id, S2.Supplier_Code, F1.item,  S1.Color_id, F1.Color, S1.Size_ID, F1.size, S1.Grs_Rate_Conv, S1.Rate_Conv 

GO
/****** Object:  UserDefinedFunction [dbo].[Project_Stock_Fn_All]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create  Function [dbo].[Project_Stock_Fn_All]() returns table return          
sElect C.GrnNO, B.OrdeR_NO, B.Proj_ACtivity_NAme, B.Proj_Type, B.Proj_ACtivity_ID, B.Proj_Type_ID, A.Grn_ID, A.ORdER_ID, 
A.ITem_ID, A.Color_Id, A.SizE_ID, A.Stock_Qty, A.Grn_Detail_ID, A.Grn_OCn_DEtail_ID From Project_Material_Status A          
LEft Join  (Select distinct Proj_ACtivity_NAme, Proj_Type, Proj_ACtivity_ID, Proj_Type_ID, OrdeR_NO, OrdER_ID From Project_View_Plan_Fn()) B On A.ORdER_ID = B.ORdER_ID  
LEft Join Project_GRn_Ocn_DEtails C1 On A.Grn_Ocn_DEtail_ID = C1.Rowid  
LEft Join Project_GRn_Master C On C1.MAsteR_ID = C.Rowid 

GO
/****** Object:  UserDefinedFunction [dbo].[Project_Grn_Item_DEtails_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Function [dbo].[Project_Grn_Item_DEtails_Fn]()Returns table return       
Select B.GRNNo, B.GRNDate, D.LedgeR_NAme Supplier, B.INvoice_No, b.GP_NO, B.GP_Date, B.DC_No , B.DC_Date , 
B.Invoice_Date , E.Item, F.Color, G.Size ,  (B1.Grn_Qty) Grn_Qty, B1.Pur_Rate Pur_Rate, B1.Item_ID, B1.Color_ID, B1.Size_ID, B.Supplier_Code, 
B.RowID , b.Net_Amount, B.Gross_Amount, B.Tax_Amount, d.Country_Code, b.Remarks, 
B.Rowid Grn_ID, B1.RowID Grn_Detail_ID, B1.Grs_Rate, B1.Tax_Per, B1.Grs_Amount Grs_Amount_Dtl, B1.Tax_Amount Tax_Amount_Dtl, B1.Pur_Amount Pur_Amount_Dtl, B1.Slno
From  Project_Grn_MAster B 
InneR Join Project_GRN_Details B1 On B.RowID = B1.Master_ID
LEft Join Supplier_All_Fn() D On B.Supplier_Code = D.LedgeR_Code       
LEft Join Item E On B1.Item_ID = E.ItemID 
LEft Join color F On B1.Color_ID = F.ColorID
LEft Join Size G On B1.Size_ID = G.SizeID

GO
/****** Object:  UserDefinedFunction [dbo].[Project_Floor_Gate_Pass_Details_Pending]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  Function [dbo].[Project_Floor_Gate_Pass_Details_Pending] () returns table return           
Select S1.Party, S1.GPNo, S1.GPDate, S1.InvNo, S1.InvDate, S1.DCNo, S1.DCDate, S1.Qty
From Fiterp1314.Dbo.GArments_Floor_Gate_Pass_Details () S1
Left join Project_Grn_Master S2 on S1.GPNo = S2.GP_No and S1.GPDATE = S2.GP_Date and S2.Supplier_Code Not in (900003, 900001, 900004, 900002)          
Where S2.RowID is Null 
and S1.GPDate >= '01-jan-2019'      



GO
/****** Object:  UserDefinedFunction [dbo].[Project_Mandays_DEtails_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Function [dbo].[Project_Mandays_DEtails_Fn]() returns table return
Select Eno , EDate, ROW_NUMBER() Over(Order By S2.Rowid) SlNo, S3.Name Project, S2.Order_No,  S4.Item Description, S2.Amount Value, S2.Amount Plan_Value, Approved, Remarks ,S2.Project_Id, S2.Itemid ManDays_Id From Mandays_Entry_Master S1 left Join Mandays_Entry_Details S2 on S1.Rowid = S2.Master_Id left Join Project_Name_Master S3 on S2.Project_Id = S3.Rowid left Join Item S4 on S2.Itemid = S4.Itemid 

GO
/****** Object:  UserDefinedFunction [dbo].[Project_Uom_Settings_Fn]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Function [dbo].[Project_Uom_Settings_Fn](@ID bigint) Returns Table Return
Select B1.UOM, A.Conv, A.CAlc_Type, A.Uid2 UomID from Project_Uom_Settings A LEft Join UOM_MASTER B1 On A.Uid2 = B1.UOMID Where A.UID1 = @ID
Union
Select Uom, 1 conv, '/' Calc_Type, UomId  From UOM_MASTER Where UomID = @ID

GO
/****** Object:  UserDefinedFunction [dbo].[Projects_Login]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Projects_Login] () returns table return     
Select User_Code, User_Name, User1_address14 Pass, 'True' Asci, Isnull(Emplno, 0) Emplno 
From Projects_User_Master Where USER_STATUS = 'False' 
Union All    
Select User_Code, Tno, Password, Asci, Emplno From Vaahini_erp_gainup.dbo.EMployeemas_Login()
Union All
Select Emplno User_Code, Tno, Replace(Convert(Varchar (20), Datebirth, 4), '.', '') Password, 'False' Asci, 
Emplno from Vaahini_erp_gainup.dbo.Employeemas Where Emplno = 12885 and catcode in (4,5,6,7)

GO
/****** Object:  UserDefinedFunction [dbo].[Table_Size]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Table_Size] () returns table return  
SELECT Object_ID (T.Name) TableID, t.NAME AS TableName, p.rows AS RowCounts, SUM(a.total_pages) * 8 AS TotalSpaceKB,   
SUM(a.used_pages) * 8 AS UsedSpaceKB, (SUM(a.total_pages) - SUM(a.used_pages)) * 8 AS UnusedSpaceKB  
FROM sys.tables t   
INNER JOIN sys.indexes i ON t.OBJECT_ID = i.object_id  
INNER JOIN sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id  
INNER JOIN sys.allocation_units a ON p.partition_id = a.container_id  
WHERE t.NAME NOT LIKE 'dt%' AND t.is_ms_shipped = 0 AND i.OBJECT_ID > 255   
GROUP BY t.Name, p.Rows  
GO
/****** Object:  UserDefinedFunction [dbo].[Testing_suppliers_Code]    Script Date: 31/07/2021 9:23:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[Testing_suppliers_Code]() returns Table return
SElect 11578 Code Union
Select  5722 Code union 
Select 11728

GO
