using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Diagnostics;

namespace DemoBelcorp2.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Title = "Home Page";
            var log = new EventLog { Source = "WinContainerApp" };
            log.WriteEntry($"You will see this message in the application event. Timestamp = {DateTime.Now.ToString("F")}", EventLogEntryType.Warning);

            return View();
        }
    }
}
