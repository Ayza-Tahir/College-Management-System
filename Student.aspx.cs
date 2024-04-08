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
    public partial class Student : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetStudents();
            }
        }

        private void GetStudents()
        {
            string query = @"SELECT [Student ID], [Roll no], [Student Name], [Year ID], [Date of Birth], [Gender], [Contact_info], [Address] FROM s_Student";
            DataTable dt = fn.Fetch(query);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string studentName = txtStudentName.Text;
            string rollNo = txtRollNo.Text;
            string dob = txtDateOfBirth.Text;
            string gender = ddlGender.SelectedValue;
            string contactInfo = txtContactInfo.Text;
            string address = txtAddress.Text;
            string yearId = txtYear.Text;

            string insertQuery = $@"INSERT INTO s_Student ([Roll no], [Student Name], [Year ID], [Date of Birth], [Gender], [Contact_info], [Address]) 
                              VALUES ('{rollNo}', '{studentName.Replace("'", "''")}', '{yearId}', '{dob}', '{gender}', '{contactInfo.Replace("'", "''")}', '{address.Replace("'", "''")}')";
            try
            {
                fn.Query(insertQuery);
                lblMsg.Text = "Student Added Successfully!";
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
            GetStudents();
        }

        private void ClearForm()
        {
            txtStudentName.Text = "";
            txtRollNo.Text = "";
            txtDateOfBirth.Text = "";
            ddlGender.SelectedIndex = 0;
            txtContactInfo.Text = "";
            txtAddress.Text = "";
            txtYear.Text = "";
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetStudents();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetStudents();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int studentId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            string studentName = (row.FindControl("txtStudentNameEdit") as TextBox).Text.Replace("'", "''");
            string rollNo = (row.FindControl("txtRollnoEdit") as TextBox).Text.Replace("'", "''");
            string dob = (row.FindControl("txtDateOfBirthEdit") as TextBox).Text.Replace("'", "''");
            string gender = (row.FindControl("ddlGenderEdit") as DropDownList).SelectedValue.Replace("'", "''");
            string contactInfo = (row.FindControl("txtContactInfoEdit") as TextBox).Text.Replace("'", "''");
            string address = (row.FindControl("txtAddressEdit") as TextBox).Text.Replace("'", "''");
            string yearId = (row.FindControl("txtYearEdit") as TextBox).Text.Replace("'", "''");

            string updateQuery = $@"UPDATE s_Student SET [Roll no] = '{rollNo}', [Student Name] = '{studentName}', 
                            [Year ID] = '{yearId}', [Date of Birth] = '{dob}', [Gender] = '{gender}', [Contact_info] = '{contactInfo}', 
                            [Address] = '{address}' WHERE [Student ID] = {studentId}";

            fn.Query(updateQuery);

            GridView1.EditIndex = -1;
            GetStudents();
            lblMsg.Text = "Student Updated Successfully!";
            lblMsg.CssClass = "alert alert-success";
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int studentId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            string deleteQuery = $@"DELETE FROM s_Student WHERE [Student ID] = {studentId}";

            fn.Query(deleteQuery);

            GetStudents();
            lblMsg.Text = "Student Deleted Successfully!";
            lblMsg.CssClass = "alert alert-success";
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetStudents();
        }

        // Additional methods as needed
    }
}
