namespace Accounts
{
    partial class FrmProjectReturnEntry
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
            this.Arrow_SNo = new System.Windows.Forms.PictureBox();
            this.label10 = new System.Windows.Forms.Label();
            this.TabCtrl1 = new System.Windows.Forms.TabControl();
            this.TabPageWrk = new System.Windows.Forms.TabPage();
            this.label8 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.GridQty = new DotnetVFGrid.MyDataGridView();
            this.Grid = new DotnetVFGrid.MyDataGridView();
            this.label5 = new System.Windows.Forms.Label();
            this.TxtBalQty = new V_Components.MyTextBox();
            this.TxtRetQty = new V_Components.MyTextBox();
            this.TxtTaxAmt = new V_Components.MyTextBox();
            this.TxtGrsAmt = new V_Components.MyTextBox();
            this.TxtSupplier = new V_Components.MyTextBox();
            this.TxtGrnNo = new V_Components.MyTextBox();
            this.TxtRemarks = new V_Components.MyTextBox();
            this.TxtNetAmt = new V_Components.MyTextBox();
            this.DtpDate = new System.Windows.Forms.DateTimePicker();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.TxtTotQty = new V_Components.MyTextBox();
            this.listBox1 = new System.Windows.Forms.ListBox();
            this.GBMain.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.Arrow_SNo)).BeginInit();
            this.TabCtrl1.SuspendLayout();
            this.TabPageWrk.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.GridQty)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Grid)).BeginInit();
            this.SuspendLayout();
            // 
            // GBMain
            // 
            this.GBMain.Controls.Add(this.Arrow_SNo);
            this.GBMain.Controls.Add(this.label10);
            this.GBMain.Controls.Add(this.TabCtrl1);
            this.GBMain.Controls.Add(this.TxtSupplier);
            this.GBMain.Controls.Add(this.TxtGrnNo);
            this.GBMain.Controls.Add(this.TxtRemarks);
            this.GBMain.Controls.Add(this.TxtNetAmt);
            this.GBMain.Controls.Add(this.DtpDate);
            this.GBMain.Controls.Add(this.label4);
            this.GBMain.Controls.Add(this.label3);
            this.GBMain.Controls.Add(this.label2);
            this.GBMain.Controls.Add(this.TxtTotQty);
            this.GBMain.Controls.Add(this.listBox1);
            this.GBMain.Location = new System.Drawing.Point(12, 6);
            this.GBMain.Name = "GBMain";
            this.GBMain.Size = new System.Drawing.Size(775, 463);
            this.GBMain.TabIndex = 0;
            this.GBMain.TabStop = false;
            // 
            // Arrow_SNo
            // 
            this.Arrow_SNo.Image = global::Accounts.Properties.Resources.Down;
            this.Arrow_SNo.Location = new System.Drawing.Point(721, 16);
            this.Arrow_SNo.Name = "Arrow_SNo";
            this.Arrow_SNo.Size = new System.Drawing.Size(25, 21);
            this.Arrow_SNo.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.Arrow_SNo.TabIndex = 124;
            this.Arrow_SNo.TabStop = false;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.Location = new System.Drawing.Point(321, 20);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(67, 15);
            this.label10.TabIndex = 75;
            this.label10.Text = "SUPPLIER";
            // 
            // TabCtrl1
            // 
            this.TabCtrl1.Controls.Add(this.TabPageWrk);
            this.TabCtrl1.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.TabCtrl1.Location = new System.Drawing.Point(22, 45);
            this.TabCtrl1.Name = "TabCtrl1";
            this.TabCtrl1.SelectedIndex = 0;
            this.TabCtrl1.Size = new System.Drawing.Size(747, 367);
            this.TabCtrl1.TabIndex = 59;
            this.TabCtrl1.SelectedIndexChanged += new System.EventHandler(this.TabCtrl1_SelectedIndexChanged);
            // 
            // TabPageWrk
            // 
            this.TabPageWrk.Controls.Add(this.label8);
            this.TabPageWrk.Controls.Add(this.label7);
            this.TabPageWrk.Controls.Add(this.label9);
            this.TabPageWrk.Controls.Add(this.label6);
            this.TabPageWrk.Controls.Add(this.GridQty);
            this.TabPageWrk.Controls.Add(this.Grid);
            this.TabPageWrk.Controls.Add(this.label5);
            this.TabPageWrk.Controls.Add(this.TxtBalQty);
            this.TabPageWrk.Controls.Add(this.TxtRetQty);
            this.TabPageWrk.Controls.Add(this.TxtTaxAmt);
            this.TabPageWrk.Controls.Add(this.TxtGrsAmt);
            this.TabPageWrk.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.TabPageWrk.Location = new System.Drawing.Point(4, 24);
            this.TabPageWrk.Name = "TabPageWrk";
            this.TabPageWrk.Padding = new System.Windows.Forms.Padding(3);
            this.TabPageWrk.Size = new System.Drawing.Size(739, 339);
            this.TabPageWrk.TabIndex = 0;
            this.TabPageWrk.Text = "RETURN";
            this.TabPageWrk.UseVisualStyleBackColor = true;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.Location = new System.Drawing.Point(590, 245);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(61, 15);
            this.label8.TabIndex = 77;
            this.label8.Text = "BAL QTY";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(590, 214);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(60, 15);
            this.label7.TabIndex = 77;
            this.label7.Text = "RET QTY";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.Location = new System.Drawing.Point(590, 308);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(62, 15);
            this.label9.TabIndex = 77;
            this.label9.Text = "TAX AMT";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(590, 277);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(63, 15);
            this.label6.TabIndex = 77;
            this.label6.Text = "GRS AMT";
            // 
            // GridQty
            // 
            this.GridQty.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.GridQty.Location = new System.Drawing.Point(6, 205);
            this.GridQty.Name = "GridQty";
            this.GridQty.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.CellSelect;
            this.GridQty.Size = new System.Drawing.Size(578, 122);
            this.GridQty.TabIndex = 3;
            this.GridQty.CellLeave += new System.Windows.Forms.DataGridViewCellEventHandler(this.GridQty_CellLeave);
            this.GridQty.EditingControlShowing += new System.Windows.Forms.DataGridViewEditingControlShowingEventHandler(this.GridQty_EditingControlShowing);
            this.GridQty.RowsAdded += new System.Windows.Forms.DataGridViewRowsAddedEventHandler(this.GridQty_RowsAdded);
            this.GridQty.KeyDown += new System.Windows.Forms.KeyEventHandler(this.GridQty_KeyDown);
            this.GridQty.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.GridQty_KeyPress);
            this.GridQty.MouseDoubleClick += new System.Windows.Forms.MouseEventHandler(this.GridQty_MouseDoubleClick);
            // 
            // Grid
            // 
            this.Grid.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.Grid.Location = new System.Drawing.Point(6, 6);
            this.Grid.Name = "Grid";
            this.Grid.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.CellSelect;
            this.Grid.Size = new System.Drawing.Size(727, 193);
            this.Grid.TabIndex = 2;
            this.Grid.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.Grid_CellClick);
            this.Grid.CellLeave += new System.Windows.Forms.DataGridViewCellEventHandler(this.Grid_CellLeave);
            this.Grid.CurrentCellChanged += new System.EventHandler(this.Grid_CurrentCellChanged);
            this.Grid.EditingControlShowing += new System.Windows.Forms.DataGridViewEditingControlShowingEventHandler(this.Grid_EditingControlShowing);
            this.Grid.RowsAdded += new System.Windows.Forms.DataGridViewRowsAddedEventHandler(this.Grid_RowsAdded);
            this.Grid.RowsRemoved += new System.Windows.Forms.DataGridViewRowsRemovedEventHandler(this.Grid_RowsRemoved);
            this.Grid.KeyDown += new System.Windows.Forms.KeyEventHandler(this.Grid_KeyDown);
            this.Grid.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.Grid_KeyPress);
            this.Grid.MouseDoubleClick += new System.Windows.Forms.MouseEventHandler(this.Grid_MouseDoubleClick);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(567, 239);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(0, 15);
            this.label5.TabIndex = 16;
            // 
            // TxtBalQty
            // 
            this.TxtBalQty.Location = new System.Drawing.Point(670, 242);
            this.TxtBalQty.Name = "TxtBalQty";
            this.TxtBalQty.Size = new System.Drawing.Size(63, 22);
            this.TxtBalQty.TabIndex = 1;
            this.TxtBalQty.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.TxtBalQty.TextChanged += new System.EventHandler(this.TxtTotQty_TextChanged);
            this.TxtBalQty.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.TxtTotBales_KeyPress);
            // 
            // TxtRetQty
            // 
            this.TxtRetQty.Location = new System.Drawing.Point(670, 211);
            this.TxtRetQty.Name = "TxtRetQty";
            this.TxtRetQty.Size = new System.Drawing.Size(63, 22);
            this.TxtRetQty.TabIndex = 1;
            this.TxtRetQty.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.TxtRetQty.TextChanged += new System.EventHandler(this.TxtTotQty_TextChanged);
            this.TxtRetQty.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.TxtTotBales_KeyPress);
            // 
            // TxtTaxAmt
            // 
            this.TxtTaxAmt.Location = new System.Drawing.Point(670, 305);
            this.TxtTaxAmt.Name = "TxtTaxAmt";
            this.TxtTaxAmt.Size = new System.Drawing.Size(63, 22);
            this.TxtTaxAmt.TabIndex = 1;
            this.TxtTaxAmt.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.TxtTaxAmt.TextChanged += new System.EventHandler(this.TxtTotQty_TextChanged);
            this.TxtTaxAmt.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.TxtTotBales_KeyPress);
            // 
            // TxtGrsAmt
            // 
            this.TxtGrsAmt.Location = new System.Drawing.Point(670, 274);
            this.TxtGrsAmt.Name = "TxtGrsAmt";
            this.TxtGrsAmt.Size = new System.Drawing.Size(63, 22);
            this.TxtGrsAmt.TabIndex = 1;
            this.TxtGrsAmt.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.TxtGrsAmt.TextChanged += new System.EventHandler(this.TxtTotQty_TextChanged);
            this.TxtGrsAmt.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.TxtTotBales_KeyPress);
            // 
            // TxtSupplier
            // 
            this.TxtSupplier.Location = new System.Drawing.Point(416, 17);
            this.TxtSupplier.Name = "TxtSupplier";
            this.TxtSupplier.Size = new System.Drawing.Size(299, 20);
            this.TxtSupplier.TabIndex = 0;
            this.TxtSupplier.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // TxtGrnNo
            // 
            this.TxtGrnNo.Location = new System.Drawing.Point(88, 17);
            this.TxtGrnNo.Name = "TxtGrnNo";
            this.TxtGrnNo.Size = new System.Drawing.Size(129, 20);
            this.TxtGrnNo.TabIndex = 58;
            this.TxtGrnNo.TabStop = false;
            this.TxtGrnNo.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // TxtRemarks
            // 
            this.TxtRemarks.Location = new System.Drawing.Point(100, 432);
            this.TxtRemarks.Name = "TxtRemarks";
            this.TxtRemarks.Size = new System.Drawing.Size(516, 20);
            this.TxtRemarks.TabIndex = 4;
            this.TxtRemarks.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.TxtRemarks.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.TxtTotBales_KeyPress);
            // 
            // TxtNetAmt
            // 
            this.TxtNetAmt.Location = new System.Drawing.Point(694, 433);
            this.TxtNetAmt.Name = "TxtNetAmt";
            this.TxtNetAmt.Size = new System.Drawing.Size(71, 20);
            this.TxtNetAmt.TabIndex = 1;
            this.TxtNetAmt.TabStop = false;
            this.TxtNetAmt.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.TxtNetAmt.TextChanged += new System.EventHandler(this.TxtTotQty_TextChanged);
            this.TxtNetAmt.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.TxtTotBales_KeyPress);
            // 
            // DtpDate
            // 
            this.DtpDate.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.DtpDate.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.DtpDate.Location = new System.Drawing.Point(223, 17);
            this.DtpDate.Name = "DtpDate";
            this.DtpDate.Size = new System.Drawing.Size(85, 22);
            this.DtpDate.TabIndex = 1;
            this.DtpDate.TabStop = false;
            this.DtpDate.Leave += new System.EventHandler(this.DtpEDate_Leave);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(25, 435);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(69, 15);
            this.label4.TabIndex = 1;
            this.label4.Text = "REMARKS";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(622, 435);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(61, 15);
            this.label3.TabIndex = 1;
            this.label3.Text = "NET AMT";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(19, 20);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(50, 15);
            this.label2.TabIndex = 1;
            this.label2.Text = "RETNO";
            // 
            // TxtTotQty
            // 
            this.TxtTotQty.Location = new System.Drawing.Point(623, 434);
            this.TxtTotQty.Name = "TxtTotQty";
            this.TxtTotQty.Size = new System.Drawing.Size(63, 20);
            this.TxtTotQty.TabIndex = 1;
            this.TxtTotQty.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.TxtTotQty.Visible = false;
            this.TxtTotQty.TextChanged += new System.EventHandler(this.TxtTotQty_TextChanged);
            this.TxtTotQty.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.TxtTotBales_KeyPress);
            // 
            // listBox1
            // 
            this.listBox1.FormattingEnabled = true;
            this.listBox1.Location = new System.Drawing.Point(536, 22);
            this.listBox1.Name = "listBox1";
            this.listBox1.Size = new System.Drawing.Size(47, 17);
            this.listBox1.TabIndex = 74;
            this.listBox1.Visible = false;
            // 
            // FrmProjectReturnEntry
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(799, 474);
            this.Controls.Add(this.GBMain);
            this.KeyPreview = true;
            this.Name = "FrmProjectReturnEntry";
            this.Text = "FrmProjectReturnEntry";
            this.Load += new System.EventHandler(this.FrmProjectReturnEntry_Load);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.FrmProjectReturnEntry_KeyDown);
            this.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.FrmProjectReturnEntry_KeyPress);
            this.GBMain.ResumeLayout(false);
            this.GBMain.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.Arrow_SNo)).EndInit();
            this.TabCtrl1.ResumeLayout(false);
            this.TabPageWrk.ResumeLayout(false);
            this.TabPageWrk.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.GridQty)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Grid)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox GBMain;
        private V_Components.MyTextBox TxtNetAmt;
        private System.Windows.Forms.DateTimePicker DtpDate;
        private System.Windows.Forms.Label label2;
        private V_Components.MyTextBox TxtGrnNo;
        private System.Windows.Forms.Label label3;
        private V_Components.MyTextBox TxtRemarks;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TabControl TabCtrl1;
        private System.Windows.Forms.ListBox listBox1;
        private System.Windows.Forms.TabPage TabPageWrk;
        private DotnetVFGrid.MyDataGridView Grid;
        private System.Windows.Forms.Label label5;
        private DotnetVFGrid.MyDataGridView GridQty;
        private V_Components.MyTextBox TxtTotQty;
        private System.Windows.Forms.Label label6;
        private V_Components.MyTextBox TxtTaxAmt;
        private V_Components.MyTextBox TxtGrsAmt;
        private System.Windows.Forms.Label label7;
        private V_Components.MyTextBox TxtBalQty;
        private V_Components.MyTextBox TxtRetQty;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label10;
        private V_Components.MyTextBox TxtSupplier;
        private System.Windows.Forms.PictureBox Arrow_SNo;
    }
}