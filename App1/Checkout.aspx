<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Checkout</title>
    <link href="Checkout.css" rel="stylesheet" />
</head>
<body>
    <form id="CheckoutForm" runat="server">
    <div id="wrapper">
        <img id="banner" alt="Banner image" src="Images/banner.jpg" /><br />
        <h1>Checkout</h1>
        <hr />
        <div>
            <asp:Panel ID="PnlInfo" runat="server">
                <h3>Contact Information</h3>

                <label class="labels">Email address: </label>
                <asp:TextBox ID="TxtEmail" CssClass="entry" runat="server"></asp:TextBox><br />

                <label class="labels">Email Re-entry: </label>
                <asp:TextBox ID="TxtReEnterEmail" CssClass="entry" runat="server"></asp:TextBox><br />

                <label class="labels">First Name: </label>
                <asp:TextBox ID="TxtFirstName" CssClass="entry" runat="server"></asp:TextBox><br />

                <label class="labels">Last Name: </label>
                <asp:TextBox ID="TxtLastName" CssClass="entry" runat="server"></asp:TextBox><br />

                <label class="labels">Phone Number: </label>
                <asp:TextBox ID="TxtPhone" CssClass="entry" runat="server"></asp:TextBox><br />

                <h3>Billing Address</h3>

                <label class="labels">Address: </label>
                <asp:TextBox ID="TxtAddress" CssClass="entry" runat="server"></asp:TextBox><br />

                <label class="labels">City: </label>
                <asp:TextBox ID="TxtCity" CssClass="entry" runat="server"></asp:TextBox><br />

                <label class="labels">State: </label>
                <asp:TextBox ID="TxtState" CssClass="entry" runat="server"></asp:TextBox><br />

                <label class="labels">Zip code: </label>
                <asp:TextBox ID="TxtZip" CssClass="entry" runat="server" 
                    OnTextChanged="TxtZip_TextChanged" AutoPostBack="true">
                </asp:TextBox><br />
            </asp:Panel>
            <asp:Panel ID="PnlOtherInfo" runat="server">
                <h3>Shipping Method</h3>

                <span>Please choose a shipping method.</span><br />
                <asp:DropDownList ID="DdlShipping" runat="server">
                    <asp:ListItem Value="G" Selected="True">UPS Ground - $5.00</asp:ListItem>
                    <asp:ListItem Value="S">UPS 3-day Select - $8.00</asp:ListItem>
                    <asp:ListItem Value="T">UPS 2nd Day Air - $15.00</asp:ListItem>
                    <asp:ListItem Value="N">UPS Next Day Air - $20.00</asp:ListItem>
                </asp:DropDownList>
                
                <h3>Optional Data</h3>
                <span>Please let me know about:</span>
                <asp:CheckBoxList ID="CblOptions" runat="server" RepeatColumns="2" Width="15em">
                    <asp:ListItem Selected="True">Special Offers</asp:ListItem>
                    <asp:ListItem>New Editions</asp:ListItem>
                    <asp:ListItem Selected="True">New Products</asp:ListItem>
                    <asp:ListItem>Local Events</asp:ListItem>
                </asp:CheckBoxList>
                
                <br /><br />
                <span>Please contact me via:</span>
                <asp:RadioButtonList ID="RblContact" runat="server" Width="15em">
                    <asp:ListItem>Twitter</asp:ListItem>
                    <asp:ListItem>Facebook</asp:ListItem>
                    <asp:ListItem>Text Message</asp:ListItem>
                    <asp:ListItem Selected="True">Email</asp:ListItem>
                </asp:RadioButtonList>

                <br /><br />
                <asp:Button ID="BtnCheckout" runat="server" Text="Checkout" 
                    PostBackUrl="~/ThankYou.aspx" />
                <asp:Button ID="BtnCancel" runat="server" Text="Cancel Order" OnClick="BtnCancel_Click" />

            </asp:Panel>
            
        </div>
    </div>
    </form>
</body>
</html>
