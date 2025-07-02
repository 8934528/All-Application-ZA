using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace All_Application_ZA.Pages.Applicant.AplicationForm
{
    public partial class ApplicationForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize form if needed
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    // Process the application (save to database, etc.)
                    // This would include handling file uploads and other form data

                    // Generate a random reference number for demo purposes
                    string referenceNumber = GenerateReferenceNumber();

                    // Call JavaScript function to show success modal
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowSuccessModal",
                        $"showSuccessModal('{referenceNumber}');", true);
                }
                catch (Exception ex)
                {
                    // Handle errors
                    Response.Write($"<script>alert('Error submitting application: {ex.Message}');</script>");
                }
            }
        }

        private string GenerateReferenceNumber()
        {
            Random random = new Random();
            return $"{DateTime.Now:yyyyMMdd}-{random.Next(1000, 9999)}";
        }
    }
}