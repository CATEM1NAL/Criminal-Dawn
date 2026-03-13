Hooks:PostHook(GroupAIStateBase, "set_point_of_no_return_timer", "CrimDawn_EnableDropIn", function(self)
	self._forbid_drop_in = false
	managers.network.matchmake:set_server_joinable(true)
end)