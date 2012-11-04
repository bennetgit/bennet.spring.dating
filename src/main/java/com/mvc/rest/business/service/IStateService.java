package com.mvc.rest.business.service;

import java.util.List;

import com.mvc.rest.business.domain.State;

public interface IStateService {
	public State getState(String stt_name);	
	public State getState(int stt_id);	
	public List<State> getStates(int stt_cou_id);
}
