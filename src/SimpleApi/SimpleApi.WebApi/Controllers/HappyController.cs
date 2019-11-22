using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace SimpleApi.Api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class HappyController : ControllerBase
    {
        private static readonly string[] HowHappy = new[]
        {
            "Kinda", "Sorta", "Pretty", "Unusually", "Ridiculously", "Sleepy and", "Drearily", "Sickeningly", "Obtusely", "Stingily"
        };

        private readonly ILogger<HappyController> _logger;

        public HappyController(ILogger<HappyController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public async Task<HappinessQuotient> GetAsync()
        {
            var rnd = new Random();
            var r = rnd.Next(HowHappy.Length);
            return await Task.FromResult(new HappinessQuotient {HappinessAmount = HowHappy[r]});
        }
    }
}