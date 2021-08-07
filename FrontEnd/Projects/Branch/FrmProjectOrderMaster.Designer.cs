namespace Accounts
{
    partial class FrmProjectOrderMaster
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.GBMain = new System.Windows.Forms.GroupBox();
            this.GBImage = new System.Windows.Forms.GroupBox();
            this.ButCancel = new System.Windows.Forms.Button();
            this.ButOK = new System.Windows.Forms.Button();
            this.Img1 = new System.Windows.Forms.PictureBox();
            this.ChkCopy = new System.Windows.Forms.CheckBox();
            this.label11 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.DtpODate = new System.Windows.Forms.DateTimePicker();
            this.Arrow_Buyer = new System.Windows.Forms.PictureBox();
            this.Arrow_Name = new System.Windows.Forms.PictureBox();
            this.Arrow_Empl = new System.Windows.Forms.PictureBox();
            this.listBox1 = new System.Windows.Forms.ListBox();
            this.label10 = new System.Windows.Forms.Label();
            this.label14 = new System.Windows.Forms.Label();
            this.label15 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.LblResponse = new System.Windows.Forms.Label();
            this.Grid = new DotnetVFGrid.MyDataGridView();
            this.TxtPrjType = new V_Components.MyTextBox();
            this.TxtPrjNo = new V_Components.MyTextBox();
            this.TxtBuyer = new V_Components.MyTextBox();
            this.TxtEmployee = new V_Components.MyTextBox();
            this.TxtRemarks = new V_Components.MyTextBox();
            this.TxtTotOrderQty = new V_Components.MyTextBox();
            this.TxtNetAmount = new V_Components.MyTextBox();
            this.TxtTotalBom = new V_Components.MyTextBox();
            this.GBMain.SuspendLayout();
            this.GBImage.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.Img1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Arrow_Buyer)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Arrow_Name)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Arrow_Empl)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Grid)).BeginInit();
            this.SuspendLayout();
            // 
            // GBMain
            // 
            this.GBMain.Controls.Add(this.GBImage);
            this.GBMain.Controls.Add(this.ChkCopy);
            this.GBMain.Controls.Add(this.label11);
            this.GBMain.Controls.Add(this.label5);
            this.GBMain.Controls.Add(this.DtpODate);
            this.GBMain.Controls.Add(this.Arrow_Buyer);
            this.GBMain.Controls.Add(this.Arrow_Name);
            this.GBMain.Controls.Add(this.Arrow_Empl);
            this.GBMain.Controls.Add(this.listBox1);
            this.GBMain.Controls.Add(this.label10);
            this.GBMain.Controls.Add(this.label14);
            this.GBMain.Controls.Add(this.label15);
            this.GBMain.Controls.Add(this.label4);
            this.GBMain.Controls.Add(this.Grid);
            this.GBMain.Controls.Add(this.label2);
            this.GBMain.Controls.Add(this.TxtPrjType);
            this.GBMain.Controls.Add(this.LblResponse);
            this.GBMain.Controls.Add(this.TxtPrjNo);
            this.GBMain.Controls.Add(this.TxtBuyer);
            this.GBMain.Controls.Add(this.TxtEmployee);
            this.GBMain.Controls.Add(this.TxtRemarks);
            this.GBMain.Controls.Add(this.TxtTotOrderQty);
            this.GBMain.Controls.Add(this.TxtNetAmount);
            this.GBMain.Controls.Add(this.TxtTotalBom);
            this.GBMain.Location = new System.Drawing.Point(12, 7);
            this.GBMain.Name = "GBMain";
            this.GBMain.Size = new System.Drawing.Size(657, 394);
            this.GBMain.TabIndex = 0;
            this.GBMain.TabStop = false;
            this.GBMain.Enter += new System.EventHandler(this.GBMain_Enter);
            // 
            // GBImage
            // 
            this.GBImage.Controls.Add(this.ButCancel);
            this.GBImage.Controls.Add(this.ButOK);
            this.GBImage.Controls.Add(this.Img1);
            this.GBImage.Location = new System.Drawing.Point(394, 108);
            this.GBImage.Name = "GBImage";
            this.GBImage.Size = new System.Drawing.Size(228, 229);
            this.GBImage.TabIndex = 79;
            this.GBImage.TabStop = false;
            this.GBImage.Visible = false;
            // 
            // ButCancel
            // 
            this.ButCancel.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ButCancel.Location = new System.Drawing.Point(114, 196);
            this.ButCancel.Name = "ButCancel";
            this.ButCancel.Size = new System.Drawing.Size(75, 23);
            this.ButCancel.TabIndex = 2;
            this.ButCancel.Text = "CANCEL";
            this.ButCancel.UseVisualStyleBackColor = true;
            this.ButCancel.Click += new System.EventHandler(this.ButCancel_Click);
            // 
            // ButOK
            // 
            this.ButOK.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ButOK.Location = new System.Drawing.Point(24, 196);
            this.ButOK.Name = "ButOK";
            this.ButOK.Size = new System.Drawing.Size(75, 23);
            this.ButOK.TabIndex = 1;
            this.ButOK.Text = "ADD";
            this.ButOK.UseVisualStyleBackColor = true;
            this.ButOK.Click += new System.EventHandler(this.ButOK_Click);
            // 
            // Img1
            // 
            this.Img1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.Img1.Location = new System.Drawing.Point(6, 18);
            this.Img1.Name = "Img1";
            this.Img1.Size = new System.Drawing.Size(216, 172);
            this.Img1.TabIndex = 0;
            this.Img1.TabStop = false;
            // 
            // ChkCopy
            // 
            this.ChkCopy.AutoSize = true;
            this.ChkCopy.Font = new System.Drawing.Font("Times New Roman", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ChkCopy.Location = new System.Drawing.Point(325, 18);
            this.ChkCopy.Name = "ChkCopy";
            this.ChkCopy.Size = new System.Drawing.Size(60, 17);
            this.ChkCopy.TabIndex = 1;
            this.ChkCopy.TabStop = false;
            this.ChkCopy.Text = "COPY";
            this.ChkCopy.UseVisualStyleBackColor = true;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label11.Location = new System.Drawing.Point(391, 18);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(70, 15);
            this.label11.TabIndex = 78;
            this.label11.Text = "PRJ NAME";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(20, 19);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(53, 15);
            this.label5.TabIndex = 78;
            this.label5.Text = "PRJ NO";
            // 
            // DtpODate
            // 
            this.DtpODate.CustomFormat = "dd/MM/yyyy";
            this.DtpODate.Enabled = false;
            this.DtpODate.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.DtpODate.Location = new System.Drawing.Point(243, 16);
            this.DtpODate.Name = "DtpODate";
            this.DtpODate.Size = new System.Drawing.Size(76, 20);
            this.DtpODate.TabIndex = 0;
            this.DtpODate.TabStop = false;
            this.DtpODate.Value = new System.DateTime(2013, 10, 19, 0, 0, 0, 0);
            this.DtpODate.Leave += new System.EventHandler(this.DtpEDate_Leave);
            // 
            // Arrow_Buyer
            // 
            this.Arrow_Buyer.Image = global::Accounts.Properties.Resources.Down;
            this.Arrow_Buyer.Location = new System.Drawing.Point(325, 47);
            this.Arrow_Buyer.Name = "Arrow_Buyer";
            this.Arrow_Buyer.Size = new System.Drawing.Size(25, 21);
            this.Arrow_Buyer.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.Arrow_Buyer.TabIndex = 75;
            this.Arrow_Buyer.TabStop = false;
            this.Arrow_Buyer.Click += new System.EventHandler(this.Arrow_Buyer_Click);
            // 
            // Arrow_Name
            // 
            this.Arrow_Name.Image = global::Accounts.Properties.Resources.Down;
            this.Arrow_Name.Location = new System.Drawing.Point(621, 13);
            this.Arrow_Name.Name = "Arrow_Name";
            this.Arrow_Name.Size = new System.Drawing.Size(25, 21);
            this.Arrow_Name.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.Arrow_Name.TabIndex = 75;
            this.Arrow_Name.TabStop = false;
            this.Arrow_Name.Click += new System.EventHandler(this.Arrow_Name_Click);
            // 
            // Arrow_Empl
            // 
            this.Arrow_Empl.Image = global::Accounts.Properties.Resources.Down;
            this.Arrow_Empl.Location = new System.Drawing.Point(621, 50);
            this.Arrow_Empl.Name = "Arrow_Empl";
            this.Arrow_Empl.Size = new System.Drawing.Size(25, 21);
            this.Arrow_Empl.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.Arrow_Empl.TabIndex = 75;
            this.Arrow_Empl.TabStop = false;
            this.Arrow_Empl.Click += new System.EventHandler(this.Arrow_Merch_Click);
            // 
            // listBox1
            // 
            this.listBox1.FormattingEnabled = true;
            this.listBox1.Location = new System.Drawing.Point(29, 377);
            this.listBox1.Name = "listBox1";
            this.listBox1.Size = new System.Drawing.Size(32, 4);
            this.listBox1.TabIndex = 74;
            this.listBox1.Visible = false;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.Location = new System.Drawing.Point(24, 355);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(69, 15);
            this.label10.TabIndex = 56;
            this.label10.Text = "REMARKS";
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label14.Location = new System.Drawing.Point(409, 355);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(64, 15);
            this.label14.TabIndex = 56;
            this.label14.Text = "AMOUMT";
            this.label14.Visible = false;
            // 
            // label15
            // 
            this.label15.AutoSize = true;
            this.label15.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label15.Location = new System.Drawing.Point(483, 355);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(33, 15);
            this.label15.TabIndex = 56;
            this.label15.Text = "QTY";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(409, 355);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(37, 15);
            this.label4.TabIndex = 56;
            this.label4.Text = "BOM";
            this.label4.Visible = false;
            this.label4.Click += new System.EventHandler(this.label4_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(20, 50);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(48, 15);
            this.label2.TabIndex = 15;
            this.label2.Text = "BUYER";
            // 
            // LblResponse
            // 
            this.LblResponse.AutoSize = true;
            this.LblResponse.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.LblResponse.Location = new System.Drawing.Point(391, 49);
            this.LblResponse.Name = "LblResponse";
            this.LblResponse.Size = new System.Drawing.Size(68, 15);
            this.LblResponse.TabIndex = 15;
            this.LblResponse.Text = "ENTRY BY";
            this.LblResponse.Click += new System.EventHandler(this.label6_Click);
            // 
            // Grid
            // 
            this.Grid.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.Grid.Location = new System.Drawing.Point(23, 88);
            this.Grid.Name = "Grid";
            this.Grid.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.CellSelect;
            this.Grid.Size = new System.Drawing.Size(623, 249);
            this.Grid.TabIndex = 5;
            this.Grid.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.Grid_CellContentClick);
            this.Grid.EditingControlShowing += new System.Windows.Forms.DataGridViewEditingControlShowingEventHandler(this.Grid_EditingControlShowing);
            this.Grid.RowsAdded += new System.Windows.Forms.DataGridViewRowsAddedEventHandler(this.Grid_RowsAdded);
            this.Grid.RowsRemoved += new System.Windows.Forms.DataGridViewRowsRemovedEventHandler(this.Grid_RowsRemoved);
            this.Grid.KeyDown += new System.Windows.Forms.KeyEventHandler(this.Grid_KeyDown);
            this.Grid.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.Grid_KeyPress);
            this.Grid.Leave += new System.EventHandler(this.Grid_Leave);
            this.Grid.MouseDoubleClick += new System.Windows.Forms.MouseEventHandler(this.Grid_MouseDoubleClick);
            // 
            // TxtPrjType
            // 
            this.TxtPrjType.Location = new System.Drawing.Point(467, 16);
            this.TxtPrjType.Name = "TxtPrjType";
            this.TxtPrjType.Size = new System.Drawing.Size(148, 20);
            this.TxtPrjType.TabIndex = 0;
            this.TxtPrjType.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // TxtPrjNo
            // 
            this.TxtPrjNo.Location = new System.Drawing.Point(119, 16);
            this.TxtPrjNo.Name = "TxtPrjNo";
            this.TxtPrjNo.Size = new System.Drawing.Size(118, 20);
            this.TxtPrjNo.TabIndex = 0;
            this.TxtPrjNo.TabStop = false;
            this.TxtPrjNo.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // TxtBuyer
            // 
            this.TxtBuyer.Location = new System.Drawing.Point(119, 47);
            this.TxtBuyer.Name = "TxtBuyer";
            this.TxtBuyer.Size = new System.Drawing.Size(200, 20);
            this.TxtBuyer.TabIndex = 1;
            this.TxtBuyer.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // TxtEmployee
            // 
            this.TxtEmployee.Location = new System.Drawing.Point(467, 50);
            this.TxtEmployee.Name = "TxtEmployee";
            this.TxtEmployee.Size = new System.Drawing.Size(148, 20);
            this.TxtEmployee.TabIndex = 3;
            this.TxtEmployee.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.TxtEmployee.TextChanged += new System.EventHandler(this.TxtDept_TextChanged);
            // 
            // TxtRemarks
            // 
            this.TxtRemarks.Location = new System.Drawing.Point(99, 352);
            this.TxtRemarks.Name = "TxtRemarks";
            this.TxtRemarks.Size = new System.Drawing.Size(286, 20);
            this.TxtRemarks.TabIndex = 6;
            this.TxtRemarks.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // TxtTotOrderQty
            // 
            this.TxtTotOrderQty.Location = new System.Drawing.Point(531, 352);
            this.TxtTotOrderQty.Name = "TxtTotOrderQty";
            this.TxtTotOrderQty.Size = new System.Drawing.Size(115, 20);
            this.TxtTotOrderQty.TabIndex = 9;
            this.TxtTotOrderQty.TabStop = false;
            this.TxtTotOrderQty.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // TxtNetAmount
            // 
            this.TxtNetAmount.Location = new System.Drawing.Point(412, 352);
            this.TxtNetAmount.Name = "TxtNetAmount";
            this.TxtNetAmount.Size = new System.Drawing.Size(61, 20);
            this.TxtNetAmount.TabIndex = 9;
            this.TxtNetAmount.TabStop = false;
            this.TxtNetAmount.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.TxtNetAmount.Visible = false;
            // 
            // TxtTotalBom
            // 
            this.TxtTotalBom.Location = new System.Drawing.Point(412, 352);
            this.TxtTotalBom.Name = "TxtTotalBom";
            this.TxtTotalBom.Size = new System.Drawing.Size(59, 20);
            this.TxtTotalBom.TabIndex = 9;
            this.TxtTotalBom.TabStop = false;
            this.TxtTotalBom.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.TxtTotalBom.Visible = false;
            // 
            // FrmProjectOrderMaster
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(674, 411);
            this.Controls.Add(this.GBMain);
            this.KeyPreview = true;
            this.Name = "FrmProjectOrderMaster";
            this.Text = "FrmProjectOrderMaster";
            this.Load += new System.EventHandler(this.FrmProjectOrderMaster_Load);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.FrmProjectOrderMaster_KeyDown);
            this.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.FrmProjectOrderMaster_KeyPress);
            this.GBMain.ResumeLayout(false);
            this.GBMain.PerformLayout();
            this.GBImage.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.Img1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Arrow_Buyer)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Arrow_Name)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Arrow_Empl)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Grid)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox GBMain;
        private DotnetVFGrid.MyDataGridView Grid;
        private V_Components.MyTextBox TxtTotalBom;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ListBox listBox1;
        private V_Components.MyTextBox TxtPrjNo;
        private System.Windows.Forms.DateTimePicker DtpODate;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.PictureBox Arrow_Empl;
        private System.Windows.Forms.Label label2;
        private V_Components.MyTextBox TxtBuyer;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label label10;
        private V_Components.MyTextBox TxtRemarks;
        private System.Windows.Forms.PictureBox Arrow_Buyer;
        private System.Windows.Forms.Label LblResponse;
        private V_Components.MyTextBox TxtEmployee;
        private System.Windows.Forms.Label label14;
        private V_Components.MyTextBox TxtNetAmount;
        private System.Windows.Forms.GroupBox GBImage;
        private System.Windows.Forms.PictureBox Img1;
        private System.Windows.Forms.Button ButCancel;
        private System.Windows.Forms.Button ButOK;
        private System.Windows.Forms.Label label15;
        private V_Components.MyTextBox TxtTotOrderQty;
        private System.Windows.Forms.CheckBox ChkCopy;
        private V_Components.MyTextBox TxtPrjType;
        private System.Windows.Forms.PictureBox Arrow_Name;
    }
}