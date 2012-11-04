package com.mvc.rest.business.persistence;

import java.util.List;

import com.mvc.rest.business.domain.State;

public interface StateMapper {
	public State selectStateByName(String stt_name);
	public State selectStateById(int stt_id);
	public List<State> selectStatesByCou_id(int stt_cou_id);
}
