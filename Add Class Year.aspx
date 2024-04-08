<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Add Class Year.aspx.cs" Inherits="WebApplication2.Admin.Class_Year" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

     <div style="background-image:url('../image/bg3.jpg');width:100%;height:720px;background-repeat:no-repeat;background-size:cover;background-attachment:fixed;">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
            <h3 class="text-center"> Class Year </h3>
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                
                <div class="col-md-6">
                    <label for="txtClass">Year Name</label>
                    <asp:TextBox ID ="txtClass" runat="server" CssClass="form-control" placeholder="Enter Year Name" required></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3 mr-lg-5 ml-lg-5">
             <div class="col-md-3 col-md-offset-2 mb-3">
                 <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block"  BackColor="#5558C9" Text="Add Class Year" OnClick="btnAdd_Click" />

                </div>
             </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5">
               <div class="col-md-6">
                 <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered " BackColor="WhiteSmoke" ForeColor="Black" DataKeyNames="Year id" AutoGenerateColumns="False" 
                     EmptyDataText="No Record to Display" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" 
                     OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" AllowPaging="true" PageSize="4">
                     <Columns>
                         <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                         <ItemStyle HorizontalAlign="Center" />
                         </asp:BoundField>
                         <asp:TemplateField HeaderText="Year">
                             <EditItemTemplate>
                                
                                 <asp:TextBox ID="txtYearEdit" runat="server" Text='<%# Eval("Year Name") %>' CssClass="form-control"></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="lblYearName" runat="server" Text='<%# Eval("Year Name") %>'></asp:Label>
                             </ItemTemplate>
                             <HeaderStyle HorizontalAlign="Center" />
                         </asp:TemplateField>
                         <asp:CommandField CausesValidation="False" HeaderText="Operation" ShowEditButton="True" ShowDeleteButton="True" />
                     </Columns>
                     <HeaderStyle BackColor="#5558C9" ForeColor="White" />
                 </asp:GridView>
                 
                 </div>
             </div>

        </div>
   </div>

</asp:Content>
