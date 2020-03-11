package trg.talentsprint.starterkit.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import trg.talentsprint.starterkit.repository.RouteRepository;
import trg.talentsprint.starterkit.model.Route;

@Service
public class RouteService {

	@Autowired
	private RouteRepository routeRepository;
	
	public List<Route> getAllRoutes()
	{
		List<Route> rlist = new ArrayList<>();
		routeRepository.findAll().forEach(rlist::add);
		return rlist;
	}
	
	public Route addRoute(Route route) {
		return routeRepository.save(route);
	}

	public List<Route> getRouteByUser(String user) {
		List<Route> rlist = new ArrayList<>();
		routeRepository.findByUser(user).forEach(rlist::add);
		return rlist;
	}
	
	public Optional<Route> getRouteById(long id){
		return routeRepository.findById(id);
	}
	
	public List<Route> findByFromToCategory(String from,String to,String category){
		return routeRepository.findByFromToCategory(from, to, category);
	}
	
	public List<Route> getMyFavouriteRoute(String name){
		List<Route> rlist = new ArrayList<>();
		routeRepository.findByfavourite(name).forEach(rlist::add);
		return rlist;
	}

	public List<Route> findByFrom(String from) {
		List<Route> rlist = new ArrayList<>();
		routeRepository.findByFrom(from).forEach(rlist::add);
		return rlist;
	}

	public void addrating(long id, int rating,String comment) {
		routeRepository.addrating(id,rating,comment);
		
	}

	public Route UpdateRoute(Route r) {
		return routeRepository.save(r);
	}

	public void deleteById(Long id) {
		routeRepository.deleteById(id);
	}
}
