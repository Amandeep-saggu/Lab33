using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lab3;
// reference the model binding library
using System.Web.ModelBinding;

namespace Week6
{
    public partial class student_details : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int student_id = Convert.ToInt32(Request.QueryString["id"]);
                if (student_id >0)
                {
                    getStudentDetailsById(student_id);
                }
                

            }



        }

        public void getStudentDetailsById(int student_id)
        {
            var conn = new ContosoEntities();
            
            Student StudentDetail = conn.Students.Find(student_id);

            txtFirstMidName.Text = StudentDetail.FirstMidName;
            txtLastName.Text = StudentDetail.LastName;
            txtEnrollmentDate.Text = StudentDetail.EnrollmentDate.ToString("dd-MM-yyyy");
            StudentID.Value = StudentDetail.StudentID.ToString();
            btnSave.Visible = false;
            btnUpdate.Visible = true;

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {

            using (ContosoEntities entities = new ContosoEntities())
            {
                Student customer = new Student
                {
                    FirstMidName = txtFirstMidName.Text,
                    LastName = txtLastName.Text,
                    EnrollmentDate=Convert.ToDateTime(txtEnrollmentDate.Text)
                };
                entities.Students.Add(customer);
                entities.SaveChanges();
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int student_id = Convert.ToInt32(StudentID.Value.ToString());
            using (ContosoEntities entities = new ContosoEntities())
            {
                Student customer = (from c in entities.Students
                                     where c.StudentID == student_id
                                     select c).FirstOrDefault();
                customer.FirstMidName = txtFirstMidName.Text;
                customer.LastName = txtLastName.Text;
                customer.EnrollmentDate = Convert.ToDateTime(txtEnrollmentDate.Text);
                entities.SaveChanges();
            }

            // redirect to the students page
            Response.Redirect("student.aspx");
        }
    }
}