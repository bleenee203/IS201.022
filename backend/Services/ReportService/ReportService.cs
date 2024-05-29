using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using PetShop.Data;
using PetShop.DTOs;
using PetShop.Helpers;
using PetShop.Models;
using System.Xml.Linq;

namespace PetShop.Services.ReportService
{
    public class ReportService : IReportService
    {
        private readonly PetShopDbContext _context;
        public ReportService(PetShopDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> GetAllInformation()
        {
            var sales = await _context.Checkout.SumAsync(c => c.Total);
            var invoices = await _context.Checkout.CountAsync();
            var items = await _context.DogProductItem.CountAsync();
            var dogitems = await _context.DogItem.CountAsync();
            var products = items + dogitems;
            var users = await _context.Users.CountAsync();
            object response = new
            {
                sales,
                products,
                users,
                invoices
            };
            return ResponseHelper.Ok(response);
        }
        public async Task<IActionResult> GetMonthlySaleAsync(int month, int year)
        {
            var startDate = new DateTime(year, month, 1);
            var endDate = startDate.AddMonths(1).AddDays(-1);

            var sales = await _context.Checkout
    .Where(c => c.CreateAt >= startDate && c.CreateAt <= endDate)
    .ToListAsync();

            /*var dailySales = sales.Select(c => new
            {
                Date = c.CreateAt.HasValue ? c.CreateAt.Value.Date : DateTime.MinValue,
                Total = c.Total,
                ProductCount = JsonConvert.DeserializeObject<List<Product>>(c.Data).Count
            }).ToList();*/
           
            List<object> responselist = new List<object>();
            /*foreach (var sale in dailySales)
            {
                object response = new
                {
                    sale.Date, sale.Total,sale.ProductCount
                };
                responselist.Add(response);
            }*/
            foreach (var sale in sales)
            {
                dynamic Data = JsonConvert.DeserializeObject<DataObject[]>(sale.Data);
                String formattedData = "";
                foreach (var dataObject in Data)
                {
                    string name = dataObject.name.ToString();
                    string quantity = dataObject.quantity.ToString();

                    formattedData+=($"Tên sản phẩm: {name}, Số lượng: {quantity};");
                }
                object response = new
                {
                    sale.CreateAt,
                    formattedData,
                    sale.Name,
                    sale.Address,
                    sale.PhoneNumber,
                    sale.Total,
                    sale.Payment,
                    sale.Status

                };
                responselist.Add(response);
            }
            return ResponseHelper.Ok(responselist);
        }
    }
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Quantity { get; set; }
        public string Type { get; set; }
        public decimal Price { get; set; }
        public int Stock { get; set; }
        public decimal? TotalPrice { get; set; }
        public List<string> Images { get; set; }
    }
}
