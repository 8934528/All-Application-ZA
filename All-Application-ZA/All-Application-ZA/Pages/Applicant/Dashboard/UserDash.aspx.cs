using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using All_Application_ZA.Classes;

namespace All_Application_ZA.Pages.Applicant.Dashboard
{
    public partial class UserDash : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is logged in
            SessionManager sessionManager = new SessionManager();
            sessionManager.RedirectIfNotLoggedIn();

            // Get current user data
            SessionManager.UserSessionData userData = sessionManager.GetCurrentUser();

            if (!IsPostBack && userData != null)
            {
                // You can use userData to populate any dashboard elements
                // For example, set welcome message or user stats
            }
        }
    }
}