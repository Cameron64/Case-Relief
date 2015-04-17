<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div class="container-fluid" style="background-color:white;width:80%;bottom:0;" ng-controller="cart">
                <div ng-show="0 >= $storage.products.length" style="top:50px;"><h3>Try adding some products into your cart by hitting up the <a href="Shopping.aspx">shopping page</a> </h3></div>
                <table class="table table-hover" ng-hide="0 >= $storage.products.length">
                 <tr>   
                     <th>Picture</th>
                     <th>Name</th>
                     <th>Description</th>
                     <th>Number in Stock</th>
                     <th>Price</th>
                     <th>Quantity</th>
                     <th>Remove</th>

                 </tr>
 <tbody>
     
     <tr ng-repeat="product in $storage.products">
         <td><img ng-src="img/phones/{{product.Photo}}" style="position:relative;max-width:50%;max-height:50%;margin:10px;"/></td>
        <td>{{product.Name}}</td>
         <td>{{product.Description}}</td>
         <td>{{product.NumInStock}}</td>
         <td>{{product.Price | currency}}</td>
         <td ><input ng-model="$storage.products[getBasketIndex($storage.products,product.Name)].Quantity" min="1" max="{{product.NumInStock}}" type="number" style="width:60%;min-width:60px;"/></td>
         <td><div ng-click="$storage.products.splice(getBasketIndex($storage.products,product.Name),1)" class="removeItem">x</div></td>
    </tr>

     <tr>
         <td>&nbsp</td><td>&nbsp</td><td>&nbsp</td>
         <td><h3>TOTAL:</h3></td>
         <td>&nbsp</td>
         <td style="float:right;" ng-model="beforeTax"><h3>{{total($storage.products) | currency}}</h3></td>
     </tr>
     <tr>
         <td>&nbsp</td><td>&nbsp</td><td>&nbsp</td>
         <td><h3>Tax:</h3></td>
         <td>&nbsp</td>
         <td><h3><div style="float:right;" ng-model="tax">8.25%</div></h3></td>
     </tr>
     <tr>
         <td>&nbsp</td><td>&nbsp</td><td>&nbsp</td>
         <td><h3>GRAND TOTAL:</h3></td>
         <td>&nbsp</td>
         <td style="float:right;" ><h3>{{total($storage.products) / 8.25 + total($storage.products) | number:2 | currency}}</h3></td>
     </tr>
 </tbody>


</table>
            <button type="button" class="btn btn-primary" ng-hide="0 >= $storage.products.length"  ng-click="toPay()" style="float:right;margin:5px;">Add Payment Information</button>

                </div>
</asp:Content>

