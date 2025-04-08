namespace KidneySaversApi.Models
{
    public class QuizSubmission
    {
        public Guid UserId { get; set; }
        public Guid QuizId { get; set; }
        public List<QuizResponse> Responses { get; set; }
    }

    public class QuizResponse
    {
        public Guid QuestionId { get; set; }
        public string Answer { get; set; }
    }
}
