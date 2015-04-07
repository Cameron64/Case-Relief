<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container-fluid" style="background-color: white; width: 80%; height: 100%;">
         <div style="width:30%;">
         <div class="form-group" style="margin-top:20px">
    <label for="First Name">First Name</label>
    <asp:TextBox runat="server" type="text" CssClass="form-control" ID="fName"  placeholder="Enter first name"/>
  </div>
        <div class="form-group">
    <label for="Last Name">Last Name</label>
    <asp:TextBox runat="server" type="text" CssClass="form-control" ID="lName" placeholder="Enter last name"/>
           
  </div>
  <div class="form-group">
    <label for="Email Input">Email address</label>
    <asp:TextBox runat="server" type="text" CssClass="form-control" ID="email"  placeholder="Enter email"/>

  </div>
  <div class="form-group">
    <label for="Password">Password</label>
    <asp:TextBox runat="server" type="password" class="form-control" ID="password"  placeholder="Password"/>
  </div>
    <div class="form-group">
    <label for="Password Confirmation">Confirm Password</label>
    <asp:TextBox runat="server" type="password" class="form-control" ID="passwordConfirm"  placeholder="Password"/>
  </div>

  <asp:Button OnClick="submit_Click" runat="server" type="submit" class="btn btn-default" text="submit"></asp:Button>
    <asp:Label style="color:red" runat="server" id="error"></asp:Label>
         </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"   ConnectionString="<%$ ConnectionStrings:UserConnection %>" 
     InsertCommand="INSERT INTO [Users] (Email, Password, FName, LName, Admin) VALUES (@returnEmail, @returnPassword, @returnFName, @returnLName, @admin)"
     OldValuesParameterFormatString="original_{0}" 
     ProviderName="<%$ ConnectionStrings:UserConnection %>">
        <InsertParameters>
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="FName" Type="String" />
            <asp:Parameter Name="LName" Type="String" />
            <asp:Parameter Name="Admin" />
        </InsertParameters>
     </asp:SqlDataSource>

</asp:Content>

