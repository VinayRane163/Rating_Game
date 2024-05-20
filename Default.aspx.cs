using System;
using System.Web;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Rating_Game
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        


        protected void AdRotator1_AdCreated(object sender, AdCreatedEventArgs e)
        {
            // Get reload count from cookies
            int reloadCount = 0;
            HttpCookie reloadCountCookie = Request.Cookies["ReloadCount"];
            if (reloadCountCookie != null)
            {
                int.TryParse(reloadCountCookie.Value, out reloadCount);
            }

            if (reloadCount == 0)
            {
                // Show the ad
                Session["AdShown"] = true;
                ImageButton1.Visible = true;
            }
            else
            {
                // Hide the ad
                AdRotator1.Visible = false;
                ImageButton1.Visible = false;

            }

            // Increment the reload count
            reloadCount++;

            // Reset reload count if it reaches 5
            if (reloadCount >= 2)
            {
                reloadCount = 0;
            }

            // Update the cookie with the new reload count
            Response.Cookies["ReloadCount"].Value = reloadCount.ToString();
            Response.Cookies["ReloadCount"].Expires = DateTime.Now.AddYears(1); 
        }

       

        protected void ImageButton1_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            Session["AdShown"] = false;

            // Set the reload count to zero to ensure the ad is shown again on the next page load
            Response.Cookies["ReloadCount"].Value = "0";
        }
    }
}