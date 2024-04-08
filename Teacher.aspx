
<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Teacher.aspx.cs" Inherits="WebApplication2.Admin.Teacher"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div style="background-image:url('../image/bg3.jpg'); width:100%; height:720px; background-repeat:no-repeat; background-size:cover; background-attachment:fixed;">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblMsg" runat="server" CssClass="alert"></asp:Label>
            </div>
            <h3 class="text-center">Teachers</h3>

            <div class="row mb-3">
               
                <div class="col-md-6">
                    <label for="txtTeacherName">Teacher Name:</label>
                    <asp:TextBox ID="txtTeacherName" runat="server" CssClass="form-control" placeholder="Enter Teacher Name" required></asp:TextBox>
                </div>
               
                <div class="col-md-6">
                    <label for="ddlGender">Gender:</label>
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0">Select Gender</asp:ListItem>
                        <asp:ListItem Value="Male">Male</asp:ListItem>
                        <asp:ListItem Value="Female">Female</asp:ListItem>
                        <asp:ListItem Value="Other">Other</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            

            <div class="row mb-3 mr-lg-5 ml-lg-5">
  
    
   
    <div class="col-md-6">
        <label for="txtDateOfBirth">Date of Birth:</label>
        <asp:TextBox ID="txtDateOfBirth" runat="server" CssClass="form-control" TextMode="Date" placeholder="Enter Date of Birth" required></asp:TextBox>
    </div>
</div>

<div class="row mb-3 mr-lg-5 ml-lg-5">
   
    <div class="col-md-6">
        <label for="txtContactInfo">Contact Info:</label>
        <asp:TextBox ID="txtContactInfo" runat="server" CssClass="form-control" placeholder="Enter Contact Info" required></asp:TextBox>
    
        <asp:RegularExpressionValidator ID="revPhoneNumber" runat="server" ControlToValidate="txtContactInfo"
                               ValidationExpression="^\d{11}$" ErrorMessage="Phone number must be 11 digits" 
                               CssClass="text-danger" Display="Dynamic">*</asp:RegularExpressionValidator>
    
        </div>

    <div class="col-md-6">
        <label for="txtEmail">Email:</label>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email" required></asp:TextBox>
    </div>
</div>

<div class="row mb-3 mr-lg-5 ml-lg-5">
    
    <div class="col-md-12">
        <label for="txtAddress">Address:</label>
        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Enter Address" required></asp:TextBox>
    </div>
</div>

           

<div class="row mb-3 mr-lg-5 ml-lg-5">
    <div class="col-md-3 col-md-offset-2 mb-3">
        <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary btn-block"  BackColor="#5558C9" Text="Add Teacher" OnClick="btnAdd_Click" />
    </div>
</div>

            

            <div class="row">
    <div class="col-md-12">
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered"
                      AutoGenerateColumns="False" AllowPaging="True" PageSize="4" BackColor="WhiteSmoke" ForeColor="Black"
                      DataKeyNames="Teacher ID" OnPageIndexChanging="GridView1_PageIndexChanging"
                      OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing"
                      OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                
                  <asp:TemplateField HeaderText="Sr.No">
        <ItemTemplate>
            <%# Container.DataItemIndex + 1 %>
        </ItemTemplate>
        <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>

                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label ID="lblTeacherName" runat="server" Text='<%# Eval("Teacher Name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTeacherNameEdit" runat="server" Text='<%# Eval("Teacher Name") %>' CssClass="form-control"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                
                

                <asp:TemplateField HeaderText="Date of Birth">
                    <ItemTemplate>
                        <asp:Label ID="lblDateOfBirth" runat="server" Text='<%# Eval("Date Of Birth") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDateOfBirthEdit" runat="server" Text='<%#Eval("Date Of Birth") %>' CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>





                <asp:TemplateField HeaderText="Gender">
                    <ItemTemplate>
                        <asp:Label ID="lblGender" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlGenderEdit" runat="server" CssClass="form-control" SelectedValue='<%# Eval("Gender") %>'>
                            <asp:ListItem Value="Male">Male</asp:ListItem>
                            <asp:ListItem Value="Female">Female</asp:ListItem>
                            <asp:ListItem Value="Other">Other</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Contact Info">
                    <ItemTemplate>
                        <asp:Label ID="lblContactInfo" runat="server" Text='<%# Eval("contact info") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtContactInfoEdit" runat="server" Text='<%# Eval("contact info") %>' CssClass="form-control"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Address">
                    <ItemTemplate>
                        <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAddressEdit" runat="server" Text='<%# Eval("Address") %>' CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEmailEdit" runat="server" Text='<%# Eval("Email") %>' CssClass="form-control"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
            </Columns>
              <HeaderStyle BackColor="#5558C9" ForeColor="White" />
        </asp:GridView>
    </div>
</div>

        </div>
    </div>
</asp:Content>
