<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Finalize.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="container-fluid" style="background-color:white;width:80%;bottom:0;" ng-controller="cart">
   <div style="border:solid black 1px;width:300px;margin-top:10px;margin-bottom:10px;">
       <div style="margin-right:auto;margin-left:auto;width:80%;">
       <h2>Shipping Address</h2>
       <div style="font-size:18px;font-weight:500;display:inline;">Address:</div>
       <asp:Label ID="FAddress" runat="server" ></asp:Label>
       <br />
              <div style="font-size:18px;font-weight:500;display:inline;">City:</div>
              <asp:Label ID="FCity" runat="server"></asp:Label>
       <br />
              <div style="font-size:18px;font-weight:500;display:inline;">State:</div>
              <asp:Label ID="FState" runat="server"></asp:Label>
           </div>
   </div>
        
                        <table class="table table-hover" ng-hide="0 >= $storage.products.length">
                 <tr>   
                     <th>Name</th>
                     <th>Price</th>
                     <th>Quantity</th>

                 </tr>
 <tbody>
     
     <tr ng-repeat="product in $storage.products">
        <td>{{product.Name}}</td>
         <td>{{product.Price | currency}}</td>
         <td>{{product.Quantity}}</td>
    </tr>

     <tr>
         <td><h3>TOTAL:</h3></td>
         <td style="float:right;" ng-model="beforeTax"><h3>{{total($storage.products) | currency}}</h3></td>
     </tr>
     <tr>
         <td><h3>Tax:</h3></td>
         <td><h3><div style="float:right;" ng-model="tax">8.25%</div></h3></td>
     </tr>
     <tr>
         <td><h3>Sub TOTAL:</h3></td>
         <td style="float:right;"  ><h3>{{subTotal() | number:2 | currency}}</h3></td>
     </tr>
     <tr>
         <td><h3>Shipping:</h3></td>
         <td><h3><div style="float:right;">
             <select style="height:50px;width:200px;" ng-model="shipping">
  
        <option ng-repeat="type in prices" value="{{type.price}}">{{type.name}}</option>

</select>
                 </div></h3></td>
     </tr>
     <tr>
         <td>
             <h3>GRAND TOTAL:</h3>
         </td>
                  <td><h3><div style="float:right;">{{grandTotal() | number:2 | currency}}</div></h3></td>

     </tr>
 </tbody>


</table>

        </div>


     
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"  ConnectionString="<%$ ConnectionStrings:AdminConnection %>" SelectCommand="SELECT [Email], [Address], [City], [State] FROM [Shipping] WHERE ([Email] = @Email)">
        <SelectParameters>
            <asp:Parameter Name="Email" Type="String" />
        </SelectParameters>
</asp:SqlDataSource>
</asp:Content>

