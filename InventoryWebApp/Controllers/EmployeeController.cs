using InventoryWebApp.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace InventoryWebApp.Controllers
{
    public class EmployeeController
    {
        IStationeryCatalogueDAO Isc = new StationeryCatalogueDAO();
        IRequestDAO Ir = new RequestDAO();
        IRequestDetailsDAO Ird = new RequestDetailsDAO();
        public List<StationeryCatalogue> gridview()
        {
            List<StationeryCatalogue> list = Isc.ListAllStationery();
            return list;
        }
        public List<StationeryCatalogue> searchByDescription(string keyword)
        {
            List<StationeryCatalogue> list = Isc.SearchByDescription(keyword);
            return list;
        }
        public List<StationeryCatalogue> searchByCategoryCode(string keyword)
        {
            List<StationeryCatalogue> list = Isc.SearchByCategory(keyword);
            return list;
        }
        public List<StationeryCatalogue> searchByItemCode(string keyword)
        {
            List<StationeryCatalogue> list = Isc.SearchByItemCode(keyword);
            return list;
        }
        public StationeryCatalogue GetStationery(string itemcode)
        {
            return Isc.GetStationery(itemcode);
        }
        public void AddRequest(string requestCode, string departmentCode, DateTime dateCreate, 
            DateTime dateApproved, string status, string notes, string headRemarks)
        {
                Request request = new Request()
                {
                    RequestCode = requestCode,
                    DepartmentCode = departmentCode,
                    DateCreated = dateCreate,
                    DateApproved = dateApproved,
                    Status = status,
                    Notes = notes,
                    HeadRemarks = headRemarks,
                };
                Ir.AddRequest(request);
                
            RequestDetail requestDetails = new RequestDetail()
            {

            }


            
            //Ir.AddRequest(requestCode, departmentCode, dateCreate, dateApproved, status, notes, headRemarks, username, approvedBy);

            //var orders = new List<Order>();
            //var order = new Order();

            //order.FoodSize = RadioButtonList1.SelectedItem.Text;
            //if (rtbChickenRice.Checked)
            //{
            //    order.FoodDishes = rtbChickenRice.Text;
            //}
            //else if (rtbDumplingNoodle.Checked)
            //{
            //    order.FoodDishes = rtbDumplingNoodle.Text;
            //}
            //else if (rtbFishAndChips.Checked)
            //{
            //    order.FoodDishes = rtbFishAndChips.Text;
            //}
            //for (int i = 0; i < CheckBoxList1.Items.Count; i++)
            //{
            //    if (CheckBoxList1.Items[i].Selected)
            //    {
            //        if (string.IsNullOrEmpty(order.AdditionalRequest))
            //        {
            //            order.AdditionalRequest += CheckBoxList1.Items[i].Text;
            //        }
            //        else
            //        {
            //            order.AdditionalRequest += "," + CheckBoxList1.Items[i].Text;
            //        }
            //    }
            //}
            //orders.Add(order);
            //var customer = ctx.Customers.FirstOrDefault(x => x.Email == tbxEmail.Text);
            //if (customer != null)
            //{
            //    customer.Address = tbxAddress.Text;
            //    customer.Name = tbxUserName.Text;
            //    customer.Phone = tbxPhone.Text;
            //    customer.PostalCode = int.Parse(tbxPostalCode.Text);
            //    foreach (var orderItem in orders)
            //    {
            //        orderItem.CustomerId = customer.Id;
            //    }
            //    ctx.Orders.AddRange(orders);
            //    ctx.Customers.AddOrUpdate(customer);
            //}
            //else
            //{
            //    customer = new Customer()
            //    {
            //        Name = tbxUserName.Text,
            //        Address = tbxAddress.Text,
            //        Phone = tbxPhone.Text,
            //        PostalCode = int.Parse(tbxPostalCode.Text),
            //        Email = tbxEmail.Text,
            //        Orders = orders
            //    };
            //    ctx.Customers.Add(customer);
            //}
            //ctx.SaveChanges();


            return;
        }
    }
}