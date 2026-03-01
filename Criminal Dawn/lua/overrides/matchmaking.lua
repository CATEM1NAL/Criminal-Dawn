local APD2FileIdent = "[APD2>matchmaking] "

if apd2_data.game.seed then
  log(APD2FileIdent .. "Found seed!")
  NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY = apd2_data.game.seed
  NetworkMatchMakingEPIC._BUILD_SEARCH_INTEREST_KEY = apd2_data.game.seed
  log (APD2FileIdent .. "Matchmaking key: " .. NetworkMatchMakingEPIC._BUILD_SEARCH_INTEREST_KEY)
else
  NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY = nil
  NetworkMatchMakingEPIC._BUILD_SEARCH_INTEREST_KEY = nil
end