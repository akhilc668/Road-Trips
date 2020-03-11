package trg.talentsprint.starterkit.web;

import java.util.List;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import trg.talentsprint.starterkit.model.Favourite;
import trg.talentsprint.starterkit.model.Feedback;
import trg.talentsprint.starterkit.model.Route;
import trg.talentsprint.starterkit.service.FavouriteService;
import trg.talentsprint.starterkit.service.FeedbackService;
import trg.talentsprint.starterkit.service.RouteService;

@Controller
public class RouteContoller {
	@Autowired
	private RouteService routeService;

	@Autowired
	private FavouriteService favourService;

	@Autowired
	private FeedbackService feedbackService;

	@Value("${upload.location}")
	private String uploadDirectory;

	@GetMapping("/routes")
	public String getAllRoutes(Model model) {
		model.addAttribute("rlist", routeService.getAllRoutes());
		return null;
	}

	@GetMapping("/routesByUser/{user}")
	public String getRouteByUser(Model model, @PathVariable("user") String user) {
		model.addAttribute("rlist", routeService.getRouteByUser(user));
		return "myroutes";
	}

	@GetMapping("/routesById/{id}")
	public String getRouteById(Model model, @PathVariable("id") long id, @ModelAttribute("status") String status) {
		Route route = routeService.getRouteById(id)
				.orElseThrow(() -> new IllegalArgumentException("Invalid route Id:" + id));
		model.addAttribute("route", route);
		model.addAttribute("favourite", new Favourite());
		return "viewdetails";
	}

	@RequestMapping("/search")
	public String search(Model model, @RequestParam(value = "from", defaultValue = "") String from,
			@RequestParam(value = "to", defaultValue = "") String to,
			@RequestParam(value = "category", defaultValue = "") String category) {
		System.out.println(from + " " + to + " " + category);
		if (from.equals("") && to.equals("") && category.equals("Select Category")) {
			return "welcome";
		} else {
			List<Route> routes = routeService.findByFromToCategory(from, to, category);
			model.addAttribute("rlist", routes);
		}
		return "search";
	}

	@GetMapping("/new-Route/{user}")
	public String showRouteCreationForm(Model model,
			@PathVariable("user") String user) { /* @RequestParam(value = "user", defaultValue = "") String user) { */
		model.addAttribute("route", new Route(user));
		return "addRoute";
	}

	@PostMapping("/add")
	public String addRoute(@RequestParam(value = "routename", defaultValue = "") String routename,
			@RequestParam(value = "category", defaultValue = "") String category,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "rdescription", defaultValue = "") String rdescription,
			@RequestParam(value = "fromaddress", defaultValue = "") String fromaddress,
			@RequestParam(value = "toaddress", defaultValue = "") String toaddress,
			@RequestParam(value = "ilocation", defaultValue = "") String ilocation,
			@RequestParam(value = "iname", defaultValue = "") String iname,
			@RequestParam(value = "idescription", defaultValue = "") String idescription,
			@RequestParam(value = "user", defaultValue = "") String user,
			@RequestParam(value = "file", defaultValue = "") MultipartFile[] files, Model model, Route r) {
		StringBuilder fileNames = new StringBuilder();
		for (MultipartFile file : files) {
			Path fileNameAndPath = Paths.get(uploadDirectory, file.getOriginalFilename());
			fileNames.append(file.getOriginalFilename() + " ");
			try {
				Files.write(fileNameAndPath, file.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		String path = fileNames.toString();
		r = new Route(routename, category, keyword, rdescription, fromaddress, toaddress, ilocation, iname,
				idescription, user, path);
		routeService.addRoute(r);
		return "welcome";
	}

	@PostMapping("/favourite")
	public String addfavourite(@Valid @ModelAttribute Favourite favourite, BindingResult result, Model model,
			RedirectAttributes redattr) {
		if (result.hasErrors()) {
			return "addRoute";
		}
		long rid = favourite.getRid();
		String username = favourite.getUsername();
		boolean status = true;
		Favourite f = favourService.findFavourite(rid, username);
		try {
			long drid = f.getRid();
			String dusername = f.getUsername();
			if (rid == drid && username.equals(dusername)) {
				redattr.addAttribute("rid", rid);
				redattr.addAttribute("status", status);
				return "redirect:/routesById/{rid}";
			}
		} catch (Exception e) {
			favourService.addFavouriteRoute(favourite);
		}
		return "welcome";
	}

	@GetMapping("/rating/{id}")
	public String addrating(@PathVariable("id") long id, Model model,
			@RequestParam(value = "rating", defaultValue = "0") int rating,
			@RequestParam(value = "comment", defaultValue = "0") String comment) {
		routeService.addrating(id, rating, comment);
		return "welcome";
	}

	@GetMapping("/favourite/{user}")
	public String getMyFavouriteRoute(@PathVariable("user") String name, Model model) {
		model.addAttribute("rlist", routeService.getMyFavouriteRoute(name));
		return "myfavourite";
	}

	@GetMapping("/deleteFavourite/{user}/{id}")
	public String deleteFavourite(@PathVariable("user") String name, Model model, @PathVariable("id") long rid) {
		favourService.deleteFavouriteRoute(rid, name);
		return "redirect:/favourite/{user}";
	}

	@GetMapping("/favRouteView/{id}")
	public String getFavRouteView(Model model, @PathVariable("id") long id) {
		Route route = routeService.getRouteById(id)
				.orElseThrow(() -> new IllegalArgumentException("Invalid route Id:" + id));
		model.addAttribute("route", route);
		model.addAttribute("favourite", new Favourite());
		return "favrouteviewdetails";
	}

	@GetMapping("/{id}")
	public String showRouteById(@PathVariable Long id, Model model) {
		Route route = routeService.getRouteById(id)
				.orElseThrow(() -> new IllegalArgumentException("Invalid route Id:" + id));
		model.addAttribute("route", route);
		return "editRoute";
	}

	@PostMapping("/updateRoute/{id}")
	public String updateRoute(@PathVariable("id") Long id,
			@RequestParam(value = "routename", defaultValue = "") String routename,
			@RequestParam(value = "category", defaultValue = "") String category,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "rdescription", defaultValue = "") String rdescription,
			@RequestParam(value = "fromaddress", defaultValue = "") String fromaddress,
			@RequestParam(value = "toaddress", defaultValue = "") String toaddress,
			@RequestParam(value = "ilocation", defaultValue = "") String ilocation,
			@RequestParam(value = "iname", defaultValue = "") String iname,
			@RequestParam(value = "idescription", defaultValue = "") String idescription,
			@RequestParam(value = "user", defaultValue = "") String user,
			@RequestParam(value = "file", defaultValue = "") MultipartFile[] files, Model model) {

		StringBuilder fileNames = new StringBuilder();

		for (MultipartFile file : files) {
			Path fileNameAndPath = Paths.get(uploadDirectory, file.getOriginalFilename());
			fileNames.append(file.getOriginalFilename() + " ");
			try {
				Files.write(fileNameAndPath, file.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		String path = fileNames.toString();

		Route route = routeService.getRouteById(id)
				.orElseThrow(() -> new IllegalArgumentException("Invalid route Id:" + id));

		route.setRoutename(routename);
		route.setCategory(category);
		route.setKeyword(keyword);
		route.setRdescription(rdescription);
		route.setFromaddress(fromaddress);
		route.setToaddress(toaddress);
		route.setIlocation(ilocation);
		route.setIname(iname);
		route.setIdescription(idescription);
		route.setUser(user);
		route.setPath(path);
		routeService.UpdateRoute(route);
		model.addAttribute("rlist", routeService.getRouteByUser(user));
		return "myroutes";
	}

	@GetMapping("/delete/{id}/{user}")
	public String deleteEmployee(@PathVariable("id") Long id, Model model, @PathVariable("user") String user) {
		routeService.getRouteById(id).orElseThrow(() -> new IllegalArgumentException("Invalid route Id:" + id));
		routeService.deleteById(id);
		model.addAttribute("rlist", routeService.getRouteByUser(user));
		return "myroutes";
	}

	@GetMapping("/feedback")
	public String feedback(@RequestParam(value = "name", defaultValue = "") String name,
			@RequestParam(value = "feedback", defaultValue = "") String feedback) {
		Feedback f = new Feedback(name, feedback);
		feedbackService.addFeedback(f);
		return "welcome";

	}

}
