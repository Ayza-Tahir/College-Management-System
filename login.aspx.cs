using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static WebApplication2.Models.Commonfn;

namespace WebApplication2
{
    public partial class login : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click1(object sender, EventArgs e)
        {
            string email = inputEmail.Value.Trim();
            string password = inputPassword.Value.Trim();

            // Check the  admin login first
            if (email == "Ayza Tahir" && password == "ayza1234")
            {
                Session["admin"] = email;
                Response.Redirect("Admin/AdminHome.aspx");
            }
            else
            {
                // If the hardcoded check fails, check the database
                DataTable dt = fn.Fetch("SELECT * FROM a_Admin WHERE [Admin Name] = '" + email + "' AND [Admin Password] = '" + password + "'");

                if (dt.Rows.Count > 0)
                {
                    // Valid admin login
                    Session["admin"] = email;
                    Response.Redirect("Admin/AdminHome.aspx");
                }
                else
                {
                    // Invalid login
                        Label2.Text = "Login Failed!";
                    Label2.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

    }
}