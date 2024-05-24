using Microsoft.AspNetCore.Mvc;

namespace PetShop.Services.ReportService
{
    public interface IReportService
    {
        Task<IActionResult> GetAllInformation();
        Task<IActionResult> GetMonthlySaleAsync(int month,int year);
    }
}
