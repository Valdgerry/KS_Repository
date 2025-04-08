using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using KidneySaversApi.Models;
using KidneySaversApi.Services;
namespace KidneySaversApi.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class TrackingController : ControllerBase
    {
        private readonly ITrackingService _trackingService;
        public TrackingController(ITrackingService trackingService) => _trackingService = trackingService;
        [HttpPost]
        public async Task<IActionResult> AddTracking([FromBody] Tracking tracking)
        {
            await _trackingService.AddTrackingAsync(tracking);
            return Ok(new { Message = "Suivi enregistré" });
        }
        [HttpGet("{userId}")]
        public async Task<IActionResult> GetTracking(Guid userId) => Ok(await _trackingService.GetTrackingByUserIdAsync(userId));
    }
}