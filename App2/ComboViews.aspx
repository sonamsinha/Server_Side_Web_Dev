<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ComboViews.aspx.cs" Inherits="ComboViews" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Grid/Details Views</title>
    <link href="Styles/GridViewStyles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="MyForm" runat="server">
    <div>
        <asp:SqlDataSource ID="DsEmployees" runat="server" ConnectionString='<%$ ConnectionStrings:Northwind %>' SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [City], [PostalCode] FROM [Employees]"></asp:SqlDataSource>
        <asp:GridView ID="GVEmployees" DataSourceID="DsEmployees" AutoGenerateColumns="false" DataKeyNames="EmployeeID" runat="server">
            <HeaderStyle BackColor="LightBlue" />
            <SelectedRowStyle BackColor="LightGray" />
            <Columns>
                <asp:CommandField ShowSelectButton="true" SelectText="Select" ItemStyle-Width="5em" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                <asp:BoundField DataField="City" HeaderText="City" />
                <asp:BoundField DataField="PostalCode" HeaderText="Postal Code"/>
            </Columns>
        </asp:GridView>
        <br /><br />
        <asp:SqlDataSource ID="DsEmployee" runat="server" ConnectionString='<%$ ConnectionStrings:Northwind %>' 
            SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [City], [PostalCode], [Title], [BirthDate] FROM [Employees] WHERE ([EmployeeID] = @EmployeeID)"
            UpdateCommand="UPDATE Employees SET LastName=@LastName, FirstName=@FirstName, BirthDate=@BirthDate , Title=@Title, City=@City, PostalCode=@PostalCode WHERE EmployeeID=@EmployeeID">
            <SelectParameters>
                <asp:ControlParameter ControlID="GVEmployees" PropertyName="SelectedValue" Name="EmployeeID" Type="Int32"></asp:ControlParameter>
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="LastName"></asp:Parameter>
                <asp:Parameter Name="FirstName"></asp:Parameter>
                <asp:Parameter Name="BirthDate"></asp:Parameter>
                <asp:Parameter Name="Title"></asp:Parameter>
                <asp:Parameter Name="City"></asp:Parameter>
                <asp:Parameter Name="PostalCode"></asp:Parameter>
                <asp:Parameter Name="EmployeeID"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:DetailsView ID="DvEmployee" runat="server" Height="10em" Width="20em" DataKeyNames="EmployeeID" DataSourceID="DsEmployee" 
            AutoGenerateRows="false" AutoGenerateEditButton="true" OnItemUpdated="DvEmployee_ItemUpdated">
            <Fields>
                <asp:BoundField HeaderText="EmployeeID" DataField="EmployeeID"></asp:BoundField>
                <asp:BoundField HeaderText="LastName" DataField="LastName"></asp:BoundField>
                <asp:BoundField HeaderText="FirstName" DataField="FirstName"></asp:BoundField>
                <asp:BoundField HeaderText="City" DataField="City"></asp:BoundField>
                <asp:TemplateField HeaderText="PostalCode">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Bind("PostalCode") %>' ID="TextPostalCode"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="ReqTextPostalCode" ControlToValidate="TextPostalCode" Text="Postal Code is required"
                             Display="Dynamic" ForeColor="Red"  runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegTextPostalCode" ControlToValidate="TextPostalCode" Text="Postal Code must be 5 digits"
                             ValidationExpression="\d{5}" Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="RegularExpressionValidator"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Bind("PostalCode") %>' ID="TextBox1"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("PostalCode") %>' ID="Label1"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField HeaderText="Title" DataField="Title"></asp:BoundField>
                <asp:BoundField HeaderText="BirthDate" DataField="BirthDate"></asp:BoundField>
            </Fields>
        </asp:DetailsView>
    </div>
    </form>
</body>
</html>
