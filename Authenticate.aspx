<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Authenticate.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div class="container-fluid" style="background-color: white; width: 80%; height: 100%;">
            <div style="width:20%;">
  <div class="form-group" style="margin-top:20px;" >
    <label for="Email">Email</label>
    <asp:TextBox runat="server" type="text" CssClass="form-control" ID="UserEmail" placeholder="jdoe@unt.org"/>
  </div>
  <div class="form-group">
    <label for="Password">Password</label>
    <asp:TextBox runat="server" type="password" class="form-control" ID="UserPassword"  placeholder="password"/>
  </div>
  
  <asp:Button OnClick="submit_Click" runat="server" type="submit" class="btn btn-default" text="Login"></asp:Button>
                or
     <asp:Button OnClick="register_Click" runat="server" type="submit" class="btn btn-primary" text="Register"></asp:Button>
                <br />
                 <asp:Label runat="server" id="ErrorMessage" Style="color:red;"></asp:Label>
    </div>
           
            </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"  ConnectionString="<%$ ConnectionStrings:UserConnection %>" SelectCommand="SELECT [Email], [Password], [FName], [LName], [Admin] FROM [users] WHERE (([Email] = @UserEmail) AND ([Password] = @UserPassword))">
        <SelectParameters>
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
        </SelectParameters>
</asp:SqlDataSource>
</asp:Content>

