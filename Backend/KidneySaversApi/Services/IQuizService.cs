using KidneySaversApi.Models;

namespace KidneySaversApi.Services
{
    public interface IQuizService
    {
        Task<List<Quiz>> GetQuizzesByUserTypeAsync(string userType);
        Task<Quiz> GetQuizByIdAsync(Guid id);
        Task<QuizResult> SubmitQuizAsync(QuizSubmission submission);
    }
}
