<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ThankYou.aspx.cs" Inherits="PassProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container-fluid" style="background-color:white;width:80%;bottom:0;position:relative;" ng-controller="thankYou">
            <div ng-bind="response"></div>
                        <button type="button" class="btn btn-primary"  ng-click="getService()" style="float:right;margin:5px;">Add Payment Information</button>

</div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server"  ConnectionString="<%$ ConnectionStrings:AdminConnection %>" SelectCommand="SELECT [Name], [NumInStock] FROM [Phones] WHERE ([Name] = @Name AND [NumInStock] >= @Quantity)">
        <SelectParameters>
            <asp:Parameter Name="Name" Type="String" />
        </SelectParameters>
</asp:SqlDataSource>
</asp:Content>

