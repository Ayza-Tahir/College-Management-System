using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static WebApplication2.Models.Commonfn;

namespace WebApplication2.Admin
{
    public partial class Class_Year : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx(); 

        protected void Page_Load(object sender, EventArgs e)
        {
            

            if(!IsPostBack)
            {
                GetClass();
            }
        }

        private void GetClass()
        {
            DataTable dt = fn.Fetch("Select Row_Number() over(Order by(select 1)) as [Sr.No],[Year id],[Year Name] from y_Year ");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

            try
            {
                DataTable dt = fn.Fetch("Select * from y_Year where [Year Name] = '"+txtClass.Text.Trim()+"'");
                if(dt.Rows.Count==0)
                {
                    string query = "Insert into y_Year Values('" + txtClass.Text.Trim() + "')";
                    fn.Query(query);
                    lblMsg.Text = "Inserted Successfully!";
                    lblMsg.CssClass = "alert alert.success";
                    txtClass.Text = string.Empty;
                    GetClass();
                }
                else
                {
                    lblMsg.Text = "Enter Year already exists!";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message+"');</script>");
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetClass();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetClass();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int cId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string YearName = (row.FindControl("txtYearEdit") as TextBox).Text;
                fn.Query("Update y_Year set [Year Name] = '" + YearName+"' where [Year id]='" + cId + "'");
                lblMsg.Text = "Year Updated Successfully!";
                lblMsg.CssClass = "alert alert.success";
                GridView1.EditIndex = -1;
                GetClass();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int yearId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
                string deleteQuery = $"DELETE FROM y_Year WHERE [Year id] = {yearId}";

                fn.Query(deleteQuery);

                lblMsg.Text = "Year Deleted Successfully!";
                lblMsg.CssClass = "alert alert-success";
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Error in deleting year: " + ex.Message;
                lblMsg.CssClass = "alert alert-danger";
            }
            GetClass(); // Refresh GridView data
        }


    }
}