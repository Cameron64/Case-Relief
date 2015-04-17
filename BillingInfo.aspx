<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BillingInfo.aspx.cs" Inherits="Bill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container-fluid" style="background-color: white; width: 80%; height: 100%;">
         <div style="width:30%;float:left;margin-right:15%;">
             <h2>Billing Information</h2>
         <div class="form-group" style="margin-top:20px">
    <label for="Card Type">Card Type</label>
 
    <asp:DropDownList ID="CardDropDown" Style="width:150px;" CssClass="form-control" runat="server">
	<asp:ListItem Value="Visa">Visa</asp:ListItem>
	<asp:ListItem Value="MasterCard">Master Card</asp:ListItem>  
    <asp:ListItem Value="AExpress">American Express</asp:ListItem>  
    <asp:ListItem Value="Discover">Discover Card</asp:ListItem>  


             </asp:DropDownList>
             </div>
        <div class="form-group">
    <label for="Card Number">Card Number</label>
    <asp:TextBox runat="server" type="text" Style="width:200px;" CssClass="form-control" ID="CardNum" placeholder="5555 5555 5555 5555"/>
           
  </div>
             <div class="form-group">
                 <label for="Security Code">Security Code</label>
                 <asp:TextBox runat="server"  Style="width:100px;" CssClass="form-control" ID="SCode" placeholder="555" />
                 </div>
   <asp:Button OnClick="submit_Click" runat="server" type="submit" class="btn btn-primary" text="submit"></asp:Button>

             </div>
             </div>
</asp:Content>

