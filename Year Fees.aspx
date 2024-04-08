<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Year Fees.aspx.cs" Inherits="WebApplication2.Admin.Year_Fees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">


    <div style="background-image:url('../image/bg3.jpg');width:100%;height:720px;background-repeat:no-repeat;background-size:cover;background-attachment:fixed;">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
            <h3 class="text-center"> Year Fees </h3>
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                
                  <div class="col-md-6">
                    <label for="ddlClass">Year</label>
               
                      <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control"></asp:DropDownList>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Year is Required." 
                          ControlToValidate="ddlClass" Display="Dynamic" ForeColor="Red" InitialValue="Select Year" SetFocusOnError="True">

                      </asp:RequiredFieldValidator>
                </div>
                <div class="col-md-6">
                    <label for="txtFeeAmounts">Fees(Annual)</label>
                    <asp:TextBox ID ="txtFeeAmounts" runat="server" CssClass="form-control" placeholder="Enter Fees Amount" TextMode="Number" required></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3 mr-lg-5 ml-lg-5">
             <div class="col-md-3 col-md-offset-2 mb-3">
                 <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block"  BackColor="#5558C9" Text="Add Class Year" OnClick="btnAdd_Click1"/>

                </div>
             </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5">
               <div class="col-md-6">
             
                   <asp:GridView ID="GridView1" runat="server" DataKeyNames ="Fees ID" CssClass="table table-hover table-bordered"
    EmptyDataText="No record to display yet!" AutoGenerateColumns="False" AllowPaging="true" PageSize="4"
    BackColor="WhiteSmoke" ForeColor="Black" OnPageIndexChanging="GridView1_PageIndexChanging"
    OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting"
    OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
   
   



    <Columns>

        <asp:TemplateField HeaderText="Sr.No">
        <ItemTemplate>
            <%# Container.DataItemIndex + 1 %>
        </ItemTemplate>
        <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
        

        <asp:BoundField DataField="Year Name" HeaderText="Year" ReadOnly="True">
            <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>

        <asp:TemplateField HeaderText="Fees(Monthly)">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("Fees amount") %>' CssClass="form-control"></asp:TextBox>
            </EditItemTemplate>

            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Fees amount") %>'></asp:Label>
            </ItemTemplate>

            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>

        <asp:CommandField CausesValidation="false" HeaderText="Operations" ShowDeleteButton="True" ShowEditButton="True">
            <ItemStyle HorizontalAlign="Center" />
        </asp:CommandField>
    </Columns>

    <HeaderStyle BackColor="#5558C9" ForeColor="White" />
</asp:GridView>


                 
                 </div>
             </div>





        </div>
   </div>


</asp:Content>
