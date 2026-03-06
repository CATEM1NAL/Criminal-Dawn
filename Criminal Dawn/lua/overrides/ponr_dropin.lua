Hooks:PostHook(GroupAIStateBase, "set_point_of_no_return_timer", "apd2_ponr_dropin", function(self)
	self._forbid_drop_in = false
	managers.network.matchmake:set_server_joinable(true)
end)