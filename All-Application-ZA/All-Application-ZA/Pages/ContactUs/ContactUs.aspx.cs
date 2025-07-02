using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace All_Application_ZA.Pages.ContactUs
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    // Set current year in footer
            //    lblYear.Text = DateTime.Now.Year.ToString();

            //    // Bind FAQ data
            //    BindFAQ();
            //}
        }

        //private void BindFAQ()
        //{
        //    // In a real application, you would get this from a database
        //    var faqs = new List<FAQ>
        //    {
        //        new FAQ {
        //            Question = "How long does it take to get a response?",
        //            Answer = "We typically respond to all inquiries within 24 hours during business days (Monday to Friday)."
        //        },
        //        new FAQ {
        //            Question = "What information should I include in my message?",
        //            Answer = "Please include your full name, contact details, and as much detail as possible about your inquiry to help us assist you better."
        //        },
        //        new FAQ {
        //            Question = "Do you offer support for international students?",
        //            Answer = "Yes! We provide guidance for both domestic and international students applying to South African universities."
        //        }
        //    };

        //    rptFAQ.DataSource = faqs;
        //    rptFAQ.DataBind();
        //}

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //if (Page.IsValid)
            //{
            //    // In a real application, you would:
            //    // 1. Save the contact form to a database
            //    // 2. Send an email notification
            //    // 3. Maybe send a confirmation email to the user

            //    // For demo purposes, we'll just show the success message
            //    pnlContactForm.Visible = false;
            //    pnlSuccess.Visible = true;
            //    pnlSuccess.CssClass += " animate__fadeIn";
            //}
        }
    }

    //public class FAQ
    //{
    //    public string Question { get; set; }
    //    public string Answer { get; set; }
    //}
}