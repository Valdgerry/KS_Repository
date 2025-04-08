using Microsoft.EntityFrameworkCore;
using KidneySaversApi.Data;
using KidneySaversApi.Models;
namespace KidneySaversApi.Services
{
    public class QuizService : IQuizService
    {
        private readonly ApplicationDbContext _context;
        public QuizService(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<List<Quiz>> GetQuizzesByUserTypeAsync(string userType)
        {
            var today = DateTime.UtcNow.Date;
            var quiz = await _context.Quizzes
                .Where(q => q.UserType == userType && q.Date == today)
                .Include(q => q.Questions)
                .FirstOrDefaultAsync();
            if (quiz == null)
            {
                quiz = new Quiz
                {
                    Id = Guid.NewGuid(),
                    Title = $"Quiz du {today:dd/MM/yyyy} - {userType}",
                    UserType = userType,
                    Date = today,
                    Questions = GenerateDailyQuestions(userType)
                };
                _context.Quizzes.Add(quiz);
                await _context.SaveChangesAsync();
            }
            return new List<Quiz> { quiz };
        }
        public async Task<Quiz> GetQuizByIdAsync(Guid id)
        {
            return await _context.Quizzes.Include(q => q.Questions).FirstOrDefaultAsync(q => q.Id == id);
        }

        public async Task<QuizResult> SubmitQuizAsync(QuizSubmission submission)
        {
            var quiz = await _context.Quizzes.Include(q => q.Questions).FirstOrDefaultAsync(q => q.Id == submission.QuizId);
            if (quiz == null) throw new Exception("Quiz introuvable");
            int score = 0;
            foreach (var response in submission.Responses)
            {
                var question = quiz.Questions.FirstOrDefault(q => q.Id == response.QuestionId);
                if (question != null && question.CorrectAnswer == response.Answer) score++;
                _context.UserQuizResponses.Add(new UserQuizResponse
                {
                    Id = Guid.NewGuid(),
                    UserId = submission.UserId,
                    QuizId = submission.QuizId,
                    QuestionId = response.QuestionId,
                    Answer = response.Answer,
                    SubmittedAt = DateTime.UtcNow
                });
            }
            await _context.SaveChangesAsync();
            return new QuizResult { Score = score, Total = quiz.Questions.Count };
        }
        private static List<Question> GenerateDailyQuestions(string userType)
        {
            return userType == "Doctor" ?
                new List<Question>
                {
                    new Question { Id = Guid.NewGuid(), Text = "Quelle est la principale cause de l'IRC ?", Options = new List<string> { "Hypertension", "Diabète", "Infection" }, CorrectAnswer = "Diabète", Explanation = "Le diabète est la cause principale." },
                    new Question { Id = Guid.NewGuid(), Text = "Quel est le débit de filtration glomérulaire normal ?", Options = new List<string> { "<60", "60-90", ">90" }, CorrectAnswer = ">90", Explanation = "DFG > 90 mL/min est normal." },
                    new Question { Id = Guid.NewGuid(), Text = "Quel médicament est contre-indiqué dans l'IRC ?", Options = new List<string> { "Paracétamol", "Aspirine", "Ibuprofène" }, CorrectAnswer = "Ibuprofène", Explanation = "Les AINS comme l’ibuprofène sont néphrotoxiques." }
                } :
                new List<Question>
                {
                    new Question { Id = Guid.NewGuid(), Text = "Boire beaucoup d’eau aide-t-il les reins ?", Options = new List<string> { "Oui", "Non" }, CorrectAnswer = "Oui", Explanation = "L’eau aide à nettoyer les reins." },
                    new Question { Id = Guid.NewGuid(), Text = "Le sel est-il bon pour les reins ?", Options = new List<string> { "Oui", "Non" }, CorrectAnswer = "Non", Explanation = "Trop de sel fatigue les reins." },
                    new Question { Id = Guid.NewGuid(), Text = "Faut-il manger moins de sucre pour les reins ?", Options = new List<string> { "Oui", "Non" }, CorrectAnswer = "Oui", Explanation = "Le sucre peut causer du diabète, mauvais pour les reins." }
                };
        }
    }
}