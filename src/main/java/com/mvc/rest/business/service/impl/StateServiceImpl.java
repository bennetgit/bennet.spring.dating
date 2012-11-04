package com.mvc.rest.business.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.rest.business.domain.State;
import com.mvc.rest.business.persistence.StateMapper;
import com.mvc.rest.business.service.IStateService;

@Service
public class StateServiceImpl implements IStateService {

	@Autowired
	private StateMapper stateMapper;
	
	@Override
	public State getState(String stt_name) {
		// TODO Auto-generated method stub
		State s = stateMapper.selectStateByName(stt_name);
		return s;
	}

	@Override
	public State getState(int stt_id) {
		// TODO Auto-generated method stub
		State s = stateMapper.selectStateById(stt_id);
		return s;
	}

	@Override
	public List<State> getStates(int stt_cou_id) {
		// TODO Auto-generated method stub
		List<State> list = (List<State>)  stateMapper.selectStatesByCou_id(stt_cou_id);
		return list;
	}

}
