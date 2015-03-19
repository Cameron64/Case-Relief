<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Input.aspx.cs" Inherits="Input" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container-fluid" style="background-color: white; width: 80%; height: 100%;">
         <div style="width:30%;">
         <div class="form-group" style="margin-top:20px">

    <label for="Item Name">Item Name</label>
    <asp:TextBox runat="server" type="text" CssClass="form-control" ID="IName"  placeholder="Enter Item Name"/>
  </div>
        <div class="form-group">
    <label for="Item Model">Item Model</label>
    <asp:TextBox runat="server" type="text" CssClass="form-control" ID="IModel" placeholder="Enter Item Model"/>
           
  </div>
  <div class="form-group">
    <label for="Item Star Rating">Item Rating</label>
    <asp:TextBox runat="server" type="text" CssClass="form-control" ID="IRating"  placeholder="Enter Item Rating 1-5"/>
      <asp:RangeValidator runat="server" MinimumValue="0" MaximumValue="5" Text="The value must be from 0 to 5" style="color:red;" Type="Integer" ControlToValidate="IRating" />
  </div>
  <div class="form-group">
    <label for="Description">Description</label>
    <asp:TextBox runat="server" type="text" class="form-control" ID="IDescription"  placeholder="Enter Item Description"/>
  </div>
  
    <div class="form-group">
    <label for="Item Price">Price</label>
    <asp:TextBox runat="server" type="text" CssClass="form-control" ID="IPrice"  placeholder="9.99 (Only ints and decimals)"/>   
  </div>

    <div class="form-group">
    <label for="Item Photo">Photo</label>
    <asp:TextBox runat="server" type="text" CssClass="form-control" ID="IPhoto"  placeholder="img/phones/4.jpg"/>   
  </div>

    <div class="form-group">
    <label for="Item Stock">In Stock</label>
    <asp:TextBox runat="server" type="text" CssClass="form-control" ID="IStock"  placeholder="yes or no"/>   
  </div>

    <div class="form-group">
    <label for="Item Num In Stock">Number In Stock</label>
    <asp:TextBox runat="server" type="text" CssClass="form-control" ID="INStock"  placeholder="0-100"/>   
  </div>

  <asp:Button OnClick="submit_Click" runat="server" type="submit" class="btn btn-default" text="submit"></asp:Button>
    <asp:Label style="color:red" runat="server" id="error"></asp:Label>
         </div>
    </div>

</asp:Content>

