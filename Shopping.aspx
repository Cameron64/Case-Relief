<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Shopping.aspx.cs" Inherits="Shopping" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="container-fluid" style="background-color:white;width:80%;bottom:0;" ng-controller="shopping">
        <script>
            var dr = "<%= final %>";
</script>
            <div style="position:relative;float:left;width:20%;height:600px; top:50px; border:1px solid black">
               <form>
  <div class="form-group" style="margin:5px;">
                 <h3>Filters</h3>
                
    <label for="Search of Products">Search</label>
    <input class="form-control" placeholder="Search" ng-model="productSearch"/>
      <h4>Minimum Rating</h4>
      <div  style="position:relative;height:20px;width:80%;margin-bottom:10px;">
      <img ng-src="assets/site/stars/star.png" style="float:left;height:100%;" ng-mouseover="hoverStars = 1" ng-click="selectedStars=1" />
      <img ng-src="assets/site/stars/{{hoverStars >= 2 || selectedStars >= 2 ? 'star' : 'estar'}}.png" style="float:left;height:100%;" ng-mouseover="hoverStars = 2" ng-mouseleave="hoverStars = selectedStars" ng-click="selectedStars=2"/>
      <img ng-src="assets/site/stars/{{hoverStars >= 3 || selectedStars >= 3 ? 'star' : 'estar'}}.png" style="float:left;height:100%;" ng-mouseover="hoverStars = 3" ng-mouseleave="hoverStars = selectedStars" ng-click="selectedStars=3"/>
      <img ng-src="assets/site/stars/{{hoverStars >= 4 || selectedStars >= 4 ? 'star' : 'estar'}}.png" style="float:left;height:100%;" ng-mouseover="hoverStars = 4" ng-mouseleave="hoverStars = selectedStars" ng-click="selectedStars=4"/>
      <img ng-src="assets/site/stars/{{hoverStars >= 5 || selectedStars >= 5 ? 'star' : 'estar'}}.png" style="float:left;height:100%;" ng-mouseover="hoverStars = 5" ng-mouseleave="hoverStars = selectedStars" ng-click="selectedStars=5"/>

          </div>
      <button type="button" class="btn btn-primary" style="margin-top:5px;margin-bottom:5px;" ng-click="productSearch='';selectedStars=1;hoverStars=1;">Clear Search</button>
      <h3>Sort by</h3>
      <select style="height:30px;width:150px;" ng-model="sortBy">
  <option value="-Price" >Price High to Low</option>
  <option value="Price" >Price Low to High</option>

  <option value="-Rating">Rating</option>
  <option value="-NumInStock">Quantity In Stock</option>
            <option value="Name">Name</option>

</select>

  </div>
                    </form>
            </div>
            <div class="container-fluid" style="bottom:0;width:80%;margin:0;float:right;">
        <div ng-repeat="data in dataRecieved | filter:productSearch | orderBy:sortBy" ng-show="data.Rating >= selectedStars">
            <div style="position:relative;height:10%;width:45%;margin-left:3%;margin-top:3%;background-color:lightblue;float:left;top:0;border:1px solid black">
           <div style="height:100%;width:100%;margin-left:10px;">
                <h2> {{data.Name}} </h2>
           
            <h3>{{data.Price | currency}}</h3>
                <div ng-repeat="n in [] | range:data.Rating">
                    <img ng-src="assets/site/stars/star.png" style="width:20px;float:left;" />
                </div>
                <br />
               
                <img style="position:relative;height:300px;max-width:90%;margin:10px;" align="middle" ng-src="img/phones/{{data.Photo}}" />
                
               <h4> {{"In Stock: " + data.InStock}}</h4>
                
               <h4> {{"Number In Stock: " + data.NumInStock}}</h4>
        </div>
                            <button type="button" class="btn btn-primary" ng-hide="getBasketIndex($storage.products,data.Name) >= 0"  ng-click="$storage.products.push(data);$storage.products[getBasketIndex($storage.products,data.Name)]['Quantity'] = 1;" style="float:right;position:relative;margin:5px;">Add to Cart</button>
                            <button type="button" class="btn btn-primary" ng-show="getBasketIndex($storage.products,data.Name) >= 0"  ng-click="$storage.products.splice(getBasketIndex($storage.products,data.Name),1);" style="float:right;position:relative;margin:5px;">Remove to Cart</button>

                </div>

        </div>
       </div>

        <asp:Label runat="server" id="Message"></asp:Label>
            <button ng-click="toCheckOut()" style="position:fixed;right:0;bottom:0;margin:5px;" type="button" class="btn btn-primary"><h3>Check Out</h3></button>
        </div>
</asp:Content>

