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
    public partial class Year_books : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetClass();
                GetSubject();
            }
        }

        private void GetClass()

        {
            DataTable dt = fn.Fetch("Select * From y_Year");
            ddlClass.DataSource = dt;
            ddlClass.DataTextField = "Year Name";
            ddlClass.DataValueField = "Year id";
            ddlClass.DataBind();
            ddlClass.Items.Insert(0, "Select Year");
        }

        protected void btnAdd_Click1(object sender, EventArgs e)
        {
            try
            {

                string YearVal = ddlClass.SelectedItem.Text;
                DataTable dt = fn.Fetch("Select * from b_Books where [Year ID] = '" + ddlClass.SelectedItem.Value +
                                  "' and [Book Name] ='"+txtSubject.Text.Trim()+"' ");

                if (dt.Rows.Count == 0)
                {
                    string query = "INSERT INTO b_Books ([Year ID], [Book Name]) VALUES ('" + ddlClass.SelectedItem.Value + "', '" + txtSubject.Text.Trim() + "')";

                   // string query = "Insert into b_Books Values('" + ddlClass.SelectedItem.Value + "','" + txtSubject.Text.Trim() + "')";
                    fn.Query(query);
                    lblMsg.Text = "Inserted Successfully!";
                    lblMsg.CssClass = "alert alert-success";
                    ddlClass.SelectedIndex = 0;
                    txtSubject.Text = string.Empty;
                    GetSubject();
                }
                else
                {
                    lblMsg.Text = "Entered book already exists for <b>'" + YearVal + "'</b>!";
                    lblMsg.CssClass = "alert alert-danger";
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        private void GetSubject()
        {
            DataTable dt = fn.Fetch(@"Select b.[Book ID] , y.[Year id],b.[Book Name]
                            from b_Books b
                             inner join y_Year y on y.[Year id] = b.[Year ID] ");
            // DataTable dt = fn.Fetch("Select [Fees ID],[Year ID],[Fees amount] From f_fees");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetSubject();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetSubject();
        }

       

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetSubject();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int subjId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string yearId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("DropDownList1")).SelectedValue;
                string subjName = (row.FindControl("TextBox1") as TextBox).Text;
                fn.Query("UPDATE b_Books SET [Year ID] = '" + yearId + "', [Book Name] ='" + subjName + "' WHERE [Book ID] ='" + subjId + "'");

               


                lblMsg.Text = "Book Updated Successfully!";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetSubject();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int bookId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
                string deleteQuery = $"DELETE FROM b_Books WHERE [Book ID] = {bookId}";

                fn.Query(deleteQuery);

                lblMsg.Text = "Book Deleted Successfully!";
                lblMsg.CssClass = "alert alert-success";
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Error in deleting book: " + ex.Message;
                lblMsg.CssClass = "alert alert-danger";
            }
            GetSubject(); // Refresh GridView data
        }


    }
}
