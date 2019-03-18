using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Activity6_API.Models;
using System.Data;
using System.Net;
using System.Net.Http;
using System.Data.Entity;
using System.Web.Http;
using System.Web.Http.Cors;
using System.IO;
using CrystalDecisions.CrystalReports.Engine;
using System.Web.Hosting;
using System.Net.Http.Headers;
using Activity6_API.Reporting;
using System.Dynamic;

namespace Activity6_API.Controllers
{
    [EnableCors(origins:"*", headers: "*", methods:"*")]

    public class ReportController : Controller
    {
        [System.Web.Mvc.Route("api/Report/getReportData")]
        [System.Web.Http.HttpGet]
        public dynamic getReportData(int BranchSelection)
        {
            Activity6Entities db = new Activity6Entities();
            db.Configuration.ProxyCreationEnabled = false;
            List<Sale> sales;
            if(BranchSelection == 1)
            {
                sales = db.Sales.Include(gg => gg.Employee).Include(gg => gg.Employee.Branch).Where(gr => db.Branches.Any(cc => cc.Branch_Code == gr.Employee.Branch_Code)).ToList();
            }
            else
            {
                sales = db.Sales.Include(gg => gg.Employee).Include(gg => gg.Employee.Branch).ToList();
            }
            return getExpandoReport(sales);

        }
        private dynamic getExpandoReport(List<Sale>sales)
        {
            dynamic outObject = new ExpandoObject();
            var branchList = sales.GroupBy(gg => gg.Employee.Branch.branch_description);
            List<dynamic> brans = new List<dynamic>();
            foreach (var group in branchList)
            {
                dynamic branch = new ExpandoObject();
                branch.description = group.Key;
                branch.totalSales = group.Sum(gg => gg.Amount);
                brans.Add(branch);


                }
                outObject.Branches = brans;

                var EmployeeList = sales.GroupBy(gg => gg.Employee.name);
                List<dynamic> employeeGroups = new List<dynamic>();
                foreach(var group in EmployeeList)
                {
                dynamic employee = new ExpandoObject();
                employee.Name = group.Key;
                employee.SaleTotal = group.Sum(gg => gg.Amount);
                List<dynamic> flexiSales = new List<dynamic>();
                foreach(var item in group)
                {
                    dynamic saleObj = new ExpandoObject();
                    saleObj.Employee = item.Employee.name + " " + item.Employee.surname;
                    saleObj.Branch = item.Employee.Branch.branch_description;
                    saleObj.Amount = item.Amount;
                    flexiSales.Add(saleObj);


                }
                employee.Sales = flexiSales;
                employeeGroups.Add(employee);
                }
            outObject.Employees = employeeGroups;
            return outObject;


}
        
            // GET: Report
        public ActionResult Index()
        {
            return View();
        }
    }
}