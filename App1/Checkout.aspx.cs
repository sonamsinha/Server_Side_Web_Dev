using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Checkout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            TxtEmail.Focus();
            PnlOtherInfo.Visible = false;
        }
    }

    protected void TxtZip_TextChanged(object sender, EventArgs e)
    {
        PnlOtherInfo.Visible = true;
    }

    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        foreach (Control c in PnlInfo.Controls)
        {
            if (c is TextBox)
            {
                ((TextBox) c).Text = "";
            }
           
        }

        foreach (Control c in PnlOtherInfo.Controls)
        {
            if (c is DropDownList)
            {
                ((DropDownList)c).SelectedIndex = 0;
            }
            else if (c is RadioButtonList)
            {
                ((RadioButtonList)c).SelectedIndex = 3;
            }
            else if (c is CheckBoxList)
            {
                ((CheckBoxList)c).Items.FindByText("Special Offers").Selected = true;
                ((CheckBoxList)c).Items.FindByText("New Products").Selected = true;
                ((CheckBoxList)c).Items.FindByText("New Editions").Selected = false;
                ((CheckBoxList)c).Items.FindByText("Local Events").Selected = false;
            }
        }
        PnlOtherInfo.Visible = false;
        TxtEmail.Focus();
    }
}