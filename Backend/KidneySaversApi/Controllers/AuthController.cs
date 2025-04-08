using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using KidneySaversApi.Models;
using KidneySaversApi.Services;
namespace KidneySaversApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly UserManager<User> _userManager;
        private readonly SignInManager<User> _signInManager;
        private readonly ITokenService _tokenService;
        public AuthController(UserManager<User> userManager, SignInManager<User> signInManager, ITokenService tokenService)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _tokenService = tokenService;
        }
        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] RegisterModel model)
        {
            if (!new[] { "Doctor", "Regular" }.Contains(model.UserType))
                return BadRequest(new { Message = "Type d'utilisateur invalide" });
            var user = new User
            {
                Id = Guid.NewGuid(),
                Email = model.Email,
                UserName = model.Email,
                UserType = model.UserType,
                CreatedAt = DateTime.UtcNow
            };
            var result = await _userManager.CreateAsync(user, model.Password);
            if (result.Succeeded)
                return Ok(new { Message = "Inscription réussie", UserId = user.Id });
            return BadRequest(result.Errors);
        }
        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginModel model)
        {
            var user = await _userManager.FindByEmailAsync(model.Email);
            if (user == null) return Unauthorized(new { Message = "Email ou mot de passe incorrect" });
            var result = await _signInManager.CheckPasswordSignInAsync(user, model.Password, false);
            if (result.Succeeded)
            {
                var token = _tokenService.GenerateJwtToken(user);
                return Ok(new { Token = token, UserType = user.UserType });
            }
            return Unauthorized(new { Message = "Email ou mot de passe incorrect" });
        }
    }
}