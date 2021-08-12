package sopra.formation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import sopra.formation.model.Praticien;
import sopra.formation.repository.IPraticienRepository;

@Controller
public class PraticienController {
	@Autowired
	private IPraticienRepository praticienRepo;
	
	@GetMapping("/praticien") // ETAPE 1
	public String list(Model model) {
		// ETAPE 2
		List<Praticien> praticiens = this.praticienRepo.findAll();

		// ETAPE 3
		model.addAttribute("mesPraticiens", praticiens);

		// ETAPE 4
		return "praticien/list";
	}

	@GetMapping("/praticien/add")
	public String add() {
		// ETAPE 2 et 3 inutile
		// ETAPE 4
		return "praticien/form";
	}

	@GetMapping("/praticien/edit")
	public String edit(@RequestParam("id") Long id, Model model) {
		// ETAPE 2
		Praticien praticien = praticienRepo.findById(id).get();

		// ETAPE 3
		model.addAttribute("praticien", praticien);

		// ETAPE 4
		return "praticien/form";
	}
	
	@PostMapping("/praticien/save")
	public String save(@RequestParam(required = false) Long id, @RequestParam(required = false, defaultValue = "0") int version, @RequestParam String nom, @RequestParam String prenom, @RequestParam String mail, @RequestParam String mdp) {
		Praticien praticien = new Praticien(id,nom,prenom, mail, mdp);
		praticien.setVersion(version);
		
		praticienRepo.save(praticien);
		
		return "redirect:/praticien";
	}

	@GetMapping("/praticien/delete")
	public String delete(@RequestParam Long id) {
		praticienRepo.deleteById(id);
		
		return "redirect:/praticien";
	}
	
	@GetMapping("/praticien/cancel")
	public String cancel() {
		return "forward:/praticien";
	}

}
