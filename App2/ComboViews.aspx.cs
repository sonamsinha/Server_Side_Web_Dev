using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ComboViews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void DvEmployee_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        GVEmployees.DataBind();
    }
}