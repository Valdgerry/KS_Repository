using Microsoft.AspNetCore.Identity;
using KidneySaversApi.Models;
namespace KidneySaversApi.Services
{
    public class ChatbotService : IChatbotService
    {
        private readonly UserManager<User> _userManager;
        public ChatbotService(UserManager<User> userManager) => _userManager = userManager;
        public async Task<string> GetResponseAsync(ChatbotRequest request)
        {
            var user = await _userManager.FindByIdAsync(request.UserId.ToString());
            if (user == null) return "Utilisateur introuvable.";
            var question = request.Question.ToLower();
            if (user.UserType == "Doctor")
            {
                if (question.Contains("irc")) return "L’insuffisance rénale chronique (IRC) est souvent liée à l’HTA ou au diabète. Le DFG est un indicateur clé.";
                if (question.Contains("traitement")) return "Les IEC ou ARA-II sont souvent utilisés, mais surveillez l’hyperkaliémie.";
                return "Posez-moi une question technique sur les reins !";
            }
            else // Regular
            {
                if (question.Contains("eau")) return "Oui, boire de l’eau aide tes reins à bien fonctionner. Essaie 1,5 à 2 litres par jour !";
                if (question.Contains("malade")) return "Si tes reins vont mal, tu peux te sentir fatigué ou avoir les jambes gonflées. Parles-en à un docteur.";
                return "Demande-moi quelque chose de simple sur tes reins !";
            }
        }
    }
}