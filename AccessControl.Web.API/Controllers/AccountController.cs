using AccessControl.Web.API.Models;
using AccessControl.Web.API.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace AccessControl.Web.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private readonly ILogger<AccountController> _logger;
        private readonly IAccountService _accountService;
        public AccountController(ILogger<AccountController> logger, IAccountService accountService)
        {
            _logger = logger;
            _accountService = accountService;
        }


        [HttpPost]
        [Route("AuthenticateAsync")]
        public async Task<IActionResult> AuthenticateAsync(UserLogin userLogin)
        {
            try
            {
                if (userLogin == null || string.IsNullOrEmpty(userLogin.Username) || string.IsNullOrEmpty(userLogin.Password))
                {
                    _logger.LogError("Invalid user login data");
                    return BadRequest("Username and password are required");

                }

                var response = await _accountService.AuthenticateAsync(userLogin);

                _logger.LogInformation("Authentication attempt for user {Username} resulted in {Message}", userLogin.Username, response.Message);

                _logger.LogInformation("User login response " + JsonConvert.SerializeObject(response));

                return Ok(response);
            }
            catch (Exception ex)
            {
                _logger.LogError($"Internal server error: {ex.Message}");
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
    }
}
