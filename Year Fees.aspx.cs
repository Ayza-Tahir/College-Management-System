using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication2; // Assuming DatabaseUtils is in this namespace
using System.Configuration; // Include this
namespace WebApplication2.Admin
{
    public partial class Year_Fees : Page
    {
        private DatabaseUtils dbUtils;

        protected void Page_Load(object sender, EventArgs e)
        {
            string connString = ConfigurationManager.ConnectionStrings["CollegeCS"].ConnectionString;
            dbUtils = new DatabaseUtils(connString);

            if (!IsPostBack)
            {
                GetClass();
                GetCFees();
            }
        }

        private void GetClass()
        {
            try
            {
                // Define the SQL query with ROW_NUMBER() to generate a sequential Sr.No for each row
                string query = @"
            SELECT 
                ROW_NUMBER() OVER (ORDER BY [Year id]) AS [Sr.No], 
                [Year id], 
                [Year Name] 
            FROM 
                y_Year";

                // Execute the query and get the result in a DataTable
                DataTable dt = dbUtils.ExecuteQuery(query);

                // Set the data source for the dropdown list
                ddlClass.DataSource = dt;
                ddlClass.DataTextField = "Year Name";
                ddlClass.DataValueField = "Year id";
                ddlClass.DataBind();

                // Insert a default item at the beginning of the dropdown list
                ddlClass.Items.Insert(0, new ListItem("Select Year", "0"));
            }
            catch (Exception ex)
            {
                // Handle any exceptions that occur during the execution of the method
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }




        private void GetCFees()
        {
            try
            {
                string query = @"
            SELECT 
                ROW_NUMBER() OVER (ORDER BY f.[Fees ID]) AS [Sr.No], 
                f.[Fees ID], 
                f.[Year ID], 
                y.[Year Name], 
                f.[Fees amount] 
            FROM 
                f_Fees f 
                INNER JOIN y_Year y ON y.[Year id] = f.[Year ID]
            ORDER BY 
                f.[Fees ID]";

                DataTable dt = dbUtils.ExecuteQuery(query);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                // Handle any exceptions that occur during the execution of the method
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

       

        protected void btnAdd_Click1(object sender, EventArgs e)
        {
            try
            {
                string queryCheck = "Select * from f_Fees where [Year ID] = @YearID";
                SqlParameter[] checkParams = {
                    new SqlParameter("@YearID", SqlDbType.Int) { Value = Convert.ToInt32(ddlClass.SelectedItem.Value) }
                };
                DataTable dt = dbUtils.ExecuteQuery(queryCheck, checkParams);

                if (dt.Rows.Count == 0)
                {
                    string queryInsert = "INSERT INTO f_Fees ([Year ID], [Fees amount]) VALUES (@YearID, @FeeAmount)";
                    SqlParameter[] insertParams = {
                        new SqlParameter("@YearID", SqlDbType.Int) { Value = Convert.ToInt32(ddlClass.SelectedItem.Value) },
                        new SqlParameter("@FeeAmount", SqlDbType.VarChar) { Value = txtFeeAmounts.Text.Trim() }
                    };
                    dbUtils.ExecuteNonQuery(queryInsert, insertParams);

                    lblMsg.Text = "Inserted Successfully!";
                    lblMsg.CssClass = "alert alert-success";
                    ddlClass.SelectedIndex = 0;
                    txtFeeAmounts.Text = string.Empty;
                    GetCFees();
                }
                else
                {
                    lblMsg.Text = "Entered Year Fees already exists for <b>'" + ddlClass.SelectedItem.Text + "'</b>!";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetCFees();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetCFees();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int feeId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
                TextBox txtFeeAmount = row.FindControl("TextBox1") as TextBox;

                if (txtFeeAmount != null)
                {
                    string feeAmount = txtFeeAmount.Text.Trim();
                    string query = "UPDATE f_Fees SET [Fees amount] = @FeeAmount WHERE [Fees ID] = @FeeId";
                    SqlParameter[] parameters = {
                new SqlParameter("@FeeAmount", SqlDbType.VarChar) { Value = feeAmount },
                new SqlParameter("@FeeId", SqlDbType.Int) { Value = feeId }
            };

                    dbUtils.ExecuteNonQuery(query, parameters);
                    GridView1.EditIndex = -1;
                    GetCFees();

                    lblMsg.Text = "Fees Updated Successfully!";
                    lblMsg.CssClass = "alert alert-success";
                }
                else
                {
                    // Handle the case where the TextBox is not found
                    lblMsg.Text = "Error: Could not find the TextBox.";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                // Log and/or display the error
                lblMsg.Text = "Error: " + ex.Message;
                lblMsg.CssClass = "alert alert-danger";
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int feeId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values["Fees ID"]);
                string query = "DELETE FROM f_Fees WHERE [Fees ID] = @FeeId";
                SqlParameter[] parameters = {
            new SqlParameter("@FeeId", SqlDbType.Int) { Value = feeId }
        };

                dbUtils.ExecuteNonQuery(query, parameters);
                GetCFees();

                lblMsg.Text = "Fees Deleted Successfully!";
                lblMsg.CssClass = "alert alert-success";
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetCFees();
        }



    }

}

