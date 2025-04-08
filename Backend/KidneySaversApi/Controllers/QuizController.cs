using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using KidneySaversApi.Models;
using KidneySaversApi.Services;
namespace KidneySaversApi.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class QuizController : ControllerBase
    {
        private readonly IQuizService _quizService;
        public QuizController(IQuizService quizService) => _quizService = quizService;
        [HttpGet]
        public async Task<IActionResult> GetQuizzes([FromQuery] string userType) => Ok(await _quizService.GetQuizzesByUserTypeAsync(userType));
        [HttpGet("{id}")]
        public async Task<IActionResult> GetQuiz(Guid id)
        {
            var quiz = await _quizService.GetQuizByIdAsync(id);
            return quiz == null ? NotFound() : Ok(quiz);
        }
        [HttpPost("submit")]
        public async Task<IActionResult> SubmitQuiz([FromBody] QuizSubmission submission) => Ok(await _quizService.SubmitQuizAsync(submission));
    }
}
