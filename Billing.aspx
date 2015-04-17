<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Billing.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div ng-controller="billing" class="container-fluid" style="background-color: white; width: 80%; height: 100%;">
        
        <div style="width:30%;float:left;margin-right:15%;">
             <h2>Billing Address</h2>
         <div class="form-group" style="margin-top:20px">
    <label for="Address">Address</label>
    <asp:TextBox runat="server" type="text" CssClass="form-control" ID="Address"  placeholder="2222 22nd St."/>
  </div>
        <div class="form-group">
    <label for="City">City</label>
    <asp:TextBox runat="server" type="text" CssClass="form-control" ID="City" placeholder="Carrollton"/>
           
  </div>
  <div class="form-group">
    <label for="State">State</label>
    <asp:DropDownList ID="DropDownListState" CssClass="form-control" runat="server">
	<asp:ListItem Value="Alabama">Alabama</asp:ListItem>
	<asp:ListItem Value="Alaska">Alaska</asp:ListItem>
	<asp:ListItem Value="Arizona">Arizona</asp:ListItem>
	<asp:ListItem Value="Arkansas">Arkansas</asp:ListItem>
	<asp:ListItem Value="California">California</asp:ListItem>
	<asp:ListItem Value="Colorado">Colorado</asp:ListItem>
	<asp:ListItem Value="Connecticut">Connecticut</asp:ListItem>
	<asp:ListItem Value="District of Columbia">District of Columbia</asp:ListItem>
	<asp:ListItem Value="Delaware">Delaware</asp:ListItem>
	<asp:ListItem Value="Florida">Florida</asp:ListItem>
	<asp:ListItem Value="Georgia">Georgia</asp:ListItem>
	<asp:ListItem Value="Hawaii">Hawaii</asp:ListItem>
	<asp:ListItem Value="Idaho">Idaho</asp:ListItem>
	<asp:ListItem Value="Illinois">Illinois</asp:ListItem>
	<asp:ListItem Value="Indiana">Indiana</asp:ListItem>
	<asp:ListItem Value="Iowa">Iowa</asp:ListItem>
	<asp:ListItem Value="Kansas">Kansas</asp:ListItem>
	<asp:ListItem Value="Kentucky">Kentucky</asp:ListItem>
	<asp:ListItem Value="Louisiana">Louisiana</asp:ListItem>
	<asp:ListItem Value="Maine">Maine</asp:ListItem>
	<asp:ListItem Value="Maryland">Maryland</asp:ListItem>
	<asp:ListItem Value="Massachusetts">Massachusetts</asp:ListItem>
	<asp:ListItem Value="Michigan">Michigan</asp:ListItem>
	<asp:ListItem Value="Minnesota">Minnesota</asp:ListItem>
	<asp:ListItem Value="Mississippi">Mississippi</asp:ListItem>
	<asp:ListItem Value="Missouri">Missouri</asp:ListItem>
	<asp:ListItem Value="Montana">Montana</asp:ListItem>
	<asp:ListItem Value="Nebraska">Nebraska</asp:ListItem>
	<asp:ListItem Value="Nevada">Nevada</asp:ListItem>
	<asp:ListItem Value="New Hampshire">New Hampshire</asp:ListItem>
	<asp:ListItem Value="New Jersey">New Jersey</asp:ListItem>
	<asp:ListItem Value="New Mexico">New Mexico</asp:ListItem>
	<asp:ListItem Value="New York">New York</asp:ListItem>
	<asp:ListItem Value="North Carolina">North Carolina</asp:ListItem>
	<asp:ListItem Value="North Dakota">North Dakota</asp:ListItem>
	<asp:ListItem Value="Ohio">Ohio</asp:ListItem>
	<asp:ListItem Value="Oklahoma">Oklahoma</asp:ListItem>
	<asp:ListItem Value="Oregon">Oregon</asp:ListItem>
	<asp:ListItem Value="Pennsylvania">Pennsylvania</asp:ListItem>
	<asp:ListItem Value="Rhode Island">Rhode Island</asp:ListItem>
	<asp:ListItem Value="South Carolina">South Carolina</asp:ListItem>
	<asp:ListItem Value="South Dakota">South Dakota</asp:ListItem>
	<asp:ListItem Value="Tennessee">Tennessee</asp:ListItem>
	<asp:ListItem Value="Texas">Texas</asp:ListItem>
	<asp:ListItem Value="Utah">Utah</asp:ListItem>
	<asp:ListItem Value="Vermont">Vermont</asp:ListItem>
	<asp:ListItem Value="Virginia">Virginia</asp:ListItem>
	<asp:ListItem Value="Washington">Washington</asp:ListItem>
	<asp:ListItem Value="West Virginia">West Virginia</asp:ListItem>
	<asp:ListItem Value="Wisconsin">Wisconsin</asp:ListItem>
	<asp:ListItem Value="Wyoming">Wyoming</asp:ListItem>
</asp:DropDownList>

  </div>
             
<input type="checkbox"  ng-model="sameAsBilling" />     
             Shipping Address Same as Billing      
             
               <br />
            <asp:Button runat="server" OnClick="Clear_Form" CssClass="btn btn-warning" Text="Clear Form" />
  <asp:Button ng-show="sameAsBilling" OnClick="Submit_Click"  runat="server"  class="btn btn-primary" text="submit"></asp:Button>
    <asp:Label style="color:red" runat="server" id="error"></asp:Label>
         </div>
   














    <div ng-hide="sameAsBilling" style="width:30%;position:relative;float:left;">
         <div class="form-group" style="margin-top:20px">
             <h2>Shipping Address</h2>
    <label for="Address">Address</label>
    <asp:TextBox runat="server" type="text" CssClass="form-control" ID="SAddress"  placeholder="2222 22nd St."/>
  </div>
        <div class="form-group">
    <label for="City">City</label>
    <asp:TextBox runat="server" type="text" CssClass="form-control" ID="SCity" placeholder="Carrollton"/>
           
  </div>
  <div class="form-group">
    <label for="State">State</label>
    <asp:DropDownList ID="SDropDownListState" CssClass="form-control" runat="server">
	<asp:ListItem Value="Alabama">Alabama</asp:ListItem>
	<asp:ListItem Value="Alaska">Alaska</asp:ListItem>
	<asp:ListItem Value="Arizona">Arizona</asp:ListItem>
	<asp:ListItem Value="Arkansas">Arkansas</asp:ListItem>
	<asp:ListItem Value="California">California</asp:ListItem>
	<asp:ListItem Value="Colorado">Colorado</asp:ListItem>
	<asp:ListItem Value="Connecticut">Connecticut</asp:ListItem>
	<asp:ListItem Value="District of Columbia">District of Columbia</asp:ListItem>
	<asp:ListItem Value="Delaware">Delaware</asp:ListItem>
	<asp:ListItem Value="Florida">Florida</asp:ListItem>
	<asp:ListItem Value="Georgia">Georgia</asp:ListItem>
	<asp:ListItem Value="Hawaii">Hawaii</asp:ListItem>
	<asp:ListItem Value="Idaho">Idaho</asp:ListItem>
	<asp:ListItem Value="Illinois">Illinois</asp:ListItem>
	<asp:ListItem Value="Indiana">Indiana</asp:ListItem>
	<asp:ListItem Value="Iowa">Iowa</asp:ListItem>
	<asp:ListItem Value="Kansas">Kansas</asp:ListItem>
	<asp:ListItem Value="Kentucky">Kentucky</asp:ListItem>
	<asp:ListItem Value="Louisiana">Louisiana</asp:ListItem>
	<asp:ListItem Value="Maine">Maine</asp:ListItem>
	<asp:ListItem Value="Maryland">Maryland</asp:ListItem>
	<asp:ListItem Value="Massachusetts">Massachusetts</asp:ListItem>
	<asp:ListItem Value="Michigan">Michigan</asp:ListItem>
	<asp:ListItem Value="Minnesota">Minnesota</asp:ListItem>
	<asp:ListItem Value="Mississippi">Mississippi</asp:ListItem>
	<asp:ListItem Value="Missouri">Missouri</asp:ListItem>
	<asp:ListItem Value="Montana">Montana</asp:ListItem>
	<asp:ListItem Value="Nebraska">Nebraska</asp:ListItem>
	<asp:ListItem Value="Nevada">Nevada</asp:ListItem>
	<asp:ListItem Value="New Hampshire">New Hampshire</asp:ListItem>
	<asp:ListItem Value="New Jersey">New Jersey</asp:ListItem>
	<asp:ListItem Value="New Mexico">New Mexico</asp:ListItem>
	<asp:ListItem Value="New York">New York</asp:ListItem>
	<asp:ListItem Value="North Carolina">North Carolina</asp:ListItem>
	<asp:ListItem Value="North Dakota">North Dakota</asp:ListItem>
	<asp:ListItem Value="Ohio">Ohio</asp:ListItem>
	<asp:ListItem Value="Oklahoma">Oklahoma</asp:ListItem>
	<asp:ListItem Value="Oregon">Oregon</asp:ListItem>
	<asp:ListItem Value="Pennsylvania">Pennsylvania</asp:ListItem>
	<asp:ListItem Value="Rhode Island">Rhode Island</asp:ListItem>
	<asp:ListItem Value="South Carolina">South Carolina</asp:ListItem>
	<asp:ListItem Value="South Dakota">South Dakota</asp:ListItem>
	<asp:ListItem Value="Tennessee">Tennessee</asp:ListItem>
	<asp:ListItem Value="Texas">Texas</asp:ListItem>
	<asp:ListItem Value="Utah">Utah</asp:ListItem>
	<asp:ListItem Value="Vermont">Vermont</asp:ListItem>
	<asp:ListItem Value="Virginia">Virginia</asp:ListItem>
	<asp:ListItem Value="Washington">Washington</asp:ListItem>
	<asp:ListItem Value="West Virginia">West Virginia</asp:ListItem>
	<asp:ListItem Value="Wisconsin">Wisconsin</asp:ListItem>
	<asp:ListItem Value="Wyoming">Wyoming</asp:ListItem>
</asp:DropDownList>

  </div>


  <asp:Button  runat="server" OnClick="SSubmit_Click" class="btn btn-primary" text="submit"></asp:Button>
    <asp:Label style="color:red" runat="server" ID="Serror" ></asp:Label>
         </div>
    </div>

     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"   ConnectionString="<%$ ConnectionStrings:UserConnection %>" 
     InsertCommand="INSERT INTO [Billing] (Email, Address, City, State) VALUES (@Email, @Address, @City, @State)"
     OldValuesParameterFormatString="original_{0}" 
     ProviderName="<%$ ConnectionStrings:UserConnection %>">
        <InsertParameters>
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
           
        </InsertParameters>
     </asp:SqlDataSource>

     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues"   ConnectionString="<%$ ConnectionStrings:UserConnection %>" 
     InsertCommand="INSERT INTO [Shipping] (Email, Address, City, State) VALUES (@Email, @SAddress, @SCity, @SState)"
     OldValuesParameterFormatString="original_{0}" 
     ProviderName="<%$ ConnectionStrings:UserConnection %>">
        <InsertParameters>
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
           
        </InsertParameters>
     </asp:SqlDataSource>

     <asp:SqlDataSource ID="SqlDataSource3" runat="server"  ConnectionString="<%$ ConnectionStrings:AdminConnection %>" SelectCommand="SELECT [Email], [Address], [City], [State] FROM [Billing] WHERE ([Email] = @Email)">
        <SelectParameters>
            <asp:Parameter Name="Email" Type="String" />
        </SelectParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server"  ConnectionString="<%$ ConnectionStrings:AdminConnection %>" SelectCommand="SELECT [Email], [Address], [City], [State] FROM [Shipping] WHERE ([Email] = @Email)">
        <SelectParameters>
            <asp:Parameter Name="Email" Type="String" />
        </SelectParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:AdminConnection %>"
            SelectCommand="SELECT [Email], [Address], [City], [State] FROM [Shipping] WHERE ([Email] = @Email)"
            UpdateCommand="UPDATE [Shipping] SET [Address] = @Address, [City] = @City, [State] = @State WHERE [Email] = @Email" DeleteCommand="DELETE FROM [Shipping] WHERE (Email = @Email)" InsertCommand="INSERT INTO [Shipping](Email, Address, City, State) VALUES (@Email, @Address, @City, @State)">
            <UpdateParameters>
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
            </UpdateParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="Email" QueryStringField="Email" Type="String" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="Email" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Email" />
                <asp:Parameter Name="Address" />
                <asp:Parameter Name="City" />
                <asp:Parameter Name="State" />
            </InsertParameters>
        </asp:SqlDataSource>
     <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:AdminConnection %>"
            SelectCommand="SELECT [Email], [Address], [City], [State] FROM [Billing] WHERE ([Email] = @Email)"
            UpdateCommand="UPDATE [Billing] SET [Address] = @Address, [City] = @City, [State] = @State WHERE [Email] = @Email" DeleteCommand="DELETE FROM [Billing] WHERE (Email = @Email)" InsertCommand="INSERT INTO [Billing](Email, Address, City, State) VALUES (@Email, @Address, @City, @State)">
            <UpdateParameters>
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
            </UpdateParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="Email" QueryStringField="Email" Type="String" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="Email" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Email" />
                <asp:Parameter Name="Address" />
                <asp:Parameter Name="City" />
                <asp:Parameter Name="State" />
            </InsertParameters>
        </asp:SqlDataSource>
     <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConflictDetection="CompareAllValues"   ConnectionString="<%$ ConnectionStrings:UserConnection %>" 
     InsertCommand="INSERT INTO [Shipping] (Email, Address, City, State) VALUES (@Email, @Address, @City, @State)"
     OldValuesParameterFormatString="original_{0}" 
     ProviderName="<%$ ConnectionStrings:UserConnection %>">
        <InsertParameters>
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
           
        </InsertParameters>
     </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConflictDetection="CompareAllValues"   ConnectionString="<%$ ConnectionStrings:UserConnection %>" 
     InsertCommand="INSERT INTO [Billing] (Email, Address, City, State) VALUES (@Email, @Address, @City, @State)"
     OldValuesParameterFormatString="original_{0}" 
     ProviderName="<%$ ConnectionStrings:UserConnection %>">
        <InsertParameters>
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
           
        </InsertParameters>
     </asp:SqlDataSource>
</asp:Content>

