using AccessControl.Web.API.Models;
namespace AccessControl.Web.API.Services

{
    public interface IUserService
    {
        public Task<IEnumerable<User>> GetAllUsersAsync();
        public Task<User> GetUserByIdAsync(int id);
        public Task<User> CreateUserAsync(User user);
        public Task<User> UpdateUserAsync(int id, User user);
        public Task<bool> DeleteUserAsync(int id);

    }
}
