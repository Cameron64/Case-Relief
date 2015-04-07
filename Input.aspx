<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Input.aspx.cs" Inherits="Input" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container-fluid" style="background-color: white; width: 80%; height: 100%;">
         <div style="width:30%;">
         <div class="form-group" style="margin-top:20px">
             HOW TO ADD PHONES:
           <br />
             Name: Normal, just put in the name
             <br />
             Model: Normal
             <br />
             Rating: No decimals!!
             <br />
             Description: Normal
             <br />
             Price: NO decimals
             <br />
             Photo: say the name of the photo with its extension (like .jpg) and drop that pic into the folder img/phones immediately
             <br />
             In stock: Lower Case
             <br />
             Number in stock: No decimals
             <br />


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
    <asp:TextBox runat="server" type="text" CssClass="form-control" ID="IPrice"  placeholder="20 (No Decimals)"/>   
  </div>

    <%--<asp:FileUpload id="IPhoto" runat="server" />
    <br /><br />
    <asp:Label runat="server" id="StatusLabel" text="Upload status: " />--%>
     <div class="form-group">
    <label for="Item Photo">Photo</label>
        <asp:TextBox runat="server" type="text" CssClass="form-control" ID="IPhoto"  placeholder="Name.jpg"/>
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
    

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"           
     ConnectionString="<%$ ConnectionStrings:AdminConnection %>" 
     InsertCommand="INSERT INTO [Phones] (Name, Model, Rating, Description, Price, Photo, InStock, NumInStock) VALUES (@IName, @IModel, @IRating, @IDescription, @IPrice, @IPhoto, @IStock, @INStock)"
     OldValuesParameterFormatString="original_{0}" 
     ProviderName="<%$ ConnectionStrings:AdminConnection %>">
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Model" Type="String" />
            <asp:Parameter Name="Rating" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Price" Type="String" />
            <asp:Parameter Name="Photo" Type="String" />
            <asp:Parameter Name="InStock" Type="String" />
            <asp:Parameter Name="NumInStock" Type="String" />
        </InsertParameters>
     </asp:SqlDataSource>
</asp:Content>

