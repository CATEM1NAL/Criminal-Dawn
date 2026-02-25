-- beautiful. elegant. may cause problems in multiplayer
-- not that it matters as the mod is singleplayer only
Hooks:PostHook(JobManager, "is_current_job_professional", "apd2_force_projob", function(self)
  return true
end)