using AccessControl.Web.API.Models;

namespace AccessControl.Web.API.Services
{
    public interface IAccountService
    {
        Task<AuthenticationResponse> AuthenticateAsync(UserLogin userLogin);
    }
}
