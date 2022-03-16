package com.Quan.TryJWT.serviceImpl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Quan.TryJWT.dto.PosterDTO;
import com.Quan.TryJWT.model.Poster;
import com.Quan.TryJWT.repository.PosterRepository;
import com.Quan.TryJWT.service.PosterService;

@Service
public class PosterServiceImpl implements PosterService {
	
	@Autowired
	private PosterRepository posterRepository;
	
	public List<PosterDTO> getPosters() {
		List<Poster> posters = posterRepository.findAll();
		List<PosterDTO> list = new ArrayList<PosterDTO>();
		for (Poster poster : posters) {
			if (!poster.isActive()) {
				continue;
			}
			PosterDTO p = new PosterDTO(poster.getName(), poster.getType());
			list.add(p);
		}
		return list;
	}
}
