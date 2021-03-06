USE [PROJECTS]
GO
/****** Object:  Table [dbo].[Budget_Approval_Status]    Script Date: 31/07/2021 9:18:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Budget_Approval_Status](
	[RowID] [bigint] IDENTITY(1,1) NOT NULL,
	[Order_No] [varchar](15) NULL,
	[ProcessID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[ColorID] [int] NOT NULL,
	[SizeID] [int] NOT NULL,
	[Status] [varchar](1) NOT NULL,
	[Rate] [numeric](22, 4) NULL DEFAULT ((0)),
	[Approval_Time] [datetime] NULL DEFAULT (getdate()),
	[Approval_System] [varchar](50) NULL DEFAULT (host_name())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[buyer]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[buyer](
	[buyerid] [int] IDENTITY(1,1) NOT NULL,
	[buyer] [varchar](40) NOT NULL,
	[buyer_lookup] [varchar](10) NOT NULL,
	[PackListFile] [varchar](500) NULL,
	[Remarks] [varchar](5000) NULL,
	[Sourceid] [int] NULL,
	[ShippingMarks] [varchar](1000) NULL,
	[BuyerName] [varchar](40) NOT NULL,
	[InvoiceFile] [varchar](500) NOT NULL,
	[PayDays] [int] NOT NULL,
	[LogoName] [varchar](30) NOT NULL,
	[Allowance_per] [numeric](5, 2) NOT NULL,
	[Agency_per] [numeric](5, 2) NOT NULL,
	[Supplier_per] [numeric](5, 2) NOT NULL,
	[ENTRYREASON] [int] NULL,
	[LOSSREASON] [int] NULL,
	[STARTPERIOD] [datetime] NULL,
	[ENDPERIOD] [datetime] NULL,
	[IsActive] [varchar](1) NOT NULL,
	[Acc_Ledger_Code] [bigint] NULL,
 CONSTRAINT [pk_buyer] PRIMARY KEY CLUSTERED 
(
	[buyerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__buyer__5812160E] UNIQUE NONCLUSTERED 
(
	[buyer_lookup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__buyer__59063A47] UNIQUE NONCLUSTERED 
(
	[buyer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Uq_BuyerName] UNIQUE NONCLUSTERED 
(
	[BuyerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Color]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Color](
	[ColorID] [bigint] IDENTITY(1,1) NOT NULL,
	[Color] [varchar](50) NOT NULL,
	[Loss_Perc] [numeric](5, 2) NULL DEFAULT ((0)),
UNIQUE NONCLUSTERED 
(
	[Color] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[COMMERCIALMAS]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COMMERCIALMAS](
	[CommercialID] [bigint] IDENTITY(1,1) NOT NULL,
	[Commercial] [varchar](50) NOT NULL,
UNIQUE NONCLUSTERED 
(
	[Commercial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Complaint_SMS]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Complaint_SMS](
	[Rowid] [int] IDENTITY(1,1) NOT NULL,
	[FEmplno] [int] NULL,
	[TEmplno] [int] NULL,
	[Mobile] [varchar](25) NULL,
	[Sms_Status] [varchar](20) NULL,
	[Massages] [varchar](255) NULL,
	[Smsdate] [datetime] NULL,
	[System] [varchar](23) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Grid_Cost_Report]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grid_Cost_Report](
	[Name] [varchar](50) NULL,
	[RowID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item](
	[ItemID] [bigint] IDENTITY(1,1) NOT NULL,
	[Item] [varchar](50) NOT NULL,
	[Calc] [char](1) NULL DEFAULT ('A'),
	[Testing] [varchar](2) NULL DEFAULT ('F'),
UNIQUE NONCLUSTERED 
(
	[Item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mandays_Entry_Details]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mandays_Entry_Details](
	[Rowid] [bigint] IDENTITY(1,1) NOT NULL,
	[Master_Id] [bigint] NULL,
	[Project_Id] [bigint] NULL,
	[Itemid] [bigint] NULL,
	[Amount] [numeric](20, 2) NULL,
	[Order_No] [varchar](40) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mandays_Entry_Master]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mandays_Entry_Master](
	[Rowid] [bigint] IDENTITY(1,1) NOT NULL,
	[Eno] [varchar](15) NULL,
	[Remarks] [varchar](1000) NULL,
	[EDate] [date] NULL,
	[Etime] [datetime] NULL DEFAULT (getdate()),
	[Entry_System] [varchar](25) NULL DEFAULT (host_name()),
	[Approved] [char](1) NULL DEFAULT ('N'),
	[Approved_System] [varchar](20) NULL DEFAULT (host_name()),
	[Approved_Time] [datetime] NULL DEFAULT (getdate()),
	[Supplier_ID] [bigint] NULL,
	[Entry_Value] [numeric](20, 2) NULL DEFAULT ((0.00)),
PRIMARY KEY CLUSTERED 
(
	[Rowid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Uk_ManDay_cost] UNIQUE NONCLUSTERED 
(
	[EDate] ASC,
	[Supplier_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Uq_Eno] UNIQUE NONCLUSTERED 
(
	[Eno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PROCESS]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PROCESS](
	[PROCESSID] [bigint] IDENTITY(1,1) NOT NULL,
	[PROCESS] [varchar](50) NOT NULL,
UNIQUE NONCLUSTERED 
(
	[PROCESS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project_Activity_NAme_Master]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project_Activity_NAme_Master](
	[Rowid] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Short_Name] [varchar](3) NULL,
	[Uom_ID] [bigint] NULL,
	[Entry_Time] [datetime] NULL DEFAULT (getdate()),
	[Entry_System] [varchar](40) NULL DEFAULT (host_name()),
	[User_Code] [bigint] NULL,
	[Order_By_Slno] [bigint] NULL,
UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project_GRN_DEtails]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project_GRN_DEtails](
	[RowID] [bigint] IDENTITY(1,1) NOT NULL,
	[Master_ID] [bigint] NULL,
	[Slno] [int] NOT NULL,
	[Item_ID] [bigint] NOT NULL,
	[Color_ID] [bigint] NOT NULL,
	[Size_ID] [bigint] NOT NULL,
	[GRN_Qty] [numeric](15, 3) NOT NULL,
	[Grs_Rate] [numeric](22, 4) NULL,
	[Tax_Per] [numeric](22, 4) NULL,
	[Pur_Rate] [numeric](22, 4) NULL,
	[Grs_Amount] [numeric](22, 2) NULL,
	[Tax_Amount] [numeric](22, 2) NULL,
	[Pur_Amount] [numeric](22, 2) NULL,
 CONSTRAINT [Uk_Prj_Grn_Dtl] UNIQUE NONCLUSTERED 
(
	[Master_ID] ASC,
	[Item_ID] ASC,
	[Color_ID] ASC,
	[Size_ID] ASC,
	[Grs_Rate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Project_GRN_Invoicing_Details]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project_GRN_Invoicing_Details](
	[RowID] [bigint] IDENTITY(1,1) NOT NULL,
	[Master_ID] [bigint] NULL,
	[Slno] [int] NOT NULL,
	[Item_ID] [bigint] NOT NULL,
	[Color_ID] [bigint] NOT NULL,
	[Size_ID] [bigint] NOT NULL,
	[GRN_Qty] [numeric](15, 3) NOT NULL,
	[Rate] [numeric](25, 4) NULL,
	[PO_Amount] [numeric](25, 2) NOT NULL,
	[Bill_Qty] [numeric](15, 3) NULL,
	[Bill_Amount] [numeric](25, 2) NULL,
	[Bill_Rate] [numeric](22, 4) NULL,
	[Loss_Perc] [numeric](5, 2) NULL,
	[Qty_Deb] [numeric](22, 3) NULL,
	[Rate_Deb] [numeric](22, 2) NULL,
	[Acc_Qty] [numeric](22, 3) NULL,
	[Total_Rate] [numeric](22, 4) NULL,
	[Total_Bud_Cost] [numeric](22, 4) NULL,
	[Budget_Nrate] [numeric](22, 4) NULL,
	[Freight_BTax] [numeric](22, 4) NULL,
	[OCharges_BTax] [numeric](22, 4) NULL,
	[Tax_Per] [numeric](22, 4) NULL,
	[Bill_Gross] [numeric](15, 2) NULL,
	[Tax_Amount] [numeric](15, 2) NULL,
	[Freight_ATax] [numeric](22, 4) NULL,
	[OCharges_ATax] [numeric](22, 4) NULL,
	[Bill_NRate] [numeric](22, 4) NULL,
	[Budget_Tax] [numeric](22, 4) NULL,
	[Budget_Freight] [numeric](22, 4) NULL,
	[Budget_Others] [numeric](22, 4) NULL,
	[Disc_Per] [numeric](8, 4) NULL DEFAULT ((0))
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Project_GRN_Invoicing_Details_OCN]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project_GRN_Invoicing_Details_OCN](
	[RowID] [bigint] IDENTITY(1,1) NOT NULL,
	[Master_ID] [bigint] NULL,
	[Slno] [int] NOT NULL,
	[GRN_MasterID] [bigint] NOT NULL,
	[Mode] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project_GRN_Invoicing_Details_Tax]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project_GRN_Invoicing_Details_Tax](
	[RowID] [bigint] IDENTITY(1,1) NOT NULL,
	[Master_ID] [bigint] NULL,
	[Slno] [int] NOT NULL,
	[Tax_Code] [bigint] NOT NULL,
	[Mode] [varchar](1) NOT NULL,
	[Tax_Per] [numeric](5, 2) NOT NULL,
	[Tax_Amount] [numeric](15, 2) NOT NULL,
	[Calc_Mode_ID] [bigint] NULL,
 CONSTRAINT [UK_Unique_Invoicing_Tax] UNIQUE NONCLUSTERED 
(
	[Master_ID] ASC,
	[Tax_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project_GRN_Invoicing_Master]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project_GRN_Invoicing_Master](
	[RowID] [bigint] IDENTITY(1,1) NOT NULL,
	[Entry_No] [varchar](22) NOT NULL,
	[Entry_Date] [datetime] NOT NULL,
	[Supplier_Code] [bigint] NOT NULL,
	[Invoice_No] [varchar](50) NOT NULL,
	[Invoice_Date] [datetime] NOT NULL,
	[PO_Gross] [numeric](25, 2) NOT NULL,
	[PO_Tax] [numeric](20, 2) NOT NULL,
	[PO_Net] [numeric](25, 2) NULL,
	[Bill_Gross] [numeric](25, 2) NOT NULL,
	[Bill_Tax] [numeric](20, 2) NOT NULL,
	[Bill_Net] [numeric](25, 2) NULL,
	[To_Be_paid] [numeric](25, 2) NOT NULL,
	[Approved_Debit] [numeric](25, 2) NULL,
	[Entry_System] [varchar](150) NULL,
	[Entry_Time] [datetime] NULL,
	[Remarks] [varchar](2000) NULL,
	[Rate_Debit] [numeric](25, 2) NULL,
	[Qty_Debit] [numeric](25, 2) NULL,
	[Approval] [varchar](1) NULL,
	[Tax_Calc_Mode] [int] NULL,
	[RO_Amt] [numeric](5, 1) NULL,
 CONSTRAINT [UK_Prj_Inv_Mas] UNIQUE NONCLUSTERED 
(
	[Invoice_No] ASC,
	[Invoice_Date] ASC,
	[Supplier_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project_GRN_Master]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project_GRN_Master](
	[RowID] [bigint] IDENTITY(1,1) NOT NULL,
	[GRNNo] [varchar](15) NOT NULL,
	[GRNDate] [datetime] NOT NULL,
	[Supplier_Code] [bigint] NOT NULL,
	[Gross_Amount] [numeric](25, 2) NOT NULL,
	[Qty] [numeric](15, 3) NOT NULL,
	[Net_Amount] [numeric](25, 2) NOT NULL,
	[EDate] [datetime] NULL CONSTRAINT [Prj_GRn_Date]  DEFAULT (getdate()),
	[Tax_Amount] [numeric](20, 2) NULL,
	[Invoice_No] [varchar](50) NULL,
	[Invoice_Date] [datetime] NULL,
	[DC_No] [varchar](50) NULL,
	[DC_Date] [datetime] NULL,
	[GP_No] [numeric](20, 1) NULL,
	[GP_Date] [datetime] NULL,
	[ESystem] [varchar](50) NULL CONSTRAINT [Prj_Grn_Sys]  DEFAULT (host_name()),
	[Remarks] [varchar](200) NULL,
	[Acc_Enable] [varchar](2) NULL DEFAULT ('T'),
 CONSTRAINT [Uk_Prj_Grn_NO] UNIQUE NONCLUSTERED 
(
	[GRNNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project_GRN_OCN_DEtails]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project_GRN_OCN_DEtails](
	[RowID] [bigint] IDENTITY(1,1) NOT NULL,
	[Master_ID] [bigint] NULL,
	[Slno] [int] NOT NULL,
	[PO_Detail_ID] [bigint] NULL,
	[Order_ID] [bigint] NOT NULL,
	[Qty] [numeric](15, 3) NOT NULL,
	[Trans_Mode] [varchar](2) NULL,
	[Return_Qty] [numeric](23, 3) NULL,
	[SlNo_Dtl] [int] NULL,
	[Proj_Type_ID] [bigint] NULL,
	[Proj_Activity_ID] [bigint] NULL,
 CONSTRAINT [Uk_Prj_Grn_Ocn_Dtl] UNIQUE NONCLUSTERED 
(
	[Master_ID] ASC,
	[PO_Detail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project_Material_Status]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project_Material_Status](
	[OrdeR_ID] [bigint] NULL,
	[Proj_Type_ID] [bigint] NULL,
	[Proj_Activity_ID] [bigint] NULL,
	[Item_ID] [bigint] NULL,
	[Color_Id] [bigint] NULL,
	[SizE_Id] [bigint] NULL,
	[Grn_Qty] [numeric](22, 3) NULL CONSTRAINT [Df_Prj_Sts_Grn]  DEFAULT ((0)),
	[Rej_Qty] [numeric](22, 3) NULL CONSTRAINT [Df_Prj_Sts_Rej]  DEFAULT ((0)),
	[ISs_Qty] [numeric](22, 3) NULL CONSTRAINT [Df_Prj_Sts_Iss]  DEFAULT ((0)),
	[ReProc_Qty] [numeric](22, 3) NULL CONSTRAINT [Df_Prj_Sts_Rep]  DEFAULT ((0)),
	[Issue_return_Qty] [numeric](22, 3) NULL CONSTRAINT [Df_Prj_Sts_Is_Re]  DEFAULT ((0)),
	[Sale_Qty] [numeric](22, 3) NULL CONSTRAINT [Df_Prj_Sts_Sal]  DEFAULT ((0)),
	[Adjust_Qty] [numeric](22, 3) NULL CONSTRAINT [Df_Prj_Sts_Adj]  DEFAULT ((0)),
	[TransOut_Qty] [numeric](22, 3) NULL CONSTRAINT [Df_Prj_Sts_Tout]  DEFAULT ((0)),
	[TransIn_Qty] [numeric](22, 3) NULL CONSTRAINT [Df_Prj_Sts_Tin]  DEFAULT ((0)),
	[Grn_ID] [bigint] NULL,
	[Grn_Detail_Id] [bigint] NULL,
	[Grn_Ocn_DEtail_ID] [bigint] NULL,
	[PO_Detail_ID] [bigint] NULL,
	[Ret_Qty] [numeric](22, 3) NULL DEFAULT ((0)),
	[Stock_Qty]  AS (((([Grn_Qty]+[TransIn_Qty])+[Issue_Return_Qty])+[Ret_Qty])-((((([TransOut_Qty]+[Ret_Qty])+[Iss_Qty])+[Reproc_Qty])+[Sale_Qty])+[Adjust_Qty])) PERSISTED,
 CONSTRAINT [Uk_Prj_Status] UNIQUE NONCLUSTERED 
(
	[Grn_Ocn_DEtail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project_Name_Master]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project_Name_Master](
	[Rowid] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NULL,
	[Short_Name] [varchar](3) NULL,
	[Entry_Time] [datetime] NULL DEFAULT (getdate()),
	[Entry_System] [varchar](40) NULL DEFAULT (host_name()),
	[User_Code] [bigint] NULL,
UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project_ORdeR_Details]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project_ORdeR_Details](
	[Rowid] [bigint] IDENTITY(1,1) NOT NULL,
	[MAsteR_ID] [bigint] NULL,
	[RefNo] [varchar](100) NULL,
	[Estimate_Date] [datetime] NULL,
	[Complete_Date] [datetime] NULL,
	[Qty] [numeric](22, 3) NULL,
	[Allow_Per] [numeric](5, 2) NULL DEFAULT ((0)),
	[Conv_Qty] [numeric](22, 2) NULL,
	[Rate] [numeric](22, 2) NULL,
	[Amount] [numeric](22, 2) NULL,
	[SNo] [int] NULL,
	[IMAGE_REQ] [varchar](2) NULL DEFAULT ('N'),
	[Proj_Activity_ID] [bigint] NULL,
	[Uom_ID] [bigint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project_ORdeR_MASter]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project_ORdeR_MASter](
	[Rowid] [bigint] IDENTITY(1,1) NOT NULL,
	[Order_No] [varchar](30) NOT NULL,
	[Order_Date] [datetime] NULL,
	[Proj_Type_ID] [bigint] NOT NULL,
	[PArty_Code] [bigint] NULL,
	[EmplNo] [bigint] NULL,
	[Terms_ID] [bigint] NULL,
	[Approval_Flag] [varchar](2) NULL DEFAULT ('F'),
	[EntryTime] [datetime] NULL DEFAULT (getdate()),
	[EntrySystem] [varchar](50) NULL DEFAULT (host_name()),
	[Remarks] [varchar](200) NULL DEFAULT (''),
	[Total_Qty] [numeric](22, 2) NULL,
	[Total_Conv_Qty] [numeric](22, 2) NULL,
	[Total_Amount] [numeric](22, 2) NULL,
	[Complete_Order] [varchar](2) NULL DEFAULT ('F'),
	[Cancel_Order] [varchar](2) NULL DEFAULT ('F'),
	[Company_Code] [int] NULL,
	[Year_Code] [varchar](14) NULL,
UNIQUE NONCLUSTERED 
(
	[Order_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project_PLanning_Comm_Details]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project_PLanning_Comm_Details](
	[Rowid] [bigint] IDENTITY(1,1) NOT NULL,
	[MAster_ID] [bigint] NULL,
	[SNo] [int] NULL,
	[Comm_ID] [bigint] NULL,
	[Tot_Qty] [numeric](22, 3) NULL,
	[Grs_Rate] [numeric](22, 4) NULL,
	[Tax_Per] [numeric](5, 2) NULL,
	[Other_Rate] [numeric](22, 4) NULL,
	[Pur_Rate] [numeric](30, 4) NULL,
	[Grs_Amount] [numeric](30, 2) NULL,
	[Tax_Amount] [numeric](30, 2) NULL,
	[Other_Amount] [numeric](30, 2) NULL,
	[Pur_Amount] [numeric](30, 2) NULL,
	[Remarks] [varchar](30) NULL,
	[Approval_Flag] [varchar](2) NULL,
	[Approval_Time] [datetime] NULL,
	[Approval_System] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project_PLanning_Master]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project_PLanning_Master](
	[Rowid] [bigint] IDENTITY(1,1) NOT NULL,
	[Entry_NO] [bigint] NULL,
	[Effect_FRom] [datetime] NULL,
	[Order_ID] [bigint] NULL,
	[PRoj_Activity_ID] [bigint] NULL,
	[Total_Material_Amount] [numeric](22, 2) NULL,
	[Total_PRocess_Amount] [numeric](22, 2) NULL,
	[Total_Comm_Amount] [numeric](22, 2) NULL,
	[Total_Qty] [numeric](22, 2) NULL,
	[Remarks] [varchar](100) NULL,
	[Entry_Time] [datetime] NULL DEFAULT (getdate()),
	[Entry_System] [varchar](50) NULL DEFAULT (host_name()),
	[Proj_Type_Id] [bigint] NULL,
	[Unit] [numeric](22, 3) NULL,
	[Uom_ID] [bigint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project_PLanning_Material_Details]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project_PLanning_Material_Details](
	[Rowid] [bigint] IDENTITY(1,1) NOT NULL,
	[MAster_ID] [bigint] NULL,
	[SNo] [int] NULL,
	[Item_ID] [bigint] NULL,
	[Color_ID] [bigint] NULL,
	[Size_ID] [bigint] NULL,
	[Uom_ID] [int] NULL,
	[Req_Qty] [numeric](30, 3) NULL,
	[Loss_Perc] [numeric](5, 2) NULL,
	[Loss_Qty] [numeric](22, 3) NULL,
	[Tot_Qty] [numeric](22, 3) NULL,
	[Grs_Rate] [numeric](22, 4) NULL,
	[Tax_Per] [numeric](5, 2) NULL,
	[Other_Rate] [numeric](22, 4) NULL,
	[Pur_Rate] [numeric](30, 4) NULL,
	[Grs_Amount] [numeric](30, 2) NULL,
	[Tax_Amount] [numeric](30, 2) NULL,
	[Other_Amount] [numeric](30, 2) NULL,
	[Pur_Amount] [numeric](30, 2) NULL,
	[Remarks] [varchar](30) NULL,
	[Approval_Flag] [varchar](2) NULL DEFAULT ('F'),
	[Approval_Time] [datetime] NULL DEFAULT (getdate()),
	[Access_Type] [varchar](20) NULL,
	[Cons_UOm_Id] [bigint] NULL,
	[Unit] [numeric](22, 3) NULL,
	[Cons] [numeric](22, 3) NULL,
	[Approval_System] [varchar](50) NULL DEFAULT (host_name()),
	[Tot_Qty_Conv] [numeric](22, 3) NULL,
	[Grs_Rate_Conv] [numeric](22, 4) NULL,
	[Other_Rate_Conv] [numeric](22, 4) NULL,
	[Pur_Rate_Conv] [numeric](22, 4) NULL,
	[Conv_Val] [numeric](22, 3) NULL DEFAULT ((1)),
	[CAlc_Type] [varchar](2) NULL DEFAULT ('*'),
	[UomId_Po] [bigint] NULL,
	[App_Pur_Rate_Conv] [numeric](22, 4) NULL DEFAULT ((0)),
 CONSTRAINT [Uk_Plan_MAt_proj] UNIQUE NONCLUSTERED 
(
	[MAster_ID] ASC,
	[Item_ID] ASC,
	[Color_ID] ASC,
	[Size_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project_PLanning_Process_Details]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project_PLanning_Process_Details](
	[Rowid] [bigint] IDENTITY(1,1) NOT NULL,
	[MAster_ID] [bigint] NULL,
	[SNo] [int] NULL,
	[Proc_ID] [bigint] NULL,
	[Tot_Qty] [numeric](22, 3) NULL,
	[Grs_Rate] [numeric](22, 4) NULL,
	[Tax_Per] [numeric](5, 2) NULL,
	[Other_Rate] [numeric](22, 4) NULL,
	[Pur_Rate] [numeric](30, 4) NULL,
	[Grs_Amount] [numeric](30, 2) NULL,
	[Tax_Amount] [numeric](30, 2) NULL,
	[Other_Amount] [numeric](30, 2) NULL,
	[Pur_Amount] [numeric](30, 2) NULL,
	[Remarks] [varchar](30) NULL,
	[Approval_Flag] [varchar](2) NULL,
	[Approval_Time] [datetime] NULL,
	[Approval_System] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project_Planning_Summary_Details]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project_Planning_Summary_Details](
	[RowID] [bigint] IDENTITY(1,1) NOT NULL,
	[Master_ID] [bigint] NULL,
	[Yarn_Cost] [numeric](25, 2) NULL,
	[Trim_Cost] [numeric](25, 2) NULL,
	[Proc_Cost] [numeric](25, 2) NULL,
	[Comm_Cost] [numeric](25, 2) NULL,
	[Spcl_Req_Cost] [numeric](25, 2) NULL,
	[Profit] [numeric](20, 2) NULL,
	[Total_Cost] [numeric](28, 2) NULL,
	[Per_Pack_Cost] [numeric](20, 2) NULL,
	[Exc_Rate] [numeric](20, 2) NULL,
	[Prod_Rate_Ind] [numeric](20, 2) NULL,
	[Prod_Rate_Exp] [numeric](20, 2) NULL,
	[Sale_Price_Ind] [numeric](20, 2) NULL,
	[DB_Ind] [numeric](20, 2) NULL,
	[Profit_Ind] [numeric](20, 2) NULL,
	[Value_Ind] [numeric](25, 2) NULL,
	[Sale_Price_Exp] [numeric](20, 2) NULL,
	[DB_Exp] [numeric](20, 2) NULL,
	[Profit_Exp] [numeric](20, 2) NULL,
	[Value_Exp] [numeric](25, 2) NULL,
	[Approval_Flag] [varchar](2) NULL,
	[Approval_Time] [datetime] NULL,
	[Approval_System] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project_Po_Details]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project_Po_Details](
	[RowID] [bigint] IDENTITY(1,1) NOT NULL,
	[Master_ID] [bigint] NULL,
	[Slno] [int] NULL,
	[Order_ID] [bigint] NOT NULL,
	[Item_id] [bigint] NOT NULL,
	[Color_id] [bigint] NOT NULL,
	[Size_ID] [bigint] NOT NULL,
	[Order_Qty] [numeric](25, 3) NOT NULL,
	[Rate] [numeric](22, 4) NULL,
	[Amount] [numeric](25, 2) NOT NULL,
	[Cancel_Qty] [numeric](20, 3) NULL,
	[Remarks] [varchar](100) NULL,
	[Grs_Rate] [numeric](22, 4) NULL,
	[Tax_Per] [numeric](10, 2) NULL,
	[Freight_Rate] [numeric](22, 4) NULL,
	[Grs_Amount] [numeric](20, 2) NULL,
	[Tax_Amount] [numeric](20, 2) NULL,
	[Freight_Amount] [numeric](20, 2) NULL,
	[UomID1] [bigint] NULL,
	[Conv_Val] [numeric](20, 3) NULL,
	[Ro_Rate] [numeric](22, 4) NULL,
	[Order_Qty_Conv] [numeric](20, 3) NULL,
	[Rate_Conv] [numeric](20, 4) NULL,
	[Cancel_Qty_Conv] [numeric](20, 3) NULL,
	[Grs_Rate_Conv] [numeric](20, 4) NULL,
	[Freight_Rate_Conv] [numeric](22, 4) NULL,
	[APP_GRS_ORG] [numeric](22, 4) NULL,
	[APP_TAX_ORG] [numeric](22, 1) NULL,
	[APP_FREI_ORG] [numeric](22, 4) NULL,
	[APP_PUR_RATE_ORG] [numeric](22, 4) NULL,
	[APP_GRS_ORG_CONV] [numeric](22, 4) NULL,
	[APP_FREI_ORG_CONV] [numeric](22, 4) NULL,
	[APP_PUR_RATE_ORG_CONV] [numeric](22, 4) NULL,
	[APP_GRS] [numeric](22, 4) NULL,
	[APP_TAX] [numeric](22, 1) NULL,
	[APP_FREI] [numeric](22, 4) NULL,
	[APP_PUR_RATE] [numeric](22, 4) NULL,
	[FREI_TAX_MODE] [varchar](2) NULL,
	[PO_QTY_CONV] [numeric](22, 3) NULL,
	[Tax_Rate] [numeric](22, 4) NULL,
	[Tax_Rate_Conv] [numeric](22, 4) NULL,
	[RO_Amt] [numeric](22, 2) NULL,
	[Grs_Amt_Inr] [numeric](22, 2) NULL,
	[Pur_Amt_Inr] [numeric](22, 2) NULL,
	[Frei_Amt_Inr] [numeric](22, 2) NULL,
	[Tax_Amt_Inr] [numeric](22, 2) NULL,
	[App_Sup_Ex_Rate] [numeric](22, 4) NULL,
	[CAlc_Type] [varchar](2) NULL,
	[Proj_Activity_ID] [bigint] NULL,
	[Proj_Type_ID] [bigint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project_PO_Indent_Details]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project_PO_Indent_Details](
	[RowID] [bigint] IDENTITY(1,1) NOT NULL,
	[Master_ID] [bigint] NULL,
	[Slno] [int] NULL,
	[Order_ID] [bigint] NOT NULL,
	[Item_id] [bigint] NOT NULL,
	[Color_id] [bigint] NOT NULL,
	[Size_ID] [bigint] NOT NULL,
	[Order_Qty] [numeric](25, 3) NOT NULL,
	[Rate] [numeric](22, 4) NULL,
	[Amount] [numeric](25, 2) NOT NULL,
	[Cancel_Qty] [numeric](20, 3) NULL,
	[Remarks] [varchar](100) NULL,
	[Grs_Rate] [numeric](22, 4) NULL,
	[Tax_Per] [numeric](10, 2) NULL,
	[Freight_Rate] [numeric](22, 4) NULL,
	[Grs_Amount] [numeric](20, 2) NULL,
	[Tax_Amount] [numeric](20, 2) NULL,
	[Freight_Amount] [numeric](20, 2) NULL,
	[UomID1] [bigint] NULL,
	[Conv_Val] [numeric](20, 3) NULL,
	[Ro_Rate] [numeric](22, 4) NULL,
	[Order_Qty_Conv] [numeric](20, 3) NULL,
	[Rate_Conv] [numeric](20, 4) NULL,
	[Cancel_Qty_Conv] [numeric](20, 3) NULL,
	[Grs_Rate_Conv] [numeric](20, 4) NULL,
	[Freight_Rate_Conv] [numeric](22, 4) NULL,
	[APP_GRS_ORG] [numeric](22, 4) NULL,
	[APP_TAX_ORG] [numeric](22, 1) NULL,
	[APP_FREI_ORG] [numeric](22, 4) NULL,
	[APP_PUR_RATE_ORG] [numeric](22, 4) NULL,
	[APP_GRS_ORG_CONV] [numeric](22, 4) NULL,
	[APP_FREI_ORG_CONV] [numeric](22, 4) NULL,
	[APP_PUR_RATE_ORG_CONV] [numeric](22, 4) NULL,
	[APP_GRS] [numeric](22, 4) NULL,
	[APP_TAX] [numeric](22, 1) NULL,
	[APP_FREI] [numeric](22, 4) NULL,
	[APP_PUR_RATE] [numeric](22, 4) NULL,
	[FREI_TAX_MODE] [varchar](2) NULL,
	[PO_QTY_CONV] [numeric](22, 3) NULL,
	[Tax_Rate] [numeric](22, 4) NULL,
	[Tax_Rate_Conv] [numeric](22, 4) NULL,
	[RO_Amt] [numeric](22, 2) NULL,
	[Grs_Amt_Inr] [numeric](22, 2) NULL,
	[Pur_Amt_Inr] [numeric](22, 2) NULL,
	[Frei_Amt_Inr] [numeric](22, 2) NULL,
	[Tax_Amt_Inr] [numeric](22, 2) NULL,
	[App_Sup_Ex_Rate] [numeric](22, 4) NULL,
	[CAlc_Type] [varchar](2) NULL,
	[Proj_Activity_ID] [bigint] NULL,
	[Proj_Type_ID] [bigint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project_PO_Indent_Master]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project_PO_Indent_Master](
	[RowID] [bigint] IDENTITY(1,1) NOT NULL,
	[PONo] [varchar](25) NOT NULL,
	[PoDate] [datetime] NOT NULL,
	[Supplier_Code] [bigint] NULL,
	[Required_Date] [datetime] NOT NULL,
	[EDate] [datetime] NULL CONSTRAINT [Df_Etime_Ind]  DEFAULT (getdate()),
	[ESystem] [varchar](50) NULL,
	[Buyer_Code] [bigint] NULL,
	[Approval_Flag] [varchar](2) NULL CONSTRAINT [Df_appf_Ind]  DEFAULT ('F'),
	[Approval_Time] [datetime] NULL CONSTRAINT [Df_Eaptime_Ind]  DEFAULT (getdate()),
	[Approval_System] [varchar](50) NULL CONSTRAINT [Df_Esys_Ind]  DEFAULT (host_name()),
	[Ack_Date] [datetime] NULL,
	[Commit_Date] [datetime] NULL,
	[MailId] [varchar](500) NULL,
	[Indent_NO] [varchar](50) NULL,
	[Grs_Amount] [numeric](20, 2) NULL,
	[Tax_Amount] [numeric](20, 2) NULL,
	[Freight_Amount] [numeric](20, 2) NULL,
	[Net_Amount] [numeric](20, 2) NULL,
	[Remarks] [varchar](200) NULL,
	[Approval_Flag1] [varchar](2) NULL,
	[Indent_Date] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project_Po_Item_Close]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project_Po_Item_Close](
	[ORdeR_ID] [bigint] NULL,
	[ITem_ID] [bigint] NULL,
	[Color_ID] [bigint] NULL,
	[Size_ID] [bigint] NULL,
	[EntryTime] [datetime] NULL,
	[EntrySystem] [varchar](50) NULL,
	[Remarks] [varchar](150) NULL,
	[CL_Qty] [numeric](20, 2) NULL,
	[Mode] [varchar](10) NULL,
	[Model_COde] [bigint] NULL,
	[Item_COde] [bigint] NULL,
	[Proj_Type_ID] [bigint] NULL,
	[Proj_Activity_ID] [bigint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project_PO_Mail_Log_Details]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project_PO_Mail_Log_Details](
	[Rowid] [bigint] IDENTITY(1,1) NOT NULL,
	[POMasID] [bigint] NOT NULL,
	[MailID] [varchar](2000) NOT NULL,
	[SendDate] [datetime] NULL,
	[SendSystem] [varchar](200) NULL,
	[Mode] [varchar](20) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project_PO_Master]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project_PO_Master](
	[RowID] [bigint] IDENTITY(1,1) NOT NULL,
	[PONo] [varchar](25) NOT NULL,
	[PoDate] [datetime] NOT NULL,
	[Supplier_Code] [bigint] NULL,
	[Required_Date] [datetime] NOT NULL,
	[EDate] [datetime] NULL,
	[ESystem] [varchar](50) NULL,
	[Buyer_Code] [bigint] NULL,
	[Approval_Flag] [varchar](2) NULL,
	[Approval_Time] [datetime] NULL,
	[Approval_System] [varchar](50) NULL,
	[Ack_Date] [datetime] NULL,
	[Commit_Date] [datetime] NULL,
	[MailId] [varchar](500) NULL,
	[Indent_NO] [varchar](50) NULL,
	[Grs_Amount] [numeric](20, 2) NULL,
	[Tax_Amount] [numeric](20, 2) NULL,
	[Freight_Amount] [numeric](20, 2) NULL,
	[Net_Amount] [numeric](20, 2) NULL,
	[Remarks] [varchar](200) NULL,
	[Approval_Flag1] [varchar](2) NULL,
	[Indent_Date] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project_Return_DEtails]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project_Return_DEtails](
	[RowID] [bigint] IDENTITY(1,1) NOT NULL,
	[Master_ID] [bigint] NULL,
	[Slno] [int] NOT NULL,
	[Item_ID] [bigint] NOT NULL,
	[Color_ID] [bigint] NOT NULL,
	[Size_ID] [bigint] NOT NULL,
	[Grs_Rate] [numeric](22, 4) NULL,
	[Tax_Per] [numeric](22, 4) NULL,
	[Pur_Rate] [numeric](22, 4) NULL,
	[Grs_Amount] [numeric](22, 2) NULL,
	[Tax_Amount] [numeric](22, 2) NULL,
	[Pur_Amount] [numeric](22, 2) NULL,
	[Ret_Qty] [numeric](22, 3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Project_Return_Master]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project_Return_Master](
	[RowID] [bigint] IDENTITY(1,1) NOT NULL,
	[Supplier_Code] [bigint] NOT NULL,
	[Gross_Amount] [numeric](25, 2) NOT NULL,
	[Qty] [numeric](15, 3) NOT NULL,
	[Net_Amount] [numeric](25, 2) NOT NULL,
	[EDate] [datetime] NULL CONSTRAINT [Prj_Ret_Date]  DEFAULT (getdate()),
	[Tax_Amount] [numeric](20, 2) NULL,
	[ESystem] [varchar](50) NULL CONSTRAINT [Prj_Ret_Sys]  DEFAULT (host_name()),
	[Remarks] [varchar](200) NULL,
	[Acc_Enable] [varchar](2) NULL CONSTRAINT [df_Acc_en_REt]  DEFAULT ('T'),
	[RetNo] [varchar](20) NOT NULL,
	[RetDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project_Return_Ocn_DEtails]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project_Return_Ocn_DEtails](
	[RowID] [bigint] IDENTITY(1,1) NOT NULL,
	[Master_ID] [bigint] NULL,
	[Slno] [int] NOT NULL,
	[Order_ID] [bigint] NOT NULL,
	[Qty] [numeric](15, 3) NOT NULL,
	[Trans_Mode] [varchar](2) NULL,
	[SlNo_Dtl] [int] NULL,
	[Proj_Type_ID] [bigint] NULL,
	[Proj_Activity_ID] [bigint] NULL,
	[Grn_Ocn_Detail_ID] [bigint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project_Terms_Master]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project_Terms_Master](
	[Rowid] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NULL,
UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project_Uom_Settings]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project_Uom_Settings](
	[Rowid] [bigint] IDENTITY(1,1) NOT NULL,
	[Uid1] [bigint] NULL,
	[Uid2] [bigint] NULL,
	[Conv] [numeric](24, 4) NULL DEFAULT ((1)),
	[Calc_Type] [varchar](2) NULL DEFAULT ('/')
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Projects_Companymas]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Projects_Companymas](
	[CompCode] [numeric](18, 0) NULL,
	[CompName] [varchar](50) NULL,
	[InPrinting] [varchar](50) NULL,
	[CompAddress] [varchar](5000) NULL,
	[CompPhone] [varchar](50) NULL,
	[CompFax] [varchar](50) NULL,
	[CompEMail] [varchar](50) NULL,
	[CompTNGSTNo] [varchar](50) NULL,
	[CompCSTNo] [varchar](50) NULL,
	[CompECCNo] [varchar](50) NULL,
	[compTANNo] [varchar](50) NULL,
	[CompBEDNo] [varchar](50) NULL,
	[CompAEDNo] [varchar](50) NULL,
	[CompTaxDeduction] [varchar](50) NULL,
	[CompPANNo] [varchar](50) NULL,
	[CompPANDt] [varchar](50) NULL,
	[CompDesig] [varchar](50) NULL,
	[SDt] [datetime] NULL,
	[EDt] [datetime] NULL,
	[CompPfno] [varchar](50) NULL,
	[CompEsino] [varchar](50) NULL,
	[LicenseNo] [varchar](50) NULL,
	[CompanyType] [varchar](50) NULL,
	[PLANO] [varchar](50) NULL,
	[MILLIONS] [varchar](1) NULL,
	[CURNAME] [varchar](50) NULL,
	[CURSYMBOL] [varchar](10) NULL,
	[CURDECNAME] [varchar](50) NULL,
	[NEW_EMPCODE] [numeric](4, 0) NULL,
	[NEW_SYSCODE] [numeric](4, 0) NULL,
	[NEW_DATETIME] [datetime] NULL,
	[ALTER_EMPCODE] [numeric](4, 0) NULL,
	[ALTER_SYSCODE] [numeric](4, 0) NULL,
	[ALTER_DATETIME] [datetime] NULL,
	[COMPANY_CODE] [numeric](2, 0) NULL,
	[YEAR_CODE] [varchar](10) NULL,
	[SEALNAME] [varchar](50) NULL,
	[ORderSno] [int] NULL,
	[type] [int] NULL DEFAULT ((0))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Projects_General_PO_Details]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Projects_General_PO_Details](
	[RowID] [bigint] IDENTITY(1,1) NOT NULL,
	[Master_ID] [bigint] NULL,
	[Slno] [int] NULL,
	[Order_ID] [bigint] NOT NULL,
	[Item_id] [bigint] NOT NULL,
	[Color_id] [bigint] NOT NULL,
	[Size_ID] [bigint] NOT NULL,
	[Order_Qty] [numeric](25, 3) NOT NULL,
	[Rate] [numeric](22, 4) NOT NULL,
	[Amount] [numeric](25, 2) NOT NULL,
	[Cancel_Qty] [numeric](20, 3) NULL,
	[Grs_Rate] [numeric](22, 4) NOT NULL,
	[Tax_Per] [numeric](20, 2) NULL,
	[Remarks] [varchar](200) NULL,
	[Dye_MODe] [varchar](3) NULL,
 CONSTRAINT [Pk_Soc_Gen_PO_Dtl] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Uk_Unique_Gen_Yarn_PO] UNIQUE NONCLUSTERED 
(
	[Master_ID] ASC,
	[Order_ID] ASC,
	[Item_id] ASC,
	[Color_id] ASC,
	[Size_ID] ASC,
	[Rate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Projects_General_PO_Master]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Projects_General_PO_Master](
	[RowID] [bigint] IDENTITY(1,1) NOT NULL,
	[PONo] [varchar](25) NOT NULL,
	[PoDate] [datetime] NOT NULL,
	[Supplier_Code] [int] NOT NULL,
	[Required_Date] [datetime] NOT NULL,
	[PO_Method] [tinyint] NOT NULL,
	[EDate] [datetime] NULL,
	[ESystem] [varchar](50) NULL,
	[Buyer_Code] [bigint] NULL,
	[Approval_Flag] [varchar](2) NULL,
	[Approval_Time] [datetime] NULL,
	[Approval_System] [varchar](50) NULL,
	[Ack_Date] [datetime] NULL,
	[Commit_Date] [datetime] NULL,
	[REmarks] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_Unique_Gen_Socks_Po_No] UNIQUE NONCLUSTERED 
(
	[PONo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PONo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Projects_Menu_Master_New]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Projects_Menu_Master_New](
	[Menu_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Menu_Name] [varchar](100) NULL,
	[Menu_CName] [varchar](500) NOT NULL,
	[Under_Menu_CName] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Projects_Permission_Master]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Projects_Permission_Master](
	[Permission_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NULL,
	[Menu_Name] [varchar](500) NULL,
	[Rights] [varchar](20) NULL,
	[NEW_EMPCODE] [numeric](4, 0) NULL,
	[NEW_SYSCODE] [numeric](4, 0) NULL,
	[NEW_DATETIME] [datetime] NULL,
	[ALTER_EMPCODE] [numeric](4, 0) NULL,
	[ALTER_SYSCODE] [numeric](4, 0) NULL,
	[ALTER_DATETIME] [datetime] NULL,
	[COMPANY_CODE] [numeric](2, 0) NULL,
	[YEAR_CODE] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PRojects_Planning_Master]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRojects_Planning_Master](
	[RowID] [bigint] IDENTITY(1,1) NOT NULL,
	[Effect_From] [datetime] NOT NULL,
	[Order_ID] [bigint] NOT NULL,
	[Item_ID] [bigint] NOT NULL,
	[Remarks] [varchar](300) NULL,
	[EntryTime] [datetime] NULL,
	[EntrySystem] [varchar](50) NULL,
	[Entry_No] [bigint] NOT NULL,
	[Tot_Yarn_Cons] [numeric](20, 2) NOT NULL,
	[Tot_Trim_Cons] [numeric](20, 2) NOT NULL,
	[Tot_Yarn_Pur_Amt] [numeric](25, 2) NOT NULL,
	[Tot_Yarn_Dye_Amt] [numeric](25, 2) NOT NULL,
	[Tot_Trim_Pur_Amt] [numeric](25, 2) NOT NULL,
	[Tot_Proc_Pur_Amt] [numeric](25, 2) NOT NULL,
	[Tot_Proc_Cons] [numeric](20, 2) NULL,
	[Tot_Comm_Qty] [numeric](22, 2) NOT NULL,
	[Tot_Comm_Amt] [numeric](22, 2) NOT NULL,
	[Yarn_Loss_Perc] [numeric](10, 3) NULL,
PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Uk_Soc_Plan_Mas_ONo] UNIQUE NONCLUSTERED 
(
	[Order_ID] ASC,
	[Item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Projects_User_Master]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Projects_User_Master](
	[ID] [numeric](8, 0) NULL,
	[USER_CODE] [numeric](8, 0) NOT NULL,
	[USER_NAME] [varchar](200) NULL,
	[User1_address14] [varchar](150) NULL,
	[USER_STATUS] [varchar](5) NULL,
	[NEW_EMPCODE] [numeric](4, 0) NULL,
	[NEW_SYSCODE] [numeric](4, 0) NULL,
	[NEW_DATETIME] [datetime] NULL,
	[ALTER_EMPCODE] [numeric](4, 0) NULL,
	[ALTER_SYSCODE] [numeric](4, 0) NULL,
	[ALTER_DATETIME] [datetime] NULL,
	[COMPANY_CODE] [numeric](2, 0) NULL,
	[YEAR_CODE] [varchar](10) NULL,
	[LOCATION_CODE] [int] NULL,
	[USER_LEVEL_CODE] [int] NULL,
	[EmplNo] [bigint] NULL,
	[Mail_ID] [varchar](200) NULL DEFAULT ('')
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[report_details]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[report_details](
	[DLL_NAME] [varchar](50) NULL,
	[SERVER_NAME] [varchar](50) NULL,
	[DB_NAME] [varchar](50) NULL,
	[USER_NAME] [varchar](50) NULL,
	[P_WORD] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Serial_No_Condition]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Serial_No_Condition](
	[Mode] [varchar](40) NULL,
	[Effect_From] [datetime] NOT NULL,
	[Prefix] [varchar](8) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Size]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Size](
	[SizeID] [bigint] IDENTITY(1,1) NOT NULL,
	[Size] [varchar](50) NOT NULL,
UNIQUE NONCLUSTERED 
(
	[Size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sys_Master]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_Master](
	[Sys_Code] [numeric](3, 0) NULL,
	[Sys_Name] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Test]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[Rowid] [bigint] NULL,
	[Slno] [bigint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UOM_MASTER]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UOM_MASTER](
	[UOMID] [bigint] IDENTITY(1,1) NOT NULL,
	[UOM] [varchar](50) NOT NULL,
UNIQUE NONCLUSTERED 
(
	[UOM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User_Level_Projects]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[User_Level_Projects](
	[User_Level_Code] [int] NULL,
	[User_Level] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User_Location_master]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User_Location_master](
	[Location_Code] [int] NULL,
	[Locaton_Name] [varchar](250) NULL,
	[NEW_EMPCODE] [numeric](4, 0) NULL,
	[NEW_SYSCODE] [numeric](4, 0) NULL,
	[NEW_DATETIME] [datetime] NULL,
	[ALTER_EMPCODE] [numeric](4, 0) NULL,
	[ALTER_SYSCODE] [numeric](4, 0) NULL,
	[ALTER_DATETIME] [datetime] NULL,
	[COMPANY_CODE] [numeric](2, 0) NULL,
	[YEAR_CODE] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USerEntry_Log]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[USerEntry_Log](
	[ROWID] [bigint] IDENTITY(1,1) NOT NULL,
	[MODULE] [varchar](40) NULL,
	[USER_CODE] [int] NULL,
	[ENTRY_NAME] [varchar](100) NULL,
	[ENTRY_TYPE] [varchar](30) NULL,
	[ENTRY_ID] [bigint] NULL,
	[COMPANY_CODE] [int] NULL,
	[YEAR_CODE] [varchar](20) NULL,
	[Entry_DATe] [datetime] NULL DEFAULT (getdate())
) ON [PRIMARY]
SET ANSI_PADDING ON
ALTER TABLE [dbo].[USerEntry_Log] ADD [Entry_system] [varchar](50) NULL DEFAULT (host_name())

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Year_Master]    Script Date: 31/07/2021 9:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Year_Master](
	[Year] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[buyer] ADD  DEFAULT ('') FOR [ShippingMarks]
GO
ALTER TABLE [dbo].[buyer] ADD  DEFAULT ('') FOR [BuyerName]
GO
ALTER TABLE [dbo].[buyer] ADD  DEFAULT ('') FOR [InvoiceFile]
GO
ALTER TABLE [dbo].[buyer] ADD  DEFAULT ((0)) FOR [PayDays]
GO
ALTER TABLE [dbo].[buyer] ADD  DEFAULT ('') FOR [LogoName]
GO
ALTER TABLE [dbo].[buyer] ADD  DEFAULT ((0)) FOR [Allowance_per]
GO
ALTER TABLE [dbo].[buyer] ADD  DEFAULT ((0)) FOR [Agency_per]
GO
ALTER TABLE [dbo].[buyer] ADD  DEFAULT ((0)) FOR [Supplier_per]
GO
ALTER TABLE [dbo].[buyer] ADD  DEFAULT ('Y') FOR [IsActive]
GO
ALTER TABLE [dbo].[buyer] ADD  DEFAULT ((0)) FOR [Acc_Ledger_Code]
GO
ALTER TABLE [dbo].[Project_GRN_Invoicing_Details_Tax] ADD  DEFAULT ((0)) FOR [Calc_Mode_ID]
GO
ALTER TABLE [dbo].[Project_PLanning_Comm_Details] ADD  DEFAULT ('F') FOR [Approval_Flag]
GO
ALTER TABLE [dbo].[Project_PLanning_Comm_Details] ADD  DEFAULT (getdate()) FOR [Approval_Time]
GO
ALTER TABLE [dbo].[Project_PLanning_Comm_Details] ADD  DEFAULT (host_name()) FOR [Approval_System]
GO
ALTER TABLE [dbo].[Project_PLanning_Process_Details] ADD  DEFAULT ('F') FOR [Approval_Flag]
GO
ALTER TABLE [dbo].[Project_PLanning_Process_Details] ADD  DEFAULT (getdate()) FOR [Approval_Time]
GO
ALTER TABLE [dbo].[Project_PLanning_Process_Details] ADD  DEFAULT (host_name()) FOR [Approval_System]
GO
ALTER TABLE [dbo].[Projects_General_PO_Details] ADD  DEFAULT ((0)) FOR [Cancel_Qty]
GO
ALTER TABLE [dbo].[Projects_General_PO_Details] ADD  DEFAULT ('') FOR [Remarks]
GO
ALTER TABLE [dbo].[Projects_General_PO_Details] ADD  DEFAULT ('N') FOR [Dye_MODe]
GO
ALTER TABLE [dbo].[Projects_General_PO_Master] ADD  DEFAULT (getdate()) FOR [EDate]
GO
ALTER TABLE [dbo].[Projects_General_PO_Master] ADD  DEFAULT (host_name()) FOR [ESystem]
GO
ALTER TABLE [dbo].[Projects_General_PO_Master] ADD  DEFAULT ('F') FOR [Approval_Flag]
GO
ALTER TABLE [dbo].[Projects_General_PO_Master] ADD  DEFAULT (NULL) FOR [Approval_Time]
GO
ALTER TABLE [dbo].[Projects_General_PO_Master] ADD  DEFAULT (NULL) FOR [Approval_System]
GO
ALTER TABLE [dbo].[Projects_General_PO_Master] ADD  DEFAULT ('') FOR [REmarks]
GO
ALTER TABLE [dbo].[PRojects_Planning_Master] ADD  DEFAULT (getdate()) FOR [EntryTime]
GO
ALTER TABLE [dbo].[PRojects_Planning_Master] ADD  DEFAULT (host_name()) FOR [EntrySystem]
GO
ALTER TABLE [dbo].[Mandays_Entry_Details]  WITH CHECK ADD  CONSTRAINT [Fk_gar_PPlan_Dtl] FOREIGN KEY([Master_Id])
REFERENCES [dbo].[Mandays_Entry_Master] ([Rowid])
GO
ALTER TABLE [dbo].[Mandays_Entry_Details] CHECK CONSTRAINT [Fk_gar_PPlan_Dtl]
GO
ALTER TABLE [dbo].[Project_GRN_Invoicing_Details_Tax]  WITH CHECK ADD  CONSTRAINT [Chk_Gar_Inv_tax] CHECK  (([Tax_Amount]>(0)))
GO
ALTER TABLE [dbo].[Project_GRN_Invoicing_Details_Tax] CHECK CONSTRAINT [Chk_Gar_Inv_tax]
GO
