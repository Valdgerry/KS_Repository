using KidneySaversApi.Models;

namespace KidneySaversApi.Services
{
    public interface IChatbotService
    {
        Task<string> GetResponseAsync(ChatbotRequest request);
    }
}
