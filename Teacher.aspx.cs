using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using static WebApplication2.Models.Commonfn;
namespace WebApplication2.Admin
{
    public partial class Teacher : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetTeachers();
            }
        }

        private void GetTeachers()
        {
            string query = @"SELECT [Teacher ID], [Teacher Name], [Date of Birth], 
                             [Gender], [contact info], [Address], [Email] FROM t_Teacher";
            DataTable dt = fn.Fetch(query);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string teacherName = txtTeacherName.Text;
           
            string dob = txtDateOfBirth.Text;
            string gender = ddlGender.SelectedValue;
            string contactInfo = txtContactInfo.Text;
            string address = txtAddress.Text;
            string email = txtEmail.Text;

           
            string insertQuery = $@"INSERT INTO t_Teacher ([Teacher Name], [Date of Birth], 
                              [Gender], [contact info], [Address], [Email]) 
                              VALUES ('{teacherName.Replace("'", "''")}', '{dob}', 
                                      '{gender}', '{contactInfo.Replace("'", "''")}', '{address.Replace("'", "''")}', '{email.Replace("'", "''")}')";
            try
            {
                fn.Query(insertQuery);

                lblMsg.Text = "Teacher Added Successfully!";
                lblMsg.CssClass = "alert alert-success";
            }
            catch (SqlException ex)
            {
                lblMsg.Text = "An SQL error occurred: " + ex.Message;
                lblMsg.CssClass = "alert alert-danger";
            }
            catch (Exception ex)
            {
                lblMsg.Text = "An error occurred: " + ex.Message;
                lblMsg.CssClass = "alert alert-danger";
            }

            ClearForm();
            GetTeachers();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetTeachers(); 
        }

        private void ClearForm()
        {
            txtTeacherName.Text = "";
           
            txtDateOfBirth.Text = "";
            ddlGender.SelectedIndex = 0;
            txtContactInfo.Text = "";
            txtAddress.Text = "";
            txtEmail.Text = "";
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetTeachers();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetTeachers();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int teacherId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            string teacherName = (row.FindControl("txtTeacherNameEdit") as TextBox).Text.Replace("'", "''");
           // string cnic = (row.FindControl("txtCNICEdit") as TextBox).Text.Replace("'", "''");
            string dob = (row.FindControl("txtDateOfBirthEdit") as TextBox).Text.Replace("'", "''");
            string gender = (row.FindControl("ddlGenderEdit") as DropDownList).SelectedValue.Replace("'", "''");
            string contactInfo = (row.FindControl("txtContactInfoEdit") as TextBox).Text.Replace("'", "''");
            string address = (row.FindControl("txtAddressEdit") as TextBox).Text.Replace("'", "''");
            string email = (row.FindControl("txtEmailEdit") as TextBox).Text.Replace("'", "''");

            string updateQuery = $@"UPDATE t_Teacher SET [Teacher Name] = '{teacherName}',  
                            [Date of Birth] = '{dob}', [Gender] = '{gender}', [contact info] = '{contactInfo}', 
                            [Address] = '{address}', [Email] = '{email}' WHERE [Teacher ID] = {teacherId}";

            fn.Query(updateQuery);

            GridView1.EditIndex = -1;
            GetTeachers();
            lblMsg.Text = "Teacher Updated Successfully!";
            lblMsg.CssClass = "alert alert-success";
        }


        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int teacherId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            string deleteQuery = $@"DELETE FROM t_Teacher WHERE [Teacher ID] = {teacherId}";

            fn.Query(deleteQuery);

            GetTeachers();
            lblMsg.Text = "Teacher Deleted Successfully!";
            lblMsg.CssClass = "alert alert-success";
        }

        // Implement GridView1_PageIndexChanging if paging is required
        // ...
    }
}
