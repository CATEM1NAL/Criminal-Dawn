--      FEATURE HAS BEEN DEPRECATED AND REPLACED BY MAIN MENU BUTTON       --
-- THIS FILE STILL EXISTS JUST IN CASE SOMETHING LIKE THIS IS NEEDED AGAIN --

-- this function normally just returns false. what the fuck is it for??
-- not that I'm complaining, it gives a good entry point for exactly
-- the feature I want to implement. just really fucking weird
Hooks:PostHook(NarrativeTweakData, "is_job_locked", "apd2_heists", function(self, job_id)
  if apd2_data.heists and apd2_data.heists[job_id] then
    log("[APD2>narrative] Unlocking " .. job_id)
    return false
  else
    log("[APD2>narrative] Locking " .. job_id)
    return true
  end
end)