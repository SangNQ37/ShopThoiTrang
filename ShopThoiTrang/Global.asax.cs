using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace ShopThoiTrang
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            Application["OnlineUsers"] = 0;
            Application["LoggedInUsers"] = 0;
            
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Application.Lock();
            Application["OnlineUsers"] = Convert.ToInt32(Application["OnlineUsers"]) + 1;
            Application.UnLock();
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            
                Application.Lock();
                Application["LoggedInUsers"] = Convert.ToInt32(Application["LoggedInUsers"]) + 1;
                Application.UnLock();
            
        }
        //protected void Login1_LoggedIn(object sender, EventArgs e)
        //{
        //    Application.Lock();
        //    Application["LoggedInUsers"] = (int)Application["LoggedInUsers"] + 1;
        //    Application.UnLock();
        //}

        //protected void LoginStatus1_LoggedOut(object sender, EventArgs e)
        //{
        //    Application.Lock();
        //    if ((int)Application["LoggedInUsers"] > 0)
        //    {
        //        Application["LoggedInUsers"] = (int)Application["LoggedInUsers"] - 1;
        //    }
        //    Application.UnLock();
        //}
        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }
       
        protected void Session_End(object sender, EventArgs e)
        {
            Application.Lock();
            Application["OnlineUsers"] = Convert.ToInt32(Application["OnlineUsers"]) - 1;
            Application.UnLock();
        }

        protected void Application_End(object sender, EventArgs e)
        {
           
        }
    }
}