<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Year books.aspx.cs" Inherits="WebApplication2.Admin.Year_books" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

     <div style="background-image:url('../image/bg3.jpg');width:100%;height:720px;background-repeat:no-repeat;background-size:cover;background-attachment:fixed;">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
            <h3 class="text-center"> Year Books </h3>
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                
                  <div class="col-md-6">
                    <label for="ddlClass">Year</label>
               
                      <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control"></asp:DropDownList>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Year is Required." 
                          ControlToValidate="ddlClass" Display="Dynamic" ForeColor="Red" InitialValue="Select Year" SetFocusOnError="True">

                      </asp:RequiredFieldValidator>
                </div>
                <div class="col-md-6">
                    <label for="txtSubject">Book</label>
                    <asp:TextBox ID ="txtSubject" runat="server" CssClass="form-control" placeholder="Enter Book Name" required></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3 mr-lg-5 ml-lg-5">
             <div class="col-md-3 col-md-offset-2 mb-3">
                 <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block"  BackColor="#5558C9" Text="Add Book" OnClick="btnAdd_Click1"/>

                </div>
             </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5">
               <div class="col-md-6">
                   <asp:GridView ID ="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No record to display yet!"
                       AutoGenerateColumns="False" AllowPaging="True" PageSize="4" BackColor="WhiteSmoke" ForeColor="Black" 
                       OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" DataKeyNames="Book ID" 
                       OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting">
                       <Columns>
                         
                             <asp:TemplateField HeaderText="Sr.No">
        <ItemTemplate>
            <%# Container.DataItemIndex + 1 %>
        </ItemTemplate>
        <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
                           <asp:TemplateField HeaderText="Year">
                               <EditItemTemplate>
                                   <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Year Name" 
                                       DataValueField="Year id" SelectedValue='<%# Eval("Year id") %>' CssClass="form-control">
                                   </asp:DropDownList>
                                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CollegeCS %>" ProviderName="<%$ ConnectionStrings:CollegeCS.ProviderName %>" SelectCommand="SELECT * FROM [y_Year]"></asp:SqlDataSource>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="Label2" runat="server" Text='<%# Eval("Year id") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="Book">
                               <EditItemTemplate>
                                   <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("Book Name") %>' CssClass="form-control"></asp:TextBox>
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:Label ID="Label1" runat="server" Text='<%# Eval("Book Name") %>'></asp:Label>
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" />
                           </asp:TemplateField>
                           <asp:CommandField CausesValidation="false" HeaderText="Operations" ShowEditButton="True" showDeleteButton="True">
                           <ItemStyle HorizontalAlign="Center" />
                           </asp:CommandField>
                       </Columns>
                        <HeaderStyle BackColor="#5558C9" ForeColor="White" />
                   </asp:GridView>
                 
                 </div>
             </div>



            <div class="row mb-3 mr-lg-5 ml-lg-5">
        <div class="col-md-6">
            <asp:Label ID="lblSelectedValue" runat="server" Text=""></asp:Label>
        </div>
    </div>


        </div>
   </div>



</asp:Content>
