<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Shop.aspx.cs" Inherits="Shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container-fluid" style="background-color:white;width:80%;bottom:0;" ng-controller="shopping">
        <script>
            var dr = "<%= final %>";
           
</script>

        <div ng-repeat="data in dataRecieved">
            <div style="height:10%;width:30%;background-color:lightblue;float:left;border:1px solid black">
            {{data.Email}}
            <br />
            {{data.Password}}
        </div>
            </div>
        <asp:Label runat="server" id="Message"></asp:Label>
        </div>

   
</asp:Content>

