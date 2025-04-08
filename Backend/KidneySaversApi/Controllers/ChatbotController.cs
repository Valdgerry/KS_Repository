using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using KidneySaversApi.Models;
using KidneySaversApi.Services;
namespace KidneySaversApi.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class ChatbotController : ControllerBase
    {
        private readonly IChatbotService _chatbotService;
        public ChatbotController(IChatbotService chatbotService) => _chatbotService = chatbotService;
        [HttpPost]
        public async Task<IActionResult> AskQuestion([FromBody] ChatbotRequest request) => Ok(new { Response = await _chatbotService.GetResponseAsync(request) });
    }
}