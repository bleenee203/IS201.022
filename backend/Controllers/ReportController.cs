using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PetShop.Helpers;
using PetShop.Services.DogItemService;
using PetShop.Services.ReportService;
using System.Configuration;

namespace PetShop.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReportController : ControllerBase
    {
        private readonly IReportService _reportservice;
        private readonly IConfiguration configuration;
        public ReportController(IReportService reportservice, IConfiguration _configuration,
            IDogSpeciesService speciesservice)
        {
            _configuration = configuration;
            _reportservice = reportservice;
        }
        [HttpGet("get-all-infor")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> GetAllInformation()
        {
            try
            {
                var results = await _reportservice.GetAllInformation();
                return ResponseHelper.Ok(results);
            }
            catch (Exception ex)
            {
                return ResponseHelper.BadRequest(ex.Message);
            }
        }
        [HttpGet("get-sales-month/month={month}&year={year}")]
        //[Authorize(Roles = "Admin")]
        public async Task<IActionResult> GetMonthlySaleAsync([FromRoute] int month, [FromRoute] int year)
        {
            try
            {
                var results = await _reportservice.GetMonthlySaleAsync(month,year);
                return ResponseHelper.Ok(results);
            }
            catch (Exception ex)
            {
                return ResponseHelper.BadRequest(ex.Message);
            }
        }
    }
}
