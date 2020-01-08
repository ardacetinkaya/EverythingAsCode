using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

namespace ProductX.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;

        private readonly string _customer = string.Empty;

        public IndexModel(ILogger<IndexModel> logger, IConfiguration config)
        {
            _logger = logger;

            _customer = config["Customer"];
        }

        public void OnGet()
        {
            ViewData["Customer"] = _customer;
        }
    }
}
