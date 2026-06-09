namespace AccessControl.Web.API.Models
{
    public class AuthenticationResponse
    {
        public string JwtToken { get; set; } = string.Empty;
        public string RefreshToken { get; set; } = string.Empty;
        public bool IsValidUser { get; set; }
        public bool IsValidPassword { get; set; }
        public string Message { get; set; } = string.Empty;
    }
}
