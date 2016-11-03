using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lab3;
// add reference to access the database
using System.Web.ModelBinding;

namespace Week6
{
    public partial class students : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // get the departments and display in the gridview
            getStudents();
        }

        protected void getStudents()
        {
            // connect to db
            var conn = new ContosoEntities();
            
            // run the query using LINQ
            var Students = conn.Students;
            // display query result in gridview
            grdStudents.DataSource = Students.ToList();
            grdStudents.DataBind();

        }
        protected void DeleteStudent(object sender, EventArgs e)
        {
            LinkButton lnkRemove = (LinkButton)sender;
            int StudentId = Convert.ToInt32(lnkRemove.CommandArgument);

            using (ContosoEntities db = new ContosoEntities())
            {
                Student student = db.Students.First(x => x.StudentID == StudentId);
                db.Students.Remove(student);
                db.SaveChanges();
            }



        }
        protected void EditStudent(object sender, EventArgs e)
        {
            LinkButton lnkEdit= (LinkButton)sender;
            int StudentId = Convert.ToInt32(lnkEdit.CommandArgument);

            Response.Redirect("Student-details.aspx?id=" + StudentId);

        }
        protected void CancelEdit(object sender, GridViewCancelEditEventArgs e)
        {
           
        }
        protected void UpdateCustomer(object sender, GridViewUpdateEventArgs e)
        {
           
        }
    }
}